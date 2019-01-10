using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty
{
    public partial class MSFMaster : System.Web.UI.MasterPage
    {
        protected string PagePath { get { return Page.Request.FilePath.Substring(1); } }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

    }
}