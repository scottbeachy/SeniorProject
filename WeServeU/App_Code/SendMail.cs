using System;
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
/// This class will be used to send all the mail to employees and customers
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

                //string body = "<h2>You have been assigned a new serve by the staff at WeserveU.biz.</h2> <br /> " +
                //    "<h3>Please log in to WeServeU.biz to download documents</h3><h2>Details: </h2> <P>Case Number: " +
                //    dt.Rows[0][2].ToString() + "</p><p>Customer: " + dt.Rows[0][0].ToString() + "</p><p>Opposing Party: " +
                //    dt.Rows[0][1].ToString() + "</p>";
                

                mailObj.Subject = "You were assigned a new serve from WeserveU";
                //Create the message body
                
                mailObj.Body += "<h2>You have been assigned a new serve by the staff at WeserveU.biz.</h2> <br /> " +
                    "<h3>Please log in to WeServeU.biz to download documents</h3><h2>Details: </h2> <P>Case Number: " +
                    dt.Rows[0][2].ToString() + "</p><p>Customer: " + dt.Rows[0][0].ToString() + "</p><p>Opposing Party: " +
                    dt.Rows[0][1].ToString();
                //Tried to get the logo into the message but it is not working at this time. 
                //ContentType ct = new ContentType("text/html");
                //ContentType plain = new ContentType("text/plain");
                //string path = HttpContext.Current.Server.MapPath("images/newbanner.jpg");
                //AlternateView plainTextView = AlternateView.CreateAlternateViewFromString(body, plain);
                //AlternateView htmlView = AlternateView.CreateAlternateViewFromString("<image src=\"cid:Logo\" />" + body, ct);
                
                ////"<image src=cid:Logo />" + body, null, MediaTypeNames.Text.Html
                //LinkedResource image = new LinkedResource(path, "image/jpeg");
                //image.ContentId = "Logo";
                //htmlView.LinkedResources.Add(image);
                //mailObj.AlternateViews.Add(plainTextView);
                //mailObj.AlternateViews.Add(htmlView);
                
                mailObj.IsBodyHtml = true;

                //uncomment these lines when loading to GoDaddy Servers. 

                //SmtpClient smtp = new SmtpClient(SERVER);
                //smtp.Send(mailObj);
                //mailObj = null;
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
            //Send the Customer Email when the CoS is completed. 
            /* Need to read the data from the docs table into a byte[] with a dataReader and then convert to a memory stream object.
             * Code Sample:
             * MailMessage mail = new MailMessage();
             //Create a MemoryStream from a file for this test
                MemoryStream ms = new MemoryStream();

                 mail.Attachments.Add(new System.Net.Mail.Attachment(ms, "test.gif"));
                if (mail.Attachments[0].ContentStream == ms) Console.WriteLine("Streams are referencing the same resource");
                    Console.WriteLine("Stream length: " + mail.Attachments[0].ContentStream.Length);

                 //Dispose the mail as you should after sending the email
                mail.Dispose();

             * 
             * */
    public bool Send_CustMail(string workOrderID)
    {
        //just put this in to remove the squiggles
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
            mailObj.Body += "<h2>A new work order has been created by customer number " + id + "</h2> <br /> "
                + "<p>The workorder is editable at this time but they need to upload documents to complete the serve</p>";
                


            mailObj.IsBodyHtml = true;

            //uncomment these lines when loading to GoDaddy Servers. 

            //SmtpClient smtp = new SmtpClient(SERVER);
            //smtp.Send(mailObj);
            //mailObj = null;
            return true;
        }
        catch(SmtpException ex)
        {
            return false;
        }
        
        
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

            //SmtpClient smtp = new SmtpClient(SERVER);
            //smtp.Send(mailObj);
            //mailObj = null;
            return true;
        }
        catch(SmtpException se)
        {
            return false;
        }
        
    }
}