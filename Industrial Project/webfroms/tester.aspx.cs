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
            testerMethod();
            testerMethod2();
        }


        public void testerMethod()
        {
            //open db connection
            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            conn.ConnectionString = connString;
            conn.Open();

            //prepare and execute sql command
            SqlCommand comm = new SqlCommand("Dashboard_LeastPopular", conn);
            comm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(comm);

            //Fill db with result of query 
            DataTable dt1 = new DataTable();
            adapter.Fill(dt1);


            GridView1.DataSource = dt1;
            GridView1.DataBind();
            conn.Close();
        }

        public void testerMethod2()
        {
            //open db connection
            SqlConnection conn = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            conn.ConnectionString = connString;
            conn.Open();

            //prepare and execute sql command
            SqlCommand comm = new SqlCommand("Dashboard_MostPopular", conn);
            comm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(comm);

            //Fill db with result of query 
            DataTable dt2 = new DataTable();
            adapter.Fill(dt2);


            GridView2.DataSource = dt2;
            GridView2.DataBind();
            conn.Close();
        }
    }
}