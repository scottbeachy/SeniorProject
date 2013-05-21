//This page created by Scott Beachy
//4/30/2013
//Login Codebehind with seperate button event handlers
//for Customers and Employees

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    //variables for use on this page
    string perm;
    string fname;
    string lname;
    int id;
    string pass;
    


    protected void Page_Load(object sender, EventArgs e)
    {
        lblCstError.Visible = false;
        lblEmpError.Visible = false;
        
    }
    protected void btnCstLogin_Click(object sender, EventArgs e)
    {
       //Customer Login Code
        lblCstError.Visible = false;
        //Try to Login and catch the exception
        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            SqlCommand cmd = new SqlCommand("SELECT CustomerID, CPerm, CFName, CLName, CPass from Customer where CUser = @CUser and CPass = @CPass", conn);
            cmd.Parameters.AddWithValue("@CUser", txtCstUser.Text);
            cmd.Parameters.AddWithValue("@CPass", txtCstPass.Text);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Get the data out of the data reader and assign to the variables
            while (dr.Read())
            {
                id = Convert.ToInt32(dr[0]);
                perm = dr[1].ToString();
                fname = dr[2].ToString();
                lname = dr[3].ToString();
                pass = dr[4].ToString();

            }
            dr.Close();
            conn.Close();
            //Check the customers password with what is in the database
            if (pass.Equals(txtCstPass.Text, StringComparison.Ordinal)) 
            {
                //If the login is incorrect or no account "perm" will be null so show error message
                if (perm == null)
                {
                    lblCstError.Text = "Your login was incorrect. Please try again. ";
                    lblCstError.Visible = true;
                    txtCstPass.Text = "";
                }
                else
                {
                    //If "perm" has a value the login was good so assign the values of the variables to the session for use on other pages
                    Session["CustID"] = id;
                    Session["Perm"] = perm;
                    Session["CFname"] = fname;
                    Session["CLname"] = lname;
                    Response.Redirect("CustomerHome.aspx");
                }
            }
            else
            {
                lblCstError.Text = "Your Password was incorrect. Please try again.";
                lblCstError.Visible = true;
            }




        }
        catch (SqlException ex)
        {
            //Bad connection or something else happened 
            lblCstError.Text = "Something happened to your connection. Please try again later. ";
            lblCstError.Visible = true;
            txtCstPass.Text = "";
            txtCstUser.Text = "";
        }
        
    }

    //All of this does the same thing as above but checks the Employee table for the values
    //See comments above for descriptions
    protected void btnEmpLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            SqlCommand cmd = new SqlCommand("SELECT EmpID, EmpPerm, EmpFName, EmpLName, EmpPass from Employee where EmpUser = @EmpUser and EmpPass = @EmpPass", conn);
            cmd.Parameters.AddWithValue("@EmpUser", txtEmpUser.Text);
            cmd.Parameters.AddWithValue("@EmpPass", txtEmpPass.Text);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                id = Convert.ToInt32(dr[0]);
                perm = dr[1].ToString();
                fname = dr[2].ToString();
                lname = dr[3].ToString();
                pass = dr[4].ToString();

            }
            dr.Close();
            conn.Close();

            if (pass.Equals(txtEmpPass.Text, StringComparison.Ordinal))
            {
                if (perm == null)
                {
                    lblEmpError.Text = "Your login was incorrect. Please try again. ";
                    lblEmpError.Visible = true;
                    txtEmpPass.Text = "";
                }
                else
                {
                    Session["EmpID"] = id;
                    Session["Perm"] = perm;
                    Session["CFname"] = fname;
                    Session["CLname"] = lname;

                    if (perm == "E")
                    {
                        Response.Redirect("EmpHome.aspx");
                    }
                    if (perm == "A")
                    {
                        Response.Redirect("AdminHome.aspx");
                    }
                }
            }
            else
            {
                lblEmpError.Text = "Your Password was incorrect. Please try again.";
                lblEmpError.Visible = true;
            }





        }
        catch (SqlException ex)
        {
            //Bad connection or something else happened 
            lblEmpError.Text = "Something happened to your connection. Please try again later. ";
            lblEmpError.Visible = true;
            txtEmpPass.Text = "";
            txtEmpUser.Text = "";
        }
        
    }
}