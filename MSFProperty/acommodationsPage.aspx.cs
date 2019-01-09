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
    public partial class acommodationsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetNumberOfProperty(); 

            }
        }

        protected void SetNumberOfProperty()
        {
            string selectedNumber = PagerProp.SelectedValue;
            int.TryParse(selectedNumber, out int number);

            using (var db = new Model1())
            {
                PropertyRepeater.DataSource = db.Properties.ToList().Take(number);

                PropertyRepeater.DataBind();

            }
        }

        public string GetContents(int id)
        {
            return DataCalls.GetContents(id);
        }

        public string GetText(int id)
        {
            return DataCalls.GetText(id);
        }

        public string GetImage(int id)
        {

            return DataCalls.GetImage(id);
        }

        public void RefreshCount(object sender, EventArgs e)
        {
            SetNumberOfProperty();
        }
       

    }
}