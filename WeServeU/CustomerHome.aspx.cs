/*This is the logged in Customer page
//Created by Scott Beachy
//4/30/13
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class CustomerHome : System.Web.UI.Page
{
    //Some variables for use on this page
    int id;
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

        if(!Session["Perm"].Equals("C"))
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
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("login.aspx");
    }


    protected void btnCreateWorkOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerCreateWO.aspx");
    }

    protected void btnViewWorkOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerViewWO.aspx");
    }


    protected void btnUpdateAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerUpdateAccount.aspx");
    }


    protected void btnDownloadCOS_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerDownloadCOS.aspx");
    }
    protected void btnGoToUpload_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerUpload.aspx");
    }
}