using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{

    public partial class UserAlteration : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["role"].ToString() != "Admin")
            {
                UploadButton.Attributes.Add("style", "display:none");
            }

            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            conn.ConnectionString = connString;

            SqlCommand com = new SqlCommand("GetUsersDetails", conn);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            conn.Open();

            SqlDataReader rd = com.ExecuteReader();

            //Header of Table
            TableHeaderRow infoRow = new TableHeaderRow();
            //Cell of header
            TableCell tch0 = new TableCell();
            tch0.Text = "<b>Username</b>";
            TableCell tch1 = new TableCell();
            tch1.Text = "<b>Role</b>";
            TableCell tch2 = new TableCell();
            tch2.Text = "<b>Update</b>";
            TableCell tch3 = new TableCell();
            tch3.Text = "<b>Delete</b>";

            //Add cells to header
            infoRow.Cells.Add(tch0);
            infoRow.Cells.Add(tch1);
            infoRow.Cells.Add(tch2);
            infoRow.Cells.Add(tch3);

            Table1.Rows.Add(infoRow);

            int count = 0;

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    TableRow row = new TableRow();

                    TableCell cell = new TableCell();
                    cell.Text = rd[0].ToString();

                    row.Cells.Add(cell);

                    TableCell cell1 = new TableCell();
                    cell1.Text = rd[1].ToString();
                    row.Cells.Add(cell1);
                    TableCell cell2 = new TableCell();
                    Button editbtn = new Button();
                    editbtn.Attributes.Add("class", "btn btn-info btn-lg");
                    editbtn.Attributes.Add("style", "font-size:17px");
                    editbtn.Click += new System.EventHandler(edit_Click);
                    editbtn.Text = "Update";
                    editbtn.ID = "Edit" + count;
                    cell2.Controls.Add(editbtn);
                    row.Cells.Add(cell2);

                    TableCell cell3 = new TableCell();
                    if (rd[0].ToString() != Session["username"].ToString())
                    {
                        Button deleteBtn = new Button();
                        deleteBtn.Click += new System.EventHandler(delete_Click);
                        deleteBtn.Text = "Delete";
                        deleteBtn.ID = "Delete" + count;
                        deleteBtn.Attributes.Add("class", "btn btn-info btn-lg");
                        deleteBtn.Attributes.Add("style", "font-size:17px");
                        cell3.Controls.Add(deleteBtn);
                    }
                    row.Cells.Add(cell3);

                    Table1.Rows.Add(row);
                    count++;
                }

            }

            rd.Close();
            conn.Close();

        }

        /// <summary>
        /// Logs out the user and deletes the session.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LogOut_click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("Login.aspx");
        }

        /// <summary>
        /// Redirects you to the upload page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Upload_Click(object sender, EventArgs e)
        {

            Response.Redirect("Upload.aspx");
        }

        /// <summary>
        ///  Redirects to the appropriate page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Account_click(object sender, EventArgs e)
        {
            if (Session["role"].ToString() == "User") Response.Redirect("ManageAccount.aspx");
            if (Session["role"].ToString() == "Admin") Response.Redirect("UserAlteration.aspx");
        }


        /// <summary>
        /// Edits the details of the specific user.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void edit_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            string id = button.ID;
            TableRow row = (button.Parent as TableCell).Parent as TableRow;

            TableCellCollection cells = row.Cells;
            string username = cells[0].Text;
            if (username == Session["username"].ToString())
            {
                Response.Redirect("ManageAccount.aspx");
            }
            else
            {
                Session["changingUsername"] = username;
                Response.Redirect("ManageOtherAccounts.aspx");
            }

        }


        /// <summary>
        ///  Deletes the specific user.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void delete_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            string id = button.ID;
            TableRow row = (button.Parent as TableCell).Parent as TableRow;

            TableCellCollection cells = row.Cells;
            string username = cells[0].Text;
            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            conn.ConnectionString = connString;

            conn.Open();

            SqlCommand command = new SqlCommand("DeleteUser", conn);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter user = new SqlParameter("username", username);
            command.Parameters.Add(user);

            int result = command.ExecuteNonQuery();
            if (result != 0)
            {
                Response.Redirect("UserAlteration.aspx");

            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "There was a problem with the creation of the user";
            }
            conn.Close();
            conn.Dispose();

        }

        /// <summary>
        /// Adds a user to the database.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Add_click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(userName.Text) || String.IsNullOrEmpty(userPassword.Text))
            {
                Label1.Visible = true;
                Label1.Text = "Fill all the user details";
            }
            else
            {
                SqlConnection conn = new SqlConnection();
                string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
                conn.ConnectionString = connString;

                SqlCommand com = new SqlCommand("CheckUsername", conn);
                com.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter username = new SqlParameter("username", userName.Text);
                com.Parameters.Add(username);
                conn.Open();

                SqlDataReader rd = com.ExecuteReader();
                if (!rd.HasRows)
                {
                    rd.Close();
                    SqlCommand command = new SqlCommand("InsertUser", conn);
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlParameter user = new SqlParameter("username", userName.Text);
                    SqlParameter password = new SqlParameter("password", Hash(userPassword.Text));
                    SqlParameter role = new SqlParameter("role", roles.Text);
                    command.Parameters.Add(user);
                    command.Parameters.Add(password);
                    command.Parameters.Add(role);

                    int result = command.ExecuteNonQuery();
                    if (result != 0)
                    {
                        Response.Redirect("UserAlteration.aspx");

                    }
                    else
                    {
                        Label1.Visible = true;
                        Label1.Text = "There was a problem with the creation of the user";
                    }

                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "The username already exists";
                }
                conn.Close();
                conn.Dispose();
            }
        }

        /// <summary>
        /// Hashes the password.
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        static string Hash(string input)
        {
            using (SHA1Managed sha1 = new SHA1Managed())
            {
                var hash = sha1.ComputeHash(Encoding.UTF8.GetBytes(input));
                var sb = new StringBuilder(hash.Length * 2);

                foreach (byte b in hash)
                {
                    sb.Append(b.ToString("x2")); //x2 for lowercase hashes
                }

                return sb.ToString();
            }
        }
    }
}

