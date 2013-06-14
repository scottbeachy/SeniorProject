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

        lblAddSuccess.Visible = true;
        ClearInputs(Page.Controls);
        
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
}