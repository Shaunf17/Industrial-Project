using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btnlogin_click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            SqlCommand Cmd = new SqlCommand();
            conn.ConnectionString = connString;
            
            SqlCommand com = new SqlCommand("CheckUser",conn);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter username= new SqlParameter("username", userName.Text);
            SqlParameter password = new SqlParameter("password", userPassword.Text);
            com.Parameters.Add(username);
            com.Parameters.Add(password);
            conn.Open();

            SqlDataReader rd = com.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();

                Response.Redirect("WebForm1.aspx");
            }
            else
            {
                Label1.Visible = true;
            }
        }
    }
}