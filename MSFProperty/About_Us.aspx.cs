using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty
{

    public partial class About_Us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           Repeater1.DataSource = GetAboutUsInfo();

            Repeater1.DataBind();
        }

        public string GetText(int id)
        {
            return DataCalls.GetText(id);
        }

        public string GetImage(int id)
        {

            return DataCalls.GetImage(id);
        }

        public object GetAboutUsInfo()
        {
            List<AboutUsInfoObject> result;
            using (var db = new Model1())
            {
               result  = db.AboutUsInfoes
                       .Select(c => new AboutUsInfoObject { TitleText = c.Title, Chat = c.Chat, ImageUrl = c.ImageUrl, Quote = c.Quote  })
                      .ToList();
              

            }

            return result;

        }


    }
}