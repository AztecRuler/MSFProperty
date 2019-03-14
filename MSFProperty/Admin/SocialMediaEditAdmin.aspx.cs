using System;
using System.Linq;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class SocialMediaEditAdmin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            using (var db = new Model1())
            {
                var result = db.ContactDetails.SingleOrDefault(b => b.ID == 1);
                if (result == null) return;
                facebook.Text = result.facebook;
                twitter.Text = result.twitter;
                google.Text = result.google;
                pintrst.Text = result.pintrst;
                linkin.Text = result.linkin;
            }
        }

        protected void SaveSocial_OnClick(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                var result = db.ContactDetails.SingleOrDefault(b => b.ID == 1);
                if (result == null) return;
                result.facebook = facebook.Text;
                result.twitter = twitter.Text;
                result.google = google.Text;
                result.pintrst = pintrst.Text;
                result.linkin = linkin.Text;
                db.SaveChanges();
                SocialError.Text = "New Changes Saved";
            }
        }
    }
}