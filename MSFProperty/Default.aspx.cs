using MSFProperty.Admin.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSFProperty
{
    public partial class Default : System.Web.UI.Page
    {
        List<string> editableTextContents = new List<string>();
        private List<int> pagerNumbersList = new List<int>(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateTextContents();
            SetNumberOfProperty();
        }

        protected void SetPagination(int pageNumber = 0)
        {
            
            string selectedNumber = PagerPropHome.SelectedValue;
            int.TryParse(selectedNumber, out int number);

            //int numBoxes = Math.DivRem(numItems, capacity, out remainder);
            var rowCount = 0;
            var rowCounteraction = 1; 
            //get all properties count 
            using (var db = new Model1())
            {
                rowCount = db.Properties.Count(p => p.Featured == true);
          
            }
            //loop through them and find how many sets using the number to display 
            for (int i = 0; i < rowCount; i++)
            {
                //for each set add 1 to the pager numbers;
                
                if (i % number == 0)
                {
                    pagerNumbersList.Add(rowCounteraction);
                    rowCounteraction++;
                }
            }
            //add this list as data for reapeater 

            pagerRepeater.DataSource = pagerNumbersList;

            pagerRepeater.DataBind();
        }
        protected void SetNumberOfProperty(string indexIn = "0")
        {
            string selectedNumber = PagerPropHome.SelectedValue;
            int.TryParse(selectedNumber, out int number);
            string indexNumber = indexIn;
            int.TryParse(indexNumber, out int index);

            index = index * number; 
            using (var db = new Model1())
            {
                PropertyRepeaterHome.DataSource = db.Properties.Where(p => p.Featured == true).ToList().Skip(index - number).Take(number);
                 PropertyRepeaterHome.DataBind();
                    
            }
            SetPagination(index);

        }

        public string getContents(int id)
        {
            return DataCalls.GetContents(id);
        }

        private void PopulateTextContents()
        {
            List<string> pageList = new List<string>();
            using (var db = new Model1())
            {
                foreach (var item in db.TextContents)
                {
                    editableTextContents.Add(item.ElementText);

                }
            }
        }
        public void RefreshCount(object sender, EventArgs e)
        {
            SetNumberOfProperty();
        }
        public string GetText(int id)
        {
            return DataCalls.GetText(id); ;
        }

        public string GetImage(int id)
        {
            return DataCalls.GetImage(id);

        }
    }
}