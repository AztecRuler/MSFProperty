using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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

        protected void SetNumberOfProperty()
        {
            string selectedNumber = PagerProp.SelectedValue;
            int.TryParse(selectedNumber, out int number);

            using (var db = new Model1())
            {
                PropertyRepeaterHome.DataSource = db.Properties.ToList().Take(number);

                PropertyRepeaterHome.DataBind();

            }
        }

        public string getContents(int id)
        {
            using (var db = new Model1())
            {
                foreach (var item in db.Properties)
                {
                    if (item.ID == id)
                        return Regex.Replace(item.Blurb, "<.*?>", string.Empty);

                }
            }

            return "";
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