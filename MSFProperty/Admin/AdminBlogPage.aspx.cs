using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty.Admin
{
    public partial class AdminBlogPage : System.Web.UI.Page
    {
        protected void Page_Load(Object Src, EventArgs E)
        {

            if (!Page.IsPostBack)
            {
                setUpEditBlog(); 
       
                List<string> pageList = new List<string>();
                using (var db = new Model1())
                {
                    EditBlogRepeaterItems.DataSource = db.Blogs.ToList();

                    EditBlogRepeaterItems.DataBind();
                }

            }
        }

        public string getContents(int id)
        {
            using (var db = new Model1())
            {
                foreach (var item in db.Blogs)
                {
                    if (item.ID == id)
                        return Regex.Replace(item.Contents, "<.*?>", string.Empty);

                }
            }

            return "";
        }

        private void setUpEditBlog()
        {

        //     blogEditTextBox1.Text = 
        //    "editButton" +
        //        "blogEditTextBox2" +
        //        "Button2" class="editButton" 
        //blogEditFileUpload1
        //    Button3" class="editButton" 
        //    blogEditCheckBox1
        //    Button4" class="editButton" 
        //    blogEditFreeTextBox2
        //    Button5" class="editButton"
        //    "SaveEditBlog" 
        }


        
        protected void EditBlogSaveButton_Click(object sender, EventArgs e)
        {
            var Output = blogEditFreeTextBox2.Text;
            var todaysDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);


            string realPhysicalPath = "";



            if (EditValidation(Output))
            {
                using (var db = new Model1())
                {
                    String Filename = "";
                    Boolean popular = blogEditCheckBox1.Checked;
                    int blogEditId = 0;
                    Int32.TryParse(editBlogId.Value, out blogEditId);
                    
                    Blog result = db.Blogs.SingleOrDefault(b => b.ID == blogEditId);

                    Blog oldResults = new Blog
                    {
                        Contents = result.Contents,
                        Title = result.Title,
                        Name = result.Name,
                        Date = result.Date,
                        ImageUrl = result.ImageUrl,
                        Popular = result.Popular
                    };


                    if (IsImage(this.blogEditFileUpload1.FileContent))
                    {


                        if (this.blogEditFileUpload1.HasFile)
                        {
                            realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + this.blogEditFileUpload1.FileName);
                            this.blogEditFileUpload1.SaveAs(realPhysicalPath);
                            Filename = "MSF-" + this.blogEditFileUpload1.FileName;
                        }
                        else
                        {
                            Filename = oldResults.ImageUrl;
                        }


                    }

                    result.Contents = Output == "" ? oldResults.Contents : Output;
                    result.Title = blogEditTextBox2.Text == "" ? oldResults.Title : blogEditTextBox2.Text;
                    result.Name = blogEditTextBox1.Text == "" ? oldResults.Contents : blogEditTextBox1.Text;
                    result.ImageUrl = Filename == "" ? oldResults.ImageUrl : Filename;
                    result.Date = todaysDate;
                    result.Popular = popular;

                    db.SaveChanges();

                }
            }
            else
            {
                errorText.Visible = true;

                errorText.Text = "Please fill in all values";
            }

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
        private bool EditValidation(string output)
        {
            return (output != null && blogEditTextBox1.Text != "" && blogEditTextBox2.Text != "");


        }
        private void emptyAll()
        {
            blogTitle.Text = "";
            blogName.Text = "";
            FreeTextBox1.Text = "";

        }
    }
}