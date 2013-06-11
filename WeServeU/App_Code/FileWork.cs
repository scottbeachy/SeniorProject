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



    //you need to provide the correct select statement for whatever doc you are trying to recieve
    public void DownloadFile(string selectStatement)
    {

        byte[] fileData;
        

        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        SqlCommand cmd = new SqlCommand(selectStatement, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            fileData = (byte[])dr[0];
            using ( MemoryStream stream = new MemoryStream(fileData))
            {
                HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=weserveuFile.pdf");
                HttpContext.Current.Response.ContentType = "application/pdf";
                HttpContext.Current.Response.BinaryWrite(stream.ToArray());
                HttpContext.Current.Response.End();
            }
             
        }
        dr.Close();
        conn.Close();

    }
}