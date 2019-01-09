using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace MSFProperty
{
    public class DataCalls
    {
        public static string GetText(int id)
        {
            string text = "";

            using (var db = new Model1())
            {
                foreach (var item in db.TextContents)
                {
                    if (item.ID == id)
                        text = item.ElementText;

                }
            }
            return text;
        }

        public static string GetImage(int id)
        {
            string text = "";

            using (var db = new Model1())
            {
                foreach (var item in db.PageImages)
                {
                    if (item.ID == id)
                        text = item.ImageUrl;

                }
            }
            return text;
        }

        public static string GetContents(int id)
        {
            using (var db = new Model1())
            {
                foreach (var item in db.Properties)
                {
                    if (item.ID == id)
                        return Regex.Replace(item.Blurb, "<.*?>", string.Empty);

                }
            }

            return "";
        }

    }


}