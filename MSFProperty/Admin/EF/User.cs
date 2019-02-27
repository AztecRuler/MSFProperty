namespace MSFProperty.Admin.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        public int UserId { get; set; }

        [Required]
        [StringLength(50)]
        public string Username { get; set; }

        [Required]
        [StringLength(50)]
        public string Password { get; set; }

        [Required]
        [StringLength(320)]
        public string Email { get; set; }

        public bool? Locked { get; set; }

        public DateTime? LockedTime { get; set; }

        public int? LogAttempts { get; set; }

        [StringLength(50)]
        public string UIDRESET { get; set; }

        public DateTime? UIDRESETTIME { get; set; }
    }
}
