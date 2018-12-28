namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Property
    {
        public int ID { get; set; }

        [StringLength(2083)]
        public string MainImage { get; set; }

        public int? Bedrooms { get; set; }

        [StringLength(100)]
        public string Amenities { get; set; }

        [StringLength(100)]
        public string BathType { get; set; }

        [Required]
        [StringLength(100)]
        public string Location { get; set; }

        [StringLength(10)]
        public string LocationX { get; set; }

        [StringLength(10)]
        public string LocationY { get; set; }

        public bool? Pets { get; set; }

        [Column(TypeName = "date")]
        public DateTime? AvailableFrom { get; set; }

        [Column(TypeName = "date")]
        public DateTime? AvaiableTo { get; set; }

        [Required]
        [StringLength(10)]
        public string RentPrice { get; set; }

        [Required]
        [StringLength(10)]
        public string Deposit { get; set; }

        [StringLength(100)]
        public string Address { get; set; }

        [StringLength(100)]
        public string Area { get; set; }

        [StringLength(1000)]
        public string Blurb { get; set; }

        public bool? Featured { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Created { get; set; }

        [StringLength(2083)]
        public string Images { get; set; }

        [StringLength(100)]
        public string PropertyName { get; set; }
    }
}
