using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty.UserControls
{
    public partial class AboutUsInfo : System.Web.UI.UserControl
    {
        public string TitleText { get; set; }
        public string Quote { get; set; }
        public string Chat { get; set; }
        public string ImageUrl { get; set; }
        public int DataId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
         
        }


   

    }
}