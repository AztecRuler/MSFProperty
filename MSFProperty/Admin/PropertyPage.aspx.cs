using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using MSFProperty.Admin.EF;
using RestSharp;
using Image = System.Web.UI.WebControls.Image;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class PropertyPage : Page
    {
        private string _errorMessage = "";
        private string _mainImageUrl = "";
        private string _mainRealAddress = ""; 

        protected void SaveNewProperty(object sender, EventArgs e)
        {
            var todayDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);

         
            if (Validation())
            {
                using (var db = new Model1())
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

                    var property = new Property
                    {
                        MainImage = mainImage,
                        Bedrooms = bedrooms,
                        Amenities = CreateCommaSeperatedList(amenities),
                        BathType = bathType,
                        Pets = pets,
                        AvailableFrom = availableFrom,
                        AvaiableTo = avaiableTo,
                        RentPrice = rentPrice,
                        Deposit = deposit,
                        Blurb = blurb,
                        Featured = featured,
                        Created = created,
                        Images = CreateCommaSeperatedList(images),
                        //Todo: add property value 
                        //PropertyName = 
                        Street = FullAdress.Street,
                        Street2 = FullAdress.Street2,
                        County = FullAdress.County,
                        Country = FullAdress.Country,
                        PostCode = FullAdress.Postcode,
                        Location = FullAdress.Location,
                        LocationX = FullAdress.LocationX,
                        LocationY = FullAdress.LocationY,
                        AddressNumber = FullAdress.AddressNumber,
                        Area = FullAdress.Area
                    };
                    db.Properties.Add(property);
                    SafeSave(db);
                    EmptyAll();
                    errorText.Text = "Property uploaded";
                }
            }
            else
            {
                errorText.Text = _errorMessage;
            }
        }

        private void SafeSave(Model1 context)
        {
            //this is for error checking
            try
            {
                context.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                Log(e.ToString());

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
            var separatedList = "";

            foreach (var item in amenities) separatedList += item + ",";

            return separatedList;
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
                    this.GetType(), "newfile",
                    "window.parent.$find('" + MainFileUploader.ClientID + "').newFileName='" + "MSF-" + MainFileUploader.FileName + "';", true);
                Session["MainUrl"] = "MSF-" + MainFileUploader.FileName;
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

            return items;
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
            {
                if (Session["MainUrl"].ToString() != "")
                {
                    _mainImageUrl = Session["MainUrl"].ToString();
                }
            }
            if (Session["MainAddress"] != null)
            {
                if (Session["MainAddress"].ToString() != "")
                {
                    _mainRealAddress = Session["MainAddress"].ToString();
                }
            }
            

            if (!IsPostBack)
            {
                //fillRepeaterData();
            }
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
            bool validationOk = true;
            var validateBlurb = GetBlurb();
            _errorMessage = "";

            var mainImage = GetMainImage();
            long mainImageSize = 0;
            if (_mainRealAddress !="")
                mainImageSize = new System.IO.FileInfo(_mainRealAddress).Length;
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
            if (imagesCombinedSize > (26214400*5))
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
            {
                ErrorAddress.Text =
                    "Could Not Validate House Number the results will be an estimate, Please check for a typo or enter a new number for a more accurate result";
            }

            EmptyTextBoxesForAdress();

            using (var wc = new WebClient())
            {
                Log("https://nominatim.openstreetmap.org/" + "reverse?format=json&lat=" +
                    postCodeRestResult.Result.Latitude + "&lon=" + postCodeRestResult.Result.Longitude);
                const string downloadUrl = "https://nominatim.openstreetmap.org/";
                const string validationEmail = "reverse?email=info@msfproperty.co.uk&format=json&lat=";
                var postcodeLongAndLat =  postCodeRestResult.Result.Latitude + "&lon=" + postCodeRestResult.Result.Longitude;
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
            fullAddress.Append("http://maps.google.com/maps?q=").Append(PropertyHouseNumber.Text + " ").Append(address.Road + " ").Append(address.County + "&z=16&output=embed");
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
                return;
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

        private void EmptyAll()
        {
            EmptyTextBoxesForAdress();
        }
    }
}