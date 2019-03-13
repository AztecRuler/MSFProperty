using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using Antlr.Runtime.Tree;
using Microsoft.Ajax.Utilities;
using MSFProperty.Admin.EF;
using RestSharp;


namespace MSFProperty.Admin
{
    public partial class PropertyPage : System.Web.UI.Page
    {
        private string _errorMessage = "";
        private string _mainImageUrl = "";
        private string _mainRealAddress = "";
        private string _editImageString = "";

        protected void SaveNewProperty(object sender, EventArgs e)
        {
            var todayDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);


            if (Validation())
                {
                    var mainImage = GetMainImage();
                    var bedrooms = GetRooms();
                    var amenities = GetAmenities();
                    var bathType = GetBathType();
                    var pets = GetPets();
                    var availableFrom = GetAvailableFrom();
                    var avaiableTo = GetAvaiableTo();
                    var rentPrice = GetRentPrice();
                    var deposit = GetDeposit();
                    var blurb = GetBlurb();
                    var featured = GetFeatured();
                    var created = todayDate;
                    var images = GetImages();
                    var FullAdress = GetAddress();
                    if (isEdit.Value.ToString() != "True")
                    {

                        var property = new Property
                        {
                            MainImage = mainImage.Trim(),
                            Bedrooms = bedrooms,
                            Amenities = CreateCommaSeperatedList(amenities).Trim(),
                            BathType = bathType.Trim(),
                            Pets = pets,
                            AvailableFrom = availableFrom.Trim(),
                            AvaiableTo = avaiableTo.Trim(),
                            RentPrice = rentPrice,
                            Deposit = deposit,
                            Blurb = blurb.Trim(),
                            Featured = featured,
                            Created = created,
                            Images = CreateCommaSeperatedList(images).Trim(),
                            PropertyName = propertyName.Text.Trim(),
                            Street = FullAdress.Street.Trim(),
                            Street2 = FullAdress.Street2.Trim(),
                            County = FullAdress.County.Trim(),
                            Country = FullAdress.Country.Trim(),
                            PostCode = FullAdress.Postcode.ToLower().Trim(),
                            Location = FullAdress.Location.Trim(),
                            LocationX = FullAdress.LocationX,
                            LocationY = FullAdress.LocationY,
                            AddressNumber = FullAdress.AddressNumber,
                            Area = FullAdress.Area.Trim()
                        };
                        using (var db = new Model1())
                        {
                            db.Properties.Add(property);
                            SafeSave(db);
                        }

                        propSaved.Text = "Property uploaded";
                    }
                    else
                    {
                        int.TryParse(deletePropertyHiddenField1.Value, out var id);

                        using (var db = new Model1())
                        {
                            var result = db.Properties.SingleOrDefault(b => b.ID == id);
                            if (result == null) return;
                            result.MainImage = mainImage.Trim();
                            result.Bedrooms = bedrooms;
                            result.Amenities = CreateCommaSeperatedList(amenities).Trim();
                            result.BathType = bathType.Trim();
                            result.Pets = pets;
                            result.AvailableFrom = availableFrom.Trim();
                            result.AvaiableTo = avaiableTo.Trim();
                            result.RentPrice = rentPrice;
                            result.Deposit = deposit;
                            result.Blurb = blurb.Trim();
                            result.Featured = featured;
                            result.Created = created;
                            result.Images = CreateCommaSeperatedList(images).Trim() == ""
                                ? _editImageString
                                : CreateCommaSeperatedList(images).Trim();
                        result.PropertyName = propertyName.Text.Trim();
                            result.Street = FullAdress.Street.Trim();
                            result.Street2 = FullAdress.Street2.Trim();
                            result.County = FullAdress.County.Trim();
                            result.Country = FullAdress.Country;
                            result.PostCode = FullAdress.Postcode.Trim();
                            result.Location = FullAdress.Location.Trim();
                            result.LocationX = FullAdress.LocationX;
                            result.LocationY = FullAdress.LocationY;
                            result.AddressNumber = FullAdress.AddressNumber;
                            result.Area = FullAdress.Area.Trim();
                            SafeSave(db);
                    

                    }
                }

                    EmptyAll();
            
                }
            else
                errorText.Text = _errorMessage;
        }

