USE [CoffeShop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/22/2023 8:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 4/22/2023 8:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ItemImage] [nvarchar](max) NULL,
	[ProductTypeId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/22/2023 8:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/22/2023 8:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNo] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/22/2023 8:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductTypeId] [int] NOT NULL,
	[ProductImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 4/22/2023 8:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/22/2023 8:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ConfirmPassword] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230421082246_ProductType', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230421102617_addProduct', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230421105631_ProductImage', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230421115452_addItem', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230421115820_addItems', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230421164247_OrderAndDetails', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230422070606_addUser', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230422111432_addedaddress', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230422135056_addQuantity', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230422143824_addQuantityToOrderDetails', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Items] ON 
GO
INSERT [dbo].[Items] ([Id], [Name], [Price], [ProductDescription], [ItemImage], [ProductTypeId], [Quantity]) VALUES (4, N'Rice & Stew', CAST(3000.00 AS Decimal(18, 2)), N'Product of Tanatalizers', N'Images/rice&stew.jpg', 2, NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [Price], [ProductDescription], [ItemImage], [ProductTypeId], [Quantity]) VALUES (5, N'Pepsi Cola', CAST(300.00 AS Decimal(18, 2)), N'A Product of 7up', N'Images/pepsi.jpg', 3, NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [Price], [ProductDescription], [ItemImage], [ProductTypeId], [Quantity]) VALUES (8, N'Hot Coffee', CAST(2700.00 AS Decimal(18, 2)), N'This is a Product from Mr Biggs', N'Images/coffe1.jpg', 1, NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [Price], [ProductDescription], [ItemImage], [ProductTypeId], [Quantity]) VALUES (9, N'Chocolate Drink', CAST(4000.00 AS Decimal(18, 2)), N'A Product Of Milo', N'Images/chocolatedrink.jpg', 1, NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [Price], [ProductDescription], [ItemImage], [ProductTypeId], [Quantity]) VALUES (10, N'Hot Tea', CAST(3500.00 AS Decimal(18, 2)), N'A product of Lipton', N'Images/tea1.jpg', 1, NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [Price], [ProductDescription], [ItemImage], [ProductTypeId], [Quantity]) VALUES (11, N'Coca Cola', CAST(350.00 AS Decimal(18, 2)), N'A Product of Coca Cola', N'Images/coke.jpg', 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ItemId], [Quantity]) VALUES (10, 5, 4, 3)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ItemId], [Quantity]) VALUES (11, 5, 5, 4)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ItemId], [Quantity]) VALUES (12, 6, 8, 3)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ItemId], [Quantity]) VALUES (13, 6, 4, 4)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ItemId], [Quantity]) VALUES (14, 7, 11, 4)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (1, N'001', N'Onyebuchi Okoye', N'08063202002', N'Onyebuchiokoye@jubileelifeng.com', N'9 Ogundo0ju Street', CAST(N'2023-04-21T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (2, N'002', N'Onyebuchi Okoye', N'08063202002', N'Onyebuchiokoye@jubileelifeng.com', N'9 Ogundo0ju Street', CAST(N'2023-04-22T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (3, N'003', N'Peace Chidinma Okoye ', N'08062570452', N'peaceokoyechi@yahoo.com', N'9 Ogundo0ju Street', CAST(N'2023-04-22T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (4, N'004', N'Onyebuchi Okoye', N'08063202002', N'Onyebuchiokoye@jubileelifeng.com', N'9 Ogundo0ju Street', CAST(N'2023-04-22T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (5, N'005', N'Onyebuchi Okoye', N'08063202002', N'Onyebuchiokoye@jubileelifeng.com', N'9 Ogundo0ju Street', CAST(N'2023-04-22T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (6, N'006', N'Munachimso Okoye', N'08063202001', N'ookoye@rocketmail.com', N'9 Ogundo0ju Street', CAST(N'2023-04-22T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([Id], [OrderNo], [Name], [PhoneNo], [Email], [Address], [OrderDate]) VALUES (7, N'007', N'Chimezugolum Okoye', N'08063202003', N'zugo@yahoo.com', N'9 Ogundo0ju Street', CAST(N'2023-04-21T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [ProductDescription], [ProductTypeId], [ProductImage]) VALUES (1, N'Origin Bitters', CAST(700.00 AS Decimal(18, 2)), N'This is a Product from Orign Breweries.', 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [ProductDescription], [ProductTypeId], [ProductImage]) VALUES (2, N'Odogwu Bitters', CAST(1500.00 AS Decimal(18, 2)), N'This is a product of Cubana Groups LTD', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 
GO
INSERT [dbo].[ProductTypes] ([Id], [ProductType]) VALUES (1, N'Hot Drinks')
GO
INSERT [dbo].[ProductTypes] ([Id], [ProductType]) VALUES (2, N'Food')
GO
INSERT [dbo].[ProductTypes] ([Id], [ProductType]) VALUES (3, N'Cold Drinks')
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Name], [PhoneNumber], [Email], [Password], [ConfirmPassword], [Address]) VALUES (1, N'Onyebuchi Okoye', N'08063202002', N'Onyebuchiokoye@jubileelifeng.com', N'Peace@Buch1', N'Peace@Buch1', N'9 Ogundo0ju Street')
GO
INSERT [dbo].[Users] ([Id], [Name], [PhoneNumber], [Email], [Password], [ConfirmPassword], [Address]) VALUES (2, N'Peace Chidinma Okoye ', N'08062570452', N'peaceokoyechi@yahoo.com', N'Peace@Buch2', N'Peace@Buch2', N'9 Ogundo0ju Street')
GO
INSERT [dbo].[Users] ([Id], [Name], [PhoneNumber], [Email], [Password], [ConfirmPassword], [Address]) VALUES (3, N'Munachimso Okoye', N'08063202001', N'ookoye@rocketmail.com', N'Muna@12345', N'Muna@12345', N'9 Ogundo0ju Street')
GO
INSERT [dbo].[Users] ([Id], [Name], [PhoneNumber], [Email], [Password], [ConfirmPassword], [Address]) VALUES (4, N'Chimezugolum Okoye', N'08063202003', N'zugo@yahoo.com', N'Zugo@12345', N'Zugo@12345', N'9 Ogundo0ju Street')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_ProductTypes_ProductTypeId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Items_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Items_ItemId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes_ProductTypeId]
GO
