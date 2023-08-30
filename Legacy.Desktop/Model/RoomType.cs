using System;
using System.Collections.Generic;

namespace Legacy.Desktop.Model;

public partial class RoomType
{
    public int RoomTypeId { get; set; }

    public string ShortCode { get; set; } = null!;

    public string? Name { get; set; }

    public byte[] Description { get; set; } = null!;

    public int MaxOccupancy { get; set; }

    public int NumBeds { get; set; }

    public bool IsDeleted { get; set; }

    public virtual ICollection<Reservation> Reservations { get; set; } = new List<Reservation>();

    public virtual ICollection<Room> Rooms { get; set; } = new List<Room>();
}
