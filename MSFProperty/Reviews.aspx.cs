using System;
using System.Linq;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty
{
    public partial class Reviews : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                reviewsRepeater.DataSource = db.Reviews.Where(r => r.Featured == true && r.Allowed == true).ToList();
            }

            reviewsRepeater.DataBind();
        }

        protected object GetColour(int id)
        {
            return DataCalls.GetColour(id);
        }

        public string GetText(int id)
        {
            return DataCalls.GetText(id);
        }

        public string GetImage(int id)
        {
            return DataCalls.GetImage(id);
        }


        protected void SaveReview_OnClick_(object sender, EventArgs e)
        {
            var validated = ValidateInput();
            var userName = TextBoxUserName.Text;

            if (!validated) return;
            if (userName == "")
                userName = "Anonymous";
            var reviewObject = new Review
            {
                Allowed = false,
                Date = DateTime.Today,
                Featured = false,
                Rating = Convert.ToInt32(Rating.Text),
                UserName = userName,
                ReviewLeft = TextBoxReview.Text,
                New = true
            };

            using (var db = new Model1())
            {
                db.Reviews.Add(reviewObject);
                db.SaveChanges();
            }

            replyDiv.Text = "THANK YOU FOR YOUR REVIEW, WE WILL LOOK OVER IT SOON";
            ClearBoxes();
        }

        protected bool ValidateInput()
        {
            return TextBoxReview.Text != "";
        }

        protected void ClearBoxes()
        {
            TextBoxReview.Text = "";
            TextBoxUserName.Text = "";
        }
    }
}