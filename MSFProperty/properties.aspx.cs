using System;
using System.Collections.Generic;
using System.Linq;
using MSFProperty.Admin.EF;
using static System.Int32;
using Page = System.Web.UI.Page;

namespace MSFProperty
{
    public partial class properties : Page
    {
        private Property _result;
        public List<string> Images = new List<string>();
        private int imageCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            TryParse(Request.QueryString["id"], out var id);

            id = id > 0 ? id : 1;

            using (var db = new Model1())
            {
                _result = db.Properties.SingleOrDefault(b => b.ID == id);
            }

            Images = GetRepeaterImagesFromDataBase();
            slideShowColumnRepeater.DataSource = Images;
            slideShowColumnRepeater.DataBind();
            slideImages.DataSource = Images;
            slideImages.DataBind();
        }

        private List<string> GetRepeaterImagesFromDataBase()
        {
            var dataImages = _result.Images.TrimEnd(',');
            var values = dataImages.Split(',').Select(sValue => sValue.Trim()).ToArray();
            imageCount = values.Length;
            return values.ToList();
        }

        public string GetPropertyName()
        {
            return _result.PropertyName;
        }

        public int GetCount()
        {
            return imageCount; 
        }
    }
}