using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace MSFProperty.Admin
{
    public partial class EditImages : Page
    {

        private int? _elementPageId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
             GetImagesFromFolder();

            }
        }

        private void GetImagesFromFolder()
        {
            String[] filenames = Directory.GetFiles(Server.MapPath("~/Images"));

            List<string> imageList = filenames.Select(item => item.Replace(" ", string.Empty).Split('\\').Last()).ToList();

            imageInFolder imgIF = new imageInFolder();

            foreach (var image in imageList)
            {
                
            }

            ImageRepeater.DataSource = imageList.ToList();
            ImageRepeater.DataBind(); 
        }

        protected void Image_Delete(object sender, EventArgs e)
        {

            var test = Server.MapPath(uploadedImageUrl.Text); 
            if ((File.Exists(test)))
            {
                File.Delete(test);
            }
            GetImagesFromFolder();
        }


        protected void Image_Save_Click(object sender, EventArgs e)
        {
            string realPhysicalPath = "";
            if(hdnfldVariable.Value != "")
            _elementPageId = Convert.ToInt32(hdnfldVariable.Value);

            if (IsImage(FileUpload1.FileContent))
            {
                    String Filename = "";

                    if (FileUpload1.HasFile)
                    {
                        realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + FileUpload1.FileName);
                    FileUpload1.SaveAs(realPhysicalPath);
                        Filename = "MSF-" + FileUpload1.FileName;
                    }

                GetImagesFromFolder();

            }
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


        protected long GetImageSize(int id)
        {
            String[] filename = Directory.GetFiles(Server.MapPath("~/Images"));
            List<string> imageList = filename.Select(item => item.Replace(" ", string.Empty).Split('\\').Last()).ToList();

            var filePath = imageList[0];
            var fileLength = new FileInfo("C:\\Users\\Gerry\\source\\repos\\MSFProperty\\MSFProperty\\Images\\MSF-edinburgh_view.jpg").Length;

            return fileLength; 

        }
    }
    public class imageInFolder
    {
        public string Url { get; private set; }
        public int Id { get; private set; }

        public imageInFolder(string url, int id)
        {
            Url = url;
            Id = id;
        }

        public imageInFolder()
        {
        }
    }

}