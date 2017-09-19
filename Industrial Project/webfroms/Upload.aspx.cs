﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Data.OleDb;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace Industrial_Project.webfroms
{

    public partial class Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

        }


        /// <summary>
        ///  Action taken when the upload button is pressed.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            lblMessage.ForeColor = System.Drawing.Color.Black;

            // Check if any file was uploaded
            if (FileUpload.HasFile)
            {
                string FileName = Path.GetFileName(FileUpload.PostedFile.FileName);
                string Extension = Path.GetExtension(FileUpload.PostedFile.FileName);

                // Check if the file is the required format.
                if (Extension.Contains("xls"))
                {
                    // Check if the same file was already uploaded
                    if (!wasUploaded(FileName))
                    {
                        // Insert the file name
                        if (insertFileName(FileName))
                        { 
                            string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
                            string FilePath = Server.MapPath(FolderPath + FileName);
                            FileUpload.SaveAs(FilePath);  // Save the excel file onto the server
                            UploadFile(FileName);
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "The report could not be uploaded.";
                        }
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "The report has already been uploaded.";
                    }
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Wrong format of the file. The expected file should be a Microsoft Excel.";
                }
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "No file was chosen.";
            }
        }


        /// <summary>
        /// Checks if the file has already been imported in the database.
        /// </summary>
        /// <param name="FileName"></param>
        /// <returns></returns>
        private bool wasUploaded(string FileName)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            SqlCommand com = new SqlCommand("CheckExcelReport", conn);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter filename = new SqlParameter("Filename", FileName);
            com.Parameters.Add(filename);
            conn.Open();

            SqlDataReader rd = com.ExecuteReader();
            if (rd.HasRows)
            {
                conn.Close();
                return true;
            }
            else
            {
                conn.Close();
                return false;
            }
        }


        /// <summary>
        /// Inserts the report's name into the database.
        /// </summary>
        /// <param name="FileName"></param>
        /// <returns></returns>
        private bool insertFileName(string FileName)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            SqlCommand com = new SqlCommand("InsertExcelReport", conn);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter filename = new SqlParameter("Filename", FileName);
            com.Parameters.Add(filename);
            conn.Open();

            int result = com.ExecuteNonQuery();
            if (result != 0)
            {
                conn.Close();
                return true;
            }
            else
            {
                conn.Close();
                return false;
            }
        }

        /// <summary>
        /// Delete the filename from the sql table in an event of a failure.
        /// </summary>
        /// <param name="FileName"></param>
        /// <returns></returns>
        private bool deleteFileName(string FileName)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            SqlCommand com = new SqlCommand("DeleteExcelReport", conn);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter filename = new SqlParameter("Filename", FileName);
            com.Parameters.Add(filename);
            conn.Open();

            int result = com.ExecuteNonQuery();
            if (result != 0)
            {
                conn.Close();
                return true;
            }
            else
            {
                conn.Close();
                return false;
            }
        }

        /// <summary>
        /// Uploads the Excel report to the SQL table in the databas.s
        /// </summary>
        /// <param name="FileName"></param>
        private void UploadFile(string FileName)
        {
            // Prepare the variables need for the operation
            string ServerFolderPath = Server.MapPath(ConfigurationManager.AppSettings["FolderPath"]);
            string ssqltable = "ImportingTest";       // SQL Table name
            string excelFilePath = ServerFolderPath + FileName;

            // Query for the data to be collected from the excel file
            string myexceldataquery = "select * from [List of transactions$]";
            try
            {
                // Connection string required for the excel files
                string sexcelconnectionstring = @"provider=Microsoft.ACE.OLEDB.12.0;data source=" + excelFilePath +
                ";extended properties=" + "\"excel 8.0;hdr=yes;\"";

                // Commands that execute the bulk copy of the data from the file to the sql table
                OleDbConnection oledbconn = new OleDbConnection(sexcelconnectionstring);
                OleDbCommand oledbcmd = new OleDbCommand(myexceldataquery, oledbconn);
                oledbconn.Open();
                OleDbDataReader dr = oledbcmd.ExecuteReader();
                SqlBulkCopy bulkcopy = new SqlBulkCopy(ConfigurationManager.ConnectionStrings["Connection"].ConnectionString);
                bulkcopy.DestinationTableName = ssqltable;
                int row = 0;
                while (dr.Read())
                {
                    if (row++ >= 3) bulkcopy.WriteToServer(dr);
                }

                dr.Close();
                oledbconn.Close();
                lblMessage.Text = "File imported into sql server.";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message;
                deleteFileName(FileName);
            }
            finally
            {
                if (FileName != null || FileName != string.Empty)
                {
                    if ((System.IO.File.Exists(excelFilePath)))
                    {
                        System.IO.File.Delete(excelFilePath);
                    }
                }
            }      
        }
    }
}