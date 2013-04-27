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
        lblError.Visible = false;
    }
    protected void btnCstLogin_Click(object sender, EventArgs e)
    {
       //Customer Login Code
        lblError.Visible = false;
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
                lblError.Text = "Your login was incorrect. Please try again. ";
                lblError.Visible = true;
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
            lblError.Text = "Something happened to your connection. Please try again later. ";
            lblError.Visible = true;
            txtCstPass.Text = "";
            txtCstUser.Text = "";
        }
        
    }
}