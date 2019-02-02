using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using MSFProperty.Admin.EF;
using Page = System.Web.UI.Page;

namespace MSFProperty
{
    public partial class AcommodationsPage : Page
    {
        private readonly List<int> _pagerNumbersList = new List<int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetNumberOfProperty();
                SetPagination();
                ResetPaginaton();
            }

            TestForPostBackEvent();
        }

        private void GetAllPropertiesCount()
        {
            var selectedNumber = PagerProp.SelectedValue;
            int.TryParse(selectedNumber, out var number);
            var rowCounteraction = 1;
            int rowCount;
            _pagerNumbersList.Clear();
            //get all properties count 
            using (var db = new Model1())
            {
                rowCount = db.Properties.Count(p => p.Featured == true);
            }

            //loop through them and find how many sets using the number to display 
            for (var i = 0; i < rowCount; i++)
                //for each set add 1 to the pager numbers;
                if (i % number == 0)
                {
                    _pagerNumbersList.Add(rowCounteraction);
                    rowCounteraction++;
                }
        }


        public void ChangePage(string parameter)
        {
            int.TryParse(pagerNumber.Value, out var paginationSelectedNumber);

            switch (parameter)
            {
                case "pagerBack":
                    paginationSelectedNumber--;
                    break;
                case "pagerForwards":
                    paginationSelectedNumber++;
                    break;
                default:
                    int.TryParse(parameter, out var number);
                    paginationSelectedNumber = number;
                    break;
            }

            GetAllPropertiesCount();
            if (paginationSelectedNumber < 1) paginationSelectedNumber = 1;

            if (paginationSelectedNumber >= _pagerNumbersList.Count)
            {
                paginationSelectedNumber = _pagerNumbersList.Count;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "HideForwardsPagination",
                    paginationSelectedNumber == _pagerNumbersList.Count
                        ? "HideForwardsPagination(true); setActivePagination(" + paginationSelectedNumber + ");"
                        : "HideForwardsPagination(false); setActivePagination(" + paginationSelectedNumber + ");",
                    true);
            }

            pagerNumber.Value = paginationSelectedNumber.ToString();
            SetPagination(paginationSelectedNumber);
        }


        private void TestForPostBackEvent()
        {
            ClientScript.GetPostBackEventReference(this, string.Empty);
            var parameter = Request["__EVENTARGUMENT"];
            if (Request.Form["__EVENTTARGET"] == "pagination") ChangePage(parameter);
        }


        private void ResetPaginaton()
        {
            pagerNumber.Value = "1";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "SetPagination",
                "HideBackPagination(true); setActivePagination(1);", true);
        }


        protected void SetPagination(int pageNumber = 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "HideBackPagination",
                pagerNumber.Value == "1"
                    ? "HideBackPagination(true); setActivePagination(" + pageNumber + ");"
                    : "HideBackPagination(false); setActivePagination(" + pageNumber + ");", true);
            GetAllPropertiesCount();

            //add this list as data for repeater 
            pagerRepeater.DataSource = _pagerNumbersList;

            pagerRepeater.DataBind();
            SetNumberOfProperty(pageNumber);
        }


        protected void SetNumberOfProperty(int indexIn = 0)
        {
            string selectedNumber = PagerProp.SelectedValue;
            int.TryParse(selectedNumber, out var number);

            using (var db = new Model1())
            {
                PropertyRepeater.DataSource = db.Properties.ToList().Take(number);

                PropertyRepeater.DataBind();
            }
        }

        public string GetContents(int id)
        {
            return DataCalls.GetContents(id);
        }

        public string GetText(int id)
        {
            return DataCalls.GetText(id);
        }

        public string GetImage(int id)
        {
            return DataCalls.GetImage(id);
        }

        public void RefreshCount(object sender, EventArgs e)
        {
            SetNumberOfProperty();
        }
    }
}