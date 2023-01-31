using System;
using System.Collections.Generic;

namespace WebSystem.Model;

public partial class Item
{
    public int IdItem { get; set; }

    public string CodeItem { get; set; } = null!;

    public string NameItem { get; set; } = null!;

    public string DescriptionItem { get; set; } = null!;

    public int AmountItem { get; set; }
}
