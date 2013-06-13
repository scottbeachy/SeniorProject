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


public partial class printWorkOrder : System.Web.UI.Page
{
    //Variables for PDF creation
    string workOrder, client, streetAddress, cityStateZip, serviceTo, serviceAddress;

    //Variable for getting workOrderID from session
    string woID;
    string empID;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDB_Click(object sender, EventArgs e)
    {
        //Store workOrderID & EmpID session variable in local variables
        woID = Session["workOrderID"].ToString();
        empID = Session["EmpID"].ToString(); // Convert.ToInt32(Session["EmpID"]);


        //Make DB connection & SqlCommand to pull info for COS
        string connection = ConfigurationManager.ConnectionStrings["testdb"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        SqlCommand cmd = new SqlCommand("SELECT WCountyFiled, WClientStatus, WFName, WLName, WOPFName, WOPLName, WCaseNumber, WDateCreated, WPaperTitle, WToBeServed," +
            "WServAdd, WServApt, WServCity, WServState, WServZip, WServDate, WServTime, WServeCharge, WServedFName, WServedLName, WServedRel," +
            "WCourtFiled from WorkOrder WHERE WorkOrderID = @WorkOrderID AND EmpID = @EmpID", conn);

        //woID is set through the WorkOrderID session variable
        cmd.Parameters.AddWithValue("@WorkOrderID", woID);
        cmd.Parameters.AddWithValue("@EmpID", empID);
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        //Read in the PDF template
        var reader = new PdfReader(Server.MapPath("PDFs/workOrder/workOrderTemplate.pdf"));

        //Create PdfStamper object. Used to populate Pdf fields & generate new Pdf
        //MemoryStream used to stream pdf back to user. In order to save, use FileStream instead
        var output = new MemoryStream();
        var stamper = new PdfStamper(reader, output);

        //Use the AcroFields property & SetField method to insert text into Pdf fields
        stamper.AcroFields.SetField("workOrder", txtWorkOrder.Text);
        stamper.AcroFields.SetField("date", txtDate.Text);
        stamper.AcroFields.SetField("client", txtClient.Text);
        stamper.AcroFields.SetField("address", txtStreet.Text);

        //concatenate client address
        string clientCityStateZip = txtCity.Text + ", " + txtState.Text + " " + txtZip.Text;
        
        //insert concatenated string into PDF
        stamper.AcroFields.SetField("address", clientCityStateZip);

        stamper.AcroFields.SetField("personServed", txtPersonServed.Text);

        string serviceAddress = txtServiceStreet.Text + " " + txtServiceCity.Text + ", " + txtServiceCounty.Text + " " + txtServiceState.Text + " " + txtServiceZip.Text;
        stamper.AcroFields.SetField("serviceAddress", serviceAddress);

        //Disable field editing by flattening the stamper
        stamper.FormFlattening = true;

        //Close the stamper and reader
        stamper.Close();
        reader.Close();

        //Upon close, the Pdf is stored in the specified stream (MemoryStream in this case)
        //Send Pdf from MemoryStream back to the browser to be displayed
        Response.AddHeader("Content-Disposition", "attachment; filename=YourPdf.pdf");
        Response.ContentType = "application/pdf";
        Response.BinaryWrite(output.ToArray());
        Response.End();
    }

}