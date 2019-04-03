using System;
using System.Collections.Generic;
using MSFProperty.Admin.EF;
namespace MSFProperty
{
    public partial class services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string GetText(int id)
        {
            return DataCalls.GetText(id);
        }

        public string GetImage(int id)
        {
            return DataCalls.GetImage(id);
        }

        public string GetContentImages(int id)
        {
            return DataCalls.GetContentImage(id);
        }
        protected object GetColour(int id)
        {
            return DataCalls.GetColour(id);
        }
        protected object GetMobileNumber()
        {
            return DataCalls.GetMobileNumber();
        }
        
    }
}