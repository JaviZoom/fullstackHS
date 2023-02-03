 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ItemDTO
    {
        public int IdItem { get; set; }
        public int? IdCategory { get; set; }
        public string? CategoryDescription { get; set; }
        public string CodeItem { get; set; } = null!;
        public string NameItem { get; set; } = null!;
        public int QuantityItem { get; set; }
    }
}
