USE [master]
GO
/****** Object:  Database [Food_delivery_service]    Script Date: 30.03.2025 20:12:36 ******/
CREATE DATABASE [Food_delivery_service]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Food_delivery_service', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDEVELOPER\MSSQL\DATA\Food_delivery_service.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Food_delivery_service_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDEVELOPER\MSSQL\DATA\Food_delivery_service_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Food_delivery_service] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Food_delivery_service].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Food_delivery_service] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Food_delivery_service] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Food_delivery_service] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Food_delivery_service] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Food_delivery_service] SET ARITHABORT OFF 
GO
ALTER DATABASE [Food_delivery_service] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Food_delivery_service] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Food_delivery_service] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Food_delivery_service] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Food_delivery_service] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Food_delivery_service] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Food_delivery_service] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Food_delivery_service] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Food_delivery_service] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Food_delivery_service] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Food_delivery_service] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Food_delivery_service] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Food_delivery_service] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Food_delivery_service] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Food_delivery_service] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Food_delivery_service] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Food_delivery_service] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Food_delivery_service] SET RECOVERY FULL 
GO
ALTER DATABASE [Food_delivery_service] SET  MULTI_USER 
GO
ALTER DATABASE [Food_delivery_service] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Food_delivery_service] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Food_delivery_service] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Food_delivery_service] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Food_delivery_service] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Food_delivery_service] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Food_delivery_service', N'ON'
GO
ALTER DATABASE [Food_delivery_service] SET QUERY_STORE = ON
GO
ALTER DATABASE [Food_delivery_service] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Food_delivery_service]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[RegistrationDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LoyaltyPoints] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Couriers]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Couriers](
	[CourierID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[VehicleType] [nvarchar](50) NOT NULL,
	[LicensePlate] [nvarchar](20) NULL,
	[IsAvailable] [bit] NOT NULL,
	[CurrentLocation] [nvarchar](255) NULL,
	[DeliveryCount] [int] NULL,
	[Rating] [decimal](3, 2) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK__Couriers__CDAE76F6C9E4EE0D] PRIMARY KEY CLUSTERED 
(
	[CourierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryRoutes]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryRoutes](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[CourierID] [int] NOT NULL,
	[StartLocation] [nvarchar](255) NOT NULL,
	[EndLocation] [nvarchar](255) NOT NULL,
	[Distance] [decimal](10, 2) NULL,
	[EstimatedTime] [nvarchar](50) NULL,
	[ActualTime] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_DeliveryRoutes] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[DishID] [int] IDENTITY(1,1) NOT NULL,
	[DishName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[Calories] [int] NULL,
	[PreparationTime] [int] NULL,
	[ImageURL] [nvarchar](max) NULL,
	[DateAdded] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[DishID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PricePerUnit] [decimal](10, 2) NOT NULL,
	[TotalPrice]  AS ([Quantity]*[PricePerUnit]) PERSISTED,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveryAddress] [nvarchar](255) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[DeliveryFee] [decimal](10, 2) NULL,
	[EstimatedDeliveryTime] [datetime] NULL,
	[ActualDeliveryTime] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[PromotionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[IsSuccessful] [bit] NOT NULL,
	[TransactionID] [nvarchar](50) NULL,
	[Currency] [nvarchar](10) NULL,
	[ExchangeRate] [decimal](10, 4) NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PromotionID] [int] IDENTITY(1,1) NOT NULL,
	[PromoCode] [nvarchar](20) NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MinimumOrderAmount] [decimal](10, 2) NULL,
	[MaximumDiscount] [decimal](10, 2) NULL,
	[UsageCount] [int] NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PromoCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Rating] [decimal](3, 2) NOT NULL,
	[ReviewText] [nvarchar](max) NULL,
	[ReviewDate] [date] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[AdminResponse] [nvarchar](max) NULL,
	[Likes] [int] NULL,
	[Dislikes] [int] NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteUsers]    Script Date: 30.03.2025 20:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[CourierID] [int] NULL,
	[AdministratorID] [int] NULL,
	[Login] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrators] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Administrators] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT ((0)) FOR [LoyaltyPoints]
GO
ALTER TABLE [dbo].[Couriers] ADD  CONSTRAINT [DF__Couriers__IsAvai__4BAC3F29]  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[Couriers] ADD  CONSTRAINT [DF__Couriers__Delive__4CA06362]  DEFAULT ((0)) FOR [DeliveryCount]
GO
ALTER TABLE [dbo].[DeliveryRoutes] ADD  DEFAULT ('В пути') FOR [Status]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Принят') FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [DeliveryFee]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((1)) FOR [IsSuccessful]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ('RUB') FOR [Currency]
GO
ALTER TABLE [dbo].[Promotions] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Promotions] ADD  DEFAULT ((0)) FOR [MinimumOrderAmount]
GO
ALTER TABLE [dbo].[Promotions] ADD  DEFAULT ((0)) FOR [UsageCount]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ((0)) FOR [Likes]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ((0)) FOR [Dislikes]
GO
ALTER TABLE [dbo].[DeliveryRoutes]  WITH CHECK ADD  CONSTRAINT [FK__DeliveryR__Couri__5070F446] FOREIGN KEY([CourierID])
REFERENCES [dbo].[Couriers] ([CourierID])
GO
ALTER TABLE [dbo].[DeliveryRoutes] CHECK CONSTRAINT [FK__DeliveryR__Couri__5070F446]
GO
ALTER TABLE [dbo].[DeliveryRoutes]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryRoutes_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[DeliveryRoutes] CHECK CONSTRAINT [FK_DeliveryRoutes_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([DishID])
REFERENCES [dbo].[Menu] ([DishID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__ClientID__412EB0B6] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__ClientID__412EB0B6]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Promotions1] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotions] ([PromotionID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Promotions1]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Orders]
GO
ALTER TABLE [dbo].[SiteUsers]  WITH CHECK ADD  CONSTRAINT [FK_SiteUsers_Administrators] FOREIGN KEY([AdministratorID])
REFERENCES [dbo].[Administrators] ([AdminID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SiteUsers] CHECK CONSTRAINT [FK_SiteUsers_Administrators]
GO
ALTER TABLE [dbo].[SiteUsers]  WITH CHECK ADD  CONSTRAINT [FK_SiteUsers_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SiteUsers] CHECK CONSTRAINT [FK_SiteUsers_Clients]
GO
ALTER TABLE [dbo].[SiteUsers]  WITH CHECK ADD  CONSTRAINT [FK_SiteUsers_Couriers] FOREIGN KEY([CourierID])
REFERENCES [dbo].[Couriers] ([CourierID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SiteUsers] CHECK CONSTRAINT [FK_SiteUsers_Couriers]
GO
ALTER TABLE [dbo].[Couriers]  WITH CHECK ADD  CONSTRAINT [CK__Couriers__Rating__4D94879B] CHECK  (([Rating]>=(0) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Couriers] CHECK CONSTRAINT [CK__Couriers__Rating__4D94879B]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD CHECK  (([DiscountPercentage]>=(0) AND [DiscountPercentage]<=(100)))
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([Rating]>=(0) AND [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [Food_delivery_service] SET  READ_WRITE 
GO
