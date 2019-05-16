using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MSFProperty.Admin.EF;

namespace MSFProperty
{
    public partial class FindUs : System.Web.UI.Page
    {
        private ContactDetail _result;

        protected void Page_Load(object sender, EventArgs e)
        {
            FillRepeater();

            using (var db = new Model1())
            {
                _result = db.ContactDetails.SingleOrDefault(b => b.ID == 1);
            }

            if (_result != null)
                mapForPostcode.Attributes["src"] =
                    $"https://maps.google.com/maps?q={_result.AddressNumber} {_result.AddressLineOne} {_result.AddressLineTwo}&z=16&output=embed";
        }
        protected void FillRepeater()
        {
            using (var db = new Model1())
            {
                ContactUsRepeater.DataSource = db.ContactDetails.ToList();
                ContactUsRepeater.DataBind();

            }
        }

    }
}