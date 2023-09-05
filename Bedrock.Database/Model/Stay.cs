using System;
using System.Collections.Generic;

namespace Bedrock.Database.Model;

public partial class Stay
{
    public int StayId { get; set; }

    public int ReservationId { get; set; }

    public DateTime CheckinDate { get; set; }

    public DateTime? CheckoutDate { get; set; }

    public string? Notes { get; set; }

    public string? PaymentAuthToken { get; set; }

    public int CheckedInBy { get; set; }

    public int CheckedOutBy { get; set; }

    public int RoomId { get; set; }

    public virtual Employee CheckedInByNavigation { get; set; } = null!;

    public virtual Employee CheckedOutByNavigation { get; set; } = null!;

    public virtual Reservation Reservation { get; set; } = null!;

    public virtual Room Room { get; set; } = null!;
}
