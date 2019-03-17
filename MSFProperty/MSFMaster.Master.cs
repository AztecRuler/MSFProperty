using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using MSFProperty.Admin.EF;

namespace MSFProperty
{
    public partial class MSFMaster : MasterPage
    {
        public string PagePath
        {
            get
            {
                var path = Page.Request.FilePath.Substring(1);
                var pos = path.LastIndexOf("/", StringComparison.Ordinal) + 1;
                return path.Substring(pos, path.Length - pos);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            FillRepeater();
            var url = HttpContext.Current.Request.Url.AbsoluteUri;
            canonical.Href = url;

        }

        protected void FillRepeater()
        {
            using (var db = new Model1())
            {
                ContactUsRepeater.DataSource = db.ContactDetails.ToList();
                ContactUsRepeater.DataBind();

            }
        }

        protected string GetMetaDescription()
        {
            var retString = "";
            using (var db = new Model1())
            {
                var  result = db.Analytics.SingleOrDefault(b => b.ID == 1);
                if (result != null) retString = result.MeataDescription;
            }

          
            return retString;
        }

        protected string GetMetaKeywords()
        {
            var retString = "";
            using (var db = new Model1())
            {
                var result = db.Analytics.SingleOrDefault(b => b.ID == 1);
                if (result != null) retString = result.Keywords;
            }


            return retString;
        }
    }
}