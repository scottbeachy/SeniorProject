//This page created by Paul Ortega
//Last Edited: 6/14/2013
//Creates a customer record in the DB based on user input

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class requestServices : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCreateAcct_Click(object sender, EventArgs e)
    {
        //Set up connection
        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);

        //Insert request username from form into SqlCommand
        SqlCommand cmnd = new SqlCommand("SELECT * from Customer WHERE CUser = @CUser", conn);
        cmnd.Parameters.AddWithValue("@CUser", txtUsername.Text);

        //Open connection & read in usernames from DB
        conn.Open();
        SqlDataReader dr = cmnd.ExecuteReader();

        //If requested username returns any rows, display error & closer connection & DataReader
        if (dr.HasRows)
        {
            lblError.Text = "Someone already has that username. Try another.";
            lblError.Visible = true;
            dr.Close();
            conn.Close();
        }

        else
        {
            //DataReader will still be open and must be closed before executing SqlCommand
            dr.Close();
            try
            {
                //Create parameterized insert statement
                string insertStmt = "INSERT into Customer(CFname, CLname, CFirmName, CPhone, CFax, " +
                "CEmail, CAddress, CApt, CCity, CState, CCounty, CZip, CUser, CPass, CPerm) " +
                "VALUES(@CFname, @CLname, @CFirmName, @CPhone, @CFax, @CEmail, @CAddress, @CApt, @CCity, @CState, @CCounty, @CZip, @CUser, @CPass, @CPerm)";

                //Iniatalize & add parameters to the SqlCommand object
                SqlCommand cmd = new SqlCommand(insertStmt, conn);
                cmd.Parameters.AddWithValue("@CFname", txtFname.Text);
                cmd.Parameters.AddWithValue("@CLname", txtLname.Text);
                cmd.Parameters.AddWithValue("@CFirmName", txtFirmName.Text);
                cmd.Parameters.AddWithValue("@CPhone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@CFax", txtFax.Text);
                cmd.Parameters.AddWithValue("@CEmail", txtEmail.Text);
                cmd.Parameters.AddWithValue("@CAddress", txtAddress.Text);
                cmd.Parameters.AddWithValue("@CApt", txtApartment.Text);
                cmd.Parameters.AddWithValue("@CCity", txtCity.Text);
                cmd.Parameters.AddWithValue("@CState", ddState.SelectedValue);
                cmd.Parameters.AddWithValue("@CCounty", txtCounty.Text);
                cmd.Parameters.AddWithValue("@CZip", txtZip.Text);
                cmd.Parameters.AddWithValue("@CUser", txtUsername.Text);
                cmd.Parameters.AddWithValue("@CPass", txtPassword.Text);
                cmd.Parameters.AddWithValue("@CPerm", "C");

                //Execute Query & Close Connection
                cmd.ExecuteNonQuery();
                conn.Close();

                //Send to account successful page
                Response.Redirect("AccountSuccessful.aspx");
            }

            catch (SqlException ex)
            {
                lblError.Text = "Account could not be created. Please try again later.";
                lblError.Visible = true;
            }
        }
    }
}