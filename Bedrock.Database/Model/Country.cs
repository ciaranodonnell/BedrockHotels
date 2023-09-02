using System;
using System.Collections.Generic;

namespace Bedrock.Database.Model;

public partial class Country
{
    public int CountryId { get; set; }

    public string Name { get; set; } = null!;

    public string CountryCode { get; set; } = null!;
}
