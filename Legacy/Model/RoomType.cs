using System;
using System.Collections.Generic;

namespace LegacyWeb.Model
{
    public partial class RoomType
    {
        public RoomType()
        {
            Reservations = new HashSet<Reservation>();
            Rooms = new HashSet<Room>();
        }

        public int RoomTypeId { get; set; }
        public string ShortCode { get; set; } = null!;
        public string? Name { get; set; }
        public byte[] Description { get; set; } = null!;
        public int MaxOccupancy { get; set; }
        public int NumBeds { get; set; }
        public bool IsDeleted { get; set; }

        public virtual ICollection<Reservation> Reservations { get; set; }
        public virtual ICollection<Room> Rooms { get; set; }
    }
}
