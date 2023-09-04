
USE [LegacyBedrock]
GO


------------------------------------------------------------------------------------------------------------
-------------------------------------------- ROOM TYPES ----------------------------------------------------
------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[RoomType] ([ShortCode],[Name],[Description],[MaxOccupancy],[NumBeds],[IsDeleted])
     VALUES ('TWIN', 'Twin','A room with 2 twin beds',2,2,0)

INSERT INTO [dbo].[RoomType] ([ShortCode],[Name],[Description],[MaxOccupancy],[NumBeds],[IsDeleted])
     VALUES ('QUEEN', 'Queen','A room with 2 queen sized beds',2,4,0)
     
INSERT INTO [dbo].[RoomType] ([ShortCode],[Name],[Description],[MaxOccupancy],[NumBeds],[IsDeleted])
     VALUES ('KING', 'King','A room with a King sized bed',1,2,0)
     
INSERT INTO [dbo].[RoomType] ([ShortCode],[Name],[Description],[MaxOccupancy],[NumBeds],[IsDeleted])
     VALUES ('KINGACC', 'King - Accessible','A King room with an accessible tub',1,2,0)
GO


------------------------------------------------------------------------------------------------------------
-------------------------------------------- COUNTRIES -----------------------------------------------------
------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[Country] ([Name], [CountryCode]) VALUES ('United Kingdom', '')
INSERT INTO [dbo].[Country] ([Name], [CountryCode]) VALUES ('France', 'FR')
INSERT INTO [dbo].[Country] ([Name], [CountryCode]) VALUES ('United States', 'US')

------------------------------------------------------------------------------------------------------------
-------------------------------------------- CURRENCIES ----------------------------------------------------
------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].Currency ([Name], Symbol, Code) VALUES ('British Pound', '£','GBP')
INSERT INTO [dbo].Currency ([Name], Symbol, Code) VALUES ('US Dollar', '$', 'USD')
INSERT INTO [dbo].Currency ([Name], Symbol, Code) VALUES ('Euro', '€', 'EUR')
                                                   
GO


------------------------------------------------------------------------------------------------------------
-------------------------------------------- EMPLOYEES------------------------------------------------------
------------------------------------------------------------------------------------------------------------
GO 
INSERT INTO [dbo].[Address] ([Address1],[Address2],[Address3],[Town],[CountryId],[PostalCode]
                            ,[PhoneNumber],[PhoneNumber2],[FaxNumber],[EmailAddress],[EmailAddress2])
     VALUES ('1 Ciarans St', NULL, NULL, 'London', 1, 'SE1 1AA', '0208 456 1234',NULL,'0208 456 4321','ciaran@odonnell.com',NULL)
DECLARE @CiaransAddressId INT = SCOPE_IDENTITY()

INSERT INTO Employee (   [FirstName]      ,[LastName]      ,[AddressId]      ,[DateOfBirth]      ,[EmailAddress]      ,[HiredDate]      ,[LeaveDate], JobTitle)
VALUES ( 'Ciaran', 'O''Donnell', @CiaransAddressId, '1999-01-01', 'ciaran@bedrock.com', '2015-01-01', NULL, 'Manager')



INSERT INTO [dbo].[Address] ([Address1],[Address2],[Address3],[Town],[CountryId],[PostalCode]
                            ,[PhoneNumber],[PhoneNumber2],[FaxNumber],[EmailAddress],[EmailAddress2])
     VALUES ('1 Rob St', NULL, NULL, 'Newark, NJ', 1, '07310', '201-555-1234',NULL,'201-555-1234','robcarroll@odonnell.com',NULL)
DECLARE @RobsAddressId INT = SCOPE_IDENTITY()

INSERT INTO Employee (   [FirstName]      ,[LastName]      ,[AddressId]      ,[DateOfBirth]      ,[EmailAddress]      ,[HiredDate]      ,[LeaveDate], JobTitle)
VALUES ( 'Rob', 'Carroll', @RobsAddressId, '1998-01-01', 'robcarroll@bedrock.com', '2017-01-01', NULL, 'Manager')

GO


