using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
    public partial class Comparison : System.Web.UI.Page
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
                locationSelect.Items.Add(rd[0].ToString());
            }
            procedureSelect.Items.Add("Activity");
            procedureSelect.Items.Add("Popularity");
            procedureSelect.Items.Add("Total Sales");
            con.Close();
            con.Dispose();


            SqlConnection con1 = new SqlConnection();
            con1.ConnectionString = connString;

            SqlCommand cmd1 = new SqlCommand("GetYearsByLocation", con1);
            cmd1.CommandType = System.Data.CommandType.StoredProcedure;

            cmd1.Parameters.Add(new SqlParameter("location", locationSelect.SelectedItem.Text == "" ? "Air Bar" : locationSelect.SelectedItem.Text));

            con1.Open();
            SqlDataReader rd1 = cmd1.ExecuteReader();
            while (rd1.Read())
            {
                yearsSelect.Items.Add(rd1[0].ToString());
            }

            con1.Close();
            con1.Dispose();

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> loadYearDropdown(string listbox)
        {
            List<string> years = new List<string>();

            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            SqlConnection con1 = new SqlConnection();
            con1.ConnectionString = connString;

            SqlCommand cmd1 = new SqlCommand("GetYearsByLocation", con1);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add(new SqlParameter("location", listbox));//DropDownListLocation.SelectedItem.Text));
            con1.Open();
            SqlDataReader rd1 = cmd1.ExecuteReader();

            //DropDownListYear.ClearSelection();

            while (rd1.Read())
            {
                years.Add(rd1[0].ToString());
            }

            con1.Close();
            con1.Dispose();

            return years;
        }

        [WebMethod]
        public static List<double> getYearData(string statistic, string location, string year)
        {
            myData.Clear();

            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;

            if (statistic == "Activity")
            {
                SqlCommand cmd = new SqlCommand("Comparison_Activity", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("location", location));
                cmd.Parameters.Add(new SqlParameter("year", year));

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
            }
            else if (statistic == "Popularity")
            {
                SqlCommand cmd = new SqlCommand("Comparison_Popularity", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("location", location));
                cmd.Parameters.Add(new SqlParameter("year", year));

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
            }
            else if (statistic == "Total Sales")
            {
                SqlCommand cmd = new SqlCommand("Comparison_TotalSales", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("location", location));
                cmd.Parameters.Add(new SqlParameter("year", year));

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
            }

            return myData;

        }
    }
}
