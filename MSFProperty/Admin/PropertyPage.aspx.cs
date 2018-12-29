using MarkEmbling.PostcodesIO;
using MSFProperty.Admin.EF;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using RestSharp.Deserializers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty.Admin
{
    public partial class PropertyPage : System.Web.UI.Page
    {
        protected void SaveNewProperty(object sender, EventArgs e)
        {
            var todaysDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);
        

            if (Validation())
            {
                using (var db = new Model1())
                {
                    int ID;
                    String mainImage = GetMainImage();
                    int bedrooms = GetRooms();
                    IList<String> amenities = GetAmenities();
                    String bathType = GetBathType();
                    Boolean pets = GetPets();
                    String availableFrom = GetAvailableFrom();
                    String avaiableTo = GetAvaiableTo();
                    int rentPrice = GetRentPrice();
                    int deposit = GetDeposit();
                    String blurb = GetBlurb();
                    Boolean featured = GetFeatured();
                    DateTime created = todaysDate;
                    List<String> images = GetImages();
                    String propertyName = PropertyName;

                    GetAddress();
              
                    //    Property property = new Property { Address = address, Amenities= amenities, Area= area, AvaiableTo= avaiableTo, AvailableFrom= availableFrom, BathType= bathType, Bedrooms= bedrooms, Blurb= blurb, Deposit = deposit, Location= location, LocationX= locationX, LocationY= locationY, MainImage= mainImage, Pets= pets, RentPrice= rentPrice };
                    //    db.Properties.Add(property);
                    // db.SaveChanges();
                    //emptyAll();
                }
            }
            else
            {
                errorText.Visible = true;
                errorText.Text = "Please fill in all values";
            }
        }

        private void GetAddress()
        {
            //Address address = new Address();
            //address.Road = PropertyStreet.Text;
            //address.Neighbourhood = PropertyLocation.Text;
            //address.Suburb = (string)jUser["suburb"];
            //address.Village = PropertyStreet2.Text;
            //address.County = PropertyCounty.Text;
            //address.State = PropertyCountry.Text;
            //address.Postcode = PropertyPostCode.Text;
            //address.Country = (string)jUser["country"];
            //address.CountryCode = (string)jUser["country_code"];


            //PropertyHouseNumber.Text = houseNumber;


            //     = address.State != null ? address.State : resultPC.Country;
            //     = PropertyPostCode.Text == address.Postcode ? address.Postcode : resultPC.Postcode;
            //    = address.Neighbourhood != null ? address.Neighbourhood : resultPC.AdminDistrict;
            //PropertyLocationX.Text = resultPC.Latitude.ToString();
            //PropertyY.Text = resultPC.Longitude.ToString();
        }

        private string PropertyName => propertyName.Text;

        private string GetMainImage()
        {
            string realPhysicalPath = "";

            if (propertyImage.HasFile)
            {
                if (IsImage(propertyImage.FileContent))
                {
                
                    realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + propertyImage.FileName);
                    propertyImage.SaveAs(realPhysicalPath);
                   return "MSF-" + propertyImage.FileName;
                }
            }

            return null;
        }

        private List<string> GetImages()
        {
            string realPhysicalPath = "";
            List<String> listOfFiles = new List<String>();

            if (PropertyImages.HasFile) {
                foreach (var uploadedFile in PropertyImages.PostedFiles)
                {
                    if (IsImage(uploadedFile.InputStream))
                    {
                        realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + uploadedFile.FileName);
                        uploadedFile.SaveAs("");
                        listOfFiles.Add("MSF-" + uploadedFile.FileName);
                    }
                }
            }
            return listOfFiles;
        }

        private bool GetFeatured() => propertyPopularCheck.Checked;

        private string GetBlurb() => PropertyBlurb.Text;

        private int GetDeposit()
        {
            Int32.TryParse(PropertyDeposit.Text, out int retVal);
            return retVal;
        }

        private int GetRentPrice()
        {
            Int32.TryParse(PropertyRentPrice.Text, out int retVal);
            return retVal;
        }

        private String GetAvaiableTo() => datepicker2Value.Value;

        private String GetAvailableFrom() => datepicker1Value.Value;

        private bool GetPets() => PetCheckBox.Checked;

        private String GetBathType()
        {
            string items = string.Empty;
            foreach (ListItem i in BathTypeCheckBox.Items)
            {
                if (i.Selected == true)
                {
                    items += i.Text + ",";
                }
            }

            return items;            
                
        }

        private IList<string> GetAmenities() => PropertyAmenities.Text.Split(',').Reverse().ToList();

        private int GetRooms()
        {
            Int32.TryParse(propertyBedrooms.SelectedValue, out int retVal);
            return retVal;
          
        }

        protected void Page_Load(Object Src, EventArgs E)
        {
            if (!IsPostBack)
            {
                //fillRepeaterData();
            }
        }

        //private void fillRepeaterData()
        //{
        //    List<string> pageList = new List<string>();
        //    using (var db = new Model1())
        //    {
        //        EditBlogRepeaterItems.DataSource = db.Blogs.ToList();
        //        Repeater1.DataSource = db.Blogs.ToList();
        //        EditBlogRepeaterItems.DataBind();
        //        Repeater1.DataBind();
        //    }
        //}
        //public string getContents(int id)
        //{
        //    using (var db = new Model1())
        //    {
        //        foreach (var item in db.Blogs)
        //        {
        //            if (item.ID == id)
        //                return Regex.Replace(item.Contents, "<.*?>", string.Empty);
        //        }
        //    }
        //    return "";
        //}
        //protected void EditBlogDeleteButton_Click(object sender, EventArgs e)
        //{
        //    using (var db = new Model1())
        //    {
        //        int blogEditId = 0;
        //        Int32.TryParse(delteHiddenField1.Value, out blogEditId);
        //        Blog result = db.Blogs.SingleOrDefault(b => b.ID == blogEditId);
        //        if (result != null)
        //        {
        //            db.Blogs.Remove(result);
        //            db.SaveChanges();
        //            fillRepeaterData();
        //        }
        //    }
        //}
        //protected void EditBlogSaveButton_Click(object sender, EventArgs e)
        //{
        //    var Output = blogEditFreeTextBox2.Text;
        //    var todaysDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);
        //    string realPhysicalPath = "";
        //    if (EditValidation(Output))
        //    {
        //        using (var db = new Model1())
        //        {
        //            String Filename = "";
        //            Boolean popular = blogEditCheckBox1.Checked;
        //            int blogEditId = 0;
        //            Int32.TryParse(editBlogId.Value, out blogEditId);
        //            Blog result = db.Blogs.SingleOrDefault(b => b.ID == blogEditId);
        //            Blog oldResults = new Blog
        //            {
        //                Contents = result.Contents,
        //                Title = result.Title,
        //                Name = result.Name,
        //                Date = result.Date,
        //                ImageUrl = result.ImageUrl,
        //                Popular = result.Popular
        //            };
        //            if (IsImage(this.blogEditFileUpload1.FileContent))
        //            {
        //                if (this.blogEditFileUpload1.HasFile)
        //                {
        //                    realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + this.blogEditFileUpload1.FileName);
        //                    this.blogEditFileUpload1.SaveAs(realPhysicalPath);
        //                    Filename = "MSF-" + this.blogEditFileUpload1.FileName;
        //                }
        //                else
        //                {
        //                    Filename = oldResults.ImageUrl;
        //                }
        //            }
        //            result.Contents = Output == "" ? oldResults.Contents : Output;
        //            result.Title = blogEditTextBox2.Text == "" ? oldResults.Title : blogEditTextBox2.Text;
        //            result.Name = blogEditTextBox1.Text == "" ? oldResults.Contents : blogEditTextBox1.Text;
        //            result.ImageUrl = Filename == "" ? oldResults.ImageUrl : Filename;
        //            result.Date = todaysDate;
        //            result.Popular = popular;
        //            db.SaveChanges();
        //            fillRepeaterData();
        //        }
        //    }
        //    else
        //    {
        //        errorText.Visible = true;
        //        errorText.Text = "Please fill in all values";
        //    }
        //    UpdatePanel3.Update();
        //}
        private bool IsImage(Stream stream)
        {
            stream.Seek(0, SeekOrigin.Begin);
            List<string> jpg = new List<string> { "FF", "D8" };
            List<string> bmp = new List<string> { "42", "4D" };
            List<string> gif = new List<string> { "47", "49", "46" };
            List<string> png = new List<string> { "89", "50", "4E", "47", "0D", "0A", "1A", "0A" };
            List<List<string>> imgTypes = new List<List<string>> { jpg, bmp, gif, png };
            List<string> bytesIterated = new List<string>();
            for (int i = 0; i < 8; i++)
            {
                string bit = stream.ReadByte().ToString("X2");
                bytesIterated.Add(bit);
                bool isImage = imgTypes.Any(img => !img.Except(bytesIterated).Any());
                if (isImage)
                {
                    return true;
                }
            }
            return false;
        }
        private bool Validation()
        {
            return true; 
           // return (PropertyLocation.Text != "" && PropertyRentPrice.Text != "" && PropertyDeposit.Text != "");
        }

        protected void PostCodeLookUp_Click(object sender, EventArgs e)
        {

            String postcodeResult = ValidatePostcode(PropertyPostCode.Text);
            if (postcodeResult != "")
            {
                var clientPC = new PostcodesIOClient();
                var resultPC = clientPC.Lookup(postcodeResult);
                var houseNumber = "";
                if (resultPC != null)
                {
                    houseNumber = validateHouseNumber(PropertyHouseNumber.Text);
                    emptyTextBoxesForAdress();
                    var client = new RestClient("https://nominatim.openstreetmap.org/");

                    var request = new RestRequest("reverse?format=json&lat=" + resultPC.Latitude + "&lon=" + resultPC.Longitude, Method.GET);

                    var response = client.Execute(request);
                    var content = response.Content;
                    Address address = new Address(content);

                    PropertyHouseNumber.Text = houseNumber;
                    PropertyStreet.Text = address.Road;
                    PropertyStreet2.Text = address.Village != null ? address.Village : resultPC.AdminWard;
                    PropertyCounty.Text = address.County != null ? address.County : resultPC.AdminDistrict;
                    PropertyCountry.Text = address.State != null ? address.State : resultPC.Country;
                    PropertyPostCode.Text = PropertyPostCode.Text == address.Postcode ? address.Postcode : resultPC.Postcode;
                    PropertyLocation.Text = address.Neighbourhood != null ? address.Neighbourhood : resultPC.AdminDistrict;
                    PropertyLocationX.Text = resultPC.Latitude.ToString();
                    PropertyY.Text = resultPC.Longitude.ToString();

                    mapForPostcode.Attributes["src"] = "http://maps.google.com/maps?q=" + PropertyHouseNumber.Text.ToString() + " " + address.Road.ToString() + " " + address.County + "&z=16&output=embed";
                }
            }
        }

        private string validateHouseNumber(string text) => Regex.Replace(text, "[^-.//0-9]", "");

        private string ValidatePostcode(string text)
        {
            var regex = "^(([gG][iI][rR] {0,}0[aA]{2})|((([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y]?[0-9][0-9]?)|(([a-pr-uwyzA-PR-UWYZ][0-9][a-hjkstuwA-HJKSTUW])|" +
                "([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y][0-9][abehmnprv-yABEHMNPRV-Y]))) {0,}[0-9][abd-hjlnp-uw-zABD-HJLNP-UW-Z]{2}))$";


                var match = Regex.Match(text, regex, RegexOptions.IgnoreCase);

            if (match.Success) { 

                return text;
            }
            return "";

        }

        private void emptyTextBoxesForAdress()
        {
            String empty = "";
         
            PropertyHouseNumber.Text = empty;
            PropertyPostCode.Text = empty;
            PropertyStreet.Text = empty;
            PropertyStreet2.Text = empty;
            PropertyCounty.Text = empty;
            PropertyCountry.Text = empty;
            PropertyLocation.Text = empty;
            PropertyLocationX.Text = empty;
            PropertyY.Text = empty;
        }

        public class Address
        {
            public Address()
            {
              
            }

            public Address(string json)
            {
                JObject jObject = JObject.Parse(json);
                JToken jUser = jObject["address"];
                Road = (string)jUser["road"];
                Neighbourhood = (string)jUser["neighbourhood"];
                Suburb = (string)jUser["suburb"];
                Village = (string)jUser["village"];
                County = (string)jUser["county"];
                State = (string)jUser["state"];
                Postcode = (string)jUser["postcode"];
                Country = (string)jUser["country"];
                CountryCode = (string)jUser["country_code"];
            }

            public string Road { get; set; }
            public string Neighbourhood { get; set; }
            public string Suburb { get; set; }
            public string Village { get; set; }
            public string County { get; set; }
            public string State { get; set; }
            public string Postcode { get; set; }
            public string Country { get; set; }
            public string CountryCode { get; set; }

        }

        protected void ClearTextBoxes_Click(object sender, EventArgs e)
        {
            emptyTextBoxesForAdress();
        }


        //private bool EditValidation(string output)
        //{
        //    return (output != null && blogEditTextBox1.Text != "" && blogEditTextBox2.Text != "");
        //}
        //private void emptyAll()
        //{
        //    blogTitle.Text = "";
        //    blogName.Text = "";
        //    FreeTextBox1.Text = "";
        //}
        //}
    }

}