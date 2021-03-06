﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using AjaxControlToolkit;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;
using System.Drawing.Imaging;
using System.Drawing;

namespace MSFProperty.Admin
{
    public partial class EditPage : Page
    {
        private int? _elementPageId;
        private string _filename;

        protected void Page_Init(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["val"] != null)
            {
                if (Session["val"].ToString() != "")
                {
                    _filename = Session["val"].ToString();
                }
            }

            if (Page.IsPostBack) return;
            using (var db = new Model1())
            {
                rpData.DataSource = db.Pages.ToList();
                rpData.DataBind();
            }

            GetImagesFromFolder();
        }

        private void GetImagesFromFolder()
        {
            var imageList = new List<string>();
            var fileNames = Directory.GetFiles(Server.MapPath("~/Images"));

            foreach (var item in fileNames) imageList.Add(item.Replace(" ", string.Empty).Split('\\').Last());

            Repeater1.DataSource = imageList.ToList();

            Repeater1.DataBind();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            _elementPageId = Convert.ToInt32(hdnfldVariable.Value);

            using (var db = new Model1())
            {
                // ReSharper disable once ComplexConditionExpression
                var result = db.TextContents.SingleOrDefault(b =>
                    b.ElementNumber == elementNumber.Text && b.PageId == _elementPageId);
                if (result != null)
                {
                    result.Color = textColor.Value;
                    result.ElementText = elementText.Text;
                    db.SaveChanges();
                }
            }

            if (!Page.ClientScript.IsStartupScriptRegistered("reload"))
                ScriptManager.RegisterStartupScript(this, GetType(), "reload",
                    "<script>clearIframe(" + _elementPageId + ");</script>", false);
        }

        protected void AsyncFileUpload1_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
            if (IsImage(AsyncFileUpload1.FileContent) || uploadedImageUrl.Text != "")
            {
                if (AsyncFileUpload1.HasFile)
                {
                    var realPhysicalPath =
                        Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + AsyncFileUpload1.FileName);
                    AsyncFileUpload1.SaveAs(realPhysicalPath);
                    Session["val"] = "MSF-" + AsyncFileUpload1.FileName;
                }
                else if (uploadedImageUrl.Text != "")
                {
                    Session["val"] = uploadedImageUrl.Text.Replace("../images/", string.Empty);
                }

            }
            else
            {
                Error.Text = " this is not a valid file please select another one. ";
                AsyncFileUpload1.BackColor = Color.Red;
            }
        }


        // ReSharper disable once MethodTooLong
        protected void Image_Save_Click(object sender, EventArgs e)
        {
            _elementPageId = Convert.ToInt32(hdnfldVariable.Value);
            if (AsyncFileUpload1.FileContent == null )
            {
                if (uploadedImageUrl.Text != "")
                {
                    _filename = uploadedImageUrl.Text.Replace("../images/", string.Empty);
                }
            }

            using (var db = new Model1())
            {
                // ReSharper disable once ComplexConditionExpression
                var result =
                    db.PageImages.SingleOrDefault(pi => pi.ImageID == ImageID.Text && pi.PageId == _elementPageId);

                if (result != null)
                {

                    result.ImageUrl = _filename;
                    result.ImageName = imageNewName.Text != "" ? imageNewName.Text : _filename;
                }

                db.SaveChanges();
            }


            GetImagesFromFolder();
            if (!Page.ClientScript.IsStartupScriptRegistered("reload"))
                ScriptManager.RegisterStartupScript(this, GetType(), "reload",
                    "<script>clearIframe(" + _elementPageId + ");</script>", false);
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

    }
}