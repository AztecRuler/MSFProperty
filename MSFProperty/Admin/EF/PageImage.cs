namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PageImage
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
