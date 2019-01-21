using System;
using System.Linq;
using MSFProperty.Admin.EF;
using static System.Int32;
using Page = System.Web.UI.Page;

namespace MSFProperty
{
    public partial class BlogPageView : Page
    {
        private Blog _result;

        protected void Page_Load(object sender, EventArgs e)
        {
            TryParse(Request.QueryString["id"], out var id);

            id = id > 0 ? id : 1;

            using (var db = new Model1())
            {
                _result = db.Blogs.SingleOrDefault(b => b.ID == id);
            }
        }

        public string GetImage()
        {
            return _result.ImageUrl;
        }

        public string GetTitle()
        {
            return _result.Title;
        }

        public string GetDate()
        {
            return _result.Date.ToString();
        }

        public string GetName()
        {
            return _result.Name;
        }

        public string GetContent()
        {
            return _result.Contents;
        }
    }
}