//This is the logged in Admin Home Page
//Created by Scott Beachy
//4/30/13


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net;


public partial class AdminHome : System.Web.UI.Page
{
    //Some variables for use on this page
    int id;
    string fname;
    string lname;
    string perm;
    string date1;
    string date2;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Check permission level and redirect if needed
        if (Session["Perm"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!Session["Perm"].Equals("A"))
        {
            Response.Redirect("login.aspx");

        }

        //assign the variables from the session created from the login page
        id = Convert.ToInt32(Session["EmpID"]);
        perm = Session["Perm"].ToString();
        fname = Session["CFname"].ToString();
        lname = Session["CLname"].ToString();

        //Custom welcome message on the screen
        lblWelcome.Text = "Welcome " + fname + " " + lname + ". Employee ID: " + id;
       
        lblUpdate.Visible = false;
        btnChoose.Visible = false;
        btnSelectClient.Visible = false;
    }
    protected void btnUpdateWrk_Click(object sender, EventArgs e)
    {
        date1 = txtWrkDate1.Text;
        date2 = txtWrkDate2.Text;
        try
        {
            //Connnect to DB and fill the ddl list with the WorkOrder Values
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("Select WorkOrder.WorkOrderID, WorkOrder.WLName + ' VS ' + WorkOrder.WOPLName AS CustomerName FROM WorkOrder WHERE WorkOrder.WDateCreated Between @date1 AND @date2 ORDER BY WorkOrderID;", conn);
            cmd.Parameters.AddWithValue("@date1", date1);
            cmd.Parameters.AddWithValue("@date2", date2);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    
                    ddlUpdateWO.Items.Add(new ListItem(dt.Rows[i][0].ToString() + " " + dt.Rows[i][1].ToString(), dt.Rows[i][0].ToString()));           

                }
            }
               
            else
            {
                //If there are no workorders in the specified date range, display this message
                lblUpdate.Text = ("There are no work orders in that date range. Please select another range.");
                lblUpdate.Visible = true;
            }
            //make both the select button and the ddl visible
            btnChoose.Visible = true;
            ddlUpdateWO.Visible = true;
            conn.Close();
        }
        catch (Exception ex)
        {
            //Oops, something bad happened...
            lblUpdate.Text = ("There was an error connecting to the database. Description: " + ex);
            lblUpdate.Visible = true;
        }

    }


    protected void btnChoose_Click(object sender, EventArgs e)
    {
        string id = null;

        id = ddlUpdateWO.SelectedValue;

        Session["WorkOrderID"] = id;

        Response.Redirect("UpdateWorkOrder.aspx");
    }
    protected void ddlWOList_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblWONum.Text = "Work Order # " + ddlWOList.SelectedValue.ToString();
        lblWONum.Visible = true;
    }
    protected void btnAssign_Click(object sender, EventArgs e)
    {
        lblWONum.Visible = false;
        string workOrderNum;
        string empNum;
        workOrderNum = ddlWOList.SelectedValue;
        empNum = ddlEmpList.SelectedValue;
        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("UPDATE WorkOrder SET EmpID = @EmpID WHERE WorkOrderID = @WorkOrderID;", conn);
            cmd.Parameters.AddWithValue("@EmpID", empNum);
            cmd.Parameters.AddWithValue("@WorkOrderID", workOrderNum);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            //call the mail class to send the notification
            SendMail sm = new SendMail();
            bool success = sm.Send_EmpEmail(workOrderNum);
            //Check to see if the email was actually sent or not
            if (success)
            {
                lblWONum.Text = ddlEmpList.SelectedItem.ToString() + " was assigned to work order #" + workOrderNum + " and they were notified by email.";
                lblWONum.Visible = true;
            }
            else
            {
                //If there was a problem display this message
                lblWONum.Text = "There was a problem sending the notification email. But the employee was assigned to the workorder. Please try again later";
                lblWONum.ForeColor = System.Drawing.Color.Red;
                lblWONum.Visible = true;
            }
        }
        catch (SqlException ex)
        {
            lblWONum.Text = "The work order was not assigned due to an error";            
            lblWONum.ForeColor = System.Drawing.Color.Red;
            lblWONum.Visible = true;
        }



    }

    protected void btnUpdateClient_Click(object sender, EventArgs e)
    {
        string clientNum = txtClientID.Text;
        string clientFName = txtClientFirstName.Text;
        string clientLName = txtClientLastName.Text;
        string firmName = txtFirmName.Text;

        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("Select CustomerID, CFname, CLname, CFirmName FROM Customer WHERE CustomerID = @clientNum AND (CFname = @clientFName OR CLname = @clientLName OR CFirmName = @firmName) ;", conn);

            cmd.Parameters.AddWithValue("@clientNum", clientNum);
            cmd.Parameters.AddWithValue("@clientFName", clientFName);
            cmd.Parameters.AddWithValue("@clientLName", clientLName);
            cmd.Parameters.AddWithValue("@firmName", firmName);

            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    ddUpdateClient.Items.Add(new ListItem(dt.Rows[i][0].ToString() + " " + dt.Rows[i][1].ToString(), dt.Rows[i][0].ToString()));

                }
            }

            else
            {
                lblCLientUpdate.Text = ("Input invalid. Please enter proper customer data.");
                lblCLientUpdate.Visible = true;
            }
            btnSelectClient.Visible = true;
            ddUpdateClient.Visible = true;
            conn.Close();
        }
        catch (Exception ex)
        {
            //Oops, something bad happened...
            lblCLientUpdate.Text = ("There was an error connecting to the database. Please contact your system administrator.");
            lblCLientUpdate.Visible = true;
        }

    }
    protected void btnSelectClient_Click(object sender, EventArgs e)
    {
        string id = null;

        id = ddUpdateClient.SelectedValue;

        Session["CustomerID"] = id;

        Response.Redirect("UpdateClientInfo.aspx");

    }
}