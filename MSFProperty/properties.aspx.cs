using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using MSFProperty.Admin.EF;
using static System.Int32;
using Page = System.Web.UI.Page;

namespace MSFProperty
{
    public partial class properties : Page
    {
        private Property _result;
        public List<string> Images = new List<string>();
        private int _imageCount = 0;
        private int _slideCount = 0;
        private int _bathCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            TryParse(Request.QueryString["id"], out var id);

            id = id > 0 ? id : 1;

            using (var db = new Model1())
            {
                _result = db.Properties.SingleOrDefault(b => b.ID == id);
            }

            if (_result != null) Images = GetSplitStrings(_result.Images);
            if (Images[0] == "")
                Images[0] = GetMainImage();
            _slideCount = _imageCount;
            slideShowColumnRepeater.DataSource = Images;
            slideShowColumnRepeater.DataBind();
            slideImages.DataSource = Images;
            slideImages.DataBind();
            List<string> bathResults = null;
            if (_result != null) bathResults =  GetSplitStrings(_result.BathType);
            _bathCount = _imageCount;
            bathRepeater.DataSource = bathResults;
            bathRepeater.DataBind();
            List<string> amenitiesResults = null;
            if (_result != null) amenitiesResults = GetSplitStrings(_result.Amenities);
            amRepeater.DataSource = amenitiesResults;
            amRepeater.DataBind();
            if (_result != null)
                mapForPostcode.Attributes["src"] = "http://maps.google.com/maps?q=" + _result.AddressNumber + " " +
                                                   _result.Street + " " + _result.County + "&z=16&output=embed";
        }

        private List<string> GetSplitStrings(string stringForSplitting)
        {
            var dataImages = stringForSplitting.TrimEnd().TrimEnd(',');
            var values = dataImages.Split(',').Select(sValue => sValue.Trim()).ToArray();
            _imageCount = values.Length;
            return values.ToList();
        }

        public string GetPropertyName()
        {
            return _result.PropertyName ?? "Latest Property";
        }

        public int GetSlideCount()
        {
            return _slideCount;
        }

        public int GetBathCount()
        {
            return _bathCount;
        }
        
        public string GetMainImage()
        {
            return _result.MainImage == "" ? "AboutUsPictures\\About_usImagePlaceholder.png" : _result.MainImage;
        }

        public string GetContents()
        {
            return _result.Blurb == ""
                ? "Please wait, the information is being created for this property and will be with you shortly"
                : _result.Blurb;
        }


        protected int? GetBedrooms()
        {
            return _result.Bedrooms;
        }

        protected string GetPetsAllowed()
        {
            return _result.Pets == true ? "Yes" : "No";
        }

        protected string GetAvaiable()
        {
            return _result.AvailableFrom != ""  ?_result.AvailableFrom : "Date still pending" ;
        }
        protected int GetDeposit()
        {
            return _result.Deposit;
        }
        protected int GetRentPrice()
        {
            return _result.RentPrice;
        }
        public static bool IsEmpty(DateTime dateTime)
        {
            return dateTime == default(DateTime);
        }


    }
}