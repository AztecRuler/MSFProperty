using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MSFProperty.Admin.EF;

namespace MSFProperty.Admin
{
    public partial class EditContactDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            SetBoxes();
        }

        private void SetBoxes()
        {
            using (var db = new Model1())
            {
                var result = db.ContactDetails.SingleOrDefault(b => b.ID == 1);
                if (result == null) return;
                AddressNumber.Text = result.AddressNumber.ToString().Trim();
                AddressLineOne.Text = result.AddressLineOne.Trim();
                AddressLineTwo.Text = result.AddressLineTwo.Trim();
                PostCode.Text = result.PostCode.Trim();
                TelephoneNumberLandLine.Text = result.TelephoneNumberLandLine.Trim();
                TelephoneMobile.Text = result.TelephoneMobile.Trim();
                RegNumber.Text = result.RegNumber.Trim();
                EmailAddress.Text = result.EmailAdress.Trim();
                city.Text = result.city.Trim();
            }
        }


        private void ClearBoxes()
        {
            using (var db = new Model1())
            {
                var empty = "";
                AddressNumber.Text = empty;
                AddressLineOne.Text = empty;
                AddressLineTwo.Text = empty;
                PostCode.Text = empty;
                TelephoneNumberLandLine.Text = empty;
                TelephoneMobile.Text = empty;
                RegNumber.Text = empty;
                EmailAddress.Text = empty;
                city.Text = empty;
            }
        }
        // ReSharper disable once MethodTooLong
        protected void SaveContactDetails_OnClick(object sender, EventArgs e)
        {
            using (var db = new Model1())
            {
                var result = db.ContactDetails.SingleOrDefault(b => b.ID == 1);
                int.TryParse(AddressNumber.Text, out var num);

                if (result != null)
                {
                    result.AddressNumber = num;
                    result.AddressLineOne = AddressLineOne.Text.Trim();
                    result.AddressLineTwo = AddressLineTwo.Text.Trim();
                    result.PostCode = PostCode.Text.Trim();
                    result.TelephoneNumberLandLine = TelephoneNumberLandLine.Text.Trim();
                    result.TelephoneMobile = TelephoneMobile.Text.Trim();
                    result.RegNumber = RegNumber.Text.Trim();
                    result.EmailAdress = EmailAddress.Text.Trim();
                    result.city = city.Text.Trim();
                }
                if(Validation())
                db.SaveChanges();
            }

        //ClearBoxes();
        ErrorReporter.Text = "Details Changed";
        }

        private bool Validation()
        {
            //if(result.AddressNumber.len
            //result.AddressLineOne 
            //result.AddressLineTwo 
            //result.PostCode 
            //result.TelephoneNumberLandLine 
            //result.TelephoneMobile 
            //result.RegNumber
            //result.EmailAdress 
            //result.city
            return true;
        }
    }
}