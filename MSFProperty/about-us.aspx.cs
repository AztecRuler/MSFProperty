using System;
using MSFProperty.Admin.EF;

namespace MSFProperty
{
    public partial class about_us : System.Web.UI.Page
    {
        public string TitleText { get; set; }
        public string Quote { get; set; }
        public string Chat { get; set; }
        public string ImageUrl { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetText(int id)
        {
           return  DataCalls.GetText(id);
        }

        public string GetImage(int id)
        {
         
            return DataCalls.GetImage(id);
        }

        public void GetAboutUsInfo(int id)
        {
            var abInfo = DataCalls.GetAboutUsInfo(id);
            TitleText = abInfo.title;
            Chat = abInfo.chat;
            Quote = abInfo.quote;
            ImageUrl = abInfo.image;

        }

    }
}