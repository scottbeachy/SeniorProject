using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//add itextsharp using references
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

public partial class pdfTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //instantiate new pdf doc
        Document doc1 = new Document();

        //create the pdf in the "PDFs" folder
        string path = Server.MapPath("PDFs");
        PdfWriter.GetInstance(doc1, new FileStream(path + "/doc1.pdf", FileMode.Create));

        //edit the newly created pdf
        doc1.Open();
        doc1.Add(new Paragraph("My first PDF"));
        doc1.Close();
    }
}