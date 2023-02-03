using System;
using System.Collections.Generic;

namespace ADataAccess.Models;

public partial class Item
{
    public int IdItem { get; set; }

    public int? IdCategory { get; set; }

    public string CodeItem { get; set; } = null!;

    public string NameItem { get; set; } = null!;

    public int QuantityItem { get; set; }

    public virtual Category? IdCategoryNavigation { get; set; }
}
