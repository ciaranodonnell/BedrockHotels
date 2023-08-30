using System;
using System.Collections.Generic;

namespace Legacy.Desktop.Model;

public partial class Hotel
{
    public int HotelId { get; set; }

    public string Name { get; set; } = null!;

    public int AddressId { get; set; }

    public int? ManagerId { get; set; }

    public virtual Address Address { get; set; } = null!;

    public virtual Employee? Manager { get; set; }

    public virtual ICollection<Reservation> Reservations { get; set; } = new List<Reservation>();

    public virtual ICollection<Room> Rooms { get; set; } = new List<Room>();
}
