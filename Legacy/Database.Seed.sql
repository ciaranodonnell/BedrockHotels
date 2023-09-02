
USE [LegacyBedrock]
GO

INSERT INTO [dbo].[RoomType] ([ShortCode],[Name],[Description],[MaxOccupancy],[NumBeds],[IsDeleted])
     VALUES ('TWIN', 'Twin','A room with 2 twin beds',2,2,0)

INSERT INTO [dbo].[RoomType] ([ShortCode],[Name],[Description],[MaxOccupancy],[NumBeds],[IsDeleted])
     VALUES ('QUEEN', 'Queen','A room with 2 queen sized beds',2,4,0)
     
INSERT INTO [dbo].[RoomType] ([ShortCode],[Name],[Description],[MaxOccupancy],[NumBeds],[IsDeleted])
     VALUES ('KING', 'King','A room with a King sized bed',1,2,0)
     
INSERT INTO [dbo].[RoomType] ([ShortCode],[Name],[Description],[MaxOccupancy],[NumBeds],[IsDeleted])
     VALUES ('KINGACC', 'King - Accessible','A King room with an accessible tub',1,2,0)
GO

INSERT INTO [dbo].[Country] ([Name], [CountryCode]) VALUES ('United Kingdom', 'UK')
INSERT INTO [dbo].[Country] ([Name], [CountryCode]) VALUES ('France', 'FR')
INSERT INTO [dbo].[Country] ([Name], [CountryCode]) VALUES ('United States', 'US')

GO

INSERT INTO [dbo].[Address] ([Address1],[Address2],[Address3],[Town],[CountryId],[PostalCode]
                            ,[PhoneNumber],[PhoneNumber2],[FaxNumber],[EmailAddress],[EmailAddress2])
     VALUES ('1 London Street', NULL, NULL, 'London', 1, 'SE1 1AA', '0208 456 3265',NULL,'0208 456 2367','londonprime@bedrockhotels.com',NULL)

     
INSERT INTO [dbo].[Address] ([Address1],[Address2],[Address3],[Town],[CountryId],[PostalCode]
                            ,[PhoneNumber],[PhoneNumber2],[FaxNumber],[EmailAddress],[EmailAddress2])
     VALUES ('1 Ciarans St', NULL, NULL, 'London', 1, 'SE1 1AA', '0208 456 1234',NULL,'0208 456 4321','ciaran@odonnell.com',NULL)
GO

INSERT INTO Employee (   [FirstName]      ,[LastName]      ,[AddressId]      ,[DateOfBirth]      ,[EmailAddress]      ,[HiredDate]      ,[LeaveDate], JobTitle)
VALUES ( 'Ciaran', 'O''Donnell', 1, '1999-01-01', 'ciaran@bedrock.com', '2015-01-01', NULL, 'Manager')

GO

INSERT INTO [dbo].[Hotel]            ([Name]           ,[AddressId]           ,[ManagerId])
     VALUES ('London Prime', 1, (SELECT EMPLOYEEID FROM EMPLOYEE WHERE EMAIL = 'ciaran@bedrock.com'))
GO


