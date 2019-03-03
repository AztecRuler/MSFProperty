using System;
using System.Net;
using System.Net.Mail;
using System.Text;
using MSFProperty.Admin.EF;


namespace MSFProperty
{
    public partial class contact_us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetText(int id)
        {
           return DataCalls.GetText(id);
        }

        public string GetImage(int id)
        {
           return DataCalls.GetImage(id);
        }

        protected void sendMessage_OnClick(object sender, EventArgs e)
        {
            SendContactForm("info@msfproperty.co.uk", "Admin");
        }
        private void SendContactForm(string toEmail, string userName)
        {
            var sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear " + userName + ",<br/><br/>");
            sbEmailBody.Append("Your website contact form has sent you the following message");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>msfproperty.co.uk</b>");

            try
            {
                //Create the msg object to be sent
                var msg = new MailMessage();
                //Add your email address to the recipients
                msg.To.Add(toEmail);
                //Configure the address we are sending the mail from
                var address = new MailAddress("user@mydomain.com");
                msg.From = address;
                msg.Subject = "Inquiry from website";
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
                //replyLabel.Text = "Your message was sent!";
            }
            catch (Exception ex)
            {
                //If the message failed at some point, let the user know
                //replyLabel.Text = ex.ToString();
                //"Your message failed to send, please try again."
            }

        }

    }
}