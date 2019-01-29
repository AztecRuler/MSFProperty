using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSFProperty.Admin.EF
{
    public class TextContent
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string PageName { get; set; }

        public int? PageId { get; set; }

        [Column(TypeName = "text")]
        public string ElementText { get; set; }

        [StringLength(10)]
        public string ElementNumber { get; set; }

        [StringLength(100)]
        public string ElementType { get; set; }

        [StringLength(2048)]
        public string ElementLink { get; set; }
    }
}
