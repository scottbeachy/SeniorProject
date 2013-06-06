using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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

    public bool CustUploadFile(string connectionString, string workOrderID, byte[] fileBytes)
    {
        try
        {
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
        catch (SqlException s)
        {
            return false;
        }
    }

    public bool EmpUploadFile(string connectionString, string workOrderID, byte[] fileBytes)
    {
        try
        {
            string id = HttpContext.Current.Session["CustID"].ToString();

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
        catch (SqlException s)
        {
            return false;
        }
    }


    public byte[] DownloadFile(string connectionString, string workOrderID)
    {
        int fileLength = 0;

        byte[] fileData = new byte[fileLength -1];
        return fileData;
    }
}