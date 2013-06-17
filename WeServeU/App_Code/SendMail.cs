﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net;
using System.Data.SqlClient;
using System.Net.Mime;


/// Created By Scott Beachy
/// This class will be used to send all the mail to employees and customers from the system
/// </summary>
public class SendMail
{
    //GoDaddys smtp server name. 
    const string SERVER = "relay-hosting.secureserver.net";

	public SendMail()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
    public bool Send_EmpEmail(string workOrderNum)
    {
        string email;
        try
        {
            //Get workorder details from the database
            string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("SELECT WorkOrder.WFName + ' ' + WorkOrder.WLName AS Customer, WorkOrder.WOPFName + ' ' + WorkOrder.WOPLName AS 'Opposing Party', " +
                "WorkOrder.WCaseNumber, Employee.EmpEmail From WorkOrder Inner Join Employee ON Employee.EmpID = WorkOrder.EmpID WHERE WorkOrder.WorkOrderID = @WorkOrderID;", conn);

            cmd.Parameters.AddWithValue("WorkOrderID", workOrderNum);

            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            try
            {
                //Create the email message
                email = dt.Rows[0][3].ToString();
                MailAddress from = new MailAddress("info@weserveu.biz");
                MailAddress to = new MailAddress(email.Trim());
                MailMessage mailObj = new MailMessage(from, to);

                

                mailObj.Subject = "You were assigned a new serve from WeserveU";
                //Create the message body
                
                mailObj.Body += "<h2>You have been assigned a new serve by the staff at WeserveU.biz.</h2> <br /> " +
                    "<h3>Please log in to WeServeU.biz to download documents</h3><h2>Details: </h2> <P>Case Number: " +
                    dt.Rows[0][2].ToString() + "</p><p>Customer: " + dt.Rows[0][0].ToString() + "</p><p>Opposing Party: " +
                    dt.Rows[0][1].ToString();
              
                
                mailObj.IsBodyHtml = true;

                //uncomment these lines when loading to GoDaddy Servers. 

                SmtpClient smtp = new SmtpClient(SERVER);
                smtp.Send(mailObj);
                mailObj = null;
                return true;
            }
            catch (SmtpException se)
            {
                return false;
            }
        }
        catch (SqlException ex)
        {
            return false;
        }
       


    }
            
    public bool Send_CustMail(string workOrderID)
    {
        string workOrderNum = workOrderID;
        string connection = ConfigurationManager.ConnectionStrings["testDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        SqlCommand cmd = new SqlCommand("SELECT ;", conn);

        cmd.Parameters.AddWithValue("WorkOrderID", workOrderNum);

        conn.Open();
        
        return false;
    }


    //Send the Admin Email when a new WorkOrder is created. 
    public bool Send_AdminMail(string customerID)
    {
        string id = customerID;
        try
        {
            //Create the email message
            
            MailAddress from = new MailAddress("info@weserveu.biz");
            MailAddress to = new MailAddress("info@weservu.biz");
            MailMessage mailObj = new MailMessage(from, to);
            mailObj.Subject = "A new work order has been created on WeserveU";
            //Create the message body
            mailObj.Body = "<h2>A new work order has been created by customer number " + id + "</h2> <br /> "
                + "<p>The workorder is editable at this time but they need to upload documents to complete the serve</p>";
                


            mailObj.IsBodyHtml = true;

            //uncomment these lines when loading to GoDaddy Servers. 

            SmtpClient smtp = new SmtpClient(SERVER);
            smtp.Send(mailObj);
            mailObj = null;
            return true;
        }
        catch(SmtpException ex)
        {
            return false;
        }
        
        
    }
    /*firstname, lastname, email, message
     * */
    public void CustQuestion(string email, string firstName, string lastName, string message)
    {
        MailAddress from = new MailAddress(email);
        MailAddress to = new MailAddress("info@weservu.biz");
        MailMessage mailObj = new MailMessage(from, to);
        mailObj.Subject = "You have recieved a question from WeServeUllc.com";
        //Create the message body
        mailObj.Body = "<h2>" + firstName + " " + lastName + " has a question.</h2><p> " + message + "</p>"
            + "<p>And can be reached at this email address: " + email + "</p>";
        mailObj.IsBodyHtml = true;

        //uncomment these lines when loading to GoDaddy Servers. 

        SmtpClient smtp = new SmtpClient(SERVER);
        smtp.Send(mailObj);
        mailObj = null;
    }

    public bool Retrieve_Password(string email, string pass)
    {
        string _email = email;        
        string _pass = pass;
        
        try
        {
            //Create the email message

            MailAddress from = new MailAddress("info@weserveu.biz");
            MailAddress to = new MailAddress(email.Trim());
            MailMessage mailObj = new MailMessage(from, to);
            mailObj.Subject = "Password Recovery";
            //Create the message body
            mailObj.Body += "<h2>Password recovery request from Weservullc.com</h2><br /> "
                + "<p>Your password is: " + _pass + "</p>";



            mailObj.IsBodyHtml = true;

            //uncomment these lines when loading to GoDaddy Servers. 

            ////SmtpClient smtp = new SmtpClient(SERVER);
            ////smtp.Send(mailObj);
            ////mailObj = null;
            return true;
        }
        catch(SmtpException se)
        {
            return false;
        }
        
    }
}