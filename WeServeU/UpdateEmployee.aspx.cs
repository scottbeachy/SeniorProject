﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //This is the onclick for the return button. Do not remove
    protected void btnReturnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHome.aspx");
    }
}