using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mime;
using System.Web.UI;
using AjaxControlToolkit;

namespace MSFProperty.Admin
{
    public partial class EditImages : Page
    {
        private int? _elementPageId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) GetImagesFromFolder();
        }

        private void GetImagesFromFolder()
        {
            var filenames = Directory.GetFiles(Server.MapPath("~/Images"));

            var imageList = filenames.Select(item => item.Split('\\').Last()).ToList();

            ImageRepeater.DataSource = imageList.ToList();
            ImageRepeater.DataBind();
        }

        protected void Image_Delete(object sender, EventArgs e)
        {
            var result = Server.MapPath(uploadedImageUrl.Text);
            if (File.Exists(result)) File.Delete(result);
            DeleteImageLabel.Text = "Image Deleted ! ";
            GetImagesFromFolder();
        }

        protected void refreshImages(object sender, EventArgs e)
        {
      
            GetImagesFromFolder();
        }
        protected void AsyncFileUpload1_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
            if (IsImage(AsyncFileUpload1.FileContent) )
            {
                if (AsyncFileUpload1.HasFile)
                {
                    ScriptManager.RegisterClientScriptBlock(this,
                        GetType(), "newfile",
                        "window.parent.$find('" + AsyncFileUpload1.ClientID + "').newFileName='" + "MSF-" +
                        AsyncFileUpload1.FileName + "';", true);

                    var realPhysicalPath =
                        Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + AsyncFileUpload1.FileName);
                    AsyncFileUpload1.SaveAs(realPhysicalPath);
                }
              
        
            }
            else
            {
                ErrorLabelImages.Text = " this is not a valid file please select another one. ";
                AsyncFileUpload1.BackColor = Color.Red;
            }
            GetImagesFromFolder();
            UpdatePanel1.Update();

            ErrorLabelImages.Text = "Image Uploaded ! ";
        }
        private  bool IsImage(Stream stream)
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
            ErrorLabelImages.Text = "Error Saving Image ";
            return false;
        }


        protected long GetImageSize(int id)
        {
            var filename = Directory.GetFiles(Server.MapPath("~/Images"));
            var fileLength = new FileInfo(filename[id]).Length;
            return fileLength;
        }

        protected string GetImageName(int id)
        {
            var filenames = Directory.GetFiles(Server.MapPath("~/Images"));

            var imageList = filenames.Select(item => item.Replace(" ", string.Empty).Split('\\').Last()).ToList();

            return imageList[id];
        }
    }
}