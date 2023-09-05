using Microsoft.EntityFrameworkCore;

namespace Bedrock.Database.Model;

public partial class LegacyDb : DbContext
{

    public virtual DbSet<Address> Addresses { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<Currency> Currencies { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Hotel> Hotels { get; set; }

    public virtual DbSet<HotelPicture> HotelPictures { get; set; }

    public virtual DbSet<Reservation> Reservations { get; set; }

    public virtual DbSet<Room> Rooms { get; set; }

    public virtual DbSet<RoomType> RoomTypes { get; set; }

    public virtual DbSet<Stay> Stays { get; set; }

    public virtual DbSet<User> Users { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Address>(entity =>
        {
            entity.ToTable("Address");

            entity.Property(e => e.Address1)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Address2)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Address3)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.EmailAddress)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.EmailAddress2)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.FaxNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PhoneNumber2)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.PostalCode)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Town)
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.HasOne(d => d.Country).WithMany(p => p.Addresses)
                .HasForeignKey(d => d.CountryId)
                .HasConstraintName("FK_Address_Country");
        });

        modelBuilder.Entity<Country>(entity =>
        {
            entity.ToTable("Country");

            entity.Property(e => e.CountryCode)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Currency>(entity =>
        {
            entity.ToTable("Currency");

            entity.Property(e => e.Code)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Symbol)
                .HasMaxLength(10)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.ToTable("Employee");

            entity.Property(e => e.DateOfBirth).HasColumnType("date");
            entity.Property(e => e.EmailAddress)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.HiredDate).HasColumnType("date");
            entity.Property(e => e.JobTitle)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.LeaveDate).HasColumnType("date");

            entity.HasOne(d => d.Address).WithMany(p => p.Employees)
                .HasForeignKey(d => d.AddressId)
                .HasConstraintName("FK_Employee_Address");
        });

        modelBuilder.Entity<Hotel>(entity =>
        {
            entity.ToTable("Hotel");

            entity.Property(e => e.CloseDate).HasColumnType("date");
            entity.Property(e => e.MainPictureUrl)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Name).HasMaxLength(255);

            entity.HasOne(d => d.Address).WithMany(p => p.Hotels)
                .HasForeignKey(d => d.AddressId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Hotel_Address");

            entity.HasOne(d => d.Currency).WithMany(p => p.Hotels)
                .HasForeignKey(d => d.CurrencyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Hotel_Currency");

            entity.HasOne(d => d.Manager).WithMany(p => p.Hotels)
                .HasForeignKey(d => d.ManagerId)
                .HasConstraintName("FK_Hotel_Employee");
        });

        modelBuilder.Entity<HotelPicture>(entity =>
        {
            entity.ToTable("HotelPicture");

            entity.Property(e => e.Description)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Url)
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.HasOne(d => d.Hotel).WithMany(p => p.HotelPictures)
                .HasForeignKey(d => d.HotelId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_HotelPicture_Hotel");
        });

        modelBuilder.Entity<Reservation>(entity =>
        {
            entity.ToTable("Reservation");

            entity.Property(e => e.CustomerName)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.EndDate).HasColumnType("date");
            entity.Property(e => e.Requests).HasMaxLength(500);
            entity.Property(e => e.StartDate).HasColumnType("date");

            entity.HasOne(d => d.CustomerAddressNavigation).WithMany(p => p.Reservations)
                .HasForeignKey(d => d.CustomerAddress)
                .HasConstraintName("FK_Reservation_Address");

            entity.HasOne(d => d.Property).WithMany(p => p.Reservations)
                .HasForeignKey(d => d.PropertyId)
                .HasConstraintName("FK_Reservation_Hotel");

            entity.HasOne(d => d.RoomTypeNavigation).WithMany(p => p.Reservations)
                .HasForeignKey(d => d.RoomType)
                .HasConstraintName("FK_Reservation_RoomType");
        });

        modelBuilder.Entity<Room>(entity =>
        {
            entity.ToTable("Room");

            entity.Property(e => e.PriceLoading).HasColumnType("money");
            entity.Property(e => e.RoomName)
                .HasMaxLength(10)
                .IsFixedLength();

            entity.HasOne(d => d.Hotel).WithMany(p => p.Rooms)
                .HasForeignKey(d => d.HotelId)
                .HasConstraintName("FK_Room_Hotel");

            entity.HasOne(d => d.RoomType).WithMany(p => p.Rooms)
                .HasForeignKey(d => d.RoomTypeId)
                .HasConstraintName("FK_Room_RoomType");
        });

        modelBuilder.Entity<RoomType>(entity =>
        {
            entity.ToTable("RoomType");

            entity.Property(e => e.Description).IsUnicode(false);
            entity.Property(e => e.MaxOccupancy).HasDefaultValueSql("((2))");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.NumBeds).HasDefaultValueSql("((1))");
            entity.Property(e => e.ShortCode)
                .HasMaxLength(10)
                .IsFixedLength();
        });

        modelBuilder.Entity<Stay>(entity =>
        {
            entity.ToTable("Stay");

            entity.Property(e => e.CheckinDate).HasColumnType("datetime");
            entity.Property(e => e.CheckoutDate).HasColumnType("datetime");
            entity.Property(e => e.Notes)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.PaymentAuthToken)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.CheckedInByNavigation).WithMany(p => p.StayCheckedInByNavigations)
                .HasForeignKey(d => d.CheckedInBy)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stay_Employee");

            entity.HasOne(d => d.CheckedOutByNavigation).WithMany(p => p.StayCheckedOutByNavigations)
                .HasForeignKey(d => d.CheckedOutBy)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stay_Employee1");

            entity.HasOne(d => d.Reservation).WithMany(p => p.Stays)
                .HasForeignKey(d => d.ReservationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stay_Reservation");

            entity.HasOne(d => d.Room).WithMany(p => p.Stays)
                .HasForeignKey(d => d.RoomId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stay_Room");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.DeletedDate).HasColumnType("datetime");
            entity.Property(e => e.IsAdmin).HasDefaultValueSql("((0))");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
