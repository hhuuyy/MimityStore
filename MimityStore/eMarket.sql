USE [master]
GO
/****** Object:  Database [eMarket]    Script Date: 17/01/2018 2:38:27 CH ******/
CREATE DATABASE [eMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeShop.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HomeShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeShop_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eMarket] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [eMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eMarket] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [eMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eMarket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eMarket] SET RECOVERY FULL 
GO
ALTER DATABASE [eMarket] SET  MULTI_USER 
GO
ALTER DATABASE [eMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eMarket] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eMarket', N'ON'
GO
USE [eMarket]
GO
/****** Object:  Table [dbo].[ActionRoles]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
	[WebActionId] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [varchar](5) NOT NULL,
	[NameVN] [nvarchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MasterRoles]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserInRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Masters]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters](
	[Id] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequireDate] [datetime] NOT NULL,
	[Receiver] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Amount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[UnitBrief] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[ProductDate] [datetime] NOT NULL,
	[Available] [bit] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[CategoryId] [varchar](5) NOT NULL,
	[SubCategoryId] [varchar](5) NOT NULL,
	[SupplierId] [nvarchar](50) NOT NULL,
	[UsersId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
	[Special] [bit] NOT NULL,
	[Latest] [bit] NOT NULL,
	[Views] [int] NOT NULL,
 CONSTRAINT [PK__Product__3214EC077EF2199E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategories](
	[Id] [varchar](5) NOT NULL,
	[NameVN] [nvarchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CategoryId] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Phone] [varchar](11) NULL,
	[Photo] [varchar](50) NULL,
	[Activated] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WebActions]    Script Date: 17/01/2018 2:38:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ActionRoles] ON 

INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1028, N'admin', 3)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1029, N'admin', 4)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1030, N'admin', 5)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1033, N'admin', 10)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1034, N'admin', 11)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1035, N'admin', 12)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1037, N'admin', 14)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1039, N'admin', 16)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1040, N'admin', 17)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1041, N'admin', 18)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1042, N'admin', 19)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1043, N'admin', 20)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1044, N'admin', 21)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1045, N'admin', 22)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1046, N'admin', 23)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1047, N'admin', 24)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1048, N'admin', 25)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1049, N'admin', 26)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1050, N'admin', 27)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1051, N'admin', 28)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1053, N'admin', 44)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1054, N'admin', 45)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1055, N'admin', 46)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1056, N'admin', 47)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1057, N'admin', 48)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1058, N'admin', 49)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1059, N'admin', 50)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1060, N'admin', 51)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1061, N'super', 2)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1062, N'super', 3)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1063, N'super', 4)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1064, N'super', 5)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1065, N'super', 8)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1077, N'admin', 2)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1092, N'admin', 13)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1094, N'admin', 8)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1095, N'admin', 9)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1096, N'admin', 43)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1102, N'admin', 11)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1103, N'admin', 8)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1104, N'admin', 52)
SET IDENTITY_INSERT [dbo].[ActionRoles] OFF
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (N'1000', N'Thiết bị di động', N'Device mobile')
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (N'1001', N'Máy tính', N'Computer')
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (N'1002', N'Camera', N'Camera')
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (N'1003', N'Tivi', N'Television')
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (N'1004', N'Âm Thanh', N'Sound')
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (N'1005', N'Phụ kiện', N'Accessories')
SET IDENTITY_INSERT [dbo].[MasterRoles] ON 

INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (167, N'lththao', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (173, N'songlong2k', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (219, N'ndthienlong', N'admin')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (220, N'ndthienlong', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (222, N'nghiemn', N'admin')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (223, N'lththao', N'user')
SET IDENTITY_INSERT [dbo].[MasterRoles] OFF
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'admin', N'admin', N'admin', N'admin@gmail.com', N'0123654987')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'lththao', N'songlong', N'Lê Thị Hương Thảo', N'lththao@gmail.com', N'0913745987')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'ndhoanglong', N'songlong', N'Nguyễn Đình Hoàng Long', N'ndhoanglong@gmail.com', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'ndthienlong', N'songlong', N'Nguyễn Đình Thiên Long', N'ndthienlong@gmail.com', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'nghiemn', N'songlong', N'Nguyễn Nghiệm', N'nghiemn@fpt.edu.vn', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'songlong2k', N'songlong', N'Song Long 2000', N'songlong2k@gmail.com', N'0913745789')
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [ShortDescription], [CategoryId], [SubCategoryId], [SupplierId], [UsersId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (77, N'SamSung Galaxxy J7 Pro', N'697g', 69000000, N'1.jpg', CAST(0x0000A84700000000 AS DateTime), 1, N'Điện thoại Samsung cho phân khúc người dùng có nhu cầu cấu hình cao giá thành hợp lí', N'Ram :3G </br> CPU: Intel', N'1000', N'2000', N'SS', NULL, 11, 1, 1, 1, 29)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'admin', N'Administrators')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'super', N'Supervisors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'user', N'Users')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2000', N'Điện thoại', N'Mobile', N'1000')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2001', N'Máy tính bảng', N'Tablet', N'1000')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2002', N'Đồng hồ thông minh', N'SmartWatch', N'1000')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2010', N'Máy tính PC', N'Pesonal Computer', N'1001')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2011', N'Laptop', N'Laptop', N'1001')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2020', N'Camera', N'Camera', N'1002')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2030', N'Tivi', N'Television', N'1003')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2040', N'Đầu DVD', N'DVD', N'1004')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2041', N'Loa ', N'Sound', N'1004')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2042', N'Âm ly', N'Amply', N'1004')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2050', N'Pin', N'Pin', N'1005')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2051', N'Ram', N'Ram', N'1005')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2052', N'Tai nghe', N'Headphone
', N'1005')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2053', N'Sạc ', N'Charger', N'1005')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2054', N'Thẻ nhớ', N'Memory Stick', N'1005')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2055', N'Ốp lưng', N'Case', N'1005')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2056', N'Bàn phím', N'Keyboard', N'1005')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2057', N'Chuột máy tính', N'Mouse', N'1005')
INSERT [dbo].[SubCategories] ([Id], [NameVN], [Name], [CategoryId]) VALUES (N'2058', N'USB-Ổ cứng', N'USB- Hard Drive', N'1005')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo]) VALUES (N'AP', N'Apple', N'apple.jpg')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo]) VALUES (N'IP', N'IPHONE', N'IPHONE.IPG')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo]) VALUES (N'MO', N'Motorola', N'motorola.jpg')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo]) VALUES (N'NK', N'Nokia', N'nokia.jpg')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo]) VALUES (N'OP', N'OPPO', N'OPPO.JPG')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo]) VALUES (N'SM', N'Seamen', N'Seamen.jpg')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo]) VALUES (N'SS', N'Samsung', N'samsung.jpg')
SET IDENTITY_INSERT [dbo].[WebActions] ON 

INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (2, N'product/insert', N'Sản phẩm - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (3, N'product/update', N'Sản phẩm - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (4, N'product/delete', N'Sản phẩm - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (5, N'product/edit', N'Sản phẩm - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (8, N'product/index', N'Sản phẩm - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (9, N'category/insert', N'Loại sản phẩm - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (10, N'category/update', N'Loại sản phẩm - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (11, N'category/delete', N'Loại sản phẩm - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (12, N'category/edit', N'Loại sản phẩm - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (13, N'category/index', N'Loại sản phẩm - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (14, N'supplier/insert', N'Nhà cung cấp - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (16, N'supplier/delete', N'Nhà cung cấp - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (17, N'supplier/edit', N'Nhà cung cấp - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (18, N'supplier/index', N'Nhà cung cấp - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (19, N'customer/insert', N'Khách hàng - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (20, N'customer/update', N'Khách hàng - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (21, N'customer/delete', N'Khách hàng - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (22, N'customer/edit', N'Khách hàng - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (23, N'customer/index', N'Khách hàng - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (24, N'order/insert', N'Đơn hàng - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (25, N'order/update', N'Đơn hàng - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (26, N'order/delete', N'Đơn hàng - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (27, N'order/edit', N'Đơn hàng - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (28, N'order/index', N'Đơn hàng - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (43, N'inventory/bycategory', N'Hàng tồn theo loại')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (44, N'inventory/bysupplier', N'Hàng tồn theo nhà cung cấp')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (45, N'revenue/byproduct', N'Doanh số từng mặt hàng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (46, N'revenue/bycategory', N'Doanh số từng loại hàng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (47, N'revenue/bysupplier', N'Doanh số từng nhà cung cấp')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (48, N'revenue/bycustomer', N'Doanh số từng khách hàng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (49, N'revenue/byyear', N'Doanh số từng năm')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (50, N'revenue/byquarter', N'Doanh số từng quí')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (51, N'revenue/bymonth', N'Doanh số từng tháng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (52, N'supplier/update', N'Nhà cung cấp - Cập nhật')
SET IDENTITY_INSERT [dbo].[WebActions] OFF
ALTER TABLE [dbo].[Masters] ADD  CONSTRAINT [DF_Masters_FullName]  DEFAULT (N'Nguyễn Nghiệm') FOR [FullName]
GO
ALTER TABLE [dbo].[Masters] ADD  CONSTRAINT [DF_Masters_Mobile]  DEFAULT ((913745789)) FOR [Mobile]
GO
ALTER TABLE [dbo].[ActionRoles]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Actions] FOREIGN KEY([WebActionId])
REFERENCES [dbo].[WebActions] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActionRoles] CHECK CONSTRAINT [FK_Permissions_Actions]
GO
ALTER TABLE [dbo].[ActionRoles]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActionRoles] CHECK CONSTRAINT [FK_Permissions_Roles]
GO
ALTER TABLE [dbo].[MasterRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterRoles] CHECK CONSTRAINT [FK_UserInRoles_Roles]
GO
ALTER TABLE [dbo].[MasterRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Users] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Masters] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterRoles] CHECK CONSTRAINT [FK_UserInRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([Id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategories] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategories] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategories]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Suppliers]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Users] FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Users]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_SubCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_SubCategories_Categories]
GO
USE [master]
GO
ALTER DATABASE [eMarket] SET  READ_WRITE 
GO
