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

        public void RefreshCount(object sender, EventArgs e)
        {
            SetNumberOfProperty();
        }
        //public struct Property
        //{
        //    public int Bedrooms;
        //    public string amenities;
        //    public string bath;
        //    public string name;
        //    public string mainImage;
        //    public bool featured;
        //    public bool pets;
        //    public string dateTo;
        //    public string dateFrom;
        //    public int rentPrice;
        //    public int deposit;
        //    public string propertyImages;
        //    public string propertyBlurb;
        //    public string address;
        //    public string postcode;

        //    public int GetBedrooms()
        //    {
        //        Bedrooms 
        //        return Bedrooms;
        //    }

        //    }

    }
}