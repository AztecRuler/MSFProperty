using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty.UserControls
{
    public partial class StarRatingDisplay : System.Web.UI.UserControl
    {
        public int Rating { get; set; }
        public bool IsHoverable { get; set; }
        private int starCountMax = 5; 
        public bool IsNew { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            FillRepeater();
        }

        private void FillRepeater()
        {
            var stars = new List<Star>();
           
            for (var i = 0; i < starCountMax; i++)
            {
                CreateStar(stars,i);
            }

            starRating.DataSource = stars.ToList();
            starRating.DataBind();
        }

        private void CreateStar(List<Star> stars, int i)
        {
            stars.Add(new Star()
            {
                Id = i,
                StarRating = Rating,
                IsStarHoverable = IsHoverable,
                StarClass = GetStarClass(Rating, i)
            });
        }

        public  string GetNewClass()
        {
            return IsNew ? "starSpinner" : "starSpinner hidden";
        }

        private static string GetStarClass(int rating, int i)
        {
            return rating > i ? "dashicons-star-filled" : "dashicons-star-empty";
        }



    }


    public class Star
    {
        public int Id { get; set; }
        public int StarRating { get; set; }
        public bool IsStarHoverable { get; set; }
        public string StarClass { get; set; }
    }
}