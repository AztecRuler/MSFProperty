using System;
using System.ComponentModel;
using System.Linq;
using System.Web.Security;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class Users : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            SetUserRepeater();
        }

        private void SetUserRepeater()
        {
           
            using (var db = new Model1())
            {
                UsersRepeater.DataSource = db.Users.ToList();
                UsersRepeater.DataBind();
            }
        }

        protected void CreateUserButtonClick(object sender, EventArgs e)
        {
            var validated = ValidateEmailsAndPasswordsMatch();
            if (validated)
            {
                var password = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordTextBox.Text, "SHA1");

                var newUser = new User
                {
                    Username = UserNameTextBox.Text,
                    Password = password,
                    Email = EmailTextBox.Text
                };
                using (var db = new Model1())
                {
                    var result = db.Users.FirstOrDefault(u => u.Username == UserNameTextBox.Text);
                    if (result == null)
                    {
                        db.Users.Add(newUser);
                        db.SaveChanges();
                        Completed();
                    }
                    else
                    {
                        ErrorLabelMessage.Text = "User with this name already exists";
                    }
                }
            }
            else
            {
                var errorType = GetErrorType();
                ErrorLabelMessage.Text = GetErrorMessage(errorType);
            }
        }

        private void Completed()
        {
            ErrorLabelMessage.Text = "New User Added";
            UserNameTextBox.Text = "";
            PasswordTextBox.Text = "";
            EmailTextBox.Text = "";
            PasswordRepeatTextBox.Text = "";
            ConfirmEmailTextBox.Text = "";
        }

        private static string GetErrorMessage(int errorType)
        {
            string returnString;

            switch (errorType)
            {
                case 1:
                    returnString = "Passwords must match";
                    break;
                case 2:
                    returnString = "Emails must match";
                    break;
                case 3:
                    returnString = "Passwords must match and emails must match";
                    break;
                default:
                    returnString = "";
                    break;
            }

            return returnString;
        }


        private int GetErrorType()
        {
            var err = 0;
            if (PasswordTextBox.Text != PasswordRepeatTextBox.Text)
                err = 1;
            if (EmailTextBox.Text != ConfirmEmailTextBox.Text)
                err = 2;
            // ReSharper disable once ComplexConditionExpression
            if (PasswordTextBox.Text != PasswordRepeatTextBox.Text &&
                EmailTextBox.Text != ConfirmEmailTextBox.Text) err = 3;

            return err;
        }

        private bool ValidateEmailsAndPasswordsMatch()
        {
            // ReSharper disable once ComplexConditionExpression
            if (PasswordTextBox.Text != "" && EmailTextBox.Text != "")
                return PasswordTextBox.Text == PasswordRepeatTextBox.Text &&
                       EmailTextBox.Text == ConfirmEmailTextBox.Text;

            return false;
        }

        protected void EditUserDetailsSave_OnClickUserButtonClick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void ConfirmPassword(object sender, EventArgs e)
        {
            Int32.TryParse(editUserId.Value, out int userId);
            using (var db = new Model1())
            {
                var userSelected = db.Users.SingleOrDefault(u => u.UserId == userId);
                if (userSelected?.Password == userConfirmPasswordTextBox.Text)
                {
                    editUserOptions.CssClass = editUserOptions.CssClass.Replace("hidden", "");
     
                    UserEditOptionUpdatePanel.Update();
                    editUserError.Text = "";
                }
                else
                {
                    editUserError.Text = "Incorrect Password";
                 }
            }
    
        }

        protected void DeleteUser_OnClick(object sender, EventArgs e)
        {
            Int32.TryParse(editUserId.Value, out int userId);
            using (var db = new Model1())
            {
                User result = db.Users.SingleOrDefault(u=> u.UserId == userId);
                if (result == null) return;
                db.Users.Remove(result);
                db.SaveChanges();
                
                ResetPanels();
            }
        }

        private void ResetPanels()
        {
            editUserOptions.CssClass = "hidden";
            SetUserRepeater();
            EditUserUpdatePanel.Update();
        }
    }
}