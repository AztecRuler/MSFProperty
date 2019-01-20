﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace MSFProperty.Admin
{
    public partial class EditImages : Page
    {

        private int? elementPageId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
             GetImagesFromFolder();

            }
        }

        private void GetImagesFromFolder()
        {
            List<string> imageList = new List<string>();
            String[] filenames = Directory.GetFiles(Server.MapPath("~/Images"));

            foreach (var item in filenames)
            {
                imageList.Add(item.Replace(" ", string.Empty).Split('\\').Last());

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
            elementPageId = Convert.ToInt32(hdnfldVariable.Value);

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


    }
}