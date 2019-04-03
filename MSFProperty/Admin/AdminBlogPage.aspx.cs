using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class AdminBlogPage : Page
    {
        protected void Page_Load(object src, EventArgs e)
        {
            // ReSharper disable once PossibleNullReferenceException
            if (!ScriptManager.GetCurrent(Page).IsInAsyncPostBack)
            {
                ScriptManager.RegisterOnSubmitStatement(this, this.GetType(), "SaveTextBoxBeforePostBack", "SaveTextBoxBeforePostBack()");

            }
            if (!IsPostBack) FillRepeaterData();
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
        }

        private void FillRepeaterData()
        {
            using (var db = new Model1())
            {
                EditBlogRepeaterItems.DataSource = db.Blogs.ToList();
                Repeater1.DataSource = db.Blogs.ToList();
                EditBlogRepeaterItems.DataBind();
                Repeater1.DataBind();
            }
        }

        protected void EditBlogDeleteButton_Click(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                int.TryParse(delteHiddenField1.Value, out var blogEditId);

                var result = db.Blogs.SingleOrDefault(b => b.ID == blogEditId);
                if (result == null) return;
                db.Blogs.Remove(result);
                db.SaveChanges();
                FillRepeaterData();
            }
        }

        // ReSharper disable once MethodTooLong
        // ReSharper disable once ExcessiveIndentation
        protected void EditBlogSaveButton_Click(object sender, EventArgs e)
        {
            var output = blogEditFreeTextBox2.Text;
            var todayDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);

            if (EditValidation(output))
            {
                using (var db = new Model1())
                {
                    var filename = "";
                    var popular = blogEditCheckBox1.Checked;
                    int.TryParse(editBlogId.Value, out var blogEditId);

                    var result = db.Blogs.SingleOrDefault(b => b.ID == blogEditId);

                    if (result != null)
                    {
                        var oldResults = new Blog
                        {
                            Contents = result.Contents,
                            Title = result.Title,
                            Name = result.Name,
                            Date = result.Date,
                            ImageUrl = result.ImageUrl,
                            Popular = result.Popular
                        };


                        if (IsImage(blogEditFileUpload1.FileContent))
                        {
                            if (blogEditFileUpload1.HasFile)
                            {
                                var realPhysicalPath = Path.Combine(Server.MapPath("~\\Images\\"),
                                    "MSF-" + blogEditFileUpload1.FileName);
                                blogEditFileUpload1.SaveAs(realPhysicalPath);
                                filename = "MSF-" + blogEditFileUpload1.FileName;
                            }
                            else
                            {
                                filename = oldResults.ImageUrl;
                            }
                        }

                        result.Contents = output == "" ? oldResults.Contents : output;
                        result.Title = blogEditTextBox2.Text == "" ? oldResults.Title : blogEditTextBox2.Text;
                        result.Name = blogEditTextBox1.Text == "" ? oldResults.Contents : blogEditTextBox1.Text;
                        result.ImageUrl = filename == "" ? oldResults.ImageUrl : filename;
                    }

                    if (result != null)
                    {
                        result.Date = todayDate;
                        result.Popular = popular;
                    }

                    db.SaveChanges();
                    FillRepeaterData();
                }
            }
            else
            {
                errorText.Visible = true;

                errorText.Text = "Please fill in all values";
            }

            UpdatePanel3.Update();
        }

        // ReSharper disable once MethodTooLong
        protected void SaveButton_Click1(object sender, EventArgs e)
        {
            var output = BlogBlurb.Text;
            var todayDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);

            if (Validation(output))
            {
                using (var db = new Model1())
                {
                    var filename = "";
                    var popular = popularCheck.Checked;

                    if (IsImage(blogImage.FileContent))
                        if (blogImage.HasFile)
                        {
                            var realPhysicalPath =
                                Path.Combine(Server.MapPath("~\\Images\\"), "MSF-" + blogImage.FileName);
                            blogImage.SaveAs(realPhysicalPath);
                            filename = "MSF-" + blogImage.FileName;
                        }

                    var blog = new Blog
                    {
                        Contents = output,
                        Title = blogTitle.Text,
                        Name = blogName.Text,
                        Date = todayDate,
                        ImageUrl = filename,
                        Popular = popular
                    };

                    db.Blogs.Add(blog);
                    db.SaveChanges();
                    EmptyAll();
                }
            }
            else
            {
                errorText.Visible = true;
                errorText.Text = "Please fill in all values";
            }
        }

        // ReSharper disable once MethodTooLong
        private static bool IsImage(Stream stream)
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

        private bool Validation(string output)
        {
            return output != null && blogTitle.Text != "" && blogName.Text != "";
        }

        private bool EditValidation(string output)
        {
            return output != null && blogEditTextBox1.Text != "" && blogEditTextBox2.Text != "";
        }

        private void EmptyAll()
        {
            blogTitle.Text = "";
            blogName.Text = "";
            BlogBlurb.Text = "";
        }
    }
}