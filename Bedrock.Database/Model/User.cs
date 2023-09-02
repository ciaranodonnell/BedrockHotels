using System;
using System.Collections.Generic;

namespace Bedrock.Database.Model;

public partial class User
{
    public int UserId { get; set; }

    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string Name { get; set; } = null!;

    public DateTime? DeletedDate { get; set; }

    public bool? IsAdmin { get; set; }

    public int? EmployeeId { get; set; }
}
