using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSFProperty.Admin.EF
{
    [Table("Blog")]
    public class Blog
    {
        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }

        [StringLength(100)]
        public string Title { get; set; }

        [Column(TypeName = "text")]
        public string Contents { get; set; }

        [StringLength(2083)]
        public string ImageUrl { get; set; }

        public bool? Popular { get; set; }
    }
}
