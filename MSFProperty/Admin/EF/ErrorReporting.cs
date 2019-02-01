namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ErrorReporting")]
    public partial class ErrorReporting
    {
        public int ID { get; set; }

        [StringLength(500)]
        public string Error { get; set; }

        [StringLength(500)]
        public string File { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }


    }
}
