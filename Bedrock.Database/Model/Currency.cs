using System;
using System.Collections.Generic;

namespace Bedrock.Database.Model;

public partial class Currency
{
    public int CurrencyId { get; set; }

    public string Name { get; set; } = null!;

    public string Symbol { get; set; } = null!;

    public string Code { get; set; } = null!;

    public virtual ICollection<Hotel> Hotels { get; set; } = new List<Hotel>();
}
