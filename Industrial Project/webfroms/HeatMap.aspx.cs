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
        }

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
    }
}