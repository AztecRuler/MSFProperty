using System;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.Security;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class Admin : Page
    {

        int _logAttempt =0;
        protected void Page_Load(object sender, EventArgs e)
        {
     //using (var db = new Model1())
            //{
            //    var user = db.Users.FirstOrDefault(u => u.Username == username);
            //    if (user != null)
         
        }

        protected void LoginButton_Click1(object sender, EventArgs e)
        {
            var username = UserNameTextBox.Text;
            var password = PasswordTextBox.Text;
            var authenticate = FormsAuthentication.Authenticate(username, password);
            if (authenticate)
            {
                FormsAuthentication.RedirectFromLoginPage(username, RememberMe.Checked);
            }
            else
            {
                LabelMessage.Text = "Invalid log in details please try again";
           
                _logAttempt++; 
                //TODO: add in counter for login attempts
            }

        }
    }
}