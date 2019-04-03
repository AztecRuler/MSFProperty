namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Review
    {
        public int ID { get; set; }

        public DateTime? Date { get; set; }

        [StringLength(5000)]
        public string ReviewLeft { get; set; }

        public int? Rating { get; set; }

        public bool? Allowed { get; set; }

        public bool? Featured { get; set; }

        [StringLength(500)]
        public string UserName { get; set; }

        public bool? New { get; set; }
    }
}
