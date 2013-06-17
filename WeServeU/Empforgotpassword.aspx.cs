using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Empforgotpassword : System.Web.UI.Page
{
    string fname;
    string lname;
    string user;
    string pass;
    bool success;
    string email;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRetrieve_Click(object sender, EventArgs e)
    {
        fname = txtFName.Text;
        lname = txtLName.Text;
        user = txtUser.Text;
        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("Select EmpEmail, EmpPass FROM Employee WHERE EmpFName = @EmpFName AND EmpLName = @EmpLName AND EmpUser = @EmpUser;", conn);
            cmd.Parameters.AddWithValue("@EmpFName", fname);
            cmd.Parameters.AddWithValue("@EmpLName", lname);
            cmd.Parameters.AddWithValue("@EmpUser", user);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                email = dt.Rows[0][0].ToString();
                pass = dt.Rows[0][1].ToString();
                SendMail sm = new SendMail();
                success = sm.Retrieve_Password(email, pass);
                if (success)
                {
                    lblSucc.Text = "Your password has been sent.";
                    lblSucc.Visible = true;
                    txtFName.Text = "";
                    txtLName.Text = "";
                    txtUser.Text = "";
                }
                else
                {
                    lblSucc.Text = "There was a problem sending the email. Please try again later or contact the administration.";
                    lblSucc.ForeColor = System.Drawing.Color.Red;
                    lblSucc.Visible = true;
                }
            }

            else
            {
                lblSucc.Text = "There are no records matching that information. Please try again.";
                lblSucc.ForeColor = System.Drawing.Color.Red;
                lblSucc.Visible = true;
            }
            conn.Close();

        }
        catch (SqlException se)
        {
            lblSucc.Text = "There was a problem connecting to the server. Please try again later.";
            lblSucc.ForeColor = System.Drawing.Color.Red;
            lblSucc.Visible = true;
        }
    }
}