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
        
        //protected void Btnlogin_click(object sender,EventArgs e)
        //{
        //    //SqlConnection conn = new SqlConnection();
        //    //string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        //    //SqlCommand Cmd = new SqlCommand();
        //    //conn.ConnectionString = connString;

        //    //SqlCommand com = new SqlCommand();
        //    //conn.Open();

        //    //SqlDataReader rd = com.ExecuteReader();
        //    //if(rd.HasRows)
        //    //{
        //    //    rd.Read();
        //    //    Response.Redirect("WebForm1.aspx");
        //    //}
        //    //else
        //    //{
        //    //    Label1info.Visible = true;
        //    //    Label1info.Text = "Invalid username or password.";
        //    //}
        //}
    }
}