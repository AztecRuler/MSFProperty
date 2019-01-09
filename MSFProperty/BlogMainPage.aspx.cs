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

        public string GetContents(int id)
        {
            return DataCalls.GetContents(id);
        }


        public string GetPopularBlogs(int id)
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
          return DataCalls.GetText(id);
        }

        public string GetImage(int id)
        {
            return DataCalls.GetImage(id);
        }
    }
}