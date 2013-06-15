//This page created by Paul Ortega
//Last Edited: 6/14/2013
//Creates a work order PDF based on the work order selected on EmpHome.aspx

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

//add iTextSharp using references
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Text;


public partial class printWorkOrder : System.Web.UI.Page
{
    //Variables for PDF creation
    string clientFName, clientLName, opFName, opLName, serveStreet, serveApt, serveCity, serveCounty, serveState, serveZip;
    string clientStreet, clientApt, clientCity, clientState, clientZip;

    //Variable for getting workOrderID from session
    string woID;
    string empID;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDB_Click(object sender, EventArgs e)
    {
        //Store workOrderID & EmpID session variable in local variables
        woID = "90"; // Session["workOrderID"].ToString();
        empID = "10"; // Session["EmpID"].ToString(); // Convert.ToInt32(Session["EmpID"]);


        //Make DB connection & SqlCommand to pull info for COS
        string connection = ConfigurationManager.ConnectionStrings["testdb"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        SqlCommand cmd = new SqlCommand("SELECT WFName, WLName, WOPFName, WOPLName, WServAdd, WServApt, WServCity, WServCounty," +
            "WServState, WServZip FROM WorkOrder WHERE WorkOrderID = @WorkOrderID AND EmpID = @EmpID", conn);

        //Add IDs from variables to query
        cmd.Parameters.AddWithValue("@WorkOrderID", woID);
        cmd.Parameters.AddWithValue("@EmpID", empID);       

        //2nd SqlCommand for selecting Customer info from Customer table w/ an inner join
        SqlCommand custCmd = new SqlCommand("SELECT Customer.CAddress, Customer.CApt, Customer.CCity, Customer.CState," + 
            "Customer.CZip FROM WorkOrder INNER JOIN Customer ON WorkOrder.CustomerID=Customer.CustomerID WHERE WorkOrderID = @WorkOrderID AND EmpID = @EmpID", conn);

        //Add IDs from variables to query
        custCmd.Parameters.AddWithValue("@WorkOrderID", woID);
        custCmd.Parameters.AddWithValue("@EmpID", empID);
        
        conn.Open();

        //Instantiate DataReader, execute 1st SqlCommand, & close DataReader
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            clientFName = dr[0].ToString();
            clientLName = dr[1].ToString();
            opFName = dr[2].ToString();
            opLName = dr[3].ToString();
            serveStreet = dr[4].ToString();
            serveApt = dr[5].ToString();
            serveCity = dr[6].ToString();
            serveCounty = dr[7].ToString();
            serveState = dr[8].ToString();
            serveZip = dr[9].ToString();
        }
        dr.Close();

        //Execute DataReader/2nd SqlCommand, close DataReader & SqlConnection
        dr = custCmd.ExecuteReader();
        while (dr.Read())
        {
            clientStreet = dr[0].ToString();
            clientApt = dr[1].ToString();
            clientCity = dr[2].ToString();
            clientState = dr[3].ToString();
            clientZip = dr[4].ToString();
        }
        dr.Close();
        conn.Close();


        //Read in the PDF template
        var reader = new PdfReader(Server.MapPath("PDFs/workOrder/workOrderTemplate.pdf"));

        //Create PdfStamper object. Used to populate Pdf fields & generate new Pdf
        //MemoryStream used to stream pdf back to user. In order to save, use FileStream instead
        var output = new MemoryStream();
        var stamper = new PdfStamper(reader, output);

        //Use the AcroFields property & SetField method to insert text into Pdf fields
        stamper.AcroFields.SetField("workOrder", woID);

        //create DateTime.Now to fill in the date field
        DateTime dt = DateTime.Now;        
        //Set field to dt value and format to only show month, day, & year
        stamper.AcroFields.SetField("date", dt.ToString("M/d/yyyy"));

        //build client full name string & write to PDF field
        StringBuilder clientName = new StringBuilder(clientFName);
        clientName.Append(" ");
        clientName.Append(clientLName);
        stamper.AcroFields.SetField("client", clientName.ToString());

        //If statement for writing client address with & without apartment
        if (clientApt == "")
        {
            //If no client Apt write street address
            stamper.AcroFields.SetField("address", clientStreet);
        }
        else
        {
            //If there is a client Apt, build string with street & Apt
            StringBuilder clientAddress = new StringBuilder(clientStreet);
            clientAddress.Append(" Apt ");
            clientAddress.Append(clientApt);
            stamper.AcroFields.SetField("address", clientAddress.ToString());
        }

        //build string for client 2nd address line & write to PDF field
        StringBuilder clientCityStateZip = new StringBuilder(clientCity);
        clientCityStateZip.Append(", ");
        clientCityStateZip.Append(clientState);
        clientCityStateZip.Append(" ");
        clientCityStateZip.Append(clientZip);
        stamper.AcroFields.SetField("cityStateZip", clientCityStateZip.ToString());


        //build full name string for person to be served (opposing party) & write to PDF field
        StringBuilder opName = new StringBuilder(opFName);
        opName.Append(" ");
        opName.Append(opLName);
        stamper.AcroFields.SetField("personServed", opName.ToString());

        //build string for service address
        StringBuilder serviceAddress = new StringBuilder(serveStreet);

        //If statement for writing service address with & without apartment
        if (serveApt == "")
        {
            serviceAddress.Append(" ");
            serviceAddress.Append(serveCity);
            serviceAddress.Append(", ");
            serviceAddress.Append(serveCounty);
            serviceAddress.Append(" County ");
            serviceAddress.Append(serveState);
            serviceAddress.Append(" ");
            serviceAddress.Append(serveZip);
            stamper.AcroFields.SetField("serviceAddress", serviceAddress.ToString());
        }
        else
        {
            serviceAddress.Append(" Apt ");
            serviceAddress.Append(serveApt);
            serviceAddress.Append(" ");
            serviceAddress.Append(serveCity);
            serviceAddress.Append(", ");
            serviceAddress.Append(serveCounty);
            serviceAddress.Append(" County ");
            serviceAddress.Append(serveState);
            serviceAddress.Append(" ");
            serviceAddress.Append(serveZip);
            stamper.AcroFields.SetField("serviceAddress", serviceAddress.ToString());
        }



        //Disable field editing by flattening the stamper
        stamper.FormFlattening = true;

        //Close the stamper and reader
        stamper.Close();
        reader.Close();

        //Upon close, the Pdf is stored in the specified stream (MemoryStream in this case)
        //Send Pdf from MemoryStream back to the browser to be displayed
        Response.AppendHeader("Content-Disposition", "attachment; filename=WorkOrder.pdf");
        Response.ContentType = "application/pdf";
        Response.BinaryWrite(output.ToArray());
        Response.End();
    }

}