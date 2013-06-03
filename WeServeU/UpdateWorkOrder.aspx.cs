using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateWorkOrder : System.Web.UI.Page
{
    int id;
    string fname;
    string lname;
    string perm;
    

    protected void Page_Load(object sender, EventArgs e)
    {
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
        fname = Session["EmpFname"].ToString();
        lname = Session["EmpLname"].ToString();

        //Custom welcome message on the screen
        lblWelcome.Text = "Welcome " + fname + " " + lname + ". Employee ID: " + id;
        
        
    }
    //This is the onclick for the return button. Do not remove
    protected void btnReturnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHome.aspx");
    }
}