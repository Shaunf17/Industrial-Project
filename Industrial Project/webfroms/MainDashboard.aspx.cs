using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{
    public partial class MainDashboard : System.Web.UI.Page
    {
        protected static List<double> myData = new List<double>();
        protected static List<string> dates = new List<string>();
        protected static List<double> revenue = new List<double>();


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<double> getGraphData()
        {

            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;

            SqlCommand cmd = new SqlCommand("Dashboard_OverviewGraph", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            con.Open();
            DateTime date1 = new DateTime(2016, 08, 17);
            cmd.Parameters.Add(new SqlParameter("date", date1.Date.ToString("yyyy-MM-dd")));
            List<double> revenue = new List<double>();

            revenue.Clear();
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                revenue.Add(double.Parse(rd[0].ToString()));

            }
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return revenue;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Checks if the user is logged in.
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["role"].ToString() != "Admin")
            {
                UpButton.Attributes.Add("style", "display:none");
            }
        }

        //    /// <summary>
        //    /// Logs out the user and deletes the session.
        //    /// </summary>
        //    /// <param name="sender"></param>
        //    /// <param name="e"></param>
        protected void LogOut_click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("Login.aspx");
        }

        /// <summary>
        ///  Redirects to the appropriate page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Account_Click(object sender, EventArgs e)
        {
            if (Session["role"].ToString() == "User") Response.Redirect("ManageAccount.aspx");
            if (Session["role"].ToString() == "Admin") Response.Redirect("UserAlteration.aspx");
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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<double> getBarData()
        {

            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;

            SqlCommand cmd = new SqlCommand("Dashboard_OverviewGraph", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            con.Open();
            DateTime date1 = new DateTime(2016, 08, 17);
            cmd.Parameters.Add(new SqlParameter("date", date1.Date.ToString("yyyy-MM-dd")));
            List<double> revenue = new List<double>();

            revenue.Clear();
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                revenue.Add(double.Parse(rd[0].ToString()));

            }
            cmd.Dispose();
            con.Close();
            con.Dispose();

            return revenue;
        }

        // !! To be used at later stage !! 

        //    public void displayRevenue()
        //    {
        //        SqlConnection conn = new SqlConnection();
        //        string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        //        conn.ConnectionString = connString;
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("Dashboard_Revenue", conn);
        //        comm.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter adapter = new SqlDataAdapter(comm);

        //        DataTable dt1 = new DataTable();
        //        adapter.Fill(dt1);
        //        lb1.Text = dt1.Rows[0]["Revenue"].ToString();

        //        conn.Close();
        //    }


        //    public void displayPopularLocation()
        //    {
        //        SqlConnection conn = new SqlConnection();
        //        string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        //        conn.ConnectionString = connString;
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("Dashboard_MostPopular", conn);
        //        comm.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter adapter = new SqlDataAdapter(comm);

        //        DataTable dt2 = new DataTable();
        //        adapter.Fill(dt2);
        //        lb2.Text = dt2.Rows[0]["mostPopular"].ToString();

        //        conn.Close();
        //    }

        //    public void displayRedemptions()
        //    {
        //        SqlConnection conn = new SqlConnection();
        //        string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        //        conn.ConnectionString = connString;
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("Dashboard_Redemptions", conn);
        //        comm.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter adapter = new SqlDataAdapter(comm);

        //        DataTable dt3 = new DataTable();
        //        adapter.Fill(dt3);
        //        lb3.Text = dt3.Rows[0]["Redemptions"].ToString();

        //        conn.Close();
        //    }

        //    public void displayLeastPopular()
        //    {
        //        SqlConnection conn = new SqlConnection();
        //        string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        //        conn.ConnectionString = connString;
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("Dashboard_LeastPopular", conn);
        //        comm.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter adapter = new SqlDataAdapter(comm);

        //        DataTable dt4 = new DataTable();
        //        adapter.Fill(dt4);
        //        lb4.Text = dt4.Rows[0]["leastPopular"].ToString();

        //        conn.Close();
        //    }
        //}



    }
}