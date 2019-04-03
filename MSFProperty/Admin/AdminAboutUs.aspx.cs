using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class AdminAboutUs : Page
    {
        private const string PlaceholderImage = "../Images/AboutUsPictures/About_usImagePlaceholder.png";

        protected void Page_Load(object sender, EventArgs e)
        {
            FillRepeaterData();
            
        }
        private void GetImagesFromFolder()
        {
            var fileNames = Directory.GetFiles(Server.MapPath("~/Images"));

            var imageList = fileNames.Select(item => item.Split('\\').Last()).ToList();

            Repeater1.DataSource = imageList.ToList();
            Repeater2.DataSource = imageList.ToList();

            Repeater1.DataBind();
            Repeater2.DataBind();
        }
        // ReSharper disable once MethodTooLong
        protected void SaveButton_Click1(object sender, EventArgs e)
        {
            if (Validation())
            {
                using (var db = new Model1())
                {
                    var filename = "";
                    var filenameLocation = "";

                    if (AboutImage.HasFile)
                        if (IsImage(AboutImage.FileContent))
                        {
                            var realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\AboutUsPictures\\"),
                                "MSF-" + AboutImage.FileName);
                            AboutImage.SaveAs(realPhysicalPath);
                            filename = "MSF-" + AboutImage.FileName;
                            uploadedImageUrl.Text = "";
                        }

                    if (uploadedImageUrl.Text == "")
                    {
                        filenameLocation = "../Images/AboutUsPictures/" + filename;
                    }
                    else
                    {
                        filenameLocation = uploadedImageUrl.Text;
                        filename = "1";
                    }
                    var selectedFile = filename != "" ? filenameLocation : PlaceholderImage;
                    var aboutUsModel = new AboutUsInfo
                    {
                        Title = About_Title.Text,
                        ImageUrl = selectedFile,
                        Chat = AboutParaOne.Text,
                        Quote = AboutParaTwo.Text
                    };

                    db.AboutUsInfoes.Add(aboutUsModel);
                    db.SaveChanges();
                    errorText.Text = "new about us added";
                    errorText.Visible = true;
                    EmptyAll();
                }
            }
            else
            {
                errorText.Text = "Please Enter a title !! ";
                errorText.Visible = true;
            }

            FillRepeaterData();
        }

        private bool Validation()
        {
            return About_Title.Text != "";
        }

        // ReSharper disable once MethodTooLong
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

        private void EmptyAll()
        {
            About_Title.Text = "";
            AboutParaOne.Text = "";
            AboutParaTwo.Text = "";
        }

        public object GetAboutUsInfo()
        {
            List<AboutUsInfoObject> result;
            using (var db = new Model1())
            {
                result = db.AboutUsInfoes
                    .Select(c => new AboutUsInfoObject
                        {TitleText = c.Title, Chat = c.Chat, ImageUrl = c.ImageUrl, Quote = c.Quote, ID = c.ID})
                    .ToList();
            }

            return result;
        }

        // ReSharper disable once MethodTooLong
        // ReSharper disable once ExcessiveIndentation
        protected void EditAbout_UsSaveButton_Click(object sender, EventArgs e)
        {
            if (EditValidation())
            {
                using (var db = new Model1())
                {
                    var filename = "";
                    int.TryParse(editAbout_UsId.Value, out var aboutEditId);

                    var result = db.AboutUsInfoes.SingleOrDefault(b => b.ID == aboutEditId);

                    if (result != null)
                    {
                        var oldResults = new AboutUsInfo
                        {
                            Title = result.Title,
                            Chat = result.Chat,
                            Quote = result.Quote,
                            ImageUrl = result.ImageUrl
                        };

                        if (FileUpload1.HasFile)

                        {
                            if (IsImage(FileUpload1.FileContent))

                            {
                                var realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\AboutUsPictures\\"),
                                    "MSF-" + FileUpload1.FileName);
                                FileUpload1.SaveAs(realPhysicalPath);
                                filename = "../Images/AboutUsPictures/MSF-" + FileUpload1.FileName;
                                uploadedImageUrl.Text = "";
                            }
                        }
                        else
                        {
                            filename = uploadedImageUrl.Text == "" ? oldResults.ImageUrl : uploadedImageUrl.Text;
                        }

                        result.Title = About_UsEditTextBox1.Text == "" ? oldResults.Title : About_UsEditTextBox1.Text;
                        result.Chat = About_UsEditTextBox2.Text == "" ? oldResults.Chat : About_UsEditTextBox2.Text;
                        result.Quote = About_UsEditTextBox2.Text == "" ? oldResults.Quote : About_UsEditTextBox3.Text;
                        result.ImageUrl = filename == "" ? PlaceholderImage : filename;
                    }

                    db.SaveChanges();
                 
                    FillRepeaterData();
                }
            }
            else
            {
                errorText.Visible = true;

                errorText.Text = "Please fill in all values";
            }

            UpdatePanel3.Update();
        }

        private void FillRepeaterData()
        {
            EditAbout_UsRepeaterItems.DataSource = GetAboutUsInfo();
            DeleteAboutUsRepeater.DataSource = GetAboutUsInfo();
            DeleteAboutUsRepeater.DataBind();
            EditAbout_UsRepeaterItems.DataBind();
            GetImagesFromFolder();
            UpdatePanel1.Update();
            UpdatePanel3.Update();
        }

        private bool EditValidation()
        {
            //TODO:create validation when editing about us sections
            return true;
        }

        protected void Cancel_OnClick(object sender, EventArgs e)
        {
          
        }

        protected void DeleteAbout_UsButton_Click(object sender, EventArgs e)
        {
            int.TryParse(editAbout_UsId.Value, out var aboutDelId);
            using (var db = new Model1())
            {
                var result = db.AboutUsInfoes.SingleOrDefault(b => b.ID == aboutDelId);

                if (result == null) return;
                db.AboutUsInfoes.Remove(result);
                db.SaveChanges();
                FillRepeaterData();
            }
        }

    }
}