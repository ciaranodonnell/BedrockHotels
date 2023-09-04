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

USE [LegacyBedrock]

GO

CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CountryCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
	(
		[CountryId] ASC
	)
) 
CREATE TABLE [dbo].[Currency](
	[CurrencyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Symbol] [varchar](10) NOT NULL,
	[Code] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
	(
		[CurrencyId] ASC
	)
)
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
)
) 

GO
USE [LegacyBedrock]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 9/3/2023 10:04:17 PM ******/
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
	[EmailAddress] [varchar](200) NULL,
	[HiredDate] [date] NULL,
	[LeaveDate] [date] NULL,
	[JobTitle] [varchar](200) NULL,
	CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
	(
		[EmployeeId] ASC
	)
) 
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Address] FOREIGN KEY([AddressId])
	REFERENCES [dbo].[Address] ([AddressId])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Address]
GO


CREATE TABLE [dbo].[Hotel](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[AddressId] [int] NOT NULL,
	[ManagerId] [int] NULL,
	[CloseDate] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[MainPictureUrl] [varchar](200) NULL,
	[CurrencyId] [int] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO

ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Address]
GO

ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([CurrencyId])
GO

ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Currency]
GO

ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Employee] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO

ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Employee]
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



CREATE TABLE [dbo].[RoomType](
	[RoomTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ShortCode] [nchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[MaxOccupancy] [int] NOT NULL,
	[NumBeds] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[RoomType] ADD  CONSTRAINT [DF_RoomType_MaxOccupancy]  DEFAULT ((2)) FOR [MaxOccupancy]
GO

ALTER TABLE [dbo].[RoomType] ADD  CONSTRAINT [DF_RoomType_NumBeds]  DEFAULT ((1)) FOR [NumBeds]
GO

ALTER TABLE [dbo].[RoomType] ADD  CONSTRAINT [DF_RoomType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
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



CREATE TABLE [dbo].[Stay](
	[StayId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [int] NOT NULL,
	[CheckinDate] [datetime] NOT NULL,
	[CheckoutDate] [datetime] NULL,
	[Notes] [varchar](500) NULL,
	[PaymentAuthToken] [varchar](50) NULL,
	[CheckedInBy] [int] NOT NULL,
	[CheckedOutBy] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_Stay] PRIMARY KEY CLUSTERED 
(
	[StayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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

ALTER TABLE [dbo].[Stay]  WITH CHECK ADD  CONSTRAINT [FK_Stay_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO

ALTER TABLE [dbo].[Stay] CHECK CONSTRAINT [FK_Stay_Room]
GO

