using System;
using System.Collections.Generic;

namespace LegacyWeb.Model
{
    public partial class Room
    {
        public int RoomId { get; set; }
        public int? HotelId { get; set; }
        public int? RoomTypeId { get; set; }
        public string? RoomName { get; set; }
        public decimal? PriceLoading { get; set; }

        public virtual Hotel? Hotel { get; set; }
        public virtual RoomType? RoomType { get; set; }
    }
}
