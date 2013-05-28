/*This is the logged in Employee Home Page
 * Created by Josh Snyder
 * 5/24/13
 * */

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

public partial class EmpHome : System.Web.UI.Page
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

        if (!Session["Perm"].Equals("E"))
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
            cmd.Parameters.AddWithValue("date1", date1);
            cmd.Parameters.AddWithValue("date2", date2);
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
        string workOrderNum;
        //string empNum;
        workOrderNum = ddlWOList.SelectedValue;
        //empNum = ddlEmpList.SelectedValue;
        try
        {
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("UPDATE WorkOrder SET EmpID = @EmpID WHERE WorkOrderID = @WorkOrderID;", conn);
            //cmd.Parameters.AddWithValue("@EmpID", empNum);
            cmd.Parameters.AddWithValue("@WorkOrderID", workOrderNum);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            //lblWONum.Text = ddlEmpList.SelectedItem.ToString() + " was assigned to work order #" + workOrderNum;
            lblWONum.Visible = true;

        }
        catch (SqlException ex)
        {
            lblWONum.Text = "The work order was not assigned due to an error";
            lblWONum.ForeColor = System.Drawing.Color.Red;
            lblWONum.Visible = true;
        }



    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}