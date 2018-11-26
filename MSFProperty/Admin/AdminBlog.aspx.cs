using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty.Admin
{
    public partial class Blog : System.Web.UI.Page
    {
        protected void Page_Load(Object Src, EventArgs E)
        {

        }
        protected void SaveButton_Click1(object sender, EventArgs e)
        {
            var Output = FreeTextBox1.Text;
        }
    }
}