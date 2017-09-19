using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{
    public partial class LoadCharts : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();

        protected static double myData;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public void intializeChart()
        {
            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;
            SqlCommand cmd = new SqlCommand("TotalSales", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter outletRef = new SqlParameter("outletRef", outletReference.Text);
            SqlParameter startDate = new SqlParameter("startDate", startingDate.Text);
            SqlParameter endDate = new SqlParameter("endDate", endingDate.Text);
            cmd.Parameters.Add(outletRef);
            cmd.Parameters.Add(startDate);
            cmd.Parameters.Add(endDate);
            con.Open();

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                //chartData = rd.GetInt32(0);
                rd.Read();
                myData = double.Parse(rd[0].ToString());

                con.Close();
                con.Dispose();
            }
            else
            {
                Label1.Text = "Doesn't have any rows.";
                con.Close();
                con.Dispose();
            }
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<double> GetChartData()
        {
            List<double> items = new List<double>();
            items.Add(1.23);
            items.Add(4.56);
            items.Add(350);
            items.Add(1.23);
            items.Add(4.56);
            items.Add(7.89);
            items.Add(myData);
            items.Add(4.56);
            items.Add(7.89);
            items.Add(1.23);
            items.Add(4.56);
            items.Add(7.89);
            return items;

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string[] GetColumnData()
        {
            string[] array = new string[] { "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC" };
            return array;

        }
    }
}