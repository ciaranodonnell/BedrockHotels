using System;
using System.Collections.Generic;

namespace Bedrock.Database.Model;

public partial class Address
{
    public int AddressId { get; set; }

    public string Address1 { get; set; } = null!;

    public string? Address2 { get; set; }

    public string? Address3 { get; set; }

    public string? Town { get; set; }

    public int? CountryId { get; set; }

    public string? PostalCode { get; set; }

    public string? PhoneNumber { get; set; }

    public string? PhoneNumber2 { get; set; }

    public string? FaxNumber { get; set; }

    public string? EmailAddress { get; set; }

    public string? EmailAddress2 { get; set; }

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();

    public virtual ICollection<Hotel> Hotels { get; set; } = new List<Hotel>();

    public virtual ICollection<Reservation> Reservations { get; set; } = new List<Reservation>();
}
