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
    public partial class OldChartDataRange : System.Web.UI.Page
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

            protected static double execProcedure(string outR, DateTime sDate, DateTime eDate)
            {
                double value = 1;
                SqlConnection con = new SqlConnection();
                string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
                con.ConnectionString = connString;

                SqlCommand cmd = new SqlCommand("TotalSales", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                con.Open();

                Debug.WriteLine("sDate value: " + sDate.Date.ToString("yyyy-MM-dd"));
                Debug.WriteLine("eDate value: " + eDate.Date.ToString("yyyy-MM-dd"));
                Debug.WriteLine("sDate + 1 value: " + sDate.AddMonths(1).Date.ToString("yyyy-MM-dd"));

                cmd.Parameters.Add(new SqlParameter("location", outR));
                cmd.Parameters.Add(new SqlParameter("startDate", sDate.Date.ToString("yyyy-MM-dd")));
                cmd.Parameters.Add(new SqlParameter("endDate", eDate.Date.ToString("yyyy-MM-dd")));

                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Read();
                    value = double.Parse(rd[0].ToString());
                }
                else
                {
                    Debug.WriteLine("DIDN'T WORK");
                    value = -1;
                }
                cmd.Dispose();
                con.Close();
                con.Dispose();
                return value;
            }

            [WebMethod]
            public static List<double> initializeChart(string outR, string startDat, string endDat)
            {
                Debug.WriteLine(" METHOD ENTERED !" + outR);

                DateTime sDate = DateTime.ParseExact(startDat, "yyyy-MM-dd", null);
                DateTime endingDate = DateTime.ParseExact(endDat, "yyyy-MM-dd", null);
                int result = DateTime.Compare(sDate, endingDate);

                myData.Clear();
                while (sDate <= endingDate)
                {
                    myData.Add(execProcedure(outR, sDate, sDate.AddMonths(1)));
                    sDate = sDate.AddMonths(1);
                }

                Debug.WriteLine("The chart numbers array: " + printArr(myData));
                return myData;

                /*
                Debug.WriteLine("sDate value: " + sDate.Date.ToString("yyyy-MM-dd"));
                Debug.WriteLine("eDate value: " + eDate.Date.ToString("yyyy-MM-dd"));
                Debug.WriteLine("sDate + 1 value: " + sDate.AddMonths(1).Date.ToString("yyyy-MM-dd"));
                Debug.WriteLine(" WORKING WORKING WORKING WORKING WORKING ! 2x");
                Debug.WriteLine(" WORKING WORKING WORKING WORKING WORKING ! 3x");*/
            }


            [WebMethod]
            [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
            public static List<string> GetColumnData(string outR, string startDat, string endDat)
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
                return columnData;
            }

        }
    }