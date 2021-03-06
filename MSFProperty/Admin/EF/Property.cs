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

        [StringLength(100)]
        public string Location { get; set; }

        public double? LocationX { get; set; }

        public double? LocationY { get; set; }

        public bool? Pets { get; set; }

        [StringLength(50)]
        public string AvailableFrom { get; set; }

        [StringLength(50)]
        public string AvaiableTo { get; set; }

        public decimal RentPrice { get; set; }

        public decimal Deposit { get; set; }

        [StringLength(10)]
        public string AddressNumber { get; set; }

        [StringLength(100)]
        public string Area { get; set; }

        [StringLength(3000)]
        public string Blurb { get; set; }

        public bool? Featured { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Created { get; set; }

        [StringLength(2083)]
        public string Images { get; set; }

        [StringLength(100)]
        public string PropertyName { get; set; }

        [StringLength(100)]
        public string Street { get; set; }

        [StringLength(100)]
        public string Street2 { get; set; }

        [StringLength(100)]
        public string County { get; set; }

        [StringLength(100)]
        public string Country { get; set; }

        [StringLength(10)]
        public string PostCode { get; set; }

        public bool? Smoking { get; set; }
    }
}
