namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AboutUsInfo")]
    public partial class AboutUsInfo
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Title { get; set; }

        [StringLength(1850)]
        public string Chat { get; set; }

        [StringLength(1850)]
        public string Quote { get; set; }

        [StringLength(2083)]
        public string ImageUrl { get; set; }
    }
}