------------------------------------------------------------------------------------------------------------
-------------------------------------------- HOTELS --------------------------------------------------------
------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[Address] ([Address1],[Address2],[Address3],[Town],[CountryId],[PostalCode]
                            ,[PhoneNumber],[PhoneNumber2],[FaxNumber],[EmailAddress],[EmailAddress2])
     VALUES ('1 London Street', NULL, NULL, 'London', 1, 'SE1 1AA', '0208 456 3265',NULL,'0208 456 2367','londonprime@bedrockhotels.com',NULL)
DECLARE @BRLNAddressId INT = SCOPE_IDENTITY()
     


INSERT INTO [dbo].[Hotel]            ([Name]           ,[AddressId]           ,[ManagerId], CloseDate, [Description], MainPictureUrl)
     VALUES ('Bedrock London', @BRLNAddressId , (SELECT EmployeeId FROM Employee WHERE EmailAddress='ciaran@odonnell.com') , null, 
     'When in London, stay at a hotel as famous as Buckingham Palace (but without those pesky corgis). No offense to Buckingham Palace, though – we are good neighbours. Drop off your suitcase at citizenM London Victoria Station and go wave at the Beefeaters (trust us, they love it), try on some outrageous outfits on Carnaby Street, and find the Seven Noses of Soho. After all this, your eyes will need a rest. It''s a good thing you booked the most comfortable bed in London.','/Images/Hotels/London.png')


         
INSERT INTO [dbo].[Address] ([Address1],[Address2],[Address3],[Town],[CountryId],[PostalCode]
                            ,[PhoneNumber],[PhoneNumber2],[FaxNumber],[EmailAddress],[EmailAddress2])
     VALUES ('599 Broadway', NULL, NULL, 'New York', 1, '10010', '212-555-1234',NULL,'212-555-1235','newyork@bedrock.com',NULL)
DECLARE @BRNYAddressId INT = SCOPE_IDENTITY()

INSERT INTO [dbo].[Hotel]            ([Name]           ,[AddressId]           ,[ManagerId], CloseDate, [Description])
     VALUES ('Bedrock New York', @BRNYAddressId, (SELECT EMPLOYEEID FROM EMPLOYEE WHERE EMAIL = 'robcarroll@bedrock.com'), null, 
     '<P>Bedrock New York has a fitness centre, shared lounge, a terrace and bar in New York. With free WiFi, this 5-star hotel offers room service and a 24-hour front desk. The property is non-smoking and is situated 1.3 km from National September 11 Memorial & Museum.</P>
<P>Rooms include a desk and a TV, and some rooms at the hotel have a balcony. The rooms will provide guests with a minibar.</P>
<P>At Bedrock New York you will find a restaurant serving American, Italian and Seafood cuisine. Vegetarian, dairy-free and kosher options can also be requested.</P>
<P>The accommodation offers 5-star accommodation with a sauna.</P>
<P>One World Trade Center is 1.5 km from Bedrock New York, while Brooklyn Bridge is 2.9 km from the property. The nearest airport is LaGuardia Airport, 18 km from the hotel.</P>'
,'/Images/Hotels/NewYork.png')
GO



------------------------------------------------------------------------------------------------------------
-------------------------------------------- ROOMS ---------------------------------------------------------
------------------------------------------------------------------------------------------------------------


INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 1, '101', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 2, '102', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 3, '103', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 4, '104', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 1, '201', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 2, '202', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 3, '203', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 4, '204', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 1, '301', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 2, '302', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 3, '303', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 4, '304', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 1, '401', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 2, '402', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 3, '403', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 4, '404', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 1, '501', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 2, '502', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 3, '503', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (1, 4, '504', 0)


INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 1, '101', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 2, '102', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 3, '103', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 4, '104', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 1, '201', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 2, '202', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 3, '203', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 4, '204', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 1, '301', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 2, '302', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 3, '303', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 4, '304', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 1, '401', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 2, '402', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 3, '403', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 4, '404', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 1, '501', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 2, '502', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 3, '503', 0)
INSERT INTO ROOM ([HotelId], RoomTypeId, RoomName, PriceLoading) VALUES (2, 4, '504', 0)


