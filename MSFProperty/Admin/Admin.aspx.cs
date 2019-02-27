using System;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.Security;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class Admin : Page
    {
        private int _logAttempt;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // ReSharper disable once MethodTooLong
        protected void LoginButton_Click1(object sender, EventArgs e)
        {
            var username = UserNameTextBox.Text;
#pragma warning disable 618
            var password = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordTextBox.Text, "SHA1");
#pragma warning restore 618
            var authenticate = AuthenticateUser(username, password);

            if (authenticate)
            {
                FormsAuthentication.RedirectFromLoginPage(username, RememberMe.Checked);
            }
            else
            {
                if (LabelMessage.Text == "")
                    LabelMessage.Text = "Invalid log in details please try again.....";
                if (_logAttempt == 2)
                    LabelMessage.Text += " you have one more chance to log in before you are locked out";

                if (_logAttempt < 3) return;
                LabelMessage.Text =
                    "Unfortunately you have had to many failed attempts please wait 5 minutes and try again";
                LockAccount(username);
            }
        }

        private static void LockAccount(string namedUser)
        {
            using (var db = new Model1())
            {
                var userSelected = db.Users.SingleOrDefault(u => u.Username == namedUser);
                if (userSelected == null) return;
                userSelected.LogAttempts = 0;
                userSelected.Locked = true;
                userSelected.LockedTime = DateTime.Now;
                db.SaveChanges();
            }
        }

        private static void UnlockAccount(string namedUser)
        {
            using (var db = new Model1())
            {
                var userSelected = db.Users.SingleOrDefault(u => u.Username == namedUser);
                if (userSelected == null) return;
                userSelected.Locked = false;

                userSelected.LockedTime = null;
                userSelected.LogAttempts = 0;
                db.SaveChanges();
            }
        }

        private static double CheckLockTime(User user)
        {
            var timeRemainLocked = new double();

            if (user.LockedTime == null) return timeRemainLocked;
            var start = DateTime.SpecifyKind((DateTime) user.LockedTime, DateTimeKind.Utc);
            timeRemainLocked = DateTime.UtcNow.Subtract(start).TotalMinutes;

            if (timeRemainLocked <= 5) return timeRemainLocked;
            UnlockAccount(user.Username);
            timeRemainLocked = 0;
            return timeRemainLocked;
        }

        // ReSharper disable once MethodTooLong
        private bool AuthenticateUser(string username, string password)
        {
            var isAllowed = false;

            using (var db = new Model1())
            {
                var userSelected = db.Users.SingleOrDefault(u => u.Username == username);
                if (userSelected == null)
                {
                    LabelMessage.Text = "";
                    return false;
                }

                if (userSelected.Locked == false)
                {
                    if (userSelected.Password == password)
                    {
                        isAllowed = true;
                        SetLogAttempts(0, userSelected, db);
                    }
                    else
                    {
                        AddOneToAttempts(userSelected, db);
                    }
                }
                else
                {
                    var lt = 10 - CheckLockTime(userSelected);
                    LabelMessage.Text += "";
                    if (lt > 0)
                        LabelMessage.Text = "Your account is locked out for " + Math.Round(lt, 2) + " more minutes ";
                }
            }

            return isAllowed;
        }

        private void AddOneToAttempts(User userSelected, Model1 database)
        {
            if (userSelected.LogAttempts == null) userSelected.LogAttempts = 0;
            userSelected.LogAttempts++;
            SetLogAttempts(userSelected.LogAttempts, userSelected, database);
            _logAttempt = (int) userSelected.LogAttempts;
        }

        private void SetLogAttempts(int? number, User user, Model1 database)
        {
            if (number != null) _logAttempt = (int) number;
            user.LogAttempts = _logAttempt;
            database.SaveChanges();
        }

        private void SendPasswordResetEmail(string toEmail, string userName, string uniqueId)
        {
            var sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear " + userName + ",<br/><br/>");
            sbEmailBody.Append("We received a request to reset your password if this was not you please ignore this<br/>");
            sbEmailBody.Append("Otherwise<br/>");

            sbEmailBody.Append("Please click on the following link to reset your password this link will expire in 24hrs");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("<a href='http://localhost:41121/Admin/ChangePassword.aspx?uid='"+ uniqueId +">Click here to reset password</a>" );
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>msfproperty.co.uk</b>");

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
                msg.Subject = "Reset Your Password";
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
                ResetPassResponse.Text = "Your message was sent!";
            }
            catch (Exception ex)
            {
                //If the message failed at some point, let the user know
                ResetPassResponse.Text = ex.ToString();
                //"Your message failed to send, please try again."
            }

        }

        protected void ResetpassButtonClick(object sender, EventArgs e)
        {
            var word = RandomWord();
            using (var db = new Model1())
            {
                var userSelected = db.Users.SingleOrDefault(u => u.Username == ResetpassTextBox.Text);
                if (userSelected == null) return;
#pragma warning disable 618
                userSelected.UIDRESET = FormsAuthentication.HashPasswordForStoringInConfigFile(word, "SHA1");
#pragma warning restore 618
                userSelected.UIDRESETTIME = DateTime.Now;
                SendPasswordResetEmail(userSelected.Email, userSelected.Username, userSelected.UIDRESET);
                db.SaveChanges();
                ResetPassResponse.Text = "Email sent !!";
            }
        }

        protected string RandomWord()
        {
            const int numLetters = 15;

            var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();

            var rand = new Random();

            var word = "";
            for (var j = 1; j <= numLetters; j++)
            {
                var letterNum = rand.Next(0, letters.Length - 1);
                word += letters[letterNum];
            }

            return word;
        }
    }
}