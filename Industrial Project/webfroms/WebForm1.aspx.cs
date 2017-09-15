using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            string connString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            con.ConnectionString = connString;
            con.Open();
            SqlCommand comm = new SqlCommand("SELECT TOP 10 [Date & Time],[Retailer Ref],[Outlet Ref],[Retailer Name],[Outlet Name],[New user id],[Transaction Type],[Cash Spent],[Discount Amount],[Total Amount],[ID] FROM[ip17team6db].[dbo].[YoyoDisbursals]");
            comm.Connection = con;
            SqlDataReader rd = comm.ExecuteReader();
            table.Append("<table border='1'>");
            table.Append("<tr><th> dick </th><th> butt </th><th> dick </th><th> butt </th><th> dick 5 </th><th> butt </th><th> dick </th><th> butt </th><th> dick </th><th> butt </th><th> dick </th>");
            table.Append("</tr>");
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    table.Append("<tr>");
                    table.Append("<td>" + rd[0] + "</td>");
                    table.Append("<td>" + rd[1] + "</td>");
                    table.Append("<td>" + rd[2] + "</td>");
                    table.Append("<td>" + rd[3] + "</td>");
                    table.Append("<td>" + rd[4] + "</td>");
                    table.Append("<td>" + rd[5] + "</td>");
                    table.Append("<td>" + rd[6] + "</td>");
                    table.Append("<td>" + rd[7] + "</td>");
                    table.Append("<td>" + rd[8] + "</td>");
                    table.Append("<td>" + rd[9] + "</td>");
                    table.Append("<td>" + rd[10] + "</td>");
                    table.Append("</tr>");
                }
            }
            table.Append("</table>");
            PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
            rd.Close();
            
        }


    }
}