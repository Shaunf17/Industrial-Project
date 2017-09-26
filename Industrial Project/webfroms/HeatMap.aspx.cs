using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeatmapTest.Webforms
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateTable();

            //string conString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            //Debug.Print("HELLO");
            //Debug.Print(IsServerConnected(conString).ToString());
        }

        public void populateTable()
        {
            SqlConnection con = new SqlConnection();
            string conString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = conString;
            //SqlCommand cmd = new SqlCommand("SELECT [Outlet Name], SUM([Total Amount]) AS 'Total Amount' FROM YoyoDisbursals WHERE[Date & Time] >= '2015-10-10' AND[Date & Time] < '2015-10-11' GROUP BY[Outlet Name] ORDER BY[Outlet Name];", con);
            //SqlCommand cmd = new SqlCommand("KrasimirTest @startDate = '2015-10-12'", con);
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

            //try
            //{
            //    //con.Open();
            //    //SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //    //DataSet ds = new DataSet();
            //    //sda.Fill(ds);
            //    //rptheatmap.DataSource = ds;
            //    //rptheatmap.DataBind();

            //    //con.Open();
            //    //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    //DataTable dataTable = new DataTable();

            //    //da.Fill(dataTable);

            //    //GridView1.DataSource = dataTable;
            //    //GridView1.DataBind();

            //    //con.Close();
            //}
            //catch (Exception ex)
            //{
            //    Debug.Print(ex.ToString());
            //}
            //finally
            //{
            //    //con.Close();
            //}
        }

        private static bool IsServerConnected(string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    return true;
                }
                catch (SqlException)
                {
                    return false;
                }
            }
        }
    }
}