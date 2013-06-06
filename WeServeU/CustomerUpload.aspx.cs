/* Created by Scott Beachy
 * 6/5/2013
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Some variables for use on this page
        int id;
        string fname;
        string lname;
        string perm;


        //Check permission level and redirect if needed
        if (Session["Perm"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!Session["Perm"].Equals("C"))
        {
            Response.Redirect("login.aspx");

        }

        //assign the variables from the session created from the login page
        id = Convert.ToInt32(Session["CustID"]);
        perm = Session["Perm"].ToString();
        fname = Session["CFname"].ToString();
        lname = Session["CLname"].ToString();

        //Custom welcome message on the screen
        lblWelcome.Text = "Welcome " + fname + " " + lname + ". Customer ID: " + id;
    

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        int fileLength;
        bool success;
        string connectionString = "INSERT INTO Docs (WorkOrderID, CustomerID, Doc) VALUES (@WorkOrderID, @CustomerID, @Doc)";
        //first check to see if there is actually a file selected, then do work
        if (cstFileUp.HasFile)
        {
            //get the file length to initialize the array to
            fileLength = cstFileUp.PostedFile.ContentLength;
            byte[] fileBytes = new byte[fileLength - 1];
            //read the bytes of the file
            fileBytes = cstFileUp.FileBytes;
            //create a new instance to use its methods
            FileWork fw = new FileWork();
            //method returns a boolean to check for successfull addition of the file to the db
            success = fw.CustUploadFile(connectionString, ddlWOList.SelectedValue , fileBytes);
            if (success)
            {
                lblUploadStatus.Text = "Your file has been uploaded and the staff at WeServeU notified.";
                lblUploadStatus.ForeColor = System.Drawing.Color.Green;
                lblUploadStatus.Visible = true;
            }
            else
            {
                lblUploadStatus.Text = "There was an error uploading your file. Please try again later";
                lblUploadStatus.ForeColor = System.Drawing.Color.Red;
                lblUploadStatus.Visible = true;
            }

        }
        else
        {
            lblUploadStatus.Text = "There was no file specified to upload";
        }
    }
    //logout button 
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("login.aspx");
    }
    //return the customer to the customer dashboard
    protected void btnReturnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerHome.aspx");
    }
}