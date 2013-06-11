using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fname;
        string lname;
        string email;
        string message;

        fname = txtFName.Text;
        lname = txtLName.Text;
        email = txtEmail.Text;
        message = txtMessage.Text;

        SendMail sm = new SendMail();
        sm.CustQuestion(email, fname, lname, message);
    }
}