using System;
using System.Web.UI;

namespace MSFProperty
{
    public partial class MSFMaster : System.Web.UI.MasterPage
    {
        protected string PagePath { get {
                var path = Page.Request.FilePath.Substring(1);
                int pos = path.LastIndexOf("/") + 1;
                return path.Substring(pos, path.Length - pos);

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

    }
}