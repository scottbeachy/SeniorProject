using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FileWork
/// </summary>
public class FileWork
{
	public FileWork()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public bool UploadFile(string connectionString, string workOrderID, byte[] fileBytes)
    {
        try
        {
            if (HttpContext.Current.Session["CustID"] != null)
            {
                //Get the session variable
                string id = HttpContext.Current.Session["CustID"].ToString();

                string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
                SqlConnection conn = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand(connectionString, conn);
                cmd.Parameters.AddWithValue("@WorkOrderID", workOrderID);
                cmd.Parameters.AddWithValue("@CustomerID", id);
                cmd.Parameters.AddWithValue("@Doc", fileBytes);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            else if (HttpContext.Current.Session["EmpID"] != null)
            {
                string id = HttpContext.Current.Session["EmpID"].ToString();

                string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
                SqlConnection conn = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand(connectionString, conn);
                cmd.Parameters.AddWithValue("@WorkOrderID", workOrderID);
                cmd.Parameters.AddWithValue("@EmpID", id);
                cmd.Parameters.AddWithValue("@Doc", fileBytes);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            else { return false; }
        }
        catch (SqlException s)
        {
            return false;
        }
    }

    //public bool EmpUploadFile(string connectionString, string workOrderID, byte[] fileBytes)
    //{
    //    try
    //    {
    //        string id = HttpContext.Current.Session["CustID"].ToString();

    //        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
    //        SqlConnection conn = new SqlConnection(connection);
    //        SqlCommand cmd = new SqlCommand(connectionString, conn);
    //        cmd.Parameters.AddWithValue("@WorkOrderID", workOrderID);
    //        cmd.Parameters.AddWithValue("@EmpID", id);
    //        cmd.Parameters.AddWithValue("@Doc", fileBytes);

    //        conn.Open();
    //        cmd.ExecuteNonQuery();
    //        conn.Close();
    //        return true;
    //    }
    //    catch (SqlException s)
    //    {
    //        return false;
    //    }
    //}


    public void DownloadFile(string connectionString, string docID)
    {
        byte[] fileData;
        //int fileLength = 0;
        //byte[] fileData = new byte[fileLength -1];

        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        SqlCommand cmd = new SqlCommand(connectionString, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            fileData = (byte[])dr[0];
            using ( MemoryStream stream = new MemoryStream(fileData))
            {
                HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=YourPdf.pdf");
                HttpContext.Current.Response.ContentType = "application/pdf";

                HttpContext.Current.Response.BinaryWrite(stream.ToArray());
                HttpContext.Current.Response.End();
            }
             
        }

        


        
        //return fileData;
    }
}