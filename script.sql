USE [master]
GO
/****** Object:  Database [salon_krasoti]    Script Date: 24.03.2025 19:31:11 ******/
CREATE DATABASE [salon_krasoti]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'salon_krasoti', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DEVELOPER\MSSQL\DATA\salon_krasoti.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'salon_krasoti_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DEVELOPER\MSSQL\DATA\salon_krasoti_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [salon_krasoti] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [salon_krasoti].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [salon_krasoti] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [salon_krasoti] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [salon_krasoti] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [salon_krasoti] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [salon_krasoti] SET ARITHABORT OFF 
GO
ALTER DATABASE [salon_krasoti] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [salon_krasoti] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [salon_krasoti] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [salon_krasoti] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [salon_krasoti] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [salon_krasoti] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [salon_krasoti] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [salon_krasoti] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [salon_krasoti] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [salon_krasoti] SET  DISABLE_BROKER 
GO
ALTER DATABASE [salon_krasoti] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [salon_krasoti] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [salon_krasoti] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [salon_krasoti] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [salon_krasoti] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [salon_krasoti] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [salon_krasoti] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [salon_krasoti] SET RECOVERY FULL 
GO
ALTER DATABASE [salon_krasoti] SET  MULTI_USER 
GO
ALTER DATABASE [salon_krasoti] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [salon_krasoti] SET DB_CHAINING OFF 
GO
ALTER DATABASE [salon_krasoti] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [salon_krasoti] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [salon_krasoti] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [salon_krasoti] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'salon_krasoti', N'ON'
GO
ALTER DATABASE [salon_krasoti] SET QUERY_STORE = ON
GO
ALTER DATABASE [salon_krasoti] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [salon_krasoti]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[AppointmentDateTime] [datetime] NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[PromotionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](100) NULL,
	[Position] [varchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PromotionID] [int] IDENTITY(1,1) NOT NULL,
	[PromotionName] [varchar](100) NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[QuantitySold] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](100) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Duration] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 24.03.2025 19:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[RoleID] [int] NULL,
	[ClientID] [int] NULL,
	[EmployeeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (1, 1, 1, 1, CAST(N'2023-01-01T10:00:00.000' AS DateTime), N'Завершено', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (2, 3, 2, 2, CAST(N'2025-02-14T12:00:00.000' AS DateTime), N'Завершен', 2)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (3, 3, 3, 3, CAST(N'2023-03-01T12:00:00.000' AS DateTime), N'Отменено', 4)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (4, 4, 4, 4, CAST(N'2023-04-01T13:00:00.000' AS DateTime), N'Завершено', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (5, 5, 5, 5, CAST(N'2023-05-01T14:00:00.000' AS DateTime), N'Запланировано', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (6, 6, 6, 6, CAST(N'2023-06-01T15:00:00.000' AS DateTime), N'Отменено', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (7, 7, 7, 7, CAST(N'2023-07-01T16:00:00.000' AS DateTime), N'Завершено', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (8, 8, 8, 8, CAST(N'2023-08-01T17:00:00.000' AS DateTime), N'Запланировано', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (9, 9, 9, 9, CAST(N'2023-09-01T18:00:00.000' AS DateTime), N'Отменено', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (10, 10, 10, 10, CAST(N'2023-10-01T19:00:00.000' AS DateTime), N'Завершено', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (13, 2011, 1, 1, CAST(N'2025-06-15T10:00:00.000' AS DateTime), N'Запланировано', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (14, 2011, 2, 2, CAST(N'2025-10-29T15:30:00.000' AS DateTime), N'Запланировано', 1007)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (15, 2011, 3, 3, CAST(N'2025-05-12T14:00:00.000' AS DateTime), N'Запланировано', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (17, 2011, 2, 8, CAST(N'2025-03-23T15:30:00.000' AS DateTime), N'Запланировано', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (22, 5, 14, 8, CAST(N'2025-03-28T12:30:00.000' AS DateTime), N'Запланировано', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (24, 3, 14, 1, CAST(N'2025-03-27T16:20:00.000' AS DateTime), N'Запланировано', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (25, 6, 14, 8, CAST(N'2025-05-30T14:30:00.000' AS DateTime), N'Запланировано', NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [ClientID], [EmployeeID], [ServiceID], [AppointmentDateTime], [Status], [PromotionID]) VALUES (28, 2011, 14, 9, CAST(N'2025-03-31T14:50:00.000' AS DateTime), N'Запланировано', NULL)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (1, N'Максимка', N'Ялунин', N'+79264443333', N'maximya@mail.ru', CAST(N'2006-10-19' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (2, N'Илья', N'Сергеев', N'9876543210', N'ilia@example.com', CAST(N'2006-01-09' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (3, N'Юлиана', N'Матюхина', N'5551234567', N'julia@example.com', CAST(N'2006-07-13' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (4, N'Герман', N'Рейзвих', N'1112223333', N'german@example.com', CAST(N'2006-05-18' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (5, N'Константин', N'Кердан', N'4445556666', N'konstantin@example.com', CAST(N'2006-04-22' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (6, N'Серафим', N'Хахуцкий', N'7778889999', N'serafim@example.com', CAST(N'2007-10-13' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (7, N'Стас', N'Кику', N'3332221111', N'stas@example.com', CAST(N'2006-08-11' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (8, N'Владимир', N'Дмитриев', N'6667778888', N'dmitriy@example.com', CAST(N'2003-05-25' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (9, N'Виктория', N'Салчук', N'+79258873203', N'victoriasalchuk@yandex.ru', CAST(N'2006-10-04' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (10, N'Яна', N'Бьянова', N'2223334444', N'byanova06@mail.ru', CAST(N'2006-05-13' AS Date), 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [RoleID]) VALUES (2011, N'Владимир', N'Безносиков', N'+78926343332', N'vladbez@gmail.com', NULL, 3)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (1, N'Дарина', N'Колосова', N'1234567890', N'elviraa.andreeva@gmail.com', N'Администратор', CAST(N'2020-12-28' AS Date), CAST(N'1990-05-15' AS Date), 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (2, N'Софья', N'Фоос', N'9876543210', N'sofia@example.com', N'Администратор', CAST(N'2015-06-01' AS Date), CAST(N'1988-02-20' AS Date), 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (3, N'Екатерина', N'Салчук', N'5551234567', N'ekaterina@example.com', N'Администратор', CAST(N'2012-03-01' AS Date), CAST(N'1992-03-12' AS Date), 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (4, N'Татьяна', N'Татьянова', N'1112223333', N'tatiana@example.com', N'Менеджер по продажам', CAST(N'2018-02-01' AS Date), CAST(N'1995-07-18' AS Date), 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (5, N'Роман', N'Романов', N'+79992223344', N'roman@example.com', N'Менеджер по маркетингу', CAST(N'2020-04-01' AS Date), CAST(N'1994-11-30' AS Date), 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (6, N'Ольга', N'Ольгова', N'7778889999', N'olga@example.com', N'Мастер по маникюру/педикюру', CAST(N'2016-05-01' AS Date), CAST(N'1993-08-25' AS Date), 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (7, N'Максим', N'Максимов', N'+79998887766', N'maxim@example.com', N'Парикмахер ', CAST(N'2019-07-01' AS Date), CAST(N'1990-12-12' AS Date), 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (8, N'Юлия ', N'Юльева ', N'6667778888 ', N'yulia@example.com ', N'Бровист/визажист ', CAST(N'2011-08-01' AS Date), CAST(N'1989-09-09' AS Date), 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (9, N'Денис ', N'Денисов ', N'9990001111 ', N'denis@example.com ', N'Массажист ', CAST(N'2014-09-01' AS Date), CAST(N'1985-06-15' AS Date), 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (10, N'Евгений ', N'Евгеньев ', N'+72223334455', N'evgeniy@example.com ', N'Мастер по депиляции ', CAST(N'2017-10-01' AS Date), CAST(N'1992-04-04' AS Date), 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Phone], [Email], [Position], [HireDate], [DateOfBirth], [RoleID]) VALUES (14, N'Михаил', N'Писецкий', N'+78889992211', N'mipi@gmail.com', N'Мастер по маникюру', CAST(N'2025-03-17' AS Date), CAST(N'2006-03-29' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (1, 1, 1, CAST(500.00 AS Decimal(10, 2)), CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (2, 2, 2, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2023-02-01T11:30:00.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (3, 3, 3, CAST(300.00 AS Decimal(10, 2)), CAST(N'2023-03-01T12:30:00.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (4, 4, 4, CAST(400.00 AS Decimal(10, 2)), CAST(N'2023-04-01T13:30:00.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (5, 5, 5, CAST(800.00 AS Decimal(10, 2)), CAST(N'2023-05-01T14:30:00.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (6, 6, 6, CAST(600.00 AS Decimal(10, 2)), CAST(N'2023-06-01T15:30:00.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (7, 7, 7, CAST(200.00 AS Decimal(10, 2)), CAST(N'2023-07-01T16:30:00.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (8, 8, 8, CAST(700.00 AS Decimal(10, 2)), CAST(N'2023-08-01T17:30:00.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (9, 9, 9, CAST(250.00 AS Decimal(10, 2)), CAST(N'2023-09-01T18:30:00.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [AppointmentID], [ServiceID], [Amount], [PaymentDate]) VALUES (10, 10, 10, CAST(1200.00 AS Decimal(10, 2)), CAST(N'2023-10-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (1, N'Шампунь ', CAST(200.00 AS Decimal(10, 2)), 50)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (2, N'Кондиционер ', CAST(250.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (3, N'Маска для волос ', CAST(300.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (4, N'Лак для ногтей ', CAST(150.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (5, N'Краска для волос ', CAST(500.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (6, N'Масло для тела ', CAST(400.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (7, N'Крем для рук ', CAST(100.00 AS Decimal(10, 2)), 60)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (8, N'Дезинфектант ', CAST(250.00 AS Decimal(10, 2)), 35)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (9, N'Мыло ', CAST(50.00 AS Decimal(10, 2)), 80)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (10, N'Влажные салфетки', CAST(100.00 AS Decimal(10, 2)), 45)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [StockQuantity]) VALUES (12, N'Манита крафт-пакет для стерилизации 75 х 150, 100 шт', CAST(150.00 AS Decimal(10, 2)), 20)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([PromotionID], [PromotionName], [DiscountPercentage], [StartDate], [EndDate]) VALUES (2, N'День святого Валентина', CAST(15.00 AS Decimal(5, 2)), CAST(N'2025-02-01' AS Date), CAST(N'2025-02-14' AS Date))
INSERT [dbo].[Promotions] ([PromotionID], [PromotionName], [DiscountPercentage], [StartDate], [EndDate]) VALUES (3, N'Мартовская распродажа', CAST(20.00 AS Decimal(5, 2)), CAST(N'2023-03-01' AS Date), CAST(N'2023-03-31' AS Date))
INSERT [dbo].[Promotions] ([PromotionID], [PromotionName], [DiscountPercentage], [StartDate], [EndDate]) VALUES (4, N'Апрельские скидки', CAST(12.00 AS Decimal(5, 2)), CAST(N'2023-04-01' AS Date), CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Promotions] ([PromotionID], [PromotionName], [DiscountPercentage], [StartDate], [EndDate]) VALUES (5, N'Майские праздники', CAST(18.00 AS Decimal(5, 2)), CAST(N'2023-05-01' AS Date), CAST(N'2023-05-10' AS Date))
INSERT [dbo].[Promotions] ([PromotionID], [PromotionName], [DiscountPercentage], [StartDate], [EndDate]) VALUES (6, N'Летняя распродажа', CAST(25.00 AS Decimal(5, 2)), CAST(N'2023-06-01' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Promotions] ([PromotionID], [PromotionName], [DiscountPercentage], [StartDate], [EndDate]) VALUES (1007, N'Светлые ночи', CAST(15.00 AS Decimal(5, 2)), CAST(N'2025-05-29' AS Date), CAST(N'2025-09-03' AS Date))
SET IDENTITY_INSERT [dbo].[Promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (1, 1, 1, 5, N'Отличная стрижка!')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (2, 2, 2, 4, N'Хорошее окрашивание!')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (3, 3, 3, 3, N'Маникюр нормальный.')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (4, 4, 4, 5, N'Педикюр супер!')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (5, 5, 5, 4, N'Массаж хороший.')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (6, 6, 6, 3, N'Уход за волосами нормальный.')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (7, 7, 7, 5, N'Удаление волос отличное!')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (8, 8, 8, 4, N'Коррекция бровей хорошая.')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (9, 9, 9, 3, N'Макияж нормальный.')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (10, 10, 10, 5, N'Все отлично!')
INSERT [dbo].[Reviews] ([ReviewID], [ClientID], [ServiceID], [Rating], [Comment]) VALUES (17, 2011, 1, 5, N'Был уже у этого мастера, все супер!!')
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Сотрудник')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (1, 1, 1, CAST(N'2025-01-01T10:45:00.000' AS DateTime), 2)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (2, 2, 2, CAST(N'2025-02-01T11:45:00.000' AS DateTime), 1)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (3, 3, 3, CAST(N'2025-03-01T12:45:00.000' AS DateTime), 3)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (4, 4, 4, CAST(N'2025-04-01T13:45:00.000' AS DateTime), 2)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (5, 5, 5, CAST(N'2025-05-01T14:45:00.000' AS DateTime), 1)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (6, 6, 6, CAST(N'2025-06-01T15:45:00.000' AS DateTime), 4)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (7, 7, 7, CAST(N'2025-07-01T16:45:00.000' AS DateTime), 3)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (8, 8, 8, CAST(N'2025-08-01T17:45:00.000' AS DateTime), 2)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (9, 9, 9, CAST(N'2025-09-01T18:45:00.000' AS DateTime), 1)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (10, 10, 2, CAST(N'2025-10-01T19:45:00.000' AS DateTime), 5)
INSERT [dbo].[Sales] ([SaleID], [EmployeeID], [ServiceID], [SaleDate], [QuantitySold]) VALUES (20, 14, 10, CAST(N'2025-03-20T00:00:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (1, N'Стрижка ', CAST(500.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (2, N'Окрашивание волос ', CAST(1000.00 AS Decimal(10, 2)), 60)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (3, N'Маникюр ', CAST(300.00 AS Decimal(10, 2)), 45)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (4, N'Педикюр ', CAST(400.00 AS Decimal(10, 2)), 60)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (5, N'Массаж тела ', CAST(800.00 AS Decimal(10, 2)), 90)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (6, N'Уход за волосами ', CAST(600.00 AS Decimal(10, 2)), 60)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (7, N'Уход за ногтями ', CAST(200.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (8, N'Удаление волос ', CAST(700.00 AS Decimal(10, 2)), 60)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (9, N'Коррекция бровей ', CAST(250.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (10, N'Макияж ', CAST(1200.00 AS Decimal(10, 2)), 90)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Price], [Duration]) VALUES (11, N'Татуаж', CAST(4000.00 AS Decimal(10, 2)), 120)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAccounts] ON 

INSERT [dbo].[UserAccounts] ([UserID], [Username], [PasswordHash], [RoleID], [ClientID], [EmployeeID]) VALUES (1, N'викс', N'4D6718C2655671AA200B0794D8051E86B8B03E78', 1, NULL, NULL)
INSERT [dbo].[UserAccounts] ([UserID], [Username], [PasswordHash], [RoleID], [ClientID], [EmployeeID]) VALUES (2, N'vladbez', N'D0BFDB4B133353817EDF8FE300BD00F5BE51238D', 3, 2011, NULL)
INSERT [dbo].[UserAccounts] ([UserID], [Username], [PasswordHash], [RoleID], [ClientID], [EmployeeID]) VALUES (1003, N'mipi11', N'57BFCB85C99BBDB65093ECE5A5F85D641C090826', 2, NULL, 14)
SET IDENTITY_INSERT [dbo].[UserAccounts] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserAcco__536C85E4CAB614A0]    Script Date: 24.03.2025 19:31:13 ******/
ALTER TABLE [dbo].[UserAccounts] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Promotions] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotions] ([PromotionID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Promotions]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserAccounts_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[UserAccounts] CHECK CONSTRAINT [FK_UserAccounts_Clients]
GO
ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserAccounts_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[UserAccounts] CHECK CONSTRAINT [FK_UserAccounts_Employees]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [salon_krasoti] SET  READ_WRITE 
GO
