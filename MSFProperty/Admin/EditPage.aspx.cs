using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.UI;
using System.IO;

namespace MSFProperty.Admin
{
    public partial class EditPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> pageList = new List<string>();
            using (var db = new Model1())
            {
                foreach (var item in db.Pages)
                {
                    pageList.Add(item.PageName.ToString().Replace(" ", string.Empty));

                }

                rpData.DataSource = db.Pages.ToList();

                rpData.DataBind();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                TextContent result = db.TextContents.SingleOrDefault(b => b.ElementNumber == elementNumber.Text);
                if (result != null)
                {
                    result.ElementText = elementText.Text;
                    db.SaveChanges();
                }
        
            }
            if (!Page.ClientScript.IsStartupScriptRegistered("reload"))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "reload", "<script>clearIframe();</script>", false);
            }

        }
        protected void Image_Save_Click(object sender, EventArgs e)
        {
            string realPhysicalPath = "";
            using (var db = new Model1())
            {

                if (this.FileUpload1.HasFile)
                {
                    realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\" ), "MSF-" +this.FileUpload1.FileName);
                    this.FileUpload1.SaveAs(realPhysicalPath);
                    PageImage result = db.PageImages.SingleOrDefault(b => b.ImageID == ImageID.Text);
                    if (result != null)
                    {
                        if (UploadedTab.Value == "true")
                        {
                            result.ImageUrl = "MSF-" + this.FileUpload1.FileName;
                            if (imageNewName.Text != "")
                            {
                                result.ImageName = imageNewName.Text;
                            }
                            else
                            {
                                result.ImageName = "MSF-" + this.FileUpload1.FileName;
                            }
                        }
                        else
                        {

                        }
                        db.SaveChanges();
                    }
                }

            }

            if (!Page.ClientScript.IsStartupScriptRegistered("reload"))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "reload", "<script>clearIframe();</script>", false);
            }
        }

        
    }
}