        private void SafeSave(Model1 context)
        {
            //this is for error checking
            try
            {
                context.SaveChanges();
                fillRepeaterData();
            }
           catch (DbEntityValidationException e)
                {
                    foreach (var eve in e.EntityValidationErrors)
                    {
                    Log("Entity of type " + eve.Entry.Entity.GetType().Name + " in state " + eve.Entry.State+" has the following validation errors:");
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Log("- Property: " + ve.PropertyName+", Error:" + ve.ErrorMessage);
                        }
                    }
                    throw;
                }

        }

        private DateTime? ConvertToSystDateTime(string availableFrom)
        {
            var input = availableFrom;
            var date = new DateTime();

            if (input != string.Empty)
                date = DateTime.ParseExact(input, "MM-dd-yyyy HH:mm:ss", CultureInfo.InvariantCulture);
            return date;
        }

        private string CreateCommaSeperatedList(IList<string> amenities)
        {
            amenities = amenities.Where(s => !string.IsNullOrWhiteSpace(s)).Distinct().ToList();

            return amenities.Aggregate("", (current, item) => current + (item + ",")).TrimEnd(',');
        }

        private ModelAddress GetAddress()
        {
            var address = new ModelAddress();
            int.TryParse(PropertyHouseNumber.Text, out var parsePropertyHouseNumber);
            address.AddressNumber = parsePropertyHouseNumber;
            address.Location = PropertyLocation.Text;
            address.LocationX = ConvertToFloat(PropertyLocationX.Text);
            address.LocationY = ConvertToFloat(PropertyY.Text);
            //TODO: add area
            address.Area = "";
            address.Street = PropertyStreet.Text;
            address.Street2 = PropertyStreet2.Text;
            address.County = PropertyCounty.Text;
            address.Country = PropertyCountry.Text;
            address.Postcode = PropertyPostCode.Text;

            return address;
        }

        private float ConvertToFloat(string text)
        {
            float num1;

            if (text != string.Empty) //Added if statement to see if the textBox is empty
                num1 = (float) Convert.ToDouble(text);
            else
                num1 = 0; //If textBox is empty, set num1 to 0
            return num1;
        }

        private string PropertyName => propertyName.Text;

        private string GetMainImage()
        {
            return _mainImageUrl;
        }

        private string GetMainImageAddress()
        {
            return _mainRealAddress;
        }

        protected void MainImage_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
            if (!MainFileUploader.HasFile) return;
            if (IsImage(MainFileUploader.FileContent))
            {
                Session["MainAddress"] =
                    Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + MainFileUploader.FileName);
                ScriptManager.RegisterClientScriptBlock(this,
                    GetType(), "newfile",
                    "window.parent.$find('" + MainFileUploader.ClientID + "').newFileName='" + "MSF-" +
                    MainFileUploader.FileName + "';", true);
                Session["MainUrl"] = "MSF-" + MainFileUploader.FileName;
                var realPhysicalPath =
                    Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + MainFileUploader.FileName);
                MainFileUploader.SaveAs(realPhysicalPath);
            }
            else
            {
                _errorMessage = " this is not a valid file please select another one. ";
            }
        }

        private List<string> GetImages()
        {
            var listOfFiles = new List<string>();

            if (!PropertyImages.HasFile) return listOfFiles;
            foreach (var uploadedFile in PropertyImages.PostedFiles)
                if (IsImage(uploadedFile.InputStream))
                {
                    var realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + uploadedFile.FileName);
                    uploadedFile.SaveAs(realPhysicalPath);
                    listOfFiles.Add("MSF-" + uploadedFile.FileName);
                }

            return listOfFiles;
        }

        private bool GetFeatured()
        {
            return propertyPopularCheck.Checked;
        }

        private string GetBlurb()
        {
            return PropertyBlurb.Text;
        }

        private int GetDeposit()
        {
            int.TryParse(PropertyDeposit.Text, out var retVal);
            return retVal;
        }

        private int GetRentPrice()
        {
            int.TryParse(PropertyRentPrice.Text, out var retVal);
            return retVal;
        }

        private string GetAvaiableTo()
        {
            return datepicker2Value.Value;
        }

        private string GetAvailableFrom()
        {
            return datepicker1Value.Value;
        }

        private bool GetPets()
        {
            return PetCheckBox.Checked;
        }

        private string GetBathType()
        {
            var items = string.Empty;
            foreach (ListItem i in BathTypeCheckBox.Items)
                if (i.Selected)
                    items += i.Text + ",";

            return items.TrimEnd(',');
        }

        private IList<string> GetAmenities()
        {
            IList<string> retList = PropertyAmenities.Text.Split(',').Reverse().ToList();
            retList = retList.Where(x => !string.IsNullOrEmpty(x)).ToList();
            return retList;
        }

        private int GetRooms()
        {
            int.TryParse(propertyBedrooms.SelectedValue, out var retVal);
            return retVal;
        }

        protected void Page_Load(object Src, EventArgs E)
        {

            if (Session["MainUrl"] != null)
                if (Session["MainUrl"].ToString() != "")
                    _mainImageUrl = Session["MainUrl"].ToString();
            if (Session["MainAddress"] != null)
                if (Session["MainAddress"].ToString() != "")
                    _mainRealAddress = Session["MainAddress"].ToString();
            if (Session["EditImages"] != null)
                if (Session["EditImages"].ToString() != "")
                    _editImageString = Session["EditImages"].ToString();
            

            if (!IsPostBack)
            {
                fillRepeaterData();
            }
        }

        private void fillRepeaterData()
        {
            using (var db = new Model1())
            {
                EditPropertyRepeaterItems.DataSource = db.Properties.ToList();
                EditPropertyRepeaterItems.DataBind();
                DeletePropertyRepeater.DataSource = db.Properties.ToList();
                DeletePropertyRepeater.DataBind();
            }
        }
        public string GetContents(int id)
        {
            return DataCalls.GetContents(id);
        }
        private bool IsImage(Stream stream)
        {
            stream.Seek(0, SeekOrigin.Begin);
            var jpg = new List<string> {"FF", "D8"};
            var bmp = new List<string> {"42", "4D"};
            var gif = new List<string> {"47", "49", "46"};
            var png = new List<string> {"89", "50", "4E", "47", "0D", "0A", "1A", "0A"};
            var imgTypes = new List<List<string>> {jpg, bmp, gif, png};
            var bytesIterated = new List<string>();
            for (var i = 0; i < 8; i++)
            {
                var bit = stream.ReadByte().ToString("X2");
                bytesIterated.Add(bit);
                var isImage = imgTypes.Any(img => !img.Except(bytesIterated).Any());
                if (isImage) return true;
            }

            return false;
        }

        private bool Validation()
        {
            var validationOk = true;
            var validateBlurb = GetBlurb();
            _errorMessage = "";

            var mainImage = GetMainImage();
            long mainImageSize = 0;
            if (_mainRealAddress != "")
                mainImageSize = new FileInfo(_mainRealAddress).Length;
            var amenities = GetAmenities();
            var bathType = GetBathType();
            var images = GetImages();
            var imagesCombinedSize = 0;

            if (validateBlurb.Length > 3000)
            {
                validationOk = false;
                _errorMessage += "Blurb is to long max letters are 3000 ";
            }

            if (PropertyRentPrice.Text == "")
            {
                validationOk = false;
                _errorMessage += "Property needs a rent price please enter one ";
            }

            Debug.Assert(mainImage != null, nameof(mainImage) + " != null");
            if (mainImage.Length > 2083)
            {
                validationOk = false;
                _errorMessage += "Image name is too long max is 2000 characters ";
            }

            if (mainImageSize > 26214400)
            {
                validationOk = false;
                _errorMessage += "Your Main Image is quite large consider compressing it first it is over 25mb ";
            }

            if (amenities.Count > 100)
            {
                validationOk = false;
                _errorMessage += "You have to many amenities please remove some first  ";
            }

            if (bathType.Length > 100)
            {
                validationOk = false;
                _errorMessage += "You have to many bath types please remove some first ";
            }

            if (images.Count > 2080)
            {
                validationOk = false;
                _errorMessage += "Combined Image names are too long max is 2000 characters try uploading less ";
            }

            if (imagesCombinedSize > 26214400 * 5)
            {
                validationOk = false;
                _errorMessage += "Blurb is to long max letters are 3000 ";
            }


            return validationOk;
        }

        private string GetReponseBack(string client, string request)
        {
            Log("entered");
            var resultClient = new RestClient(client);
            Log(resultClient + " resultClient");
            var resultRequest = new RestRequest(request, Method.GET);
            Log(resultRequest + " resultRequest");
            var resultResponse = resultClient.Execute(resultRequest);
            Log(resultRequest + " resultRequest");
            var resultconent = resultResponse.Content;
            Log(resultRequest + " resultRequest");
            Log("exiting");
            Log(resultconent + " resultconent");
            return resultconent;
        }

        private void Log(string message)
        {
            var map = Server.MapPath("~\\Logs\\");
            var log = new LogWriter(message, map);
        }

        protected void PostCodeLookUp_Click(object sender, EventArgs e)
        {
            var postcodeResult = ValidatePostcode(PropertyPostCode.Text);

            if (postcodeResult == "")
            {
                ErrorAddress.Text = "Your PostCode is not Valid, Please Try a different One";
                return;
            }

            var details = GetPostCodeDetailsAsJson(postcodeResult);
            if (details == "")
            {
                ErrorAddress.Text =
                    "Postcode Not Found Please Try A Different One Or Enter Details Manually";
                EmptyTextBoxesForAdress();
                return;
            }

            var postCodeRestResult = PostcodeResult.FromJson(details);
            if (postCodeRestResult.Result == null)
            {
                ErrorAddress.Text =
                    "Could Not Retrieve Details From PostCode PLease Enter A New One Or Enter Details Manually";
                EmptyTextBoxesForAdress();
                return;
            }

            var houseNumber = ValidateHouseNumber(PropertyHouseNumber.Text);
            ErrorAddress.Text = "";
            if (houseNumber == "")
                ErrorAddress.Text =
                    "Could Not Validate House Number the results will be an estimate, Please check for a typo or enter a new number for a more accurate result";

            EmptyTextBoxesForAdress();

            using (var wc = new WebClient())
            {
                Log("https://nominatim.openstreetmap.org/" + "reverse?format=json&lat=" +
                    postCodeRestResult.Result.Latitude + "&lon=" + postCodeRestResult.Result.Longitude);
                const string downloadUrl = "https://nominatim.openstreetmap.org/";
                const string validationEmail = "reverse?email=info@msfproperty.co.uk&format=json&lat=";
                var postcodeLongAndLat =
                    postCodeRestResult.Result.Latitude + "&lon=" + postCodeRestResult.Result.Longitude;
                var fullAddress = downloadUrl + validationEmail + postcodeLongAndLat;
                string content;
                try
                {
                    content = wc.DownloadString(fullAddress);
                }
                catch (Exception exception)
                {
                    Log(exception + "  content");
                    ErrorAddress.Text =
                        "Something went wrong retrieving the details using the full address";
                    EmptyTextBoxesForAdress();
                    return;
                }

                SetPropertyDetailsAndGetMap(content, houseNumber, postCodeRestResult);
            }
        }

        private void SetPropertyDetailsAndGetMap(string content, string houseNumber, PostcodeResult postCodeRestResult)
        {
            var addressResults = AddressResults.FromJson(content);
            var address = addressResults.Address;

            PropertyHouseNumber.Text = houseNumber;
            PropertyStreet.Text = address.Road;
            PropertyStreet2.Text = address.Village ?? postCodeRestResult.Result.AdminWard;
            PropertyCounty.Text = address.County ?? postCodeRestResult.Result.AdminDistrict;
            PropertyCountry.Text = address.State ?? postCodeRestResult.Result.Country;
            PropertyPostCode.Text = PropertyPostCode.Text == address.Postcode
                ? address.Postcode
                : postCodeRestResult.Result.Postcode;
            PropertyLocation.Text = address.Neighbourhood ?? postCodeRestResult.Result.AdminDistrict;
            PropertyLocationX.Text = postCodeRestResult.Result.Latitude.ToString();
            PropertyY.Text = postCodeRestResult.Result.Longitude.ToString();

            var fullAddress = new StringBuilder();
            fullAddress.Append("http://maps.google.com/maps?q=").Append(PropertyHouseNumber.Text + " ")
                .Append(address.Road + " ").Append(address.County + "&z=16&output=embed");
            try
            {
                mapForPostcode.Attributes["src"] = fullAddress.ToString();
            }
            catch (Exception e)
            {
                Log(e + "  content");
                ErrorAddress.Text =
                    "Something went wrong retrieving the details using the full address";
                EmptyTextBoxesForAdress();
            }
        }

        private string GetPostCodeDetailsAsJson(string postcodeResult)
        {
            using (var wc = new WebClient())
            {
                var resultContent = "";
                Log("https://api.postcodes.io/postcodes/" + postcodeResult);
                try
                {
                    resultContent = wc.DownloadString("https://api.postcodes.io/postcodes/" + postcodeResult);
                }
                catch (Exception exception)
                {
                    Log(exception + " resultContent ");
                }

                return resultContent;
            }
        }

        private string ValidateHouseNumber(string text)
        {
            Regex.Replace(text, "[^-.//0-9]", "");
            if (text.Length <= 4) return text.Length < 4 ? text : "";
            text = text.Substring(0, 3);
            ErrorAddress.Text =
                "Could Not Validate House Number the results will be an estimate, Please check for a typo or enter a new number for a more accurate result";

            return text.Length < 4 ? text : "";
        }

        private static string ValidatePostcode(string text)
        {
            const string regex =
                "^(([gG][iI][rR] {0,}0[aA]{2})|((([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y]?[0-9][0-9]?)|(([a-pr-uwyzA-PR-UWYZ][0-9][a-hjkstuwA-HJKSTUW])|" +
                "([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y][0-9][abehmnprv-yABEHMNPRV-Y]))) {0,}[0-9][abd-hjlnp-uw-zABD-HJLNP-UW-Z]{2}))$";
            var match = Regex.Match(text, regex, RegexOptions.IgnoreCase);

            return match.Success ? text : "";
        }

        private void EmptyTextBoxesForAdress()
        {
            const string empty = "";

            PropertyHouseNumber.Text = empty;
            PropertyPostCode.Text = empty;
            PropertyStreet.Text = empty;
            PropertyStreet2.Text = empty;
            PropertyCounty.Text = empty;
            PropertyCountry.Text = empty;
            PropertyLocation.Text = empty;
            PropertyLocationX.Text = empty;
            PropertyY.Text = empty;
            GetAdressUpdatePanel.Update();
            PropertyDetailsUpdatePanel.Update();
        }

        public class ModelAddress
        {
            public bool Ready { get; set; }
            public string Road { get; set; }
            public string Neighbourhood { get; set; }
            public string Suburb { get; set; }
            public string Village { get; set; }
            public string County { get; set; }
            public string State { get; set; }
            public string Postcode { get; set; }
            public string Country { get; set; }
            public string CountryCode { get; set; }

            public string Location { get; set; }
            public float LocationX { get; set; }
            public float LocationY { get; set; }
            public int AddressNumber { get; set; }
            public string Area { get; set; }
            public string Street { get; set; }
            public string Street2 { get; set; }
        }

        protected void ClearTextBoxes_Click(object sender, EventArgs e)
        {
            EmptyTextBoxesForAdress();
        }

        protected void ClearFront(object sender, EventArgs e)
        {
            EmptyAll();

        }
        private void EmptyAll()
        {
            isEdit.Value = "";
            EmptyTextBoxesForAdress();
            EmptyTextBoxesForproperty();
            ErrorAddress.Text = "";
            mapForPostcode.Attributes["src"] = "";
           UncheckAll(this);
        }

        private void EmptyTextBoxesForproperty()
        {
            const string empty = "";

            propertyName.Text = empty;
            propertyBedrooms.SelectedIndex = 0;
            imagePreview.ImageUrl = empty;
            propertyPopularCheck.Checked = false;
            PropertyAmenities.Text = empty;
            BathTypeCheckBox.SelectedIndex = 0;
            PetCheckBox.Checked = false;
            datepicker1.Value = empty;
            datepicker2.Value = empty;
            datepicker1Value.Value = empty;
            datepicker2Value.Value = empty;
            PropertyRentPrice.Text = empty;
            PropertyDeposit.Text = empty;
            PropertyImages.Dispose();
            PropertyBlurb.Text = empty;
        }

        private void UncheckAll(Control ctrl)
        {
            CheckBox chkBox = ctrl as CheckBox;
            if (chkBox == null)
            {
                foreach (Control child in ctrl.Controls)
                {
                    UncheckAll(child);
                }
            }
            else
            {
                chkBox.Checked = false;
            }
        }
        public string GetTextContents(int id)
        {
            return DataCalls.GetContents(id);
        }

        protected void DeletePropertyClick(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                int.TryParse(deletePropertyHiddenField1.Value, out var propertyEditId);

                var result = db.Properties.SingleOrDefault(b => b.ID == propertyEditId);
                if (result == null) return;
                db.Properties.Remove(result);
                db.SaveChanges();
                fillRepeaterData();
                EditPropertyListingUpdatePanel.Update();
            }
        }

        protected void FeaturedChangedOnProperty(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                int.TryParse(deletePropertyHiddenField1.Value, out var propertyEditId);

                var result = db.Properties.SingleOrDefault(b => b.ID == propertyEditId);
                if (result == null) return;
                result.Featured = CheckedOrNot.Checked;
                db.SaveChanges();
                fillRepeaterData();
            }
        }

        [WebMethod]
        public static string CheckFeatured(string data)
        {
            int.TryParse(data, out var id);
            using (var db = new Model1())
            {
                var result = db.Properties.SingleOrDefault(b => b.ID == id);
                if (result != null)
                {
                   return result.Featured.ToString();
                }
            }
            return "false";
        }

        public void EditProperties(object sender, EventArgs e)
        {
            EmptyTextBoxesForAdress();
            int.TryParse(deletePropertyHiddenField1.Value, out var id);

            using (var db = new Model1())
            {
                var result = db.Properties.SingleOrDefault(b => b.ID == id);
                if (result == null) return;
                PropertyHouseNumber.Text = result.AddressNumber.ToString();
                PropertyStreet.Text = result.Street;
                PropertyStreet2.Text = result.Street2;
                PropertyCounty.Text = result.County;
                PropertyCountry.Text = result.Country;
                PropertyPostCode.Text = result.PostCode.Trim();
                PropertyLocation.Text = result.Location;
                PropertyLocationX.Text = result.LocationX.ToString();
                PropertyY.Text = result.LocationY.ToString();

                propertyName.Text = result.PropertyName;
                if (result.Bedrooms != null) propertyBedrooms.SelectedIndex = (int) result.Bedrooms;
                imagePreview.ImageUrl = "../Images/" + result.MainImage;
                Session["MainUrl"] = result.MainImage;
          if (result.Featured != null) propertyPopularCheck.Checked = (bool) result.Featured;
          PropertyAmenities.Text = FixAme(result.Amenities);
          SetBathCheckbox(result.BathType);
          if (result.Pets != null) PetCheckBox.Checked = (bool) result.Pets;
          datepicker1.Value = result.AvailableFrom;
          datepicker2.Value = result.AvaiableTo;
          datepicker1Value.Value = result.AvailableFrom;
          datepicker2Value.Value = result.AvaiableTo;
          PropertyRentPrice.Text = result.RentPrice.ToString();
          PropertyDeposit.Text = result.Deposit.ToString();
          Session["EditImages"] = result.Images;
          PropertyBlurb.Text = result.Blurb;
          isEdit.Value = "True";

            }
        }

        private string FixAme(string amenities)
        {

           var strVal =  CreateCommaSeperatedList(amenities.Split(',').ToList());
           return strVal.Trim();
        }


        private void SetBathCheckbox(string resultBathType)
        {
            List<string> list = resultBathType.Split(',').ToList();
            var selected = BathTypeCheckBox.Items.Cast<ListItem>();
            foreach (var checkBoxItem in selected)
            {
                foreach (var item in list)
                {
                    if (checkBoxItem.Text == item)
                    {
                        checkBoxItem.Selected = true;
                    }
                }
            }
        }


    }
}