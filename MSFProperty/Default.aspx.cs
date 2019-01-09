using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty
{
    public partial class Default : System.Web.UI.Page
    {
        List<string> editableTextContents = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateTextContents();
            SetNumberOfProperty();
        }

        protected void SetNumberOfProperty()
        {
            string selectedNumber = PagerPropHome.SelectedValue;
            int.TryParse(selectedNumber, out int number);

            using (var db = new Model1())
            {
                PropertyRepeaterHome.DataSource = db.Properties.Where(p => p.Featured == true).ToList().Take(number);

                PropertyRepeaterHome.DataBind();

            }
        }

        public string getContents(int id)
        {
            return DataCalls.GetContents(id);
        }

        private void PopulateTextContents()
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
        public void RefreshCount(object sender, EventArgs e)
        {
            SetNumberOfProperty();
        }
        public string GetText(int id)
        {
            return DataCalls.GetText(id); ;
        }

        public string GetImage(int id)
        {
            return DataCalls.GetImage(id);

        }
    }
}