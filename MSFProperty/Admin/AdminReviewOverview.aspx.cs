using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty.Admin
{
    public partial class AdminReviewOverview : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateRepeaters();
        }

        private void PopulateRepeaters()
        {
            AllReviewsRepeater.DataSource = GetAllReviewsDataList();
            removeNewReviews();
            AllReviewsRepeater.DataBind();
        }

        private void removeNewReviews()
        {
            var newReviewsList = new List<Review>();
            using (var db = new Model1())
            {
                newReviewsList.AddRange(db.Reviews.Where(review => review.New == true));
                foreach (var review in newReviewsList)
                {
                    if (review.New != null && (bool) review.New)
                    {
                        review.New = false;
                    }
                }
                db.SaveChanges();
            }
        }
        private static object GetAllReviewsDataList()
        {
            var allReviewsList = new List<Review>();
            using (var db = new Model1())
            {
                allReviewsList.AddRange(db.Reviews);
            }

            return allReviewsList;
        }


        protected void DeleteReview_OnClick(object sender, EventArgs e)
        {
            var data = reviewNumber.Value;
            int.TryParse(data, out var id);
            using (var db = new Model1())
            {
                var result = db.Reviews.SingleOrDefault(b => b.ID == id);
                if (result == null) return;
                db.Reviews.Remove(result);
                db.SaveChanges();
                PopulateRepeaters();
            }
        }

        protected void IsFeatured_OnCheckedChanged(object sender, EventArgs e)
        {
            var data = reviewNumber.Value;
            int.TryParse(data, out var id);
            using (var db = new Model1())
            {
                var result = db.Reviews.SingleOrDefault(b => b.ID == id);
                if (result == null) return;
                result.Featured = isFeatured.Checked;

                db.SaveChanges();

            }
        }

        protected void IsAllowed_OnCheckedChanged(object sender, EventArgs e)
        {
            var data = reviewNumber.Value;
            int.TryParse(data, out var id);
            using (var db = new Model1())
            {
                var result = db.Reviews.SingleOrDefault(b => b.ID == id);
                if (result == null) return;
                result.Allowed = IsAllowed.Checked;
                db.SaveChanges();

            }
        }

        [WebMethod]
        public static string CheckFeatured(string data)
        {
            int.TryParse(data, out var id);
            using (var db = new Model1())
            {
                var result = db.Reviews.SingleOrDefault(b => b.ID == id);
                if (result != null) return result.Featured.ToString();
            }

            return "false";
        }
    }
}