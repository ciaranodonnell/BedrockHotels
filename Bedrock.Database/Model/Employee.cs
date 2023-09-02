using System;
using System.Collections.Generic;

namespace Bedrock.Database.Model;

public partial class Employee
{
    public int EmployeeId { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public int? AddressId { get; set; }

    public DateTime? DateOfBirth { get; set; }

    public byte[]? EmailAddress { get; set; }

    public DateTime? HiredDate { get; set; }

    public DateTime? LeaveDate { get; set; }

    public virtual Address? Address { get; set; }

    public virtual ICollection<Hotel> Hotels { get; set; } = new List<Hotel>();

    public virtual ICollection<Stay> StayCheckedInByNavigations { get; set; } = new List<Stay>();

    public virtual ICollection<Stay> StayCheckedOutByNavigations { get; set; } = new List<Stay>();
}
