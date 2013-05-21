using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//add iTextSharp using references
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

public partial class pdfTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCreatePdf_Click(object sender, EventArgs e)
    {
        //Read in the PDF template
        var reader = new PdfReader(Server.MapPath("PDFs/testingTemplate1.pdf"));

        //Create PdfStamper object. Used to populate Pdf fields & generate new Pdf
        //MemoryStream used to stream pdf back to user. In order to save, use FileStream instead
        var output = new MemoryStream();
        var stamper = new PdfStamper(reader, output);

        //Use the AcroFields property & SetField method to insert text into Pdf fields
        stamper.AcroFields.SetField("CourtFiled", txtCourt.Text.ToUpper());
        stamper.AcroFields.SetField("CountyFiled", txtCounty.Text.ToUpper());

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