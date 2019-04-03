using System;
using System.Collections.Generic;
using System.Linq;
using MSFProperty.Admin.EF;

namespace MSFProperty
{
    public partial class SearchResults : System.Web.UI.Page
    {
        private List<string> _paramKeys = new List<string>();
        private bool _petsAllowed;
        private bool _smoking;
        private List<int> _idsToShow = new List<int>();
        private List<int> _blogIdsToShow;
        private List<int> _pageIdsToShow;

        protected void Page_Load(object sender, EventArgs e)
        {
            _paramKeys = GetListOfSearchTerms();

            _idsToShow = GetPropertyIdsFromKeywords(_paramKeys);
            PropertySearchRepeater.DataSource = FillPropertySearchRepeater(_idsToShow);
            PropertySearchRepeater.DataBind();

            _blogIdsToShow = GetBlogIdsFromKeywords(_paramKeys);
            BlogSearchRepeater.DataSource = FillBlogSearchRepeater(_blogIdsToShow);
            BlogSearchRepeater.DataBind();


            _pageIdsToShow = GetPageIdsFromKeywords(_paramKeys);
            PageSearchRepeater.DataSource = FillPageSearchRepeater(_pageIdsToShow);
            PageSearchRepeater.DataBind();
            
        }

        protected object GetColour(int id)
        {
            return DataCalls.GetColour(id);
        }
        private List<Page> FillPageSearchRepeater(ICollection<int> pageIdsToShow)
        {
            List<Page> searchList;

            using (var db = new Model1())
            {
                searchList = db.Pages.Where(t => pageIdsToShow.Contains(t.ID)).ToList();
            }

            return searchList;
        }

        private List<Property> FillPropertySearchRepeater(ICollection<int> idsToShow)
        {
            List<Property> searchList;

            using (var db = new Model1())
            {
                searchList = db.Properties.Where(t => idsToShow.Contains(t.ID)).ToList();
            }

            return searchList;
        }

        private List<Blog> FillBlogSearchRepeater(ICollection<int> idsToShow)
        {
            List<Blog> searchList;

            using (var db = new Model1())
            {
                searchList = db.Blogs.Where(t => idsToShow.Contains(t.ID)).ToList();
            }

            return searchList;
        }
        // ReSharper disable once MethodTooLong
        private List<string> GetListOfSearchTerms()
        {
            var results = new List<string>();
            if (Request.QueryString.AllKeys.Length <= 0)
                return results;

            foreach (var key in Request.QueryString.AllKeys)
                switch (key)
                {
                    case "Pets":
                        _petsAllowed = Convert.ToBoolean(Request.QueryString[key]);
                        break;
                    case "Smoking":
                        _smoking = Convert.ToBoolean(Request.QueryString[key]);
                        break;
                    default:
                    {
                        // ReSharper disable once TooManyChainedReferences
                        var fullString = Request.QueryString[key].Split();
                        results.AddRange(fullString);
                        break;
                    }
                }

            return results;
        }


        // ReSharper disable once TooManyDeclarations
        private List<int> GetPageIdsFromKeywords(List<string> searchStringList)
        {
            var idList = new List<int>();
            foreach (var searchString in searchStringList)
            {
                List<Page> dbList = null;
                using (var db = new Model1())
                {
                    // ReSharper disable once ComplexConditionExpression
                    dbList = db.Pages.Where(p => p.PageName.Contains(searchString) || p.URL.Contains(searchString)).ToList();
                }


                foreach (var property in dbList) idList.Add(property.ID);
            }


            return idList.Distinct().ToList();
        }

        // ReSharper disable once TooManyDeclarations
        protected List<int> GetPropertyIdsFromKeywords(List<string> searchStringList)
        {
            var idList = new List<int>();
            foreach (var searchString in searchStringList)
            {
                List<Property> dbList = null;
                using (var db = new Model1())
                {
                    // ReSharper disable once ComplexConditionExpression
                    dbList = db.Properties.Where(p =>
                        p.Amenities.Contains(searchString) || p.Amenities.Contains(searchString)
                                                           || p.BathType.Contains(searchString)
                                                           || p.Location.Contains(searchString)
                                                           || p.Area.Contains(searchString)
                                                           || p.Blurb.Contains(searchString)
                                                           || p.PropertyName.Contains(searchString)
                                                           || p.Street.Contains(searchString)
                                                           || p.Street2.Contains(searchString)
                                                           || p.County.Contains(searchString)
                                                           || p.PostCode.Contains(searchString)).ToList();
                }


                foreach (var property in dbList)
                    // ReSharper disable once ComplexConditionExpression
                    if (_petsAllowed == property.Pets && property.Smoking == _smoking)
                        idList.Add(property.ID);
            }


            return idList.Distinct().ToList();
        }

        // ReSharper disable once TooManyDeclarations
        protected List<int> GetBlogIdsFromKeywords(List<string> searchStringList)
        {
            var idList = new List<int>();
            foreach (var searchString in searchStringList)
            {
                List<Blog> dbList = null;
                using (var db = new Model1())
                {
                    // ReSharper disable once ComplexConditionExpression
                    dbList = db.Blogs.Where(p => p.Contents.Contains(searchString) || p.Name.Contains(searchString)
                                                                                   || p.Title.Contains(searchString)).ToList();
                }


                foreach (var property in dbList) idList.Add(property.ID);
            }


            return idList.Distinct().ToList();
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
    }
}