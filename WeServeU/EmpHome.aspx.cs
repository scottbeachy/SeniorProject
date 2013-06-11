/*This is the logged in Employee Home Page
 * Created by Josh Snyder
 * 5/24/13
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net;

public partial class EmpHome : System.Web.UI.Page
{
    //Some variables for use on this page
    int id;
    int woID;
    string fname;
    string lname;
    string perm;
    
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
        lblWelcome.Text = "Welcome " + fname + " " + lname + ". Employee ID: " + id;
    }



    //protected void ddlWOList_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    lblWONum.Text = "Work Order # " + ddlWOList.SelectedValue.ToString();
    //    lblWONum.Visible = true;
    //    Session["workOrderID"] = ddlWOList.SelectedValue.ToString();
    //}


    protected void btnEmpUpdate_Click(object sender, EventArgs e)
    {
        
        

        woID = Convert.ToInt16(ddlWOList.SelectedValue);

        Session["WorkOrderID"] = id;

        Response.Redirect("EmpUpdateWorkOrder.aspx");


    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("login.aspx");
    }
    protected void btnDownloadCOS_Click(object sender, EventArgs e)
    {
        woID = Convert.ToInt16(ddlWOList.SelectedValue);

        Session["WorkOrderID"] = id;

        Response.Redirect("EmpDownloadCOS.aspx");

    }
    protected void btnUploadCOS_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmpUploadCOS.aspx");
    }
    protected void btnPrintWO_Click(object sender, EventArgs e)
    {
        Response.Redirect("workOrderTemplate.pdf");
    }
}