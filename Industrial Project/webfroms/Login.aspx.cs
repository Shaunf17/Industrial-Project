using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace Industrial_Project.webfroms
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Checks if the user is logged in.
            if (Session["username"] != null)
            {
                Response.Redirect("MainDashboard.aspx");
            }
        }

        protected void Btnlogin_click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            //SqlCommand Cmd = new SqlCommand();
            conn.ConnectionString = connString;

            SqlCommand com = new SqlCommand("CheckUser", conn);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter username = new SqlParameter("username", userName.Text);
            SqlParameter password = new SqlParameter("password", Hash(userPassword.Text));
            //Label1.Text = (Hash(userPassword.Text));
            com.Parameters.Add(username);
            com.Parameters.Add(password);
            conn.Open();

            SqlDataReader rd = com.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                Session["username"] = userName.Text;
                Session["role"] = rd[3].ToString();
                conn.Close();
                conn.Dispose();
                Response.Redirect("MainDashboard.aspx");
            }
            else
            {
                conn.Close();
                conn.Dispose();
                Label1.Visible = true;
            }
        }

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