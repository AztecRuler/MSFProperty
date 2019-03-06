namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ContactDetail
    {
        public int ID { get; set; }

        public int? AddressNumber { get; set; }

        [StringLength(50)]
        public string AddressLineOne { get; set; }

        [StringLength(50)]
        public string AddressLineTwo { get; set; }

        [StringLength(20)]
        public string PostCode { get; set; }

        [StringLength(25)]
        public string TelephoneNumberLandLine { get; set; }

        [StringLength(25)]
        public string TelephoneMobile { get; set; }

        [StringLength(40)]
        public string RegNumber { get; set; }

        [StringLength(40)]
        public string EmailAdress { get; set; }

        [StringLength(40)]
        public string city { get; set; }
    }
}
