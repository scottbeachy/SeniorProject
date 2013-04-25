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
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCstLogin_Click(object sender, EventArgs e)
    {
       //Trying to create a Test Connection. Works! Yay!
        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        //conn.Open();


        SqlCommand cmd = new SqlCommand("SELECT * from Customer", conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            //this didn't work so well but it did read data, I just couldnt figure out how to read it sequentially.
        }
        dr.Close();
        conn.Close();
    }
}