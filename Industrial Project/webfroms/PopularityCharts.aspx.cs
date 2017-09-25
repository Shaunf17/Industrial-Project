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
            Debug.WriteLine("PAGE LOADED !");

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

        private static string printArr(List<double> array)
        {

            string res = "";
            foreach (double x in array)
            {
                Console.WriteLine(x);
                res += x + " ; ";
            }
            return res;
        }

        [WebMethod]
        public static List<double> initializeChart(string outR, string startDat, string endDat)
        {
            Debug.WriteLine(" METHOD ENTERED !" + outR);

            //DateTime sDate = DateTime.ParseExact(startDat, "yyyy-MM-dd", null);
            //DateTime endingDate = DateTime.ParseExact(endDat, "yyyy-MM-dd", null);
            //int result = DateTime.Compare(sDate, endingDate);

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

                Debug.WriteLine("The chart numbers array: " + printArr(myData));
            }
            catch (Exception)
            {
                myData.Add(-1);
            }
            return myData;

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string[] GetColumnData(string outR, string startDat, string endDat)
        {
            //string[] array = new string[] { "09/16", "FEB", "MAR", "APR", "MAY", "JUN", "02/17", "AUG", "SEP", "OCT", "NOV", "DEC" };
            DateTime sDate = DateTime.ParseExact(startDat, "yyyy-MM-dd", null);
            DateTime eDate = DateTime.ParseExact(endDat, "yyyy-MM-dd", null);
            //Debug.WriteLine(sDate + "" + eDate);
            columnData.Clear();
            while (sDate <= eDate)
            {
                columnData.Add(sDate.Date.ToString("yyyy-MM"));
                sDate = sDate.AddMonths(1);
                //Debug.WriteLine(sDate.Date);
            }

            string combindedString = string.Join(",", columnData.ToArray());
            Debug.WriteLine("Dates array: " + combindedString);
            return columnData.ToArray();
        }

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

        [WebMethod]
        public static List<string> GetBarPieDateRangeColumn(string startDat, string endDat)
        {

            //DateTime sDate = DateTime.ParseExact(startDat, "yyyy-MM-dd", null);
            //DateTime endingDate = DateTime.ParseExact(endDat, "yyyy-MM-dd", null);
            //int result = DateTime.Compare(sDate, endingDate);

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

        [WebMethod]
        public static List<double> GetBarPieDateRangeData(string startDat, string endDat)
        {
           
            //DateTime sDate = DateTime.ParseExact(startDat, "yyyy-MM-dd", null);
            //DateTime endingDate = DateTime.ParseExact(endDat, "yyyy-MM-dd", null);
            //int result = DateTime.Compare(sDate, endingDate);

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

                Debug.WriteLine("The chart numbers array: " + printArr(myData));
            }
            catch (Exception)
            {
                myData.Add(-1);
            }
            return myData;

        }

    }
}
