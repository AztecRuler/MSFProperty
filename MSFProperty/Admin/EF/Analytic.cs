namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Analytic
    {
        public int ID { get; set; }

        [StringLength(3000)]
        public string MeataDescription { get; set; }

        [StringLength(3000)]
        public string Keywords { get; set; }
    }
}
