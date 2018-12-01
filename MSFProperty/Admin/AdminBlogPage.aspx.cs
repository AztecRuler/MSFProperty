using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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


            string realPhysicalPath = "";

 

            if (Validation(Output))
            {
                using (var db = new Model1())
                {
                    String Filename = "";
                    Boolean popular = popularCheck.Checked;

                    if (IsImage(this.blogImage.FileContent))
                    {


                        if (this.blogImage.HasFile)
                        {
                            realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + this.blogImage.FileName);
                            this.blogImage.SaveAs(realPhysicalPath);
                            Filename = "MSF-" + this.blogImage.FileName;
                        }


                    }

                    Blog blog = new Blog
                    {
                        Contents = Output,
                        Title = blogTitle.Text,
                        Name = blogName.Text,
                        Date = todaysDate,
                        ImageUrl = Filename,
                        Popular = popular

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