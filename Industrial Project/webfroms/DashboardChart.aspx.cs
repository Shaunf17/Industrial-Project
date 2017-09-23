using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{
    public partial class DashboardChart : System.Web.UI.Page
    {
        protected static List<double> myData = new List<double>();
        protected static List<string> dates = new List<string>();
        protected static List<double> revenue = new List<double>();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

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
    }
}