//This page created by Paul Ortega
//Last Edited: 6/14/2013
//Creates a certificate of service PDF based on the work order selected on EmpHome.aspx &
//based on the template selected on EmpDownloadCOS.aspx

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

public partial class EmpDownloadCOS : System.Web.UI.Page
{
    //Some variables for use on this page
    int id;
    string fname;
    string lname;
    string perm;
    string woID;

    //Variables for pdf creation
    string day, county, clientStatus, clientFName, clientLName, opFName, opLName, empFName, empLName, empLCounty;
    string caseNum, dateCreated, paperTitle, toBeServed, serveStreet, serveApt, serveCity, serveState, serveZip;
    string servedFName, servedLName, servedRel;
    string serveDt, serveTime, serveCharge, court;

    //This will always be opposite of clientStatus. Set this during the clientStatus if statements.
    string opposingPartyStatus;

    //Variable for Date/Time objects from DB
    DateTime dt = new DateTime();

    protected void Page_Load(object sender, EventArgs e)
    {
        //Check permission level and redirect if needed
        if (Session["Perm"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!Session["Perm"].Equals("E"))
        {
            Response.Redirect("login.aspx");
        }

        //assign the variables from the session created from the login page
        id = Convert.ToInt32(Session["EmpID"]);
        perm = Session["Perm"].ToString();
        fname = Session["EmpFname"].ToString();
        lname = Session["EmpLname"].ToString();

        //Custom welcome message on the screen
        lblWelcome.Text = "Welcome " + fname + " " + lname + ". Server ID: " + id;
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("login.aspx");
    }
    protected void btnEmpDownloadCOS_Click(object sender, EventArgs e)
    {
        //work order ID session is created in EmpHome.aspx.cs
        woID = Session["workOrderID"].ToString();

        //grab selectedValue from radio button & write path for appropriate template
        //Path will be used for the pdf reader & stamper
        string templatePath = "";
        if ((rblDownloadCOS.SelectedValue == "superiorSub") || (rblDownloadCOS.SelectedValue == "superiorPersonal"))
        {
            templatePath = "PDFs/Superior.pdf";
        }

        else //if ((rblDownloadCOS.SelectedValue == "justiceSub") || (rblDownloadCOS.SelectedValue == "justicePersonal"))
        {
            templatePath = "PDFs/Justice.pdf";
        }


        //Make DB connection & SqlCommand to pull info for COS
        string connection = ConfigurationManager.ConnectionStrings["testdb"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        SqlCommand cmd = new SqlCommand("SELECT WCountyFiled, WClientStatus, WFName, WLName, WOPFName, WOPLName, WCaseNumber, WDateCreated, WPaperTitle, WToBeServed," +
            "WServAdd, WServApt, WServCity, WServState, WServZip, WServDate, WServTime, WServeCharge, WServedFName, WServedLName, WServedRel," +
            "WCourtFiled from WorkOrder WHERE WorkOrderID = @WorkOrderID AND EmpID = @EmpID", conn);

        //woID is set through the WorkOrderID session variable
        cmd.Parameters.AddWithValue("@WorkOrderID", woID);
        cmd.Parameters.AddWithValue("@EmpID", id);

        //Need additional SqlCommand to pull Employee info with an Inner Join
        SqlCommand empCmd = new SqlCommand("SELECT Employee.EmpFName, Employee.EmpLName, Employee.EmpLicCnty FROM WorkOrder INNER JOIN Employee ON WorkOrder.EmpID=Employee.EmpID WHERE WorkOrderID = @WorkorderID", conn);

        //woID is set through the WorkOrderID session variable
        empCmd.Parameters.AddWithValue("@WorkOrderID", woID);

        //Open connection, insert DB info into variables, repeat with 2nd SqlCommand, close connection
        conn.Open();
        SqlDataReader dr = empCmd.ExecuteReader();
        while (dr.Read())
        {
            empFName = dr[0].ToString();
            empLName = dr[1].ToString();
            empLCounty = dr[2].ToString();
        }
        dr.Close();

        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            county = dr[0].ToString();
            clientStatus = dr[1].ToString();
            clientFName = dr[2].ToString();
            clientLName = dr[3].ToString();
            opFName = dr[4].ToString();
            opLName = dr[5].ToString();
            caseNum = dr[6].ToString();
            dateCreated = dr[7].ToString();
            paperTitle = dr[8].ToString();
            toBeServed = dr[9].ToString();
            serveStreet = dr[10].ToString();
            serveApt = dr[11].ToString();
            serveCity = dr[12].ToString();
            serveState = dr[13].ToString();
            serveZip = dr[14].ToString();
            serveDt = dr[15].ToString();
            serveTime = dr[16].ToString();
            serveCharge = dr[17].ToString();
            servedFName = dr[18].ToString();
            servedLName = dr[19].ToString();
            servedRel = dr[20].ToString();
            court = dr[21].ToString();
        }

        dr.Close();
        conn.Close();

        //build necessary strings to fill in 
        StringBuilder countyLine = new StringBuilder("IN AND FOR THE COUNTY OF ");
        countyLine.Append(county);
        StringBuilder clientName = new StringBuilder();
        clientName.Append(clientFName);
        clientName.Append(" ");
        clientName.Append(clientLName);
        clientName.Append(",");
        StringBuilder opName = new StringBuilder();
        opName.Append(opFName);
        opName.Append(" ");
        opName.Append(opLName);
        opName.Append(",");
        StringBuilder paragraphOne = new StringBuilder("I, ");
        paragraphOne.Append(empFName.ToUpper());
        paragraphOne.Append(" ");
        paragraphOne.Append(empLName.ToUpper());
        paragraphOne.Append(", a private process server, having been so appointed by the court in the County of ");
        paragraphOne.Append(empLCounty);
        paragraphOne.Append(".");

        //convert string "dateCreated" to DateTime in order to properly format & pull the month, day, & year
        dt = DateTime.Parse(dateCreated);
        StringBuilder dateReceived = new StringBuilder("On ");
        dateReceived.Append(dt.ToString("MMMM"));
        dateReceived.Append(" ");
        dateReceived.Append(dt.ToString("%d"));
        dateReceived.Append(", ");
        dateReceived.Append(dt.ToString("yyyy"));
        dateReceived.Append(" I received the following documents:");


        //StringBuilder for Serve address - w/ and w/o Apartment
        StringBuilder serveAddress = new StringBuilder(serveStreet);
        if (serveApt == "")
        {
            serveAddress.Append(" ");
            serveAddress.Append(serveCity);
            serveAddress.Append(", ");
            serveAddress.Append(serveState);
            serveAddress.Append(" ");
            serveAddress.Append(serveZip);
            serveAddress.Append(" on:");
        }

        else
        {
            serveAddress.Append(" Apt ");
            serveAddress.Append(serveApt);
            serveAddress.Append(" ");
            serveAddress.Append(serveCity);
            serveAddress.Append(", ");
            serveAddress.Append(serveState);
            serveAddress.Append(" ");
            serveAddress.Append(serveZip);
            serveAddress.Append(" on:");
        }

        //convert string "serveDT" to DateTime in order to properly format & pull the month, day, & year
        dt = DateTime.Parse(serveDt);
        StringBuilder serveDate = new StringBuilder();
        serveDate.Append(dt.ToString("MMMM"));
        serveDate.Append(" ");
        serveDate.Append(dt.ToString("%d"));
        serveDate.Append(", ");
        serveDate.Append(dt.ToString("yyyy"));
        serveDate.Append(" at ");
        serveDate.Append(serveTime);


        //Old code w/ superscript
        //if ((myDate.Day == 1) || (myDate.Day == 21) || (myDate.Day == 31)) day = myDate.ToString("%d") + "<sup>st</sup>";
        //else if ((myDate.Day == 2) || (myDate.Day == 22)) day = myDate.ToString("%d") + "<sup>nd</sup>";
        //else if ((myDate.Day == 3) || (myDate.Day == 23)) day = myDate.ToString("%d") + "<sup>rd</sup>";
        //else day = myDate.ToString("%d") + "<sup>th</sup>";


        //Set DateTime dt to current date/time for the execute date field
        dt = DateTime.Now;

        if ((dt.Day == 1) || (dt.Day == 21) || (dt.Day == 31)) day = dt.ToString("%d") + "st";
        else if ((dt.Day == 2) || (dt.Day == 22)) day = dt.ToString("%d") + "nd";
        else if ((dt.Day == 3) || (dt.Day == 23)) day = dt.ToString("%d") + "rd";
        else day = dt.ToString("%d") + "th";

        //continuation of StringBuilders
        StringBuilder executeDate = new StringBuilder("Executed this ");
        executeDate.Append(day);
        executeDate.Append(" day of ");
        executeDate.Append(dt.ToString("MMMM"));
        executeDate.Append(", ");
        executeDate.Append(dt.Year.ToString());
        executeDate.Append(".");

        StringBuilder charge = new StringBuilder("$");
        charge.Append(serveCharge);
        charge.Append(".00");

        StringBuilder sig = new StringBuilder(empFName);
        sig.Append(" ");
        sig.Append(empLName);


        //Read in the PDF template
        var reader = new PdfReader(Server.MapPath(templatePath));

        //Create PdfStamper object. Used to populate Pdf fields & generate new Pdf
        //MemoryStream used to stream pdf back to user. In order to save, use FileStream instead
        var output = new MemoryStream();
        var stamper = new PdfStamper(reader, output);


        //Write Names/Statuses (RE, DE, PE, PL) in the correct positions
        if (clientStatus == "DE")
        {
            stamper.AcroFields.SetField("bottomStatus", "Defendant,");
            stamper.AcroFields.SetField("topStatus", "Plantiff,");
            stamper.AcroFields.SetField("bottomName", clientName.ToString());
            stamper.AcroFields.SetField("topName", opName.ToString());
            opposingPartyStatus = "Plantiff";
        }
        else if (clientStatus == "PE")
        {
            stamper.AcroFields.SetField("bottomStatus", "Defendant,");
            stamper.AcroFields.SetField("topStatus", "Plantiff,");
            stamper.AcroFields.SetField("bottomName", opName.ToString());
            stamper.AcroFields.SetField("topName", clientName.ToString());
            opposingPartyStatus = "Respondent";
        }
        else if (clientStatus == "RE")
        {
            stamper.AcroFields.SetField("bottomStatus", "Respondent,");
            stamper.AcroFields.SetField("topStatus", "Petitioner,");
            stamper.AcroFields.SetField("bottomName", clientName.ToString());
            stamper.AcroFields.SetField("topName", opName.ToString());
            opposingPartyStatus = "Petitioner";
        }
        else
        {
            stamper.AcroFields.SetField("bottomStatus", "Respondent,");
            stamper.AcroFields.SetField("topStatus", "Petitioner,");
            stamper.AcroFields.SetField("bottomName", opName.ToString());
            stamper.AcroFields.SetField("topName", clientName.ToString());
            opposingPartyStatus = "Defendant";
        }

        //Side Note, have to do this if statement & stringbuilder this far down because
        //the opposingPartyStatus is being set in the stamper commands just above this.


        StringBuilder personServed = new StringBuilder();
        StringBuilder paragraphTwo = new StringBuilder("I personally served true copies of the document upon: ");

        //This will only apply on the justiceSub & superiorSub templates
        if ((servedFName == "") || (servedLName == ""))
        {
            //This is written if WServedFName || WServedLName is left blank in the DB
            personServed.Append("\"John/Jane Doe\" (whose true name is refused), ");
        }
        else
        {
            //This is written if WServedFName && WServedLName have data
            personServed.Append(servedFName);
            personServed.Append(" ");
            personServed.Append(servedLName);
            personServed.Append(", ");
        }

        //This will only be written on superiorSub || justiceSub templates
        if ((rblDownloadCOS.SelectedValue == "superiorSub") || (rblDownloadCOS.SelectedValue == "justiceSub"))
        {
            paragraphTwo.Append(opposingPartyStatus);
            paragraphTwo.Append(" ");
            paragraphTwo.Append(opName);
            paragraphTwo.Append(" by leaving a copy with ");
            paragraphTwo.Append(personServed);
            paragraphTwo.Append(servedRel);
            paragraphTwo.Append(" of ");
            paragraphTwo.Append(opposingPartyStatus);
            paragraphTwo.Append(", a person of suitable age and discretion who resides with ");
            paragraphTwo.Append(opposingPartyStatus);
            paragraphTwo.Append(" at:");
        }

        //This will be written on superiorPersonal || justicePersonal templates
        else
        {
            paragraphTwo.Append(opposingPartyStatus);
            paragraphTwo.Append(", ");
            paragraphTwo.Append(opName);
            paragraphTwo.Append(" a person of suitable age and discretion at his/her usual place of abode at:");
        }

        //Another conditional block for writing the courtLine on the justice court templates (uppermost line on PDF)
        if ((rblDownloadCOS.SelectedValue == "justiceSub") || (rblDownloadCOS.SelectedValue == "justicePersonal"))
        {
            StringBuilder courtLine = new StringBuilder("IN THE ");
            courtLine.Append(court);
            courtLine.Append(" JUSTICE COURT OF THE STATE OF ARIZONA");
            stamper.AcroFields.SetField("courtLine", courtLine.ToString().ToUpper());
        }
        
        //Use the AcroFields property & SetField method to insert text into Pdf fields
        stamper.AcroFields.SetField("countyLine", countyLine.ToString().ToUpper());
        stamper.AcroFields.SetField("caseNumber", caseNum);
        stamper.AcroFields.SetField("paragraphOne", paragraphOne.ToString());
        stamper.AcroFields.SetField("dateReceived", dateReceived.ToString());
        stamper.AcroFields.SetField("paperTitle", paperTitle.ToUpper());
        stamper.AcroFields.SetField("paragraphTwo", paragraphTwo.ToString());
        stamper.AcroFields.SetField("serveAddress", serveAddress.ToString());
        stamper.AcroFields.SetField("serveDateTime", serveDate.ToString());
        stamper.AcroFields.SetField("executeDate", executeDate.ToString());
        stamper.AcroFields.SetField("cost", charge.ToString());
        stamper.AcroFields.SetField("signature", sig.ToString());

        //Disable field editing by flattening the stamper
        stamper.FormFlattening = true;

        //Close the stamper and reader
        stamper.Close();
        reader.Close();

        //Upon close, the Pdf is stored in the specified stream (MemoryStream in this case)
        //Send Pdf from MemoryStream back to the browser to be displayed
        Response.AppendHeader("Content-Disposition", "attachment; filename=CertificateOfService.pdf");
        Response.ContentType = "application/pdf";

        Response.BinaryWrite(output.ToArray());
        Response.End();
    }
    protected void btnReturnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmpHome.aspx");
    }
}