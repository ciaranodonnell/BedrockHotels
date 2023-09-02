﻿using System;
using System.Collections.Generic;

namespace Bedrock.Database.Model;

public partial class Reservation
{
    public int ReservationId { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public int? PropertyId { get; set; }

    public int? RoomType { get; set; }

    public string? Requests { get; set; }

    public string? CustomerName { get; set; }

    public int? CustomerAddress { get; set; }

    public virtual Address? CustomerAddressNavigation { get; set; }

    public virtual Hotel? Property { get; set; }

    public virtual RoomType? RoomTypeNavigation { get; set; }

    public virtual ICollection<Stay> Stays { get; set; } = new List<Stay>();
}
