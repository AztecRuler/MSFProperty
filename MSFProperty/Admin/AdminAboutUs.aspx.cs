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
        protected void Page_Load(object sender, EventArgs e)
        {
            EditAbout_UsRepeaterItems.DataSource = GetAboutUsInfo();

            EditAbout_UsRepeaterItems.DataBind();
        }

        protected void SaveButton_Click1(object sender, EventArgs e)
        {
            if (Validation())
            {
                using (var db = new Model1())
                {
                    var filename = "";

                    if (AboutImage.HasFile)
                    {
                        if (IsImage(AboutImage.FileContent))
                        {
                            var realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\AboutUsPictures\\"), "MSF-" + AboutImage.FileName);
                            AboutImage.SaveAs(realPhysicalPath);
                            filename = "MSF-" + AboutImage.FileName;
                        }

                    }

                    var s = filename != "" ? "../Images/AboutUsPictures/" + filename : "../Images/AboutUsPictures//About_usImagePlaceholder.png";
                    var aboutUsModel = new AboutUsInfo
                    {
                        Title = About_Title.Text,
                        ImageUrl = s,
                        Chat = AboutParaOne.Text,
                        Quote = AboutParaTwo.Text
                    };

                    db.AboutUsInfoes.Add(aboutUsModel);
                    db.SaveChanges();
                    EmptyAll();

                }
            }
            else
            {
                errorText.Text = "Please Enter a title !! "; 
                errorText.Visible = true;
            }

        }

        private bool Validation()
        {
            return About_Title.Text != "" ? true : false ; 
        }

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
                    .Select(c => new AboutUsInfoObject { TitleText = c.Title, Chat = c.Chat, ImageUrl = c.ImageUrl, Quote = c.Quote, ID = c.ID})
                    .ToList();


            }

            return result;

        }

        protected void EditAbout_UsSaveButton_Click(object sender, EventArgs e)
        {
            string realPhysicalPath = "";

            if (EditValidation())
            {
                using (var db = new Model1())
                {
                    String Filename = "";
                    Int32.TryParse(editAbout_UsId.Value, out int aboutEditId);

                    AboutUsInfo result = db.AboutUsInfoes.SingleOrDefault(b => b.ID == aboutEditId);

                    if (result != null)
                    {
                        AboutUsInfo oldResults = new AboutUsInfo
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

                                realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\AboutUsPictures\\"), "MSF-" + FileUpload1.FileName);
                                FileUpload1.SaveAs(realPhysicalPath);
                                Filename = "../Images/AboutUsPictures/MSF-" + FileUpload1.FileName;
                            }
                            else
                            {
                                Filename = oldResults.ImageUrl;
                            }


                        }

                        result.Title = About_UsEditTextBox1.Text == "" ? oldResults.Title : About_UsEditTextBox1.Text;
                        result.Chat = About_UsEditTextBox2.Text == "" ? oldResults.Chat : About_UsEditTextBox2.Text;
                        result.Quote = About_UsEditTextBox2.Text == "" ? oldResults.Quote : About_UsEditTextBox3.Text;
                        result.ImageUrl = Filename == "" ? "../Images/AboutUsPictures//About_usImagePlaceholder.png" :  Filename;
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

                List<string> pageList = new List<string>();
                using (var db = new Model1())
                {
                    EditAbout_UsRepeaterItems.DataSource = GetAboutUsInfo();

                    EditAbout_UsRepeaterItems.DataBind();
            }

        }

        private bool EditValidation()
        {
        //TODO:create validation when editing about us sections
            return true; 
        }

    }


}
