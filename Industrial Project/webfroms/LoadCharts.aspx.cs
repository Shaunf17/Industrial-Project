using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{
    public partial class LoadCharts : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();

        protected void Page_Load(object sender, EventArgs e)
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
                rd.Read();
                Label1.Text = "Has Rows.";
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
    }
}