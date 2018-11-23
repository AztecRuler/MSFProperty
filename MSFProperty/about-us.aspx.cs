using System;
using MSFProperty.Admin.EF;

namespace MSFProperty
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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