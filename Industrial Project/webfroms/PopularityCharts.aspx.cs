using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{
    public partial class PopularityCharts : System.Web.UI.Page
    {
        protected static List<double> myData = new List<double>();
        protected static List<string> columnData = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["role"].ToString() != "Admin")
            {
                UploadButton.Attributes.Add("style", "display:none");
            }
           
            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;

            SqlCommand cmd = new SqlCommand("GetLocations", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                outletLocation.Items.Add(rd[0].ToString());
            }

            con.Close();
            con.Dispose();


        }

        /// <summary>
        /// Logs out the user and deletes the session.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LogOut_click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("Login.aspx");
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

        /// <summary>
        ///  Redirects to the appropriate page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AccClick(object sender, EventArgs e)
        {
            if (Session["role"].ToString() == "User") Response.Redirect("ManageAccount.aspx");
            if (Session["role"].ToString() == "Admin") Response.Redirect("UserAlteration.aspx");
        }


        /// <summary>
        /// The operation gets the information for the line chart according 
        /// to the location, start date and end date of a data range.
        /// </summary>
        /// <param name="outR"> Location/Outlet name </param>
        /// <param name="startDat"> Start date of the data range </param>
        /// <param name="endDat"> End date of the data range </param>
        /// <returns></returns>
        [WebMethod]
        public static List<double> initializeChart(string outR, string startDat, string endDat)
        {
            
            myData.Clear();

            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;

            SqlCommand cmd = new SqlCommand("PopularityPerMonthOfDataRange", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("location", outR));
            cmd.Parameters.Add(new SqlParameter("startDate", startDat));
            cmd.Parameters.Add(new SqlParameter("endDate", endDat));

            con.Open();
            try
            {
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                   myData.Add(double.Parse(rd[0].ToString()));
                }

                con.Close();
                con.Dispose();

            }
            catch (Exception)
            {
                myData.Add(-1);
            }
            return myData;

        }


        /// <summary>
        /// Get the column data for the charts.
        /// </summary>
        /// <param name="outR"> Location/Outlate name </param>
        /// <param name="startDat"> Start date of the data range </param>
        /// <param name="endDat"> End date of the data range </param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string[] GetColumnData(string outR, string startDat, string endDat)
        {

            DateTime sDate = DateTime.ParseExact(startDat, "yyyy-MM-dd", null);
            DateTime eDate = DateTime.ParseExact(endDat, "yyyy-MM-dd", null);
            columnData.Clear();
            while (sDate <= eDate)
            {
                columnData.Add(sDate.Date.ToString("yyyy-MM"));
                sDate = sDate.AddMonths(1);
            }

            string combindedString = string.Join(",", columnData.ToArray());
            return columnData.ToArray();
        }

        /// <summary>
        /// Gets the data for the bar/pie charts according to the time frame given.
        /// </summary>
        /// <param name="timeFrame"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<double> GetBarPieGraphData(string timeFrame)
        {

            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;
            SqlCommand cmd;
            myData.Clear();
            if (timeFrame == "Last week")
            {
                cmd = new SqlCommand("Popularity_OneWeek", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    myData.Add(double.Parse(rd[0].ToString()));

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return myData;
            }
            else if (timeFrame == "Last month")
            {
                cmd = new SqlCommand("Popularity_OneMonth", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    myData.Add(double.Parse(rd[0].ToString()));

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return myData;
            }
            else if (timeFrame == "Last 3 months")
            {
                cmd = new SqlCommand("Popularity_ThreeMonths", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    myData.Add(double.Parse(rd[0].ToString()));

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return myData;
            }
            else if (timeFrame == "Last 6 months")
            {
                cmd = new SqlCommand("Popularity_SixMonths", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    myData.Add(double.Parse(rd[0].ToString()));

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return myData;
            }
            else if (timeFrame == "Last year")
            {
                cmd = new SqlCommand("Popularity_OneYear", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    myData.Add(double.Parse(rd[0].ToString()));

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return myData;
            }


            return myData;

        }

        /// <summary>
        /// Gets the column name for the bar/pie charts according to a time frame.
        /// </summary>
        /// <param name="timeFrame"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetBarPieColumnData(string timeFrame)
        {

            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;
            SqlCommand cmd;
            columnData.Clear();
            if (timeFrame == "Last week")
            {
                cmd = new SqlCommand("Popularity_OneWeek", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    columnData.Add(rd[1].ToString());

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return columnData;
            }
            else if (timeFrame == "Last month")
            {
                cmd = new SqlCommand("Popularity_OneMonth", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    columnData.Add(rd[1].ToString());

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return columnData;
            }
            else if (timeFrame == "Last 3 months")
            {
                cmd = new SqlCommand("Popularity_ThreeMonths", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    columnData.Add(rd[1].ToString());

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return columnData;
            }
            else if (timeFrame == "Last 6 months")
            {
                cmd = new SqlCommand("Popularity_SixMonths", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    columnData.Add(rd[1].ToString());

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return columnData;
            }
            else if (timeFrame == "Last year")
            {
                cmd = new SqlCommand("Popularity_OneYear", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    columnData.Add(rd[1].ToString());

                }
                cmd.Dispose();
                con.Close();
                con.Dispose();

                return columnData;
            }

            return columnData;

        }


        /// <summary>
        /// Gets the column data for the bar/pie chart according to a date range.
        /// </summary>
        /// <param name="startDat"> Start date of the date range </param>
        /// <param name="endDat"> End date of the date range </param>
        /// <returns></returns>
        [WebMethod]
        public static List<string> GetBarPieDateRangeColumn(string startDat, string endDat)
        {

            columnData.Clear();

            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;

            SqlCommand cmd = new SqlCommand("PopularityPieChart", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("startDate", startDat));
            cmd.Parameters.Add(new SqlParameter("endDate", endDat));

            con.Open();
            try
            {
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    columnData.Add(rd[1].ToString());
                }

                con.Close();
                con.Dispose();


            }
            catch (Exception)
            {
                columnData.Add("Exception");
            }
            return columnData;

        }


        /// <summary>
        /// Get the pie/bar data for a specific date range.
        /// </summary>
        /// <param name="startDat"> Start date of a date range </param>
        /// <param name="endDat"> End date of a date range </param>
        /// <returns></returns>
        [WebMethod]
        public static List<double> GetBarPieDateRangeData(string startDat, string endDat)
        {
           
            myData.Clear();

            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;

            SqlCommand cmd = new SqlCommand("PopularityPieChart", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("startDate", startDat));
            cmd.Parameters.Add(new SqlParameter("endDate", endDat));

            con.Open();
            try
            {
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    myData.Add(double.Parse(rd[0].ToString()));
                }

                con.Close();
                con.Dispose();
            }
            catch (Exception)
            {
                myData.Add(-1);
            }
            return myData;

        }

    }
}
