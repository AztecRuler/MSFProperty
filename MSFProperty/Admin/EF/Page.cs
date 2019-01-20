using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSFProperty.Admin.EF
{
    public class Page
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Required]
        [StringLength(40)]
        public string PageName { get; set; }

        [Required]
        [StringLength(2083)]
        public string URL { get; set; }
    }
}
