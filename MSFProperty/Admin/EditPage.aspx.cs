using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace MSFProperty.Admin
{
    public partial class EditPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!Master.Page.ClientScript.IsStartupScriptRegistered("alert"))
            //{
            //    Master.Page.ClientScript.RegisterStartupScript
            //        (this.GetType(), "alert", "insideJS();", true);
            //}

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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ScriptManager1.RegisterClientScriptBlock(this, GetType(), "none", "<script>executeAfter();</script>", false);
        }

        public class EditableEllement
        {
            public int Id { get; set; }
            public string PageName { get; set; }
            public int PageId { get; set; }
            public string ElementText { get; set; }
            public int ElementNumber { get; set; }
            public string ElementType { get; set; }
            public string ElemenetLink { get; set; }
        }


        [WebMethod]
        public static void PassThings(EditableEllement ellement)
        {
            var t = ellement;

        }

        private void OpenAdminPanelForText(EditableEllement text)
        {
            ////display panel
            //AdminPanel.Visible = true;

            ////populate input fields 
            //pageName.Text = text.PageName;

            //pageId.Text = text.PageId.ToString();

            //elementText.Text = text.ElementText;

            //elementNumber.Text = text.ElementNumber.ToString();

            //elementType.Text = text.ElementType;

            //elemenetLink.Text = text.ElemenetLink;


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
                else
                {
                    //var std = new TextContent()
                    //{

                    //    PageName = pageName.Text.ToString(),
                    //    PageId = int.Parse(pageId.Text),
                    //    ElementText = elementText.Text,
                    //    ElementNumber = elementNumber.Text,
                    //    ElementType = elementType.Text,
                    //    ElementLink = elemenetLink.Text
                    //};

                    //db.TextContents.Add(std);

                    //db.SaveChanges();
                }
            
                //if (!Master.Page.ClientScript.IsStartupScriptRegistered("alert"))
                //{
                //    Master.Page.ClientScript.RegisterStartupScript
                //        (this.GetType(), "alert", "clearIframe(iframe1);", true);
                //}



            }

        }
    }
}