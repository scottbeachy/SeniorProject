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

        //if(Page.IsPostBack)
        //{
        //    lblCreateWOError.Visible = false;
        //}
        lblCreateWOError.Visible = false;
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
        DateTime today = DateTime.Now;
       try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("INSERT INTO WorkOrder (CustomerID, WCaseNumber, WFName, WLName, WOPFName, WOPLName, WServAdd, WServApt, WServCity, WServState, WServZip, WStatus, WDateCreated) VALUES (@CustomerID, @WCaseNumber, @WFName, @WLName, @WOPFname, @WOPLName, @WServAdd, @WServApt, @WServCity, @WServState, @WServZip, @WStatus, @WDateCreated);", conn);

            cmd.Parameters.AddWithValue("@CustomerID", id);
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
            cmd.Parameters.AddWithValue("@WStatus", "A");
            cmd.Parameters.AddWithValue("@WDateCreated", today);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
           
            // Email the admin about the new work order
            SendMail sm = new SendMail();
            if(sm.Send_AdminMail(id.ToString()))
            {
                //Show a success label
                lblCreateWOError.Text = "Your work order was created successfully. Please navigate to the Upload document page to upload the needed court documents.";
                lblCreateWOError.ForeColor = System.Drawing.Color.Green;
                lblCreateWOError.Visible = true;
                btnGoToUpload.Visible = true;
                ClearInputs(Page.Controls);

            }
            else
            {
                lblCreateWOError.Text = "Your work order was created successfully but the system failed to properly notify the staff at WeServeU LLC.";
                lblCreateWOError.ForeColor = System.Drawing.Color.Green;
                lblCreateWOError.Visible = true;
            }

       }
        catch(SqlException se)
       {
           lblCreateWOError.Text = "There was an error creating your work order" + se.ToString();
           lblCreateWOError.ForeColor = System.Drawing.Color.Red;
           lblCreateWOError.Visible = true;
       }
    }
    //clears all textboxes
    private void ClearInputs(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;

            ClearInputs(ctrl.Controls);
        }
    }

    protected void btnGoToUpload_Click(object sender, EventArgs e)
    {

    }
}