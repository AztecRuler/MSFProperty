using System;
using System.Linq;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class Analytics : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            keywordsTextBox.Text = GetKeyword();
            DesciptionAnalyticsTexBox.Text = GetDescription();
            Error.Text = "";



        }

        protected void UpdateDescription(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                var result = db.Analytics.SingleOrDefault(d => d.ID == 1);
                if (result != null) result.MeataDescription = DesciptionAnalyticsTexBox.Text.Trim();
                db.SaveChanges();
                Error.Text = "updated";
            }
        }

        protected void UpdateKeywords(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                var result = db.Analytics.SingleOrDefault(d => d.ID == 1);
                if (result != null) result.Keywords = keywordsTextBox.Text.Trim();
                db.SaveChanges();
                Error.Text = "updated";
            }
        }

        protected string GetKeyword()
        {
            var retStr = "";
            using (var db = new Model1())
            {
                var result = db.Analytics.SingleOrDefault(d => d.ID == 1);
                if (result != null) retStr = result.Keywords.Trim();
            }

            return retStr;
        }

        protected string GetDescription()
        {
            var retStr = "";
            using (var db = new Model1())
            {
                var result = db.Analytics.SingleOrDefault(d => d.ID == 1);
                if (result != null) retStr = result.MeataDescription.Trim();
            }

            return retStr;
        }
    }
}