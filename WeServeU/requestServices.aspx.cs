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
        string insertStmt = "INSERT into Customer(CFname, CLname, CFirmName, CPhone, CFax, " +
        "CEmail, CAddress, CApt, CCity, CState, CCounty, CZip, CUser, CPass, CPerm) " +
        "VALUES(@CFname, @CLname, @CFirmName, @CPhone, @CFax, @CEmail, @CAddress, @CApt, @CCity, @CState, @CCounty, @CZip, @CUser, @CPass, @CPerm)";

        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);

        string phone = txtPhone.Text;

        SqlCommand cmd = new SqlCommand(insertStmt, conn);
        cmd.Parameters.AddWithValue("@CFname", txtFname.Text);
        cmd.Parameters.AddWithValue("@CLname", txtLname.Text);
        cmd.Parameters.AddWithValue("@CFirmName", txtFirmName.Text);
        cmd.Parameters.AddWithValue("@CPhone", int.Parse(phone));
        cmd.Parameters.AddWithValue("@CFax", int.Parse(txtFax.Text));
        cmd.Parameters.AddWithValue("@CEmail", txtEmail.Text);
        cmd.Parameters.AddWithValue("@CAddress", txtAddress.Text);
        if (txtApartment.Text == "")
        {
            txtApartment.Text = "0";
        }
        cmd.Parameters.AddWithValue("@CApt", Int32.Parse(txtApartment.Text));
        cmd.Parameters.AddWithValue("@CCity", txtCity.Text);
        cmd.Parameters.AddWithValue("@CState", ddState.SelectedValue);
        cmd.Parameters.AddWithValue("@CCounty", txtCounty.Text);
        cmd.Parameters.AddWithValue("@CZip", int.Parse(txtZip.Text));
        cmd.Parameters.AddWithValue("@CUser", txtUsername.Text);
        cmd.Parameters.AddWithValue("@CPass", txtPassword.Text);
        cmd.Parameters.AddWithValue("@CPerm", "A");

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
}