using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmpUploadCOS : System.Web.UI.Page
{
    //Some variables for use on this page
    int id;
    string fname;
    string lname;
    string perm;
    int woID;

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
        woID = Convert.ToInt16(Session["WorkOrderID"]);
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
    protected void btnReturnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmpHome.aspx");
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        int fileLength;
        bool success;
        bool emailSuccess;
        //two different connection strings to use to overwrite the doc if there is one in there already
        string connectionString = "INSERT INTO Docs (WorkOrderID, EmpID, Doc) VALUES (@WorkOrderID, @EmpID, @Doc)";
        string altConnString = "UPDATE Docs SET Doc = @Doc WHERE WorkOrderID = @WorkOrderID";

        //test the docs table and see if there is a doc in there and then switch the connection string 
        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        SqlCommand cmd = new SqlCommand("SELECT DocID from Docs WHERE WorkOrderID = @WorkOrderID;", conn);
        cmd.Parameters.AddWithValue("@WorkOrderID", woID);
        
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            connectionString = altConnString;
        }
        conn.Close();
        dt.Clear();

        //first check to see if there is actually a file selected, then do work
        if (cstFileUp.HasFile)
        {
            string fileExt = System.IO.Path.GetExtension(cstFileUp.FileName);
            if (fileExt == ".pdf")
            {

                //get the file length to initialize the array to
                fileLength = cstFileUp.PostedFile.ContentLength;
                byte[] fileBytes = new byte[fileLength - 1];
                //read the bytes of the file
                fileBytes = cstFileUp.FileBytes;
                //create a new instance to use its methods
                FileWork fw = new FileWork();
                //method returns a boolean to check for successfull addition of the file to the db
                success = fw.UploadFile(connectionString, woID.ToString(), fileBytes);
                if (success)
                {
                    SendMail sm = new SendMail();
                    emailSuccess = sm.Send_CustMail(woID.ToString());
                    if (emailSuccess)
                    {
                        lblUploadStatus.Text = "Your file has been uploaded and the Customer has been notified.";
                        lblUploadStatus.ForeColor = System.Drawing.Color.Green;
                        lblUploadStatus.Visible = true;
                    }
                    else
                    {
                        lblUploadStatus.Text = "The file was uploaded but the system failed to notify the customer. Please notify the customer manually.";
                        lblUploadStatus.ForeColor = System.Drawing.Color.Red;
                        lblUploadStatus.Visible = true; 
                    }
                    
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
                lblUploadStatus.Text = "File is not a PDF. Please only upload PDF documents";
                lblUploadStatus.ForeColor = System.Drawing.Color.Red;
                lblUploadStatus.Visible = true;
            }

        }
        else
        {
            lblUploadStatus.Text = "There was no file specified to upload";
        }
    }
}