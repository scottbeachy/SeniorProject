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
    protected void Button1_Click(object sender, EventArgs e)
    {
        //name of the pdf field is "pdfTest"
        
        //instantiate new pdf doc
        Document doc2 = new Document(PageSize.LETTER, 36f, 36f, 144f, 77f);

        //create the pdf in the "PDFs" folder
        string path = Server.MapPath("PDFs");
        PdfWriter.GetInstance(doc2, new FileStream(path + "/doc2.pdf", FileMode.Create));

        //edit the newly created pdf
        doc2.Open();
        doc2.Add(new Paragraph("My first PDF"));
        doc2.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        var reader = new PdfReader(Server.MapPath("PDFs/testing.pdf"));
    }
}