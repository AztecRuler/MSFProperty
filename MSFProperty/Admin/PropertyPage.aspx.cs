using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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

                    //String address = GetAddress();
                    //String area = GetArea(address);
                    //String location = GetLocation();
                    //float locationX = GetLocationX(location);
                    //float locationY = GetLocationY(location);


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