using System;
using System.Collections.Generic;

namespace ADataAccess.Models;

public partial class Category
{
    public int IdCategory { get; set; }

    public string NameCategory { get; set; } = null!;

    public virtual ICollection<Item> Items { get; } = new List<Item>();
}
