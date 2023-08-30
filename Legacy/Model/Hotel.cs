using System;
using System.Collections.Generic;

namespace LegacyWeb.Model
{
    public partial class Hotel
    {
        public Hotel()
        {
            Reservations = new HashSet<Reservation>();
            Rooms = new HashSet<Room>();
        }

        public int HotelId { get; set; }
        public string Name { get; set; } = null!;
        public int AddressId { get; set; }
        public int? ManagerId { get; set; }

        public virtual Address Address { get; set; } = null!;
        public virtual Employee? Manager { get; set; }
        public virtual ICollection<Reservation> Reservations { get; set; }
        public virtual ICollection<Room> Rooms { get; set; }
    }
}
