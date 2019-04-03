namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Page
    {
        public int ID { get; set; }

        [Required]
        [StringLength(40)]
        public string PageName { get; set; }

        [Required]
        [StringLength(2083)]
        public string URL { get; set; }
    }
}
