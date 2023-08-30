using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Legacy.Desktop.Model;

public partial class User
{
    [Key]
    public int UserId { get; set; }

    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string Name { get; set; } = null!;

    public DateTime? DeletedDate { get; set; }
}
