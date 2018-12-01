using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

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

        public string getContents(int id)
        {
           using (var db = new Model1())
            {
                foreach (var item in db.Blogs)
                {
                    if (item.ID == id)
                        return  Regex.Replace(item.Contents, "<.*?>", string.Empty);

                }
            }

            return "";
        }


        public string getPopularBlogs(int id)
        {
            using (var db = new Model1())
            {
                foreach (var item in db.Blogs)
                {
                    if (item.ID == id)
                    {
                        if(item.Popular == true)
                       return "";
                    }
                }
            }

            return  "hidden";
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