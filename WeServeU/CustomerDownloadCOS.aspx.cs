using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerDownloadCOS : System.Web.UI.Page
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
        string select = "SELECT Doc from Docs WHERE CustomerID = " + id + " AND EmpID IS NOT NULL";
        FileWork fw = new FileWork();
        fw.DownloadFile(select);

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