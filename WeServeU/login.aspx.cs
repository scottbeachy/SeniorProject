using System;
using System.Collections.Generic;
using System.Linq;
//This page created by Scott Beachy
//4/24/2013
//Login Codebehind with seperate button event handlers
//for Customers and Employees


using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{

    string perm;
    string fname;
    string lname;


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

            SqlCommand cmd = new SqlCommand("SELECT CPerm, CFName, CLName from Customer where CUser = @CUser and CPass = @CPass", conn);
            cmd.Parameters.AddWithValue("@CUser", txtCstUser.Text);
            cmd.Parameters.AddWithValue("@CPass", txtCstPass.Text);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                perm = dr[0].ToString();
                fname = dr[1].ToString();
                lname = dr[2].ToString();

            }
            dr.Close();
            conn.Close();
            if (perm == null)
            {
                lblCstError.Text = "Your login was incorrect. Please try again. ";
                lblCstError.Visible = true;
                txtCstPass.Text = "";
            }
            else 
            {
                Session["Perm"] = perm;
                Session["CFname"] = fname;
                Session["CLname"] = lname;
                Response.Redirect("CustomerHome.aspx");
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
    protected void btnEmpLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            SqlCommand cmd = new SqlCommand("SELECT EmpPerm, EmpFName, EmpLName from Employee where EmpUser = @EmpUser and EmpPass = @EmpPass", conn);
            cmd.Parameters.AddWithValue("@EmpUser", txtEmpUser.Text);
            cmd.Parameters.AddWithValue("@EmpPass", txtEmpPass.Text);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                perm = dr[0].ToString();
                fname = dr[1].ToString();
                lname = dr[2].ToString();

            }
            dr.Close();
            conn.Close();
            if (perm == null)
            {
                lblEmpError.Text = "Your login was incorrect. Please try again. ";
                lblEmpError.Visible = true;
                txtEmpPass.Text = "";
            }
            else
            {
                Session["Perm"] = perm;
                Session["CFname"] = fname;
                Session["CLname"] = lname;

                if (perm == "E")
                {
                    Response.Redirect("EmpHome.aspx");
                }
                if(perm == "A")
                {
                    Response.Redirect("AdminHome.aspx");
                }
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