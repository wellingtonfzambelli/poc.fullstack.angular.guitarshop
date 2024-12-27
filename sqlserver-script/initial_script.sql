CREATE DATABASE guitarshopangulardb;



USE guitarshopangulardb;


CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



CREATE TABLE [dbo].[Addresses](
	[Id] [uniqueidentifier] NOT NULL,
	[Line1] [nvarchar](max) NOT NULL,
	[Line2] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]




CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]




CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]




CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[AddressId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]




CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]





CREATE TABLE [dbo].[DeliveryMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](max) NOT NULL,
	[DeliveryTime] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]





CREATE TABLE [dbo].[OrderItems](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemOrdered_ProductId] [uniqueidentifier] NOT NULL,
	[ItemOrdered_ProductName] [nvarchar](max) NOT NULL,
	[ItemOrdered_PictureUrl] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]




CREATE TABLE [dbo].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[BuyerEmail] [nvarchar](max) NOT NULL,
	[ShippingAddress_Name] [nvarchar](max) NOT NULL,
	[ShippingAddress_Line1] [nvarchar](max) NOT NULL,
	[ShippingAddress_Line2] [nvarchar](max) NULL,
	[ShippingAddress_City] [nvarchar](max) NOT NULL,
	[ShippingAddress_State] [nvarchar](max) NOT NULL,
	[ShippingAddress_PostalCode] [nvarchar](max) NOT NULL,
	[ShippingAddress_Country] [nvarchar](max) NOT NULL,
	[DeliveryMethodId] [int] NOT NULL,
	[PaymentSummary_Last4] [int] NOT NULL,
	[PaymentSummary_Brand] [nvarchar](max) NOT NULL,
	[PaymentSummary_ExpMonth] [int] NOT NULL,
	[PaymentSummary_ExpYear] [int] NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[PaymentIntentId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]






CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[PictureUrl] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Brand] [nvarchar](max) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]




INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241217215418_guitarshop1', N'8.0.11')

INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [AddressId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'01098264-102a-4c9d-aeff-d96aa904e754', N'wellington', N'zambelli', NULL, N'wellington@gmail.com', N'WELLINGTON@GMAIL.COM', N'wellington@gmail.com', N'WELLINGTON@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEEeYbBh6+QkiRCkEwp2+/1sz5oBHDeJPir1T6lzoMiGjU++TrcTe2+H0wSIk/Kz+Mg==', N'UCAEJKUAXTWSJT2MP3NIIKFYUIJOA34E', N'd0783915-a8b4-4c0a-a02e-0bb554beba42', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [AddressId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b46be735-296d-4065-a390-00a8479edabb', N'wellington', N'zambelli', NULL, N'wellington@test.com', N'WELLINGTON@TEST.COM', N'wellington@test.com', N'WELLINGTON@TEST.COM', 0, N'AQAAAAIAAYagAAAAENtxwvGNpk8byrN0hF49MUeM8yDPaSrydPV8qSg4r8KUZZIPd0gma2QudMDI5kWYqw==', N'EE7RNGBCVOWAX2RVMSSTOKXJBWJKAU5L', N'e1a88af2-5c18-4d30-b423-a3b31f94fb62', NULL, 0, 0, NULL, 1, 0)


SET IDENTITY_INSERT [dbo].[DeliveryMethods] ON 

INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (1, N'UPS1', N'1-2 Days', N'Fastest delivery time', 10)
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (2, N'UPS2', N'2-5 Days', N'Get it within 5 days', 5)
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (3, N'UPS3', N'5-10 Days', N'Slower but cheap', 2)
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (4, N'FREE', N'1-2 Weeks', N'Free! You get what you pay for', 0)
SET IDENTITY_INSERT [dbo].[DeliveryMethods] OFF



INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'49f6b458-65d2-4d17-63d4-08dd1ee61538', N'Fender Stratocaster', N'A legendary electric guitar known for its versatility and iconic design. Perfect for rock, blues, and jazz players.', 1200, N'guitar-Fender-Stratocaster.jpg', N'Electric Guitar', N'Fender', 15)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'43395a6a-82f0-4d51-63d5-08dd1ee61538', N'Gibson Les Paul', N'A classic guitar delivering rich tones and sustain. Ideal for professional guitarists seeking premium quality.', 2500, N'guitar-Gibson-Les-Paul.jpg', N'Electric Guitar', N'Gibson', 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'83202f68-2c7b-4361-63d6-08dd1ee61538', N'PRS SE Custom 24', N'A versatile guitar with a warm, resonant tone. Perfect for studio and live performances.', 849, N'guitar-PRS-SE-Custom-24.jpg', N'Electric Guitar', N'PRS', 12)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'bca2236f-1f44-43af-63d7-08dd1ee61538', N'Ibanez SR300E Bass Guitar', N'A modern bass guitar with smooth playability and dynamic sound. Great for beginners and professionals.', 349, N'bass-Ibanez-SR300E-Bass-Guitar.jpg', N'Bass Guitar', N'Ibanez', 18)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'218fad36-f19c-4c19-63d8-08dd1ee61538', N'Epiphone Thunderbird IV', N'A powerful bass guitar with iconic design, known for its deep and punchy sound.', 449, N'bass-Epiphone-Thunderbird-IV.jpg', N'Bass Guitar', N'Epiphone', 8)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'60524360-de0e-4ba5-63d9-08dd1ee61538', N'Yamaha Stage Custom Birch Drum Set', N'An excellent drum set for professionals and learners alike, offering great tonal quality and durability.', 800, N'drum-yamaha-stage-custom-birch-drum-set.jpg', N'Drums', N'Yamaha', 20)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'17267897-97c4-4c02-63da-08dd1ee61538', N'Roland V-Drums TD-17KVX', N'A high-end electronic drum kit with realistic feel and premium sound quality.', 1800, N'drum-Roland-V-Drums-TD-17KVX.jpg', N'Drums', N'Roland', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'df7d0c80-0eea-495d-63db-08dd1ee61538', N'Boss DS-1 Distortion Pedal', N'A distortion pedal that defines the sound of rock and metal for decades. Compact and powerful.', 59, N'acessories-Boss-DS-1-Distortion.jpg', N'Acessories', N'Boss', 50)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'b039ce1b-c32c-423a-63dc-08dd1ee61538', N'Shure SM57 Microphone', N'A versatile microphone widely used for instruments and vocals, delivering studio-quality sound.', 99, N'acessories-Shure-SM57-Microphone.jpg', N'Acessories', N'Shure', 40)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'a57a1248-aba8-4734-63dd-08dd1ee61538', N'MXR Carbon Copy Analog Delay', N'A lush analog delay pedal with a warm and vintage tone. Ideal for atmospheric sounds.', 149, N'acessories-MXR-Carbon-Copy-Analog-Delay.jpg', N'Acessories', N'MXR', 25)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'db368a48-2aaa-4c5d-63de-08dd1ee61538', N'Electro-Harmonix Big Muff Pi', N'An iconic fuzz pedal with a distinctive and saturated tone. A must-have for rock and grunge players.', 99, N'acessories-Electro-Harmonix-Big-Muff-Pi.jpg', N'Acessories', N'Electro-Harmonix', 30)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'7e88a1f6-e5c2-43f1-63df-08dd1ee61538', N'Zildjian A Custom Cymbal Pack', N'A professional cymbal set offering a bright and expressive tone. Perfect for live gigs.', 799, N'acessories-Zildjian-A-Custom-Cymbal-Pack.jpg', N'Acessories', N'Zildjian', 15)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'0a443cef-8ac4-4b42-63e0-08dd1ee61538', N'Ernie Ball Regular Slinky Guitar Strings', N'A set of high-quality strings known for durability and balanced tone.', 6.99, N'acessories-Ernie-Ball-Regular-Slinky-Guitar-Strings.jpg', N'Acessories', N'Ernie Ball', 100)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'b6377017-3ba1-4b5d-63e1-08dd1ee61538', N'Gator Deluxe Guitar Case', N'A durable and lightweight case to protect your guitar on the road.', 120, N'acessories-Gator-Deluxe-Guitar-Case.jpg', N'Acessories', N'Gator', 20)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'8c217cac-0423-4c4e-63e2-08dd1ee61538', N'Ampeg SVT Bass Amp', N'A high-performance bass amplifier delivering exceptional sound quality. A favorite among bass players.', 1400, N'amp-Ampeg-SVT-Bass-Amp.jpg', N'Amplifier', N'Ampeg', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'5225ef28-f9fa-45b3-63e3-08dd1ee61538', N'Marshall DSL40C Tube Combo Amp', N'A classic tube amplifier delivering rich and powerful sound for professionals.', 749, N'amp-Marshall-DSL40C-Tube-Combo-Amp.jpg', N'Amplifier', N'Marshall', 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [Type], [Brand], [QuantityInStock]) VALUES (N'6168a43d-08d1-4bf7-63e4-08dd1ee61538', N'Line 6 Spider V 60 MkII', N'A feature-packed amplifier offering a variety of tones and effects for all genres.', 399, N'amp-Line-6-Spider-V-60-MkII.jpeg', N'Amplifier', N'Line 6', 10)




SET ANSI_PADDING ON


CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON


CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON


CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON


CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON


CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON


CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


CREATE NONCLUSTERED INDEX [IX_AspNetUsers_AddressId] ON [dbo].[AspNetUsers]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON


CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_Orders_DeliveryMethodId] ON [dbo].[Orders]
(
	[DeliveryMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]

ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]

ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]

ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Addresses_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([Id])

ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Addresses_AddressId]

ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]

ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId] FOREIGN KEY([DeliveryMethodId])
REFERENCES [dbo].[DeliveryMethods] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId]

USE [master]

ALTER DATABASE [guitarshop-angular-db] SET  READ_WRITE 

