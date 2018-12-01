using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty
{
    public partial class BlogPageView : System.Web.UI.Page
    {
        Blog result;

        protected void Page_Load(object sender, EventArgs e)
        {
            var id = 1;
                 Int32.TryParse( Request.QueryString["id"], out id);
          
            id= (id > 0) ? id :  1; 

            using (var db = new Model1())
                {
                    result = db.Blogs.SingleOrDefault(b => b.ID == id);
                }
        }

        public string GetImage()
        {
            return result.ImageUrl;
        }

        public string GetTitle()
        {
            return result.Title;
        }
        public string GetDate()
        {
            return result.Date.ToString();
        }
        public string GetName()
        {
            return result.Name;
        }
        public string GetContent()
        {
            return result.Contents;
        }
    }
}