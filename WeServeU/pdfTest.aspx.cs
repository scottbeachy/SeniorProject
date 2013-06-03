using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

//add iTextSharp using references
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

public partial class pdfTest : System.Web.UI.Page
{
    string county, clientStatus;

    protected void Page_Load(object sender, EventArgs e)
    {



    }
    protected void btnCreatePdf_Click(object sender, EventArgs e)
    {
        //string county;
        
        //Make DB connection
        string connection = ConfigurationManager.ConnectionStrings["testdb"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        SqlCommand cmd = new SqlCommand("SELECT WCountyFiled, WClientStatus from WorkOrder WHERE WorkOrderID = @WorkOrderID", conn);
        cmd.Parameters.AddWithValue("@WorkOrderID", 90);


        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            county = dr[0].ToString().ToUpper();
            clientStatus = dr[1].ToString();
        }
        dr.Close();
        conn.Close();

        StringBuilder countyLine = new StringBuilder("IN AND FOR THE COUNTY OF ");
        countyLine.Append(county);


        
        
        //Read in the PDF template
        var reader = new PdfReader(Server.MapPath("PDFs/SuperiorSubShell.pdf"));

        //Create PdfStamper object. Used to populate Pdf fields & generate new Pdf
        //MemoryStream used to stream pdf back to user. In order to save, use FileStream instead
        var output = new MemoryStream();
        var stamper = new PdfStamper(reader, output);

        //Use the AcroFields property & SetField method to insert text into Pdf fields
        stamper.AcroFields.SetField("countyLine", countyLine.ToString());
        if (clientStatus == "DE")
        {
            stamper.AcroFields.SetField("bottomStatus", "Defendant");
            stamper.AcroFields.SetField("topStatus", "Plantiff");
        }

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