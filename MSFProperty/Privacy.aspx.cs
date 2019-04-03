using System;
using System.Web.UI;

namespace MSFProperty
{
    public partial class Privacy : Page
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
        protected object GetColour(int id)
        {
            return DataCalls.GetColour(id);
        }
    }
}