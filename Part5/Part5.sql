USE [master]
GO
/****** Object:  Database [GameStoreDW]    Script Date: 2020/4/21 18:28:38 ******/
CREATE DATABASE [GameStoreDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GameStoreDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ECE9017\MSSQL\DATA\GameStoreDW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GameStoreDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ECE9017\MSSQL\DATA\GameStoreDW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GameStoreDW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameStoreDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameStoreDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameStoreDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameStoreDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameStoreDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameStoreDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameStoreDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GameStoreDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameStoreDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameStoreDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameStoreDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameStoreDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameStoreDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameStoreDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameStoreDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameStoreDW] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GameStoreDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameStoreDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameStoreDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameStoreDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameStoreDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameStoreDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameStoreDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameStoreDW] SET RECOVERY FULL 
GO
ALTER DATABASE [GameStoreDW] SET  MULTI_USER 
GO
ALTER DATABASE [GameStoreDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameStoreDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameStoreDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameStoreDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GameStoreDW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GameStoreDW', N'ON'
GO
ALTER DATABASE [GameStoreDW] SET QUERY_STORE = OFF
GO
USE [GameStoreDW]
GO
/****** Object:  User [LAPTOP-CBTP14GT\SQLServerMSASUser$LAPTOP-CBTP14GT$ECE9017]    Script Date: 2020/4/21 18:28:39 ******/
CREATE USER [LAPTOP-CBTP14GT\SQLServerMSASUser$LAPTOP-CBTP14GT$ECE9017] FOR LOGIN [LAPTOP-CBTP14GT\SQLServerMSASUser$LAPTOP-CBTP14GT$ECE9017]
GO
ALTER ROLE [db_datareader] ADD MEMBER [LAPTOP-CBTP14GT\SQLServerMSASUser$LAPTOP-CBTP14GT$ECE9017]
GO
USE [GameStoreDW]
GO
/****** Object:  Sequence [dbo].[InventoryKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE SEQUENCE [dbo].[InventoryKey] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [GameStoreDW]
GO
/****** Object:  Sequence [dbo].[OrderKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE SEQUENCE [dbo].[OrderKey] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [GameStoreDW]
GO
/****** Object:  Sequence [dbo].[PlatformKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE SEQUENCE [dbo].[PlatformKey] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [GameStoreDW]
GO
/****** Object:  Sequence [dbo].[StaffKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE SEQUENCE [dbo].[StaffKey] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [GameStoreDW]
GO
/****** Object:  Sequence [dbo].[StoreKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE SEQUENCE [dbo].[StoreKey] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 2020/4/21 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](256) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 2020/4/21 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[DateValue] [date] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Day] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[StartOfMonth] [date] NOT NULL,
	[EndOfMonth] [date] NOT NULL,
	[MonthName] [varchar](9) NOT NULL,
	[DayOfWeekName] [varchar](9) NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGame]    Script Date: 2020/4/21 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGame](
	[GameKey] [int] NOT NULL,
	[Rating] [int] NULL,
	[ReleaseDate] [date] NULL,
	[GameName] [nvarchar](100) NULL,
	[PlayerCount] [int] NULL,
	[RecommendationCount] [int] NULL,
 CONSTRAINT [PK_DimGame] PRIMARY KEY CLUSTERED 
(
	[GameKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimInventory]    Script Date: 2020/4/21 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimInventory](
	[InventoryKey] [int] NOT NULL,
	[StockQuantity] [int] NULL,
 CONSTRAINT [PK_DimInventory] PRIMARY KEY CLUSTERED 
(
	[InventoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimOrder]    Script Date: 2020/4/21 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimOrder](
	[OrderKey] [int] NOT NULL,
	[OrderDate] [date] NULL,
 CONSTRAINT [PK_Dimorder] PRIMARY KEY CLUSTERED 
(
	[OrderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPlatform]    Script Date: 2020/4/21 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPlatform](
	[PlatformKey] [int] NOT NULL,
	[PlatformName] [nvarchar](100) NULL,
 CONSTRAINT [PK_DimPlatform] PRIMARY KEY CLUSTERED 
(
	[PlatformKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStaff]    Script Date: 2020/4/21 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStaff](
	[StaffKey] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](256) NULL,
 CONSTRAINT [PK_DimStaff] PRIMARY KEY CLUSTERED 
(
	[StaffKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStore]    Script Date: 2020/4/21 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStore](
	[StoreKey] [int] NOT NULL,
	[StoreAddress] [varchar](300) NULL,
 CONSTRAINT [PK_DimStore] PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSale]    Script Date: 2020/4/21 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSale](
	[GameKey] [int] NOT NULL,
	[PlatformKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[StaffKey] [int] NOT NULL,
	[InventoryKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[OrderKey] [int] NOT NULL,
	[TotalQuantity] [int] NOT NULL,
	[TotalSale] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (1, N'MARY', N'SMITH', N'MARY.SMITH@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (2, N'PATRICIA', N'JOHNSON', N'PATRICIA.JOHNSON@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (3, N'LINDA', N'WILLIAMS', N'LINDA.WILLIAMS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (4, N'BARBARA', N'JONES', N'BARBARA.JONES@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (5, N'ELIZABETH', N'BROWN', N'ELIZABETH.BROWN@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (6, N'JENNIFER', N'DAVIS', N'JENNIFER.DAVIS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (7, N'MARIA', N'MILLER', N'MARIA.MILLER@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (8, N'SUSAN', N'WILSON', N'SUSAN.WILSON@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (9, N'MARGARET', N'MOORE', N'MARGARET.MOORE@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (10, N'DOROTHY', N'TAYLOR', N'DOROTHY.TAYLOR@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (11, N'LISA', N'ANDERSON', N'LISA.ANDERSON@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (12, N'NANCY', N'THOMAS', N'NANCY.THOMAS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (13, N'KAREN', N'JACKSON', N'KAREN.JACKSON@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (14, N'BETTY', N'WHITE', N'BETTY.WHITE@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (15, N'HELEN', N'HARRIS', N'HELEN.HARRIS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (16, N'SANDRA', N'MARTIN', N'SANDRA.MARTIN@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (17, N'DONNA', N'THOMPSON', N'DONNA.THOMPSON@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (18, N'CAROL', N'GARCIA', N'CAROL.GARCIA@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (19, N'RUTH', N'MARTINEZ', N'RUTH.MARTINEZ@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (20, N'SHARON', N'ROBINSON', N'SHARON.ROBINSON@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (21, N'MICHELLE', N'CLARK', N'MICHELLE.CLARK@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (22, N'LAURA', N'RODRIGUEZ', N'LAURA.RODRIGUEZ@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (23, N'SARAH', N'LEWIS', N'SARAH.LEWIS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (24, N'KIMBERLY', N'LEE', N'KIMBERLY.LEE@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (25, N'DEBORAH', N'WALKER', N'DEBORAH.WALKER@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (26, N'JESSICA', N'HALL', N'JESSICA.HALL@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (27, N'SHIRLEY', N'ALLEN', N'SHIRLEY.ALLEN@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (28, N'CYNTHIA', N'YOUNG', N'CYNTHIA.YOUNG@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (29, N'ANGELA', N'HERNANDEZ', N'ANGELA.HERNANDEZ@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (30, N'MELISSA', N'KING', N'MELISSA.KING@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (31, N'BRENDA', N'WRIGHT', N'BRENDA.WRIGHT@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (32, N'AMY', N'LOPEZ', N'AMY.LOPEZ@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (33, N'ANNA', N'HILL', N'ANNA.HILL@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (34, N'REBECCA', N'SCOTT', N'REBECCA.SCOTT@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (35, N'VIRGINIA', N'GREEN', N'VIRGINIA.GREEN@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (36, N'KATHLEEN', N'ADAMS', N'KATHLEEN.ADAMS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (37, N'PAMELA', N'BAKER', N'PAMELA.BAKER@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (38, N'MARTHA', N'GONZALEZ', N'MARTHA.GONZALEZ@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (39, N'DEBRA', N'NELSON', N'DEBRA.NELSON@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (40, N'AMANDA', N'CARTER', N'AMANDA.CARTER@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (41, N'STEPHANIE', N'MITCHELL', N'STEPHANIE.MITCHELL@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (42, N'CAROLYN', N'PEREZ', N'CAROLYN.PEREZ@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (43, N'CHRISTINE', N'ROBERTS', N'CHRISTINE.ROBERTS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (44, N'MARIE', N'TURNER', N'MARIE.TURNER@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (45, N'JANET', N'PHILLIPS', N'JANET.PHILLIPS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (46, N'CATHERINE', N'CAMPBELL', N'CATHERINE.CAMPBELL@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (47, N'FRANCES', N'PARKER', N'FRANCES.PARKER@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (48, N'ANN', N'EVANS', N'ANN.EVANS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimCustomer] ([CustomerKey], [FirstName], [LastName], [EmailAddress], [StartDate], [EndDate]) VALUES (49, N'JOYCE', N'EDWARDS', N'JOYCE.EDWARDS@gmail.com', CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050101, CAST(N'2005-01-01' AS Date), 2005, 1, 1, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050102, CAST(N'2005-01-02' AS Date), 2005, 1, 2, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050103, CAST(N'2005-01-03' AS Date), 2005, 1, 3, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050104, CAST(N'2005-01-04' AS Date), 2005, 1, 4, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050105, CAST(N'2005-01-05' AS Date), 2005, 1, 5, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050106, CAST(N'2005-01-06' AS Date), 2005, 1, 6, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050107, CAST(N'2005-01-07' AS Date), 2005, 1, 7, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050108, CAST(N'2005-01-08' AS Date), 2005, 1, 8, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050109, CAST(N'2005-01-09' AS Date), 2005, 1, 9, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050110, CAST(N'2005-01-10' AS Date), 2005, 1, 10, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050111, CAST(N'2005-01-11' AS Date), 2005, 1, 11, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050112, CAST(N'2005-01-12' AS Date), 2005, 1, 12, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050113, CAST(N'2005-01-13' AS Date), 2005, 1, 13, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050114, CAST(N'2005-01-14' AS Date), 2005, 1, 14, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050115, CAST(N'2005-01-15' AS Date), 2005, 1, 15, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050116, CAST(N'2005-01-16' AS Date), 2005, 1, 16, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050117, CAST(N'2005-01-17' AS Date), 2005, 1, 17, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050118, CAST(N'2005-01-18' AS Date), 2005, 1, 18, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050119, CAST(N'2005-01-19' AS Date), 2005, 1, 19, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050120, CAST(N'2005-01-20' AS Date), 2005, 1, 20, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050121, CAST(N'2005-01-21' AS Date), 2005, 1, 21, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050122, CAST(N'2005-01-22' AS Date), 2005, 1, 22, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050123, CAST(N'2005-01-23' AS Date), 2005, 1, 23, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050124, CAST(N'2005-01-24' AS Date), 2005, 1, 24, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050125, CAST(N'2005-01-25' AS Date), 2005, 1, 25, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050126, CAST(N'2005-01-26' AS Date), 2005, 1, 26, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050127, CAST(N'2005-01-27' AS Date), 2005, 1, 27, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050128, CAST(N'2005-01-28' AS Date), 2005, 1, 28, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050129, CAST(N'2005-01-29' AS Date), 2005, 1, 29, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050130, CAST(N'2005-01-30' AS Date), 2005, 1, 30, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050131, CAST(N'2005-01-31' AS Date), 2005, 1, 31, 1, CAST(N'2005-01-01' AS Date), CAST(N'2005-01-31' AS Date), N'January', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050201, CAST(N'2005-02-01' AS Date), 2005, 2, 1, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050202, CAST(N'2005-02-02' AS Date), 2005, 2, 2, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050203, CAST(N'2005-02-03' AS Date), 2005, 2, 3, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050204, CAST(N'2005-02-04' AS Date), 2005, 2, 4, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050205, CAST(N'2005-02-05' AS Date), 2005, 2, 5, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050206, CAST(N'2005-02-06' AS Date), 2005, 2, 6, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050207, CAST(N'2005-02-07' AS Date), 2005, 2, 7, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050208, CAST(N'2005-02-08' AS Date), 2005, 2, 8, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050209, CAST(N'2005-02-09' AS Date), 2005, 2, 9, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050210, CAST(N'2005-02-10' AS Date), 2005, 2, 10, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050211, CAST(N'2005-02-11' AS Date), 2005, 2, 11, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050212, CAST(N'2005-02-12' AS Date), 2005, 2, 12, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050213, CAST(N'2005-02-13' AS Date), 2005, 2, 13, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050214, CAST(N'2005-02-14' AS Date), 2005, 2, 14, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050215, CAST(N'2005-02-15' AS Date), 2005, 2, 15, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050216, CAST(N'2005-02-16' AS Date), 2005, 2, 16, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050217, CAST(N'2005-02-17' AS Date), 2005, 2, 17, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050218, CAST(N'2005-02-18' AS Date), 2005, 2, 18, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050219, CAST(N'2005-02-19' AS Date), 2005, 2, 19, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050220, CAST(N'2005-02-20' AS Date), 2005, 2, 20, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050221, CAST(N'2005-02-21' AS Date), 2005, 2, 21, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050222, CAST(N'2005-02-22' AS Date), 2005, 2, 22, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050223, CAST(N'2005-02-23' AS Date), 2005, 2, 23, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050224, CAST(N'2005-02-24' AS Date), 2005, 2, 24, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050225, CAST(N'2005-02-25' AS Date), 2005, 2, 25, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050226, CAST(N'2005-02-26' AS Date), 2005, 2, 26, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050227, CAST(N'2005-02-27' AS Date), 2005, 2, 27, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050228, CAST(N'2005-02-28' AS Date), 2005, 2, 28, 1, CAST(N'2005-02-01' AS Date), CAST(N'2005-02-28' AS Date), N'February', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050301, CAST(N'2005-03-01' AS Date), 2005, 3, 1, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050302, CAST(N'2005-03-02' AS Date), 2005, 3, 2, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050303, CAST(N'2005-03-03' AS Date), 2005, 3, 3, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050304, CAST(N'2005-03-04' AS Date), 2005, 3, 4, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050305, CAST(N'2005-03-05' AS Date), 2005, 3, 5, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050306, CAST(N'2005-03-06' AS Date), 2005, 3, 6, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050307, CAST(N'2005-03-07' AS Date), 2005, 3, 7, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050308, CAST(N'2005-03-08' AS Date), 2005, 3, 8, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050309, CAST(N'2005-03-09' AS Date), 2005, 3, 9, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050310, CAST(N'2005-03-10' AS Date), 2005, 3, 10, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050311, CAST(N'2005-03-11' AS Date), 2005, 3, 11, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050312, CAST(N'2005-03-12' AS Date), 2005, 3, 12, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050313, CAST(N'2005-03-13' AS Date), 2005, 3, 13, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050314, CAST(N'2005-03-14' AS Date), 2005, 3, 14, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050315, CAST(N'2005-03-15' AS Date), 2005, 3, 15, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050316, CAST(N'2005-03-16' AS Date), 2005, 3, 16, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050317, CAST(N'2005-03-17' AS Date), 2005, 3, 17, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050318, CAST(N'2005-03-18' AS Date), 2005, 3, 18, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050319, CAST(N'2005-03-19' AS Date), 2005, 3, 19, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050320, CAST(N'2005-03-20' AS Date), 2005, 3, 20, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050321, CAST(N'2005-03-21' AS Date), 2005, 3, 21, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050322, CAST(N'2005-03-22' AS Date), 2005, 3, 22, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050323, CAST(N'2005-03-23' AS Date), 2005, 3, 23, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050324, CAST(N'2005-03-24' AS Date), 2005, 3, 24, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050325, CAST(N'2005-03-25' AS Date), 2005, 3, 25, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050326, CAST(N'2005-03-26' AS Date), 2005, 3, 26, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050327, CAST(N'2005-03-27' AS Date), 2005, 3, 27, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050328, CAST(N'2005-03-28' AS Date), 2005, 3, 28, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050329, CAST(N'2005-03-29' AS Date), 2005, 3, 29, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050330, CAST(N'2005-03-30' AS Date), 2005, 3, 30, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050331, CAST(N'2005-03-31' AS Date), 2005, 3, 31, 1, CAST(N'2005-03-01' AS Date), CAST(N'2005-03-31' AS Date), N'March', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050401, CAST(N'2005-04-01' AS Date), 2005, 4, 1, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050402, CAST(N'2005-04-02' AS Date), 2005, 4, 2, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050403, CAST(N'2005-04-03' AS Date), 2005, 4, 3, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050404, CAST(N'2005-04-04' AS Date), 2005, 4, 4, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050405, CAST(N'2005-04-05' AS Date), 2005, 4, 5, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050406, CAST(N'2005-04-06' AS Date), 2005, 4, 6, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050407, CAST(N'2005-04-07' AS Date), 2005, 4, 7, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050408, CAST(N'2005-04-08' AS Date), 2005, 4, 8, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050409, CAST(N'2005-04-09' AS Date), 2005, 4, 9, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050410, CAST(N'2005-04-10' AS Date), 2005, 4, 10, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Sunday')
GO
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050411, CAST(N'2005-04-11' AS Date), 2005, 4, 11, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050412, CAST(N'2005-04-12' AS Date), 2005, 4, 12, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050413, CAST(N'2005-04-13' AS Date), 2005, 4, 13, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050414, CAST(N'2005-04-14' AS Date), 2005, 4, 14, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050415, CAST(N'2005-04-15' AS Date), 2005, 4, 15, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050416, CAST(N'2005-04-16' AS Date), 2005, 4, 16, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050417, CAST(N'2005-04-17' AS Date), 2005, 4, 17, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050418, CAST(N'2005-04-18' AS Date), 2005, 4, 18, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050419, CAST(N'2005-04-19' AS Date), 2005, 4, 19, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050420, CAST(N'2005-04-20' AS Date), 2005, 4, 20, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050421, CAST(N'2005-04-21' AS Date), 2005, 4, 21, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050422, CAST(N'2005-04-22' AS Date), 2005, 4, 22, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050423, CAST(N'2005-04-23' AS Date), 2005, 4, 23, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050424, CAST(N'2005-04-24' AS Date), 2005, 4, 24, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050425, CAST(N'2005-04-25' AS Date), 2005, 4, 25, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050426, CAST(N'2005-04-26' AS Date), 2005, 4, 26, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050427, CAST(N'2005-04-27' AS Date), 2005, 4, 27, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050428, CAST(N'2005-04-28' AS Date), 2005, 4, 28, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050429, CAST(N'2005-04-29' AS Date), 2005, 4, 29, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050430, CAST(N'2005-04-30' AS Date), 2005, 4, 30, 2, CAST(N'2005-04-01' AS Date), CAST(N'2005-04-30' AS Date), N'April', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050501, CAST(N'2005-05-01' AS Date), 2005, 5, 1, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050502, CAST(N'2005-05-02' AS Date), 2005, 5, 2, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050503, CAST(N'2005-05-03' AS Date), 2005, 5, 3, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050504, CAST(N'2005-05-04' AS Date), 2005, 5, 4, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050505, CAST(N'2005-05-05' AS Date), 2005, 5, 5, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050506, CAST(N'2005-05-06' AS Date), 2005, 5, 6, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050507, CAST(N'2005-05-07' AS Date), 2005, 5, 7, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050508, CAST(N'2005-05-08' AS Date), 2005, 5, 8, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050509, CAST(N'2005-05-09' AS Date), 2005, 5, 9, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050510, CAST(N'2005-05-10' AS Date), 2005, 5, 10, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050511, CAST(N'2005-05-11' AS Date), 2005, 5, 11, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050512, CAST(N'2005-05-12' AS Date), 2005, 5, 12, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050513, CAST(N'2005-05-13' AS Date), 2005, 5, 13, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050514, CAST(N'2005-05-14' AS Date), 2005, 5, 14, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050515, CAST(N'2005-05-15' AS Date), 2005, 5, 15, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050516, CAST(N'2005-05-16' AS Date), 2005, 5, 16, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050517, CAST(N'2005-05-17' AS Date), 2005, 5, 17, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050518, CAST(N'2005-05-18' AS Date), 2005, 5, 18, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050519, CAST(N'2005-05-19' AS Date), 2005, 5, 19, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050520, CAST(N'2005-05-20' AS Date), 2005, 5, 20, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050521, CAST(N'2005-05-21' AS Date), 2005, 5, 21, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050522, CAST(N'2005-05-22' AS Date), 2005, 5, 22, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050523, CAST(N'2005-05-23' AS Date), 2005, 5, 23, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050524, CAST(N'2005-05-24' AS Date), 2005, 5, 24, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050525, CAST(N'2005-05-25' AS Date), 2005, 5, 25, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050526, CAST(N'2005-05-26' AS Date), 2005, 5, 26, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050527, CAST(N'2005-05-27' AS Date), 2005, 5, 27, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050528, CAST(N'2005-05-28' AS Date), 2005, 5, 28, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050529, CAST(N'2005-05-29' AS Date), 2005, 5, 29, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050530, CAST(N'2005-05-30' AS Date), 2005, 5, 30, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050531, CAST(N'2005-05-31' AS Date), 2005, 5, 31, 2, CAST(N'2005-05-01' AS Date), CAST(N'2005-05-31' AS Date), N'May', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050601, CAST(N'2005-06-01' AS Date), 2005, 6, 1, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050602, CAST(N'2005-06-02' AS Date), 2005, 6, 2, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050603, CAST(N'2005-06-03' AS Date), 2005, 6, 3, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050604, CAST(N'2005-06-04' AS Date), 2005, 6, 4, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050605, CAST(N'2005-06-05' AS Date), 2005, 6, 5, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050606, CAST(N'2005-06-06' AS Date), 2005, 6, 6, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050607, CAST(N'2005-06-07' AS Date), 2005, 6, 7, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050608, CAST(N'2005-06-08' AS Date), 2005, 6, 8, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050609, CAST(N'2005-06-09' AS Date), 2005, 6, 9, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050610, CAST(N'2005-06-10' AS Date), 2005, 6, 10, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050611, CAST(N'2005-06-11' AS Date), 2005, 6, 11, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050612, CAST(N'2005-06-12' AS Date), 2005, 6, 12, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050613, CAST(N'2005-06-13' AS Date), 2005, 6, 13, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050614, CAST(N'2005-06-14' AS Date), 2005, 6, 14, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050615, CAST(N'2005-06-15' AS Date), 2005, 6, 15, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050616, CAST(N'2005-06-16' AS Date), 2005, 6, 16, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050617, CAST(N'2005-06-17' AS Date), 2005, 6, 17, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050618, CAST(N'2005-06-18' AS Date), 2005, 6, 18, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050619, CAST(N'2005-06-19' AS Date), 2005, 6, 19, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050620, CAST(N'2005-06-20' AS Date), 2005, 6, 20, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050621, CAST(N'2005-06-21' AS Date), 2005, 6, 21, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050622, CAST(N'2005-06-22' AS Date), 2005, 6, 22, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050623, CAST(N'2005-06-23' AS Date), 2005, 6, 23, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050624, CAST(N'2005-06-24' AS Date), 2005, 6, 24, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050625, CAST(N'2005-06-25' AS Date), 2005, 6, 25, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050626, CAST(N'2005-06-26' AS Date), 2005, 6, 26, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050627, CAST(N'2005-06-27' AS Date), 2005, 6, 27, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050628, CAST(N'2005-06-28' AS Date), 2005, 6, 28, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050629, CAST(N'2005-06-29' AS Date), 2005, 6, 29, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050630, CAST(N'2005-06-30' AS Date), 2005, 6, 30, 2, CAST(N'2005-06-01' AS Date), CAST(N'2005-06-30' AS Date), N'June', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050701, CAST(N'2005-07-01' AS Date), 2005, 7, 1, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050702, CAST(N'2005-07-02' AS Date), 2005, 7, 2, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050703, CAST(N'2005-07-03' AS Date), 2005, 7, 3, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050704, CAST(N'2005-07-04' AS Date), 2005, 7, 4, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050705, CAST(N'2005-07-05' AS Date), 2005, 7, 5, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050706, CAST(N'2005-07-06' AS Date), 2005, 7, 6, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050707, CAST(N'2005-07-07' AS Date), 2005, 7, 7, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050708, CAST(N'2005-07-08' AS Date), 2005, 7, 8, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050709, CAST(N'2005-07-09' AS Date), 2005, 7, 9, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050710, CAST(N'2005-07-10' AS Date), 2005, 7, 10, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050711, CAST(N'2005-07-11' AS Date), 2005, 7, 11, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050712, CAST(N'2005-07-12' AS Date), 2005, 7, 12, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050713, CAST(N'2005-07-13' AS Date), 2005, 7, 13, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050714, CAST(N'2005-07-14' AS Date), 2005, 7, 14, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050715, CAST(N'2005-07-15' AS Date), 2005, 7, 15, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050716, CAST(N'2005-07-16' AS Date), 2005, 7, 16, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050717, CAST(N'2005-07-17' AS Date), 2005, 7, 17, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050718, CAST(N'2005-07-18' AS Date), 2005, 7, 18, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050719, CAST(N'2005-07-19' AS Date), 2005, 7, 19, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Tuesday')
GO
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050720, CAST(N'2005-07-20' AS Date), 2005, 7, 20, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050721, CAST(N'2005-07-21' AS Date), 2005, 7, 21, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050722, CAST(N'2005-07-22' AS Date), 2005, 7, 22, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050723, CAST(N'2005-07-23' AS Date), 2005, 7, 23, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050724, CAST(N'2005-07-24' AS Date), 2005, 7, 24, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050725, CAST(N'2005-07-25' AS Date), 2005, 7, 25, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050726, CAST(N'2005-07-26' AS Date), 2005, 7, 26, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050727, CAST(N'2005-07-27' AS Date), 2005, 7, 27, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050728, CAST(N'2005-07-28' AS Date), 2005, 7, 28, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050729, CAST(N'2005-07-29' AS Date), 2005, 7, 29, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050730, CAST(N'2005-07-30' AS Date), 2005, 7, 30, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050731, CAST(N'2005-07-31' AS Date), 2005, 7, 31, 3, CAST(N'2005-07-01' AS Date), CAST(N'2005-07-31' AS Date), N'July', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050801, CAST(N'2005-08-01' AS Date), 2005, 8, 1, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050802, CAST(N'2005-08-02' AS Date), 2005, 8, 2, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050803, CAST(N'2005-08-03' AS Date), 2005, 8, 3, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050804, CAST(N'2005-08-04' AS Date), 2005, 8, 4, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050805, CAST(N'2005-08-05' AS Date), 2005, 8, 5, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050806, CAST(N'2005-08-06' AS Date), 2005, 8, 6, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050807, CAST(N'2005-08-07' AS Date), 2005, 8, 7, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050808, CAST(N'2005-08-08' AS Date), 2005, 8, 8, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050809, CAST(N'2005-08-09' AS Date), 2005, 8, 9, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050810, CAST(N'2005-08-10' AS Date), 2005, 8, 10, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050811, CAST(N'2005-08-11' AS Date), 2005, 8, 11, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050812, CAST(N'2005-08-12' AS Date), 2005, 8, 12, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050813, CAST(N'2005-08-13' AS Date), 2005, 8, 13, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050814, CAST(N'2005-08-14' AS Date), 2005, 8, 14, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050815, CAST(N'2005-08-15' AS Date), 2005, 8, 15, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050816, CAST(N'2005-08-16' AS Date), 2005, 8, 16, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050817, CAST(N'2005-08-17' AS Date), 2005, 8, 17, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050818, CAST(N'2005-08-18' AS Date), 2005, 8, 18, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050819, CAST(N'2005-08-19' AS Date), 2005, 8, 19, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050820, CAST(N'2005-08-20' AS Date), 2005, 8, 20, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050821, CAST(N'2005-08-21' AS Date), 2005, 8, 21, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050822, CAST(N'2005-08-22' AS Date), 2005, 8, 22, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050823, CAST(N'2005-08-23' AS Date), 2005, 8, 23, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050824, CAST(N'2005-08-24' AS Date), 2005, 8, 24, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050825, CAST(N'2005-08-25' AS Date), 2005, 8, 25, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050826, CAST(N'2005-08-26' AS Date), 2005, 8, 26, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050827, CAST(N'2005-08-27' AS Date), 2005, 8, 27, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050828, CAST(N'2005-08-28' AS Date), 2005, 8, 28, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050829, CAST(N'2005-08-29' AS Date), 2005, 8, 29, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050830, CAST(N'2005-08-30' AS Date), 2005, 8, 30, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050831, CAST(N'2005-08-31' AS Date), 2005, 8, 31, 3, CAST(N'2005-08-01' AS Date), CAST(N'2005-08-31' AS Date), N'August', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050901, CAST(N'2005-09-01' AS Date), 2005, 9, 1, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050902, CAST(N'2005-09-02' AS Date), 2005, 9, 2, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050903, CAST(N'2005-09-03' AS Date), 2005, 9, 3, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050904, CAST(N'2005-09-04' AS Date), 2005, 9, 4, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050905, CAST(N'2005-09-05' AS Date), 2005, 9, 5, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050906, CAST(N'2005-09-06' AS Date), 2005, 9, 6, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050907, CAST(N'2005-09-07' AS Date), 2005, 9, 7, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050908, CAST(N'2005-09-08' AS Date), 2005, 9, 8, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050909, CAST(N'2005-09-09' AS Date), 2005, 9, 9, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050910, CAST(N'2005-09-10' AS Date), 2005, 9, 10, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050911, CAST(N'2005-09-11' AS Date), 2005, 9, 11, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050912, CAST(N'2005-09-12' AS Date), 2005, 9, 12, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050913, CAST(N'2005-09-13' AS Date), 2005, 9, 13, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050914, CAST(N'2005-09-14' AS Date), 2005, 9, 14, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050915, CAST(N'2005-09-15' AS Date), 2005, 9, 15, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050916, CAST(N'2005-09-16' AS Date), 2005, 9, 16, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050917, CAST(N'2005-09-17' AS Date), 2005, 9, 17, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050918, CAST(N'2005-09-18' AS Date), 2005, 9, 18, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050919, CAST(N'2005-09-19' AS Date), 2005, 9, 19, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050920, CAST(N'2005-09-20' AS Date), 2005, 9, 20, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050921, CAST(N'2005-09-21' AS Date), 2005, 9, 21, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050922, CAST(N'2005-09-22' AS Date), 2005, 9, 22, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050923, CAST(N'2005-09-23' AS Date), 2005, 9, 23, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050924, CAST(N'2005-09-24' AS Date), 2005, 9, 24, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050925, CAST(N'2005-09-25' AS Date), 2005, 9, 25, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050926, CAST(N'2005-09-26' AS Date), 2005, 9, 26, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050927, CAST(N'2005-09-27' AS Date), 2005, 9, 27, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050928, CAST(N'2005-09-28' AS Date), 2005, 9, 28, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050929, CAST(N'2005-09-29' AS Date), 2005, 9, 29, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20050930, CAST(N'2005-09-30' AS Date), 2005, 9, 30, 3, CAST(N'2005-09-01' AS Date), CAST(N'2005-09-30' AS Date), N'September', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051001, CAST(N'2005-10-01' AS Date), 2005, 10, 1, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051002, CAST(N'2005-10-02' AS Date), 2005, 10, 2, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051003, CAST(N'2005-10-03' AS Date), 2005, 10, 3, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051004, CAST(N'2005-10-04' AS Date), 2005, 10, 4, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051005, CAST(N'2005-10-05' AS Date), 2005, 10, 5, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051006, CAST(N'2005-10-06' AS Date), 2005, 10, 6, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051007, CAST(N'2005-10-07' AS Date), 2005, 10, 7, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051008, CAST(N'2005-10-08' AS Date), 2005, 10, 8, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051009, CAST(N'2005-10-09' AS Date), 2005, 10, 9, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051010, CAST(N'2005-10-10' AS Date), 2005, 10, 10, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051011, CAST(N'2005-10-11' AS Date), 2005, 10, 11, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051012, CAST(N'2005-10-12' AS Date), 2005, 10, 12, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051013, CAST(N'2005-10-13' AS Date), 2005, 10, 13, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051014, CAST(N'2005-10-14' AS Date), 2005, 10, 14, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051015, CAST(N'2005-10-15' AS Date), 2005, 10, 15, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051016, CAST(N'2005-10-16' AS Date), 2005, 10, 16, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051017, CAST(N'2005-10-17' AS Date), 2005, 10, 17, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051018, CAST(N'2005-10-18' AS Date), 2005, 10, 18, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051019, CAST(N'2005-10-19' AS Date), 2005, 10, 19, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051020, CAST(N'2005-10-20' AS Date), 2005, 10, 20, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051021, CAST(N'2005-10-21' AS Date), 2005, 10, 21, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051022, CAST(N'2005-10-22' AS Date), 2005, 10, 22, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051023, CAST(N'2005-10-23' AS Date), 2005, 10, 23, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051024, CAST(N'2005-10-24' AS Date), 2005, 10, 24, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051025, CAST(N'2005-10-25' AS Date), 2005, 10, 25, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051026, CAST(N'2005-10-26' AS Date), 2005, 10, 26, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051027, CAST(N'2005-10-27' AS Date), 2005, 10, 27, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Thursday')
GO
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051028, CAST(N'2005-10-28' AS Date), 2005, 10, 28, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051029, CAST(N'2005-10-29' AS Date), 2005, 10, 29, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051030, CAST(N'2005-10-30' AS Date), 2005, 10, 30, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051031, CAST(N'2005-10-31' AS Date), 2005, 10, 31, 4, CAST(N'2005-10-01' AS Date), CAST(N'2005-10-31' AS Date), N'October', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051101, CAST(N'2005-11-01' AS Date), 2005, 11, 1, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051102, CAST(N'2005-11-02' AS Date), 2005, 11, 2, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051103, CAST(N'2005-11-03' AS Date), 2005, 11, 3, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051104, CAST(N'2005-11-04' AS Date), 2005, 11, 4, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051105, CAST(N'2005-11-05' AS Date), 2005, 11, 5, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051106, CAST(N'2005-11-06' AS Date), 2005, 11, 6, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051107, CAST(N'2005-11-07' AS Date), 2005, 11, 7, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051108, CAST(N'2005-11-08' AS Date), 2005, 11, 8, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051109, CAST(N'2005-11-09' AS Date), 2005, 11, 9, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051110, CAST(N'2005-11-10' AS Date), 2005, 11, 10, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051111, CAST(N'2005-11-11' AS Date), 2005, 11, 11, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051112, CAST(N'2005-11-12' AS Date), 2005, 11, 12, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051113, CAST(N'2005-11-13' AS Date), 2005, 11, 13, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051114, CAST(N'2005-11-14' AS Date), 2005, 11, 14, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051115, CAST(N'2005-11-15' AS Date), 2005, 11, 15, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051116, CAST(N'2005-11-16' AS Date), 2005, 11, 16, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051117, CAST(N'2005-11-17' AS Date), 2005, 11, 17, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051118, CAST(N'2005-11-18' AS Date), 2005, 11, 18, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051119, CAST(N'2005-11-19' AS Date), 2005, 11, 19, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051120, CAST(N'2005-11-20' AS Date), 2005, 11, 20, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051121, CAST(N'2005-11-21' AS Date), 2005, 11, 21, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051122, CAST(N'2005-11-22' AS Date), 2005, 11, 22, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051123, CAST(N'2005-11-23' AS Date), 2005, 11, 23, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051124, CAST(N'2005-11-24' AS Date), 2005, 11, 24, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051125, CAST(N'2005-11-25' AS Date), 2005, 11, 25, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051126, CAST(N'2005-11-26' AS Date), 2005, 11, 26, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051127, CAST(N'2005-11-27' AS Date), 2005, 11, 27, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051128, CAST(N'2005-11-28' AS Date), 2005, 11, 28, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051129, CAST(N'2005-11-29' AS Date), 2005, 11, 29, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051130, CAST(N'2005-11-30' AS Date), 2005, 11, 30, 4, CAST(N'2005-11-01' AS Date), CAST(N'2005-11-30' AS Date), N'November', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051201, CAST(N'2005-12-01' AS Date), 2005, 12, 1, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051202, CAST(N'2005-12-02' AS Date), 2005, 12, 2, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051203, CAST(N'2005-12-03' AS Date), 2005, 12, 3, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051204, CAST(N'2005-12-04' AS Date), 2005, 12, 4, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051205, CAST(N'2005-12-05' AS Date), 2005, 12, 5, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051206, CAST(N'2005-12-06' AS Date), 2005, 12, 6, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051207, CAST(N'2005-12-07' AS Date), 2005, 12, 7, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051208, CAST(N'2005-12-08' AS Date), 2005, 12, 8, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051209, CAST(N'2005-12-09' AS Date), 2005, 12, 9, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051210, CAST(N'2005-12-10' AS Date), 2005, 12, 10, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051211, CAST(N'2005-12-11' AS Date), 2005, 12, 11, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051212, CAST(N'2005-12-12' AS Date), 2005, 12, 12, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051213, CAST(N'2005-12-13' AS Date), 2005, 12, 13, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051214, CAST(N'2005-12-14' AS Date), 2005, 12, 14, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051215, CAST(N'2005-12-15' AS Date), 2005, 12, 15, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051216, CAST(N'2005-12-16' AS Date), 2005, 12, 16, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051217, CAST(N'2005-12-17' AS Date), 2005, 12, 17, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051218, CAST(N'2005-12-18' AS Date), 2005, 12, 18, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051219, CAST(N'2005-12-19' AS Date), 2005, 12, 19, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051220, CAST(N'2005-12-20' AS Date), 2005, 12, 20, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051221, CAST(N'2005-12-21' AS Date), 2005, 12, 21, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051222, CAST(N'2005-12-22' AS Date), 2005, 12, 22, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051223, CAST(N'2005-12-23' AS Date), 2005, 12, 23, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051224, CAST(N'2005-12-24' AS Date), 2005, 12, 24, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Saturday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051225, CAST(N'2005-12-25' AS Date), 2005, 12, 25, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Sunday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051226, CAST(N'2005-12-26' AS Date), 2005, 12, 26, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Monday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051227, CAST(N'2005-12-27' AS Date), 2005, 12, 27, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Tuesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051228, CAST(N'2005-12-28' AS Date), 2005, 12, 28, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Wednesday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051229, CAST(N'2005-12-29' AS Date), 2005, 12, 29, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Thursday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051230, CAST(N'2005-12-30' AS Date), 2005, 12, 30, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Friday')
INSERT [dbo].[DimDate] ([DateKey], [DateValue], [Year], [Month], [Day], [Quarter], [StartOfMonth], [EndOfMonth], [MonthName], [DayOfWeekName]) VALUES (20051231, CAST(N'2005-12-31' AS Date), 2005, 12, 31, 4, CAST(N'2005-12-01' AS Date), CAST(N'2005-12-31' AS Date), N'December', N'Saturday')
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (1, 5, CAST(N'2000-11-01' AS Date), N' Counter-Strike', 9140731, 68991)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (2, 5, CAST(N'1999-04-01' AS Date), N' Team Fortress Classic', 753627, 2439)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (3, 5, CAST(N'2003-05-01' AS Date), N' Day of Defeat', 1709740, 2319)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (4, 5, CAST(N'2001-06-01' AS Date), N' Deathmatch Classic', 789676, 888)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (5, 5, CAST(N'1999-11-01' AS Date), N' Half-Life: Opposing Force', 705741, 2934)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (6, 5, CAST(N'2000-11-01' AS Date), N' Ricochet', 843481, 1965)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (7, 5, CAST(N'1998-11-08' AS Date), N' Half-Life', 2268772, 12486)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (8, 5, CAST(N'2004-03-01' AS Date), N' Counter-Strike: Condition Zero', 4127910, 7067)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (9, 5, CAST(N'2004-03-01' AS Date), N' Counter-Strike: Condition Zero Deleted Scenes', 1870437, 7073)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (10, 5, CAST(N'2001-06-01' AS Date), N' Half-Life: Blue Shift', 662517, 2219)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (11, 5, CAST(N'2004-11-16' AS Date), N' Half-Life 2', 5695963, 35792)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (12, 5, CAST(N'2004-11-01' AS Date), N' Counter-Strike: Source', 11472993, 53931)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (13, 5, CAST(N'2004-06-01' AS Date), N' Half-Life: Source', 695697, 2547)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (14, 5, CAST(N'2010-07-12' AS Date), N' Day of Defeat: Source', 2895778, 7185)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (15, 5, CAST(N'2004-11-01' AS Date), N' Half-Life 2: Deathmatch', 3598829, 4328)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (16, 5, CAST(N'2005-10-27' AS Date), N' Half-Life 2: Lost Coast', 2885376, 4352)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (17, 5, CAST(N'2006-05-01' AS Date), N' Half-Life Deathmatch: Source', 388292, 864)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (18, 5, CAST(N'2006-06-01' AS Date), N' Half-Life 2: Episode One', 2478611, 4437)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (19, 5, CAST(N'2007-10-10' AS Date), N' Portal', 6864247, 27535)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (20, 5, CAST(N'2007-10-10' AS Date), N' Half-Life 2: Episode Two', 2240435, 6104)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (21, 5, CAST(N'2007-10-10' AS Date), N' Team Fortress 2', 37878812, 383949)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (22, 5, CAST(N'2008-11-17' AS Date), N' Left 4 Dead', 3107949, 9980)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (23, 5, CAST(N'2009-11-16' AS Date), N' Left 4 Dead 2', 13583400, 140726)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (24, 5, CAST(N'2013-07-09' AS Date), N' Dota 2', 90687580, 590480)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (25, 5, CAST(N'2011-04-18' AS Date), N' Portal 2', 7282849, 73128)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (26, 5, CAST(N'2010-07-19' AS Date), N' Alien Swarm', 4819841, 14625)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (27, 5, CAST(N'2011-04-18' AS Date), N' Portal 2 - Pre-order', 0, 73144)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (28, 5, CAST(N'2012-08-21' AS Date), N' Counter-Strike: Global Offensive', 25150372, 1427633)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (29, 5, CAST(N'2005-10-12' AS Date), N' Rag Doll Kung Fu', 12913, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (30, 5, CAST(N'2006-03-14' AS Date), N' Red Orchestra: Ostfront 41-45', 515451, 1220)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (31, 5, CAST(N'2009-05-14' AS Date), N' Killing Floor', 2989220, 44364)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (32, 5, CAST(N'2006-05-10' AS Date), N' SiN Episodes: Emergence', 69767, 385)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (33, 5, CAST(N'2006-05-10' AS Date), N' SiN Multiplayer', 10761, 386)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (34, 5, CAST(N'2006-05-10' AS Date), N' SiN', 44658, 386)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (35, 5, CAST(N'2005-07-14' AS Date), N' Darwinia', 214861, 444)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (36, 5, CAST(N'2006-08-23' AS Date), N' Uplink', 314938, 1240)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (37, 5, CAST(N'2006-09-29' AS Date), N' DEFCON', 451423, 1655)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (38, 5, CAST(N'2008-09-19' AS Date), N' Multiwinia', 139534, 340)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (39, 5, CAST(N'2006-02-07' AS Date), N' Dangerous Waters', 22957, 112)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (40, 5, CAST(N'2006-02-07' AS Date), N' Space Empires IV Deluxe', 31566, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (41, 5, CAST(N'2006-07-06' AS Date), N' Jagged Alliance 2', 0, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (42, 5, CAST(N'2006-07-06' AS Date), N' Disciples II: Rise of the Elves', 48783, 299)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (43, 5, CAST(N'2006-07-06' AS Date), N' Disciples II: Galleans Return', 60800, 400)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (44, 5, CAST(N'2006-07-26' AS Date), N' Iron Warriors: T-72 Tank Command', 17218, 210)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (45, 5, CAST(N'2006-10-16' AS Date), N' Space Empires V', 38740, 204)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (46, 5, CAST(N'2007-04-03' AS Date), N' Arx Fatalis', 57033, 389)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (47, 5, CAST(N'2012-07-10' AS Date), N' Source Filmmaker', 1146403, 10079)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (48, 5, CAST(N'2006-04-01' AS Date), N' Earth 2160', 94876, 412)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (49, 5, CAST(N'2009-04-30' AS Date), N' Two Worlds: Epic Edition', 416629, 2399)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (50, 5, CAST(N'2006-10-25' AS Date), N' Dark Messiah of Might & Magic Single Player', 405509, 2776)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (51, 5, CAST(N'2006-10-25' AS Date), N' Dark Messiah of Might & Magic Multi-Player', 190649, 2777)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (52, 5, CAST(N'2007-08-03' AS Date), N' Quake III Arena', 141686, 656)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (53, 5, CAST(N'2011-08-04' AS Date), N' Quake 4', 93082, 509)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (54, 5, CAST(N'2007-08-03' AS Date), N' Wolfenstein 3D', 134871, 1061)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (55, 5, CAST(N'2007-08-03' AS Date), N' The Ultimate DOOM', 234051, 2000)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (56, 5, CAST(N'2007-08-03' AS Date), N' Final DOOM', 116577, 389)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (57, 5, CAST(N'2007-08-03' AS Date), N' DOOM II: Hell on Earth', 194594, 1279)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (58, 5, CAST(N'2007-08-03' AS Date), N' Quake', 181860, 1266)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (59, 5, CAST(N'2007-08-03' AS Date), N' Quake II', 140969, 660)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (60, 5, CAST(N'2007-08-03' AS Date), N' Quake II: The Reckoning', 18114, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (61, 5, CAST(N'2007-08-03' AS Date), N' Quake II: Ground Zero', 22239, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (62, 5, CAST(N'2007-08-03' AS Date), N' Quake III: Team Arena', 51115, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (63, 5, CAST(N'2007-08-03' AS Date), N' HeXen: Beyond Heretic', 37305, 158)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (64, 5, CAST(N'2007-08-03' AS Date), N' HeXen: Deathkings of the Dark Citadel', 17038, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (65, 5, CAST(N'2007-08-03' AS Date), N' Heretic: Shadow of the Serpent Riders', 46452, 241)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (66, 5, CAST(N'2006-07-11' AS Date), N' The Ship', 928313, 5026)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (67, 5, CAST(N'2006-11-20' AS Date), N' The Ship Single Player', 366411, 706)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (68, 5, CAST(N'2010-10-29' AS Date), N' Bloody Good Time', 90392, 716)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (69, 5, CAST(N'2006-05-08' AS Date), N' Shadowgrounds', 245530, 973)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (70, 5, CAST(N'2006-12-19' AS Date), N' Gumboy: Crazy Adventures', 17397, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (71, 5, CAST(N'2006-12-19' AS Date), N' Gumboy Crazy Features', 9326, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (72, 5, CAST(N'2007-06-01' AS Date), N' RIP', 34614, 291)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (73, 5, CAST(N'2007-06-01' AS Date), N' RIP 2: Strike Back', 15603, 291)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (74, 5, CAST(N'2007-06-01' AS Date), N' RIP 3: The Last Hero', 25109, 291)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (75, 5, CAST(N'2007-06-29' AS Date), N' Vigil: Blood Bitterness', 19908, 129)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (76, 5, CAST(N'2007-11-07' AS Date), N' Alpha Prime', 64207, 984)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (77, 5, CAST(N'2007-03-22' AS Date), N' Vampire: The Masquerade - Bloodlines', 407303, 3983)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (78, 5, CAST(N'2006-10-13' AS Date), N' GUN', 43044, 351)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (79, 5, CAST(N'2006-10-13' AS Date), N' Call of Duty', 158007, 851)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (80, 5, CAST(N'2006-10-13' AS Date), N' Call of Duty 2', 255573, 1307)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (81, 5, CAST(N'2006-10-13' AS Date), N' Call of Duty: United Offensive', 96311, 318)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (82, 5, CAST(N'2008-03-12' AS Date), N' RollerCoaster Tycoon 3: Platinum!', 722779, 2579)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (83, 5, CAST(N'2008-03-12' AS Date), N' Act of War: Direct Action', 15962, 109)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (84, 5, CAST(N'2007-07-12' AS Date), N' ThreadSpace: Hyperbol', 5201, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (85, 5, CAST(N'2008-03-12' AS Date), N' Arma: Combat Operations', 28158, 181)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (86, 5, CAST(N'2006-07-21' AS Date), N' X2: The Threat', 54881, 183)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (87, 5, CAST(N'2006-07-21' AS Date), N' X3: Reunion', 139713, 280)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (88, 5, CAST(N'2008-10-16' AS Date), N' X3: Terran Conflict', 319960, 1262)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (89, 5, CAST(N'2010-10-08' AS Date), N' X: Beyond the Frontier', 54522, 136)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (90, 5, CAST(N'2010-10-08' AS Date), N' X-Tension', 26006, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (91, 5, CAST(N'2013-11-15' AS Date), N' X Rebirth', 200513, 5637)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (92, 5, CAST(N'2006-10-26' AS Date), N' 688(I) Hunter/Killer', 16321, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (93, 5, CAST(N'2006-10-26' AS Date), N' Fleet Command', 17576, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (94, 5, CAST(N'2006-10-26' AS Date), N' Sub Command', 13810, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (95, 5, CAST(N'2006-12-21' AS Date), N' FlatOut 2', 281220, 2870)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (96, 5, CAST(N'2006-08-24' AS Date), N' GTI Racing', 20267, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (97, 5, CAST(N'2006-08-24' AS Date), N' Xpand Rally', 29413, 116)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (98, 5, CAST(N'2007-11-08' AS Date), N' Call of Juarez', 56316, 501)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (99, 5, CAST(N'2008-10-08' AS Date), N' Xpand Rally Xtreme', 10761, 0)
INSERT [dbo].[DimGame] ([GameKey], [Rating], [ReleaseDate], [GameName], [PlayerCount], [RecommendationCount]) VALUES (100, 5, CAST(N'2009-11-01' AS Date), N' Men of War: Red Tide', 74430, 228)
GO
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (1, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (2, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (3, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (4, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (5, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (6, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (7, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (8, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (9, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (10, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (11, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (12, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (13, 100)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (14, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (15, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (16, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (17, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (18, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (19, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (20, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (21, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (22, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (23, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (24, 21)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (25, 62)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (26, 62)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (27, 62)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (28, 62)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (29, 62)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (30, 62)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (31, 62)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (32, 62)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (33, 62)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (34, 26)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (35, 26)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (36, 26)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (37, 74)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (38, 74)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (39, 74)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (40, 39)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (41, 39)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (42, 39)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (43, 39)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (44, 39)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (45, 39)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (46, 88)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (47, 88)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (48, 88)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (49, 88)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (50, 88)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (51, 88)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (52, 88)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (53, 50)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (54, 50)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (55, 50)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (56, 50)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (57, 50)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (58, 50)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (59, 50)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (60, 50)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (61, 50)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (62, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (63, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (64, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (65, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (66, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (67, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (68, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (69, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (70, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (71, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (72, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (73, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (74, 9)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (75, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (76, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (77, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (78, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (79, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (80, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (81, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (82, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (83, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (84, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (85, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (86, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (87, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (88, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (89, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (90, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (91, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (92, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (93, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (94, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (95, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (96, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (97, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (98, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (99, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (100, 30)
GO
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (101, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (102, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (103, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (104, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (105, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (106, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (107, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (108, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (109, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (110, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (111, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (112, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (113, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (114, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (115, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (116, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (117, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (118, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (119, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (120, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (121, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (122, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (123, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (124, 30)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (125, 7)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (126, 7)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (127, 7)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (128, 7)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (129, 7)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (130, 7)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (131, 7)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (132, 7)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (133, 40)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (134, 40)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (135, 40)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (136, 40)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (137, 40)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (138, 40)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (139, 40)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (140, 40)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (141, 40)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (142, 15)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (143, 15)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (144, 15)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (145, 15)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (146, 15)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (147, 2)
INSERT [dbo].[DimInventory] ([InventoryKey], [StockQuantity]) VALUES (148, 2)
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (1, CAST(N'2005-05-27' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (2, CAST(N'2005-05-29' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (3, CAST(N'2005-06-16' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (4, CAST(N'2005-06-16' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (5, CAST(N'2005-06-17' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (6, CAST(N'2005-06-19' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (7, CAST(N'2005-07-07' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (8, CAST(N'2005-07-08' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (9, CAST(N'2005-07-27' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (10, CAST(N'2005-08-01' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (11, CAST(N'2005-08-01' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (12, CAST(N'2005-08-02' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (13, CAST(N'2005-08-17' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (14, CAST(N'2005-08-18' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (15, CAST(N'2005-08-18' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (16, CAST(N'2005-08-19' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (17, CAST(N'2005-08-19' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (18, CAST(N'2005-08-20' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (19, CAST(N'2005-07-27' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (20, CAST(N'2005-07-28' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (21, CAST(N'2005-07-28' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (22, CAST(N'2005-07-28' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (23, CAST(N'2005-07-28' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (24, CAST(N'2005-07-29' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (25, CAST(N'2005-07-30' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (26, CAST(N'2005-07-30' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (27, CAST(N'2005-07-31' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (28, CAST(N'2005-07-31' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (29, CAST(N'2005-08-01' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (30, CAST(N'2005-08-18' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (31, CAST(N'2005-08-19' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (32, CAST(N'2005-08-20' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (33, CAST(N'2005-08-21' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (34, CAST(N'2005-08-22' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (35, CAST(N'2005-08-23' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (36, CAST(N'2005-12-30' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (37, CAST(N'2005-12-31' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (38, CAST(N'2005-12-31' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (39, CAST(N'2005-12-01' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (40, CAST(N'2005-12-18' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (41, CAST(N'2005-12-19' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (42, CAST(N'2005-12-20' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (43, CAST(N'2005-12-21' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (44, CAST(N'2005-12-22' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (45, CAST(N'2005-12-23' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (46, CAST(N'2005-06-15' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (47, CAST(N'2005-06-16' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (48, CAST(N'2005-06-16' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (49, CAST(N'2005-06-16' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (50, CAST(N'2005-12-15' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (51, CAST(N'2005-12-16' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (52, CAST(N'2005-12-16' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (53, CAST(N'2005-12-16' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (54, CAST(N'2005-08-02' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (55, CAST(N'2005-08-17' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (56, CAST(N'2005-08-18' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (57, CAST(N'2005-08-18' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (58, CAST(N'2005-08-19' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (59, CAST(N'2005-08-19' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (60, CAST(N'2005-08-20' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (61, CAST(N'2005-08-20' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (62, CAST(N'2005-08-02' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (63, CAST(N'2005-08-17' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (64, CAST(N'2005-08-18' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (65, CAST(N'2005-08-18' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (66, CAST(N'2005-08-19' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (67, CAST(N'2005-08-19' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (68, CAST(N'2005-08-20' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (69, CAST(N'2005-08-20' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (70, CAST(N'2005-09-20' AS Date))
INSERT [dbo].[DimOrder] ([OrderKey], [OrderDate]) VALUES (71, CAST(N'2005-09-20' AS Date))
INSERT [dbo].[DimPlatform] ([PlatformKey], [PlatformName]) VALUES (1, N'Windows')
INSERT [dbo].[DimPlatform] ([PlatformKey], [PlatformName]) VALUES (2, N'Linux')
INSERT [dbo].[DimPlatform] ([PlatformKey], [PlatformName]) VALUES (3, N'Mac')
INSERT [dbo].[DimStaff] ([StaffKey], [FirstName], [LastName], [EmailAddress]) VALUES (1, N'Mike', N'Hillyer', N'Mike.Hillyer@ebgames.com')
INSERT [dbo].[DimStaff] ([StaffKey], [FirstName], [LastName], [EmailAddress]) VALUES (2, N'Bella', N'Jones', N'Bella.Jones@ebgames.com')
INSERT [dbo].[DimStaff] ([StaffKey], [FirstName], [LastName], [EmailAddress]) VALUES (3, N'Jon', N'Stephens', N'Jon.Stephens@ebgames.com')
INSERT [dbo].[DimStaff] ([StaffKey], [FirstName], [LastName], [EmailAddress]) VALUES (4, N'Sue', N'Laine', N'Jon.Laine@ebgames.com')
INSERT [dbo].[DimStaff] ([StaffKey], [FirstName], [LastName], [EmailAddress]) VALUES (5, N'Cal', N'Vincent', N'Cal.Vincent@ebgames.com')
INSERT [dbo].[DimStaff] ([StaffKey], [FirstName], [LastName], [EmailAddress]) VALUES (6, N'May', N'Peterson', N'May.Peterson@ebgames.com')
INSERT [dbo].[DimStaff] ([StaffKey], [FirstName], [LastName], [EmailAddress]) VALUES (7, N'Mary', N'Rose', N'Mary.Rose@ebgames.com')
INSERT [dbo].[DimStore] ([StoreKey], [StoreAddress]) VALUES (1, N'23 Workhaven Lane Atlixco Mexico')
INSERT [dbo].[DimStore] ([StoreKey], [StoreAddress]) VALUES (2, N'613 Korolev Drive Bag Brazil')
INSERT [dbo].[FactSale] ([GameKey], [PlatformKey], [CustomerKey], [StoreKey], [StaffKey], [InventoryKey], [DateKey], [OrderKey], [TotalQuantity], [TotalSale]) VALUES (65, 1, 18, 1, 3, 147, 20051231, 37, 2, CAST(9.98 AS Decimal(18, 2)))
INSERT [dbo].[FactSale] ([GameKey], [PlatformKey], [CustomerKey], [StoreKey], [StaffKey], [InventoryKey], [DateKey], [OrderKey], [TotalQuantity], [TotalSale]) VALUES (65, 1, 18, 1, 3, 147, 20051231, 38, 2, CAST(9.98 AS Decimal(18, 2)))
INSERT [dbo].[FactSale] ([GameKey], [PlatformKey], [CustomerKey], [StoreKey], [StaffKey], [InventoryKey], [DateKey], [OrderKey], [TotalQuantity], [TotalSale]) VALUES (65, 1, 18, 1, 3, 148, 20051231, 37, 2, CAST(9.98 AS Decimal(18, 2)))
INSERT [dbo].[FactSale] ([GameKey], [PlatformKey], [CustomerKey], [StoreKey], [StaffKey], [InventoryKey], [DateKey], [OrderKey], [TotalQuantity], [TotalSale]) VALUES (65, 1, 18, 1, 3, 148, 20051231, 38, 2, CAST(9.98 AS Decimal(18, 2)))
/****** Object:  Index [IX_FactSale_CustomerKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE NONCLUSTERED INDEX [IX_FactSale_CustomerKey] ON [dbo].[FactSale]
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FactSale_DateKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE NONCLUSTERED INDEX [IX_FactSale_DateKey] ON [dbo].[FactSale]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FactSale_GameKeyKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE NONCLUSTERED INDEX [IX_FactSale_GameKeyKey] ON [dbo].[FactSale]
(
	[GameKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FactSale_InventoryKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE NONCLUSTERED INDEX [IX_FactSale_InventoryKey] ON [dbo].[FactSale]
(
	[InventoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FactSale_OrderKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE NONCLUSTERED INDEX [IX_FactSale_OrderKey] ON [dbo].[FactSale]
(
	[OrderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FactSale_PlatformKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE NONCLUSTERED INDEX [IX_FactSale_PlatformKey] ON [dbo].[FactSale]
(
	[PlatformKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FactSale_StaffKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE NONCLUSTERED INDEX [IX_FactSale_StaffKey] ON [dbo].[FactSale]
(
	[StaffKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FactSale_StoreKey]    Script Date: 2020/4/21 18:28:39 ******/
CREATE NONCLUSTERED INDEX [IX_FactSale_StoreKey] ON [dbo].[FactSale]
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [GameStoreDW] SET  READ_WRITE 
GO
