using System;
using System.Collections.Generic;

namespace LegacyWeb.Model
{
    public partial class Address
    {
        public Address()
        {
            Employees = new HashSet<Employee>();
            Hotels = new HashSet<Hotel>();
            Reservations = new HashSet<Reservation>();
        }

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

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<Hotel> Hotels { get; set; }
        public virtual ICollection<Reservation> Reservations { get; set; }
    }
}
