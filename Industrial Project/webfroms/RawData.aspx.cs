using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Industrial_Project.webfroms
{ 

    public partial class RawData : System.Web.UI.Page
    {

        //String ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        StringBuilder table = new StringBuilder();

        protected void Page_Load(object sender, EventArgs e)

        {

            if (!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Select * FROM [YoyoDisbursals] ORDER BY [Date & Time]";
                cmd.Connection = con;
                SqlDataReader rd = cmd.ExecuteReader();
                table.Append("<table border ='1'>");
                table.Append("<tr><th>Date & Time</th><th>Retailer Ref</th><th>Outlet Ref</th><th>Retailer Name</th><th>Outlet Name</th><th>New User id</th><th>Transection Type</th><th>Cash Spent</th><th>Discount Amount</th><th>Total Amount</th>");
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
                        table.Append("</tr>");
                    }
                }
                table.Append("</table");
                PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
                rd.Close();

            }
        }
    }
}
