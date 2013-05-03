//This is the logged in Admin Home Page
//Created by Scott Beachy
//4/30/13

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminHome : System.Web.UI.Page
{
    //Some variables for use on this page
    int id;
    string fname;
    string lname;
    string perm;
    //string date1;
    //string date2;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Check permission level and redirect if needed
        if (Session["Perm"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!Session["Perm"].Equals("A"))
        {
            Response.Redirect("login.aspx");

        }

        //assign the variables from the session created from the login page
        id = Convert.ToInt32(Session["EmpID"]);
        perm = Session["Perm"].ToString();
        fname = Session["CFname"].ToString();
        lname = Session["CLname"].ToString();

        //Custom welcome message on the screen
        lblWelcome.Text = "Welcome " + fname + " " + lname + ". Employee ID: " + id;
    }
    protected void btnUpdateWrk_Click(object sender, EventArgs e)
    {
        //date1 = txtWrkDate1.Text;
        //date2 = txtWrkDate2.Text;
        //Session["workOrderDate1"] = date1;
        //Session["workOrderDate2"] = date2;
        //Response.Redirect("UpdateWorkOrder.aspx");
        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        SqlCommand cmd = new SqlCommand("SELECT WorkOrderID from WorkOrder WHERE WDateCreated BETWEEN @date1 AND @date2", conn);
        cmd.Parameters.AddWithValue("date1", txtWrkDate1.Text);
        cmd.Parameters.AddWithValue("date2", txtWrkDate2.Text);


    }
}