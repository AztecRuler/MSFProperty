using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

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
        }

        protected void FillRepeater()
        {
            using (var db = new Model1())
            {
                ContactUsRepeater.DataSource = db.ContactDetails.ToList();
                ContactUsRepeater.DataBind();
            }
        }

    }
}