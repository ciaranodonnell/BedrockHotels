USE [master]
GO
/****** Object:  Database [LegacyBedrock]    Script Date: 7/6/2023 9:06:41 PM ******/
CREATE DATABASE [LegacyBedrock]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LegacyBedrock', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LegacyBedrock.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LegacyBedrock_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LegacyBedrock_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LegacyBedrock] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LegacyBedrock].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LegacyBedrock] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LegacyBedrock] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LegacyBedrock] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LegacyBedrock] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LegacyBedrock] SET ARITHABORT OFF 
GO
ALTER DATABASE [LegacyBedrock] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LegacyBedrock] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LegacyBedrock] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LegacyBedrock] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LegacyBedrock] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LegacyBedrock] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LegacyBedrock] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LegacyBedrock] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LegacyBedrock] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LegacyBedrock] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LegacyBedrock] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LegacyBedrock] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LegacyBedrock] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LegacyBedrock] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LegacyBedrock] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LegacyBedrock] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LegacyBedrock] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LegacyBedrock] SET RECOVERY FULL 
GO
ALTER DATABASE [LegacyBedrock] SET  MULTI_USER 
GO
ALTER DATABASE [LegacyBedrock] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LegacyBedrock] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LegacyBedrock] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LegacyBedrock] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LegacyBedrock] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LegacyBedrock] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LegacyBedrock', N'ON'
GO
ALTER DATABASE [LegacyBedrock] SET QUERY_STORE = ON
GO
ALTER DATABASE [LegacyBedrock] SET QUERY_STORE (OPERATION_MODE = READ_WRITE )
GO
USE [LegacyBedrock]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/6/2023 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Address1] [varchar](200) NOT NULL,
	[Address2] [varchar](200) NULL,
	[Address3] [varchar](200) NULL,
	[Town] [varchar](200) NULL,
	[CountryId] [int] NULL,
	[PostalCode] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[PhoneNumber2] [nchar](10) NULL,
	[FaxNumber] [varchar](50) NULL,
	[EmailAddress] [varchar](200) NULL,
	[EmailAddress2] [varchar](200) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/6/2023 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[AddressId] [int] NULL,
	[DateOfBirth] [date] NULL,
	[EmailAddress] [varbinary](100) NULL,
	[HiredDate] [date] NULL,
	[LeaveDate] [date] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 7/6/2023 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[AddressId] [int] NOT NULL,
	[ManagerId] [int] NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 7/6/2023 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId] [int] IDENTITY(1,13) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[PropertyId] [int] NULL,
	[RoomType] [int] NULL,
	[Requests] [nvarchar](500) NULL,
	[CustomerName] [varchar](200) NULL,
	[CustomerAddress] [int] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/6/2023 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NULL,
	[RoomTypeId] [int] NULL,
	[RoomName] [nchar](10) NULL,
	[PriceLoading] [money] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 7/6/2023 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ShortCode] [nchar](10) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varbinary](500) NOT NULL,
	[MaxOccupancy] [int] NOT NULL,
	[NumBeds] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stay]    Script Date: 7/6/2023 9:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stay](
	[StayId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [int] NULL,
	[CheckinDate] [datetime] NULL,
	[CheckoutDate] [datetime] NULL,
	[Notes] [varchar](500) NULL,
	[PaymentAuthToken] [varchar](50) NULL,
	[CheckedInBy] [int] NULL,
	[CheckedOutBy] [int] NULL,
 CONSTRAINT [PK_Stay] PRIMARY KEY CLUSTERED 
(
	[StayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoomType] ADD  CONSTRAINT [DF_RoomType_MaxOccupancy]  DEFAULT ((2)) FOR [MaxOccupancy]
GO
ALTER TABLE [dbo].[RoomType] ADD  CONSTRAINT [DF_RoomType_NumBeds]  DEFAULT ((1)) FOR [NumBeds]
GO
ALTER TABLE [dbo].[RoomType] ADD  CONSTRAINT [DF_RoomType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Address]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Address]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Employee] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Employee]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Address] FOREIGN KEY([CustomerAddress])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Address]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Hotel] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Hotel] ([HotelId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Hotel]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_RoomType] FOREIGN KEY([RoomType])
REFERENCES [dbo].[RoomType] ([RoomTypeId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_RoomType]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([HotelId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hotel]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomType] ([RoomTypeId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
ALTER TABLE [dbo].[Stay]  WITH CHECK ADD  CONSTRAINT [FK_Stay_Employee] FOREIGN KEY([CheckedInBy])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Stay] CHECK CONSTRAINT [FK_Stay_Employee]
GO
ALTER TABLE [dbo].[Stay]  WITH CHECK ADD  CONSTRAINT [FK_Stay_Employee1] FOREIGN KEY([CheckedOutBy])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Stay] CHECK CONSTRAINT [FK_Stay_Employee1]
GO
ALTER TABLE [dbo].[Stay]  WITH CHECK ADD  CONSTRAINT [FK_Stay_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[Stay] CHECK CONSTRAINT [FK_Stay_Reservation]
GO
USE [master]
GO
ALTER DATABASE [LegacyBedrock] SET  READ_WRITE 
GO
