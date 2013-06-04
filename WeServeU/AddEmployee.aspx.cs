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

public partial class AddEmployee : System.Web.UI.Page
{
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
    protected void btnAddEmployee_Click(object sender, EventArgs e)
    {
        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("INSERT INTO Employee (EmpFName, EmpLName, EmpDOB, EmpSSN, EmpPhone, EmpEmail, EmpAddress, EmpApt, EmpCity, EmpState, EmpZip, EmpCounty, EmpLicNum, EmpLicExp," +
             "EmpLicCnty, EmpEmerCont, EmpECFName, EmpECLName, EmpECPhone, EmpECAddress, EmpUser, EmpPass, EmpPerm, EmpCont, EmpExp, EmpPay, EmpW9, EmpStatus) VALUES (@EmpFName, @EmpLName, " +
            "@EmpDOB, @EmpSSN, @EmpPhone, @EmpEmail, @EmpAddress, @EmpApt, @EmpCity, @EmpState, @EmpZip, @EmpCounty, @EmpLicNum, @EmpLicExp, @EmpLicCnty, @EmpEmerCont, @EmpECFName, @EmpECLName, " +
            "@EmpECPhone, @EmpECAddress, @EmpUser, @EmpPass, @EmpPerm, @EmpCont, @EmpExp, @EmpPay, @EmpW9, @EmpStatus);", conn);
            
            cmd.Parameters.AddWithValue("@EmpFName", txtFName.Text);
            cmd.Parameters.AddWithValue("@EmpLName", txtLName.Text);
            cmd.Parameters.AddWithValue("@EmpDOB",  txtDOB.Text);
            cmd.Parameters.AddWithValue("@EmpSSN", txtSSN.Text );
            cmd.Parameters.AddWithValue("@EmpPhone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@EmpEmail", txtEmail.Text);
            cmd.Parameters.AddWithValue("@EmpAddress", txtStreet.Text);
            cmd.Parameters.AddWithValue("@EmpApt", txtApt.Text);
            cmd.Parameters.AddWithValue("@EmpCity", txtCity.Text);
            cmd.Parameters.AddWithValue("@EmpState", ddlState.SelectedValue);
            cmd.Parameters.AddWithValue("@EmpZip", txtZip.Text);
            cmd.Parameters.AddWithValue("@EmpCounty", txtCounty.Text);
            cmd.Parameters.AddWithValue("@EmpLicNum", txtLicCounty.Text);
            cmd.Parameters.AddWithValue("@EmpLicExp", txtLicExp.Text);
            cmd.Parameters.AddWithValue("@EmpLicCnty", txtLicCounty.Text);
            cmd.Parameters.AddWithValue("@EmpEmerCont", txtEmerCont.Text );
            cmd.Parameters.AddWithValue("@EmpECFName", txtEFName.Text);
            cmd.Parameters.AddWithValue("@EmpECLName", txtELName.Text);
            cmd.Parameters.AddWithValue("@EmpECPhone", txtEPhone.Text);
            cmd.Parameters.AddWithValue("@EmpECAddress", txtEAddr.Text );
            cmd.Parameters.AddWithValue("@EmpUser", txtUser.Text);
            cmd.Parameters.AddWithValue("@EmpPass", txtPass.Text);            
            cmd.Parameters.AddWithValue("@EmpPerm", rdoAdmin.SelectedValue);
            cmd.Parameters.AddWithValue("@EmpCont", txtConAgreeDate.Text );
            cmd.Parameters.AddWithValue("@EmpExp", txtConExp.Text);
            cmd.Parameters.AddWithValue("@EmpPay", txtBase.Text);
            cmd.Parameters.AddWithValue("@EmpW9", txtW9Date.Text);
            cmd.Parameters.AddWithValue("@EmpStatus", "A");


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            lblAddSuccess.Text = "The employee was added succesfully";
            lblAddSuccess.Visible = true;
            ClearInputs(Page.Controls);
           
        }
        catch (SqlException ex)
        {
            lblAddSuccess.Text = "The employee was not added due to an error. Please try again";
            lblAddSuccess.ForeColor = System.Drawing.Color.Red;
            lblAddSuccess.Visible = true;
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
    protected void btnReturnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHome.aspx");
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("login.aspx");
    }
}