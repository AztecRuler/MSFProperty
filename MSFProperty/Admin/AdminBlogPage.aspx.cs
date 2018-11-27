using MSFProperty.Admin.EF;
using System;
using System.Web.UI;

namespace MSFProperty.Admin
{
    public partial class AdminBlogPage : System.Web.UI.Page
    {
        protected void Page_Load(Object Src, EventArgs E)
        {

        }
        protected void SaveButton_Click1(object sender, EventArgs e)
        {
            var Output = FreeTextBox1.Text;
            var todaysDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);

            if (Validation(Output))
            {
                using (var db = new Model1())
                {

                    Blog blog = new Blog
                    {
                        Contents = Output,
                        Title = blogTitle.Text,
                        Name = blogName.Text,
                        Date = todaysDate
                    };

                    db.Blogs.Add(blog);
                    db.SaveChanges();
                    emptyAll(); 

                }
            }
            else
            {
                errorText.Visible = true; 

                errorText.Text = "Please fill in all values"; 
            }

            if (!Page.ClientScript.IsStartupScriptRegistered("reload"))
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "reload", "<script>clearIframe(" + elementPageId + ");</script>", false);
            }
        }

        private bool Validation(string output)
        {
          return ( output != null && blogTitle.Text != "" && blogName.Text != "");
          
            
        }
        private void emptyAll()
        {
            blogTitle.Text = "";
            blogName.Text = "";
            FreeTextBox1.Text = "";
        }
    }
}