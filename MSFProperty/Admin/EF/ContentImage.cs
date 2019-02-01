namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ContentImage
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
