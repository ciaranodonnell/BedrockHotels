using System;
using System.Collections.Generic;

namespace LegacyWeb.Model
{
    public partial class Stay
    {
        public int StayId { get; set; }
        public int? ReservationId { get; set; }
        public DateTime? CheckinDate { get; set; }
        public DateTime? CheckoutDate { get; set; }
        public string? Notes { get; set; }
        public string? PaymentAuthToken { get; set; }
        public int? CheckedInBy { get; set; }
        public int? CheckedOutBy { get; set; }

        public virtual Employee? CheckedInByNavigation { get; set; }
        public virtual Employee? CheckedOutByNavigation { get; set; }
        public virtual Reservation? Reservation { get; set; }
    }
}
