using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MSFProperty.Admin.EF;

namespace MSFProperty
{
    public partial class Default : System.Web.UI.Page
    {
        List<string> editableTextContents = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateTextContents(); 
        }

       private  void PopulateTextContents()
        {
            List<string> pageList = new List<string>();
            using (var db = new Model1())
            {
                foreach (var item in db.TextContents)
                {
                    editableTextContents.Add(item.ElementText);

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
                    if(item.ID == id)
                    text =item.ElementText;

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