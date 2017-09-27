using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{
    public partial class Heatmap : System.Web.UI.Page
    {
        protected static List<double> myData = new List<double>();
        protected static List<string> columnData = new List<string>();

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
            populateTable();

        }

        /// <summary>
        /// Populates the team with the information for the specific week.
        /// </summary>
        public void populateTable()
        {
            SqlConnection con = new SqlConnection();
            string conString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = conString;
            SqlCommand cmd = new SqlCommand("KrasimirTest", con);
            SqlParameter startDate = new SqlParameter("@startDate", SqlDbType.DateTime);
            startDate.Value = "2016-09-02";
            cmd.Parameters.Add(startDate);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();

            da.Fill(dataTable);

            GridView1.DataSource = dataTable;
            GridView1.DataBind();

            con.Close();
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
        protected void AccClick(object sender, EventArgs e)
        {
            if (Session["role"].ToString() == "User") Response.Redirect("ManageAccount.aspx");
            if (Session["role"].ToString() == "Admin") Response.Redirect("UserAlteration.aspx");
        }

    }
}
