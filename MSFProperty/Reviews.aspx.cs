using System;
using System.Linq;
using System.Web.UI.WebControls;
using MSFProperty.Admin.EF;

namespace MSFProperty
{
    public partial class Reviews : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                reviewsRepeater.DataSource = db.Reviews.Where(r => r.Featured == true && r.Allowed == true).ToList();
            }

            reviewsRepeater.DataBind();
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
            bool validated = ValidateInput();
            string userName = TextBoxUserName.Text;

            if (!validated) return;
            if (userName == "")
                userName = "Anonymous";
            Review reviewObject = new Review
            {
                Allowed = false,
                Date = DateTime.Today,
                Featured = false,
                Rating = Rating.Text,
                UserName = userName,
                ReviewLeft = TextBoxReview.Text
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