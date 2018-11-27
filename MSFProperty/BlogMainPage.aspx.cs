using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MSFProperty
{
    public partial class BlogMainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<string> pageList = new List<string>();
                using (var db = new Model1())
                {
                    BlogRepeaterItems.DataSource = db.Blogs.ToList();
                    BlogRepeaterPopular.DataSource = db.Blogs.ToList();

                    BlogRepeaterPopular.DataBind();
                    BlogRepeaterItems.DataBind();
                }

            }
        }

        public string GetText(int id)
        {
            string text = "";

            using (var db = new Model1())
            {
                foreach (var item in db.TextContents)
                {
                    if (item.ID == id)
                        text = item.ElementText;

                }
            }
            return text;
        }

        public string GetImage(int id)
        {
            string text = "";

            using (var db = new Model1())
            {
                foreach (var item in db.PageImages)
                {
                    if (item.ID == id)
                        text = item.ImageUrl;

                }
            }
            return text;
        }
    }
}