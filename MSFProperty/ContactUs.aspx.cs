using System;
using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty
{
    public partial class ContactUs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string GetText(int id)
        {
            return DataCalls.GetText(id);
        }
        protected object GetColour(int id)
        {
            return DataCalls.GetColour(id);
        }
        public string GetImage(int id)
        {
            return DataCalls.GetImage(id);
        }

        protected void sendMessage_OnClick(object sender, EventArgs e)
        {
            if(Validation())
            //SendContactForm("info@msfproperty.co.uk", "Admin");
            SendContactForm("gfs_god@yahoo.com", "Admin");

        }

        private bool Validation()
        {
            var validated = true;
            if (C_U_Subject.Text == "")
            {
                C_U_Subject_Error.Text = "Please Enter A Subject ! ";
                validated = false;
            }
            if (C_U_Name.Text == "")
            {
                C_U_Name_Error.Text = "Please Enter Your Name ! ";
                validated = false;
            }
            if (C_U_Email.Text == "")
            {
                C_U_Email_Error.Text = "Please Enter Your Email ! ";
                validated = false;
            }

            bool testEmail = CheckEmailFormat(C_U_Email.Text);
            if (testEmail)
            {
                C_U_Email_Error.Text += " This Is Not A Valid Email Addrees Format Please Add A Valid Email Address ";
                validated = false;
            }
            if (C_U_Enquiry.Text == "")
            {
                C_U_Enquiry_Error.Text = "Please Enter A Message ! ";
                validated = false;
            }
         
            return validated; 
        }

        private bool CheckEmailFormat(string text)
        {
            return new EmailAddressAttribute().IsValid(text);
        }

        private void SendContactForm(string toEmail, string userName)
        {
            var sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear " + userName + ",<br/><br/>");
            sbEmailBody.Append("Your website contact form has sent you the following message");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("from " + C_U_Name.Text);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Subject : <br/>" + C_U_Subject.Text);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("enquier name : <br/>" + C_U_Name.Text);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Email Address : <br/>" + C_U_Email.Text);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Telephone number : <br/>" + C_U_Phone.Text);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Enquiry : <br/>" + C_U_Enquiry.Text);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>msfproperty.co.uk</b> </br> Letting Agent Registration Number: LARN1809015");
            try
            {
                //Create the msg object to be sent
                var msg = new MailMessage();
                //Add your email address to the recipients
                msg.To.Add(toEmail);
                //Configure the address we are sending the mail from
                msg.IsBodyHtml = true;
                var address = new MailAddress("info@msfproperty.co.uk");
                msg.From = address;
                msg.Subject = "Enquiry From WebSite";
                msg.Body = sbEmailBody.ToString();

                //Configure an SmtpClient to send the mail.
                var client = new SmtpClient
                {
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    EnableSsl = false,
                    Host = "smtpout.europe.secureserver.net",
                    Port = 25
                };

                //Setup credentials to login to our sender email address ("UserName", "Password")
                NetworkCredential credentials = new NetworkCredential("info@msfproperty.co.uk", "Marc1914");
                client.UseDefaultCredentials = true;
                client.Credentials = credentials;

                //Send the msg
                client.Send(msg);

                //Display some feedback to the user to let them know it was sent
                error.Text = "Your message was sent!";
            }
            catch (Exception ex)
            {
                //If the message failed at some point, let the user know
                error.Text = ex.ToString();
                //"Your message failed to send, please try again."
            }
        }
    }
}