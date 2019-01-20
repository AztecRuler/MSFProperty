using System.ComponentModel.DataAnnotations;

namespace MSFProperty.Admin.EF
{
    public class ContentImage
    {
        public int ID { get; set; }

        [StringLength(2083)]
        public string ImageUrl { get; set; }

        [StringLength(100)]
        public string OnPage { get; set; }

        [StringLength(100)]
        public string ImageUse { get; set; }

        [StringLength(200)]
        public string ImageName { get; set; }
    }
}
