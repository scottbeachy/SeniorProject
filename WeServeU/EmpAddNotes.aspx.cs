﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmpAddNotes : System.Web.UI.Page
{
    //Some variables for use on this page
    int id;
    string fname;
    string lname;
    string perm;
    string wID;
    
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
        wID = Session["WorkOrderID"].ToString();
        

        //Custom welcome message on the screen
        lblWelcome.Text = "Welcome " + fname + " " + lname + ". Employee ID: " + id;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string notes;

        notes = tbNotes.Text;
        DateTime dt = DateTime.Now;

        //Create parameterized insert statement
        string insertStmt = "INSERT into WorkNotes(WorkOrderID, EmpID, WNDate, WNComments) VALUES(@WorkOrderID, @EmpID, @WNDate, @WNComments);";

        try
        {
        //Set up connections
        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);

        //Iniatalize & add parameters to the SqlCommand object
        SqlCommand cmd = new SqlCommand(insertStmt, conn);
            
            cmd.Parameters.AddWithValue("@WorkOrderID", wID.ToString());
            cmd.Parameters.AddWithValue("@EmpID", id.ToString());
            cmd.Parameters.AddWithValue("@WNDate", dt);
            cmd.Parameters.AddWithValue("@WNComments", notes);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            lblAddSuccess.Visible = true;
            ClearInputs(Page.Controls);
        }
        catch(SqlException es)
        {
            lblAddFail.Visible = true;
            ClearInputs(Page.Controls);
        }
        
    }
    //this method clears all the textboxes without actually calling all the seperate values
    private void ClearInputs(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;

            ClearInputs(ctrl.Controls);
        }
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
}