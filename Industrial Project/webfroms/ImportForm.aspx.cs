using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace Industrial_Project.webfroms
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnUpload_Click(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        //Path.GetFullPath
        //        //string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //        //string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
        //        //string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
        //        //string FilePath = Server.MapPath(FileName);
        //        //FileUpload1.SaveAs(FilePath);
        //        pathName.Text = FileUpload1.PostedFile.FileName;
        //        //GetExcelSheets(FilePath, Extension, "Yes");
        //        //ImportDataFromExcel(FileUpload1.PostedFile.FileName);
        //    }
        //}

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
                string FilePath = Server.MapPath(FolderPath + FileName);
                 FileUpload1.SaveAs(FilePath);
                GetExcelSheets(FilePath, Extension, "Yes");
            }
        }   
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    string FileName = lblFileName.Text;
        //    string Extension = Path.GetExtension(FileName);
        //    string FolderPath = Server.MapPath(ConfigurationManager
        //                       .AppSettings["FolderPath"]);
        //    string CommandText = "";
        //    switch (Extension)
        //    {
        //        case ".xls": //Excel 97-03
        //            CommandText = "spx_ImportFromExcel03";
        //            break;
        //        case ".xlsx": //Excel 07
        //            CommandText = "spx_ImportFromExcel07";
        //            break;
        //    }

        //    //Read Excel Sheet using Stored Procedure
        //    //And import the data into Database Table
        //    String strConnString = ConfigurationManager
        //                 .ConnectionStrings["Connection"].ConnectionString;
        //    SqlConnection con = new SqlConnection(strConnString);
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.CommandText = CommandText;
        //    cmd.Parameters.Add("@SheetName", SqlDbType.VarChar).Value =
        //                   ddlSheets.SelectedItem.Text;
        //    cmd.Parameters.Add("@FilePath", SqlDbType.VarChar).Value =
        //                   FolderPath + FileName;
        //    cmd.Parameters.Add("@HDR", SqlDbType.VarChar).Value =
        //                   rbHDR.SelectedItem.Text;
        //    cmd.Parameters.Add("@TableName", SqlDbType.VarChar).Value =
        //                   txtTable.Text;
        //    cmd.Connection = con;

        //    try
        //    {
        //        con.Open();
        //        object count = cmd.ExecuteNonQuery();
        //        lblMessage.ForeColor = System.Drawing.Color.Green;
        //        lblMessage.Text = count.ToString() + " records inserted.";
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMessage.ForeColor = System.Drawing.Color.Red;
        //        lblMessage.Text = ex.Message;
        //    }
        //    finally
        //    {
        //        con.Close();
        //        con.Dispose();
        //        Panel1.Visible = true;
        //        Panel2.Visible = false;
        //    }
        //}

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string FileName = lblFileName.Text;
            string Extension = Path.GetExtension(FileName);
            string FolderPath = Server.MapPath(ConfigurationManager
                               .AppSettings["FolderPath"]);
            //declare variables -edit these based on your particular situation
            string ssqltable = "ImportingTest";
            string excelFilePath = FolderPath + FileName;
            // make sure your sheet name is correct, here sheet name is sheet1, so you can change your sheet name if have    different 
            string myexceldataquery = "select [Date & Time],[Retailer Ref],[Outlet Ref],[Retailer Name],[Outlet Name],[New User ID],[Transaction Type],[Cash Spent],[Discount Amount],[Total Amount] from [List of transactions$]";
            try
            {
                //create our connection strings 
                string sexcelconnectionstring = @"provider=Microsoft.ACE.OLEDB.12.0;data source=" + excelFilePath +
                ";extended properties=" + "\"excel 8.0;hdr=yes;\"";
                string ssqlconnectionstring = "Data Source=.;Initial Catalog=Connection;Integrated Security=True";
                //series of commands to bulk copy data from the excel file into our sql table 
                OleDbConnection oledbconn = new OleDbConnection(sexcelconnectionstring);
                OleDbCommand oledbcmd = new OleDbCommand(myexceldataquery, oledbconn);
                oledbconn.Open();
                OleDbDataReader dr = oledbcmd.ExecuteReader();
                SqlBulkCopy bulkcopy = new SqlBulkCopy(ConfigurationManager.ConnectionStrings["Connection"].ConnectionString);
                bulkcopy.DestinationTableName = ssqltable;
                while (dr.Read())
                {
                    bulkcopy.WriteToServer(dr);
                }
                dr.Close();
                oledbconn.Close();
                lblMessage.Text = "File imported into sql server.";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message;
            }
            finally
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        private void GetExcelSheets(string FilePath, string Extension, string isHDR)
        {
            string conStr = "";
            switch (Extension)
            {
                case ".xls": //Excel 97-03
                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]
                             .ConnectionString;
                    break;
                case ".xlsx": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                             .ConnectionString;
                    break;
            }

            //Get the Sheets in Excel WorkBoo
            conStr = string.Format(conStr, FilePath, isHDR);
            OleDbConnection connExcel = new OleDbConnection(conStr);
            OleDbCommand cmdExcel = new OleDbCommand();
            OleDbDataAdapter oda = new OleDbDataAdapter();
            cmdExcel.Connection = connExcel;
            connExcel.Open();

            //Bind the Sheets to DropDownList
            ddlSheets.Items.Clear();
            ddlSheets.Items.Add(new ListItem("--Select Sheet--", ""));
            ddlSheets.DataSource = connExcel
                     .GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            ddlSheets.DataTextField = "TABLE_NAME";
            ddlSheets.DataValueField = "TABLE_NAME";
            ddlSheets.DataBind();
            connExcel.Close();
            txtTable.Text = "";
            lblFileName.Text = Path.GetFileName(FilePath);
            Panel2.Visible = true;
            Panel1.Visible = false;
        }

        //public void ImportDataFromExcel(string excelFilePath)
        //{
        //    //declare variables - edit these based on your particular situation 
        //    string ssqltable = "ImportingTest";
        //    // make sure your sheet name is correct, here sheet name is sheet1, so you can change your sheet name if have    different 
        //    string myexceldataquery = "select * from [Sheet1$]";
        //    try
        //    {
        //        //create our connection strings 
        //        string sexcelconnectionstring = @"provider=microsoft.jet.oledb.12.0;data source=" + excelFilePath +
        //        ";extended properties=" + "\"excel 8.0;hdr=yes;\"";
        //        string ssqlconnectionstring = "Data Source=.;Initial Catalog=Connection;Integrated Security=True";
        //        //series of commands to bulk copy data from the excel file into our sql table 
        //        OleDbConnection oledbconn = new OleDbConnection(sexcelconnectionstring);
        //        OleDbCommand oledbcmd = new OleDbCommand(myexceldataquery, oledbconn);
        //        oledbconn.Open();
        //        OleDbDataReader dr = oledbcmd.ExecuteReader();
        //        SqlBulkCopy bulkcopy = new SqlBulkCopy(ssqlconnectionstring);
        //        bulkcopy.DestinationTableName = ssqltable;
        //        while (dr.Read())
        //        {
        //            bulkcopy.WriteToServer(dr);
        //        }
        //        dr.Close();
        //        oledbconn.Close();
        //        lblMessage.Text = "File imported into sql server.";
        //    }
        //    catch (Exception ex)
        //    {
        //        //handle exception 
        //    }
        //}
    }
}