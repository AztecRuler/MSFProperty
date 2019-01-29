using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class EditPage : Page
    {
        private int? elementPageId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<string> pageList = new List<string>();
                using (var db = new Model1())
                {
                    foreach (var item in db.Pages)
                    {
                        pageList.Add(item.PageName.Replace(" ", string.Empty));

                    }

                    rpData.DataSource = db.Pages.ToList();

                    rpData.DataBind();
                }

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

            Repeater1.DataSource = imageList.ToList();

            Repeater1.DataBind();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            elementPageId = Convert.ToInt32(hdnfldVariable.Value);

            using (var db = new Model1())
            {
                TextContent result = db.TextContents.SingleOrDefault(b => b.ElementNumber == elementNumber.Text && b.PageId == elementPageId);
                if (result != null)
                {
                    result.ElementText = elementText.Text;
                    db.SaveChanges();
                }
        
            }
            if (!Page.ClientScript.IsStartupScriptRegistered("reload"))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "reload", "<script>clearIframe(" + elementPageId + ");</script>", false);
            }

        }
        protected void Image_Save_Click(object sender, EventArgs e)
        {
            string realPhysicalPath = "";
            elementPageId = Convert.ToInt32(hdnfldVariable.Value);

            if (IsImage(FileUpload1.FileContent) || uploadedImageUrl.Text !="")
            {
                using (var db = new Model1())
                {
                    PageImage result = db.PageImages.SingleOrDefault(b => b.ImageID == ImageID.Text && b.PageId == elementPageId);
                    String Filename = "";

                    if (FileUpload1.HasFile)
                    {
                        realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + FileUpload1.FileName);
                        FileUpload1.SaveAs(realPhysicalPath);
                        Filename = "MSF-" + FileUpload1.FileName;
                    }
                    else if (uploadedImageUrl.Text != "")
                    {
                        Filename = uploadedImageUrl.Text.Replace("../images/", String.Empty); 
                    }
                    if (result != null)
                    {

                        result.ImageUrl = Filename;
                        if (imageNewName.Text != "")
                        {
                            result.ImageName = imageNewName.Text;
                        }
                        else
                        {
                            result.ImageName = Filename;
                        }
                    }

                    db.SaveChanges();
                }
                GetImagesFromFolder();
                if (!Page.ClientScript.IsStartupScriptRegistered("reload"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "reload", "<script>clearIframe();</script>", false);
                }
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