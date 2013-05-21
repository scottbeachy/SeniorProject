using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateWorkOrder : System.Web.UI.Page
{
    string WorkOrderID = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Perm"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!Session["Perm"].Equals("A"))
        {
            Response.Redirect("login.aspx");

        }
        //WorkOrderID = Session["WorkOrderID"].ToString();
        
    }
}