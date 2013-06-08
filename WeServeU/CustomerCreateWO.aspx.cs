using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerCreateWO : System.Web.UI.Page
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
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("login.aspx");
    }
    protected void btnReturnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerHome.aspx");
    }

    protected void btnCreateWO_Click(object sender, EventArgs e)
    {
       try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("INSERT INTO WorkOrder (WCaseNumber, WFName, WLName, WOPFName, WOPLName, WServAdd, WServApt, WServCity, WServState, WServZip) VALUES (@WCaseNumber, @WFName, @WLName, @WOPFname, @WOPLName, @WServAdd, @WServApt, @WServCity, @WServSate, @WServZip);", conn);

            cmd.Parameters.AddWithValue("@WCaseNumber", txtCaseNumber.Text);
            cmd.Parameters.AddWithValue("@WFName", txtFNameServiceRequestedBy.Text);
            cmd.Parameters.AddWithValue("@WLName", txtLNameServiceRequestedBy.Text);
            cmd.Parameters.AddWithValue("@WOPFName", txtOppFName.Text);
            cmd.Parameters.AddWithValue("@WOPLName", txtOppLName.Text);
            cmd.Parameters.AddWithValue("@WServAdd", txtServiceStreetAddress.Text);
            cmd.Parameters.AddWithValue("@WServApt", txtApartment.Text);
            cmd.Parameters.AddWithValue("@WServCity", txtCity.Text);
            cmd.Parameters.AddWithValue("@WServState", ddState.SelectedValue);
            cmd.Parameters.AddWithValue("@WServZip", txtZip.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
           //Show a success label
            lblCreateWOError.Text = "Your work order was created successfully. Please navigate to the Upload document page to upload the needed court documents.";
            lblCreateWOError.ForeColor = System.Drawing.Color.Green;
            lblCreateWOError.Visible = true;
            // Email the admin about the new work order
            SendMail sm = new SendMail();
            sm.Send_AdminMail(id.ToString());

       }
        catch(SqlException se)
       {            

       }
    }

}