using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.UI;

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

                var result = db.TextContents.SingleOrDefault(b => b.ElementNumber == elementNumber.Text);
                if (result != null)
                {
                    result.ElementText = elementText.Text;
                    db.SaveChanges();
                }
       
                if (!Page.ClientScript.IsStartupScriptRegistered("reload"))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "reload", "<script>clearIframe();</script>", false);
                }

            }

        }
    }
}