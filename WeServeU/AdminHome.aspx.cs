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
    string emp;
    string woID;

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
        fname = Session["EmpFname"].ToString();
        lname = Session["EmpLname"].ToString();

        //Custom welcome message on the screen
        lblWelcome.Text = "Welcome " + fname + " " + lname + ". Employee ID: " + id;

        
        btnSelectClient.Visible = false;
        btnGenReportSubmit.Visible = false;
        if (!Page.IsPostBack)
        {
            btnViewNotes.Visible = false;
            lblViewNote.Visible = false;
            lblUpdate.Visible = false;
            btnChoose.Visible = false;
        }

        //btnShowPayroll.Visible = false;
        //ddPayRoll.Visible = false;
        //ListBoxPay.Visible = false;
        //lblEmpPay.Visible = false;
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
        string clientFName = txtClientFirstName.Text;
        string clientLName = txtClientLastName.Text;
        string firmName = txtFirmName.Text;

        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("Select  * FROM Customer WHERE CFname = @clientFName OR CLname = @clientLName OR CFirmName = @firmName ;", conn);

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
                lblCLientUpdate.Visible = false;
                btnSelectClient.Visible = true;
                ddUpdateClient.Visible = true;
            }

            else
            {
                lblCLientUpdate.Text = ("Input invalid. Please enter proper customer data.");
                lblCLientUpdate.Visible = true;
                btnSelectClient.Visible = false;
                ddUpdateClient.Visible = false;
            }
            //btnSelectClient.Visible = true;
            //ddUpdateClient.Visible = true;

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
    protected void btnAddEmp_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddEmployee.aspx");
    }
    protected void btnUpdateEmp_Click(object sender, EventArgs e)
    {

        emp = ddlUpdateEmp.SelectedValue;
        Session["EmployeeID"] = emp;
        Response.Redirect("UpdateEmployee.aspx");

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("login.aspx");
    }
    protected void btnSubmitRep_Click(object sender, EventArgs e)
    {
        string WStatus = txtGenStatus.Text;
        string WFName = txtGenFName.Text;
        string WLName = txtGenLName.Text;
        string WOPFName = txtGenFName.Text;
        string WOPLName = txtGenLName.Text;
        string WOdate1 = txtStartDateRep.Text;
        string WOdate2 = txtEndDateRep.Text;
       

        if (RadioButtonReport.SelectedIndex == 0)
        {
            try
            {
                string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
                SqlConnection conn = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand("Select * FROM WorkOrder WHERE (WStatus = @WStatus OR WFName = @WFName OR  WLName = @WLName OR WDateCreated Between @WODate1 AND @WODate2);", conn);

                cmd.Parameters.AddWithValue("@WFName", WFName);
                cmd.Parameters.AddWithValue("@WLName", WLName);
                cmd.Parameters.AddWithValue("@WODate1", WOdate1);
                cmd.Parameters.AddWithValue("@WODate2", WOdate2);
                cmd.Parameters.AddWithValue("@WStatus", WStatus);

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        ddGenReport.Items.Add(new ListItem(dt.Rows[i][0].ToString() + " " + dt.Rows[i][1].ToString(), dt.Rows[i][0].ToString()));
                        btnGenReportSubmit.Visible = true;
                        ddGenReport.Visible = true;
                    }
                }

                else
                {
                    lblGenReport.Text = ("Input invalid. Please enter proper data.");
                    lblGenReport.Visible = true;
                    btnGenReportSubmit.Visible = false;
                    ddGenReport.Visible = false;
                }
                conn.Close();
            }
            catch (Exception ex)
            {

                //Oops, something bad happened...
                lblGenReport.Text = ("There was an error connecting to the database. Please contact your system administrator.");
                lblGenReport.Visible = true;
            }

        }
        else if (RadioButtonReport.SelectedIndex == 1)
        {
            try
            {
                string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
                SqlConnection conn = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand("Select * FROM WorkOrder WHERE (WStatus = @WStatus OR WOPFName = @WOPFName OR  WOPLName = @WOPLName OR WDateCreated Between @WODate1 AND @WODate2);", conn);

                cmd.Parameters.AddWithValue("@WOPFName", WOPFName);
                cmd.Parameters.AddWithValue("@WOPLName", WOPLName);
                cmd.Parameters.AddWithValue("@WODate1", WOdate1);
                cmd.Parameters.AddWithValue("@WODate2", WOdate2);
                cmd.Parameters.AddWithValue("@WStatus", WStatus);

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        ddGenReport.Items.Add(new ListItem(dt.Rows[i][0].ToString() + " " + dt.Rows[i][1].ToString(), dt.Rows[i][0].ToString()));
                        btnGenReportSubmit.Visible = true;
                        ddGenReport.Visible = true;
                    }
                }

                else
                {
                    lblGenReport.Text = ("Input invalid. Please enter proper data.");
                    lblGenReport.Visible = true;
                    btnGenReportSubmit.Visible = false;
                    ddGenReport.Visible = false;
                }
                conn.Close();
            }
            catch (Exception ex)
            {

                //Oops, something bad happened...
                lblGenReport.Text = ("There was an error connecting to the database. Please contact your system administrator.");
                lblGenReport.Visible = true;
            }
        }
          else
          {
              lblGenReport.Text = "Please choose at least one from the checkbox selection.";
              lblGenReport.Visible = true;
          }

    }
    protected void btnGenReportSubmit_Click(object sender, EventArgs e)
    {
        string id = null;

        id = ddGenReport.SelectedValue;

        Session["WorkOrderID"] = id;

        Response.Redirect("TrackWOPlaintResp.aspx");
    }

    protected void btnViewNotes_Click(object sender, EventArgs e)
    {
        //string woID = null;
        woID = ddlUpdateNote.SelectedValue;

        Session["WorkOrderID"] = woID;
        Response.Redirect("ViewWorkNotes.aspx");
    }
    protected void btnUpdateNotes_Click(object sender, EventArgs e)
    {
        date1 = txtNoteBeginDate.Text;
        date2 = txtNoteEndDate.Text;
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

                    ddlUpdateNote.Items.Add(new ListItem(dt.Rows[i][0].ToString() + " " + dt.Rows[i][1].ToString(), dt.Rows[i][0].ToString()));

                }
            }

            else
            {
                //If there are no workorders in the specified date range, display this message
                lblViewNote.Text = ("There are no work orders in that date range. Please select another range.");
                lblViewNote.Visible = true;
            }
            //make both the select button and the ddl visible
            btnViewNotes.Visible = true;
            ddlUpdateNote.Visible = true;
            conn.Close();
        }
        catch (Exception ex)
        {
            //Oops, something bad happened...
            lblViewNote.Text = ("There was an error connecting to the database. Description: " + ex);
            lblViewNote.Visible = true;
        }
    }
    protected void btnShowPayroll_Click(object sender, EventArgs e)
    {
        string WODate1 = txtDate1.Text;
        string WODate2 = txtDate2.Text;
        double pay = 0;


        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            SqlCommand cmd = new SqlCommand("SELECT WServeCharge, WEmpBPay FROM WorkOrder WHERE WServDate BETWEEN @WODate1 AND @WODate2 AND EmpID = @EmpID", conn);
            cmd.Parameters.AddWithValue("@WODate1", WODate1);
            cmd.Parameters.AddWithValue("@WODate2", WODate2);
            cmd.Parameters.AddWithValue("@EmpID", DropDownListPay.SelectedValue);

            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    pay += Convert.ToDouble(dt.Rows[i][0]) * (Convert.ToDouble(dt.Rows[i][1]) + .5);
                }
            }
            lblPayroll.Text = String.Format("{0:C}", pay);
            //lblPayroll.Text = pay.ToString("{0:C, money}");
            lblPayroll.Visible = true;
        }
        catch(Exception payE)
        {
            lblPayroll.Text = "Something bad happened " + payE.ToString();
            lblPayroll.Visible = true;
        }

        

        
    }



    protected void btnViewWoByStatus_Click(object sender, EventArgs e)
    {
        string status;
        string date1;
        string date2;

        status = rdoWoStatus.SelectedValue;
        date1 = txtStatusDate1.Text;
        date2 = txtStatusDate2.Text;

        Session["woStatus"] = status;
        Session["date1"] = date1;
        Session["date2"] = date2;

        Response.Redirect("ViewWOByStatus.aspx");
    }
}