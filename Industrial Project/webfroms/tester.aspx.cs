using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{
    public partial class tester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            displayRevenue();
            displayPopularLocation();
            displayRedemptions();
            displayLeastPopular();
        }


        public void displayRevenue()
        {
            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            conn.ConnectionString = connString;
            conn.Open();

            SqlCommand comm = new SqlCommand("Dashboard_Revenue", conn);
            comm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(comm);

            DataTable dt1 = new DataTable();
            adapter.Fill(dt1);
            Literal1.Text = dt1.Rows[0]["Revenue"].ToString();

            conn.Close();
        }


        public void displayPopularLocation()
        {
            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            conn.ConnectionString = connString;
            conn.Open();

            SqlCommand comm = new SqlCommand("Dashboard_MostPopular", conn);
            comm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(comm);

            DataTable dt2 = new DataTable();
            adapter.Fill(dt2);
            Literal2.Text = dt2.Rows[0]["mostPopular"].ToString();

            conn.Close();
        }

        public void displayRedemptions()
        {
            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            conn.ConnectionString = connString;
            conn.Open();

            SqlCommand comm = new SqlCommand("Dashboard_Redemptions", conn);
            comm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(comm);

            DataTable dt3 = new DataTable();
            adapter.Fill(dt3);
            Literal3.Text = dt3.Rows[0]["Redemptions"].ToString();

            conn.Close();
        }

        public void displayLeastPopular()
        {
            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            conn.ConnectionString = connString;
            conn.Open();

            SqlCommand comm = new SqlCommand("Dashboard_LeastPopular", conn);
            comm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(comm);

            DataTable dt4 = new DataTable();
            adapter.Fill(dt4);
            Literal4.Text = dt4.Rows[0]["leastPopular"].ToString();

            conn.Close();
        }
    }
}