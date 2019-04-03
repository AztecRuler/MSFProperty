using MSFProperty.Admin.EF;
using System;
using System.Linq;

namespace MSFProperty
{
    public partial class BlogMainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            using (var db = new Model1())
            {
                BlogRepeaterItems.DataSource = db.Blogs.ToList();
                BlogRepeaterPopular.DataSource = db.Blogs.ToList();

                BlogRepeaterPopular.DataBind();
                BlogRepeaterItems.DataBind();
            }
        }
        protected object GetColour(int id)
        {
            return DataCalls.GetColour(id);
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
        protected object GetMobileNumber()
        {
            return DataCalls.GetMobileNumber();
        }
    }
}