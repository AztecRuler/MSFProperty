using System.ComponentModel.DataAnnotations;

namespace MSFProperty.Admin.EF
{
    public class PageImage
    {
        public int ID { get; set; }

        [StringLength(10)]
        public string ImageID { get; set; }

        [StringLength(200)]
        public string ImageName { get; set; }

        [StringLength(2083)]
        public string ImageUrl { get; set; }

        [StringLength(100)]
        public string PageName { get; set; }

        public int? PageId { get; set; }
    }
}
