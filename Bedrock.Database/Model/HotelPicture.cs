using System;
using System.Collections.Generic;

namespace Bedrock.Database.Model;

public partial class HotelPicture
{
    public int HotelPictureId { get; set; }

    public string Description { get; set; } = null!;

    public string Url { get; set; } = null!;

    public bool? IsDeleted { get; set; }

    public int? Order { get; set; }

    public int HotelId { get; set; }

    public virtual Hotel Hotel { get; set; } = null!;
}
