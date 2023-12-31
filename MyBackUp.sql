USE [master]
GO
/****** Object:  Database [SweetHome_MyFinalProject]    Script Date: 7/4/2023 1:59:09 PM ******/
CREATE DATABASE [SweetHome_MyFinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SweetHome_MyFinalProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SweetHome_MyFinalProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SweetHome_MyFinalProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SweetHome_MyFinalProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SweetHome_MyFinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET QUERY_STORE = OFF
GO
USE [SweetHome_MyFinalProject]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/4/2023 1:59:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[About]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Icon] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[IsAgent] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
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
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Date] [datetime2](7) NULL,
	[AppUserId] [nvarchar](450) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Desc] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faq]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faq](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Faq] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeTypes]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_HomeTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[Status] [bit] NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[TeamId] [int] NULL,
	[PurchasedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[IsMain] [bit] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Room] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[HomeSize] [int] NOT NULL,
	[TeamId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[StatusId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[HomeTypeId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Icon] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 7/4/2023 1:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701094608_alltables', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701101213_UpdateAppUserTable', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701105333_NewAddOrderTAble', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230703104515_FaqTAble', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230703172121_CommentTable', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230703195303_NewColumn', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230703212753_SettingsTAble', N'6.0.18')
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([Id], [Name], [Icon]) VALUES (1, N'Smart Home Design', N'<i class="flaticon-home-2"></i>')
INSERT [dbo].[About] ([Id], [Name], [Icon]) VALUES (2, N'Beautiful Scene Around', N'<i class="flaticon-mountain"></i>')
INSERT [dbo].[About] ([Id], [Name], [Icon]) VALUES (3, N'Exceptional Lifestyle', N'<i class="flaticon-heart"></i>')
INSERT [dbo].[About] ([Id], [Name], [Icon]) VALUES (4, N'Complete 24/7 Security', N'<i class="flaticon-secure"></i>')
SET IDENTITY_INSERT [dbo].[About] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3b7c42ec-8584-4174-87b6-499fb39ec9a8', N'admin', N'ADMIN', N'b289a0ac-bacd-4ff3-8bc1-a9e4d88079cb')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9df807a9-5e80-4b49-b711-414c15294a22', N'buyer', N'BUYER', N'aa786245-3890-4978-b4eb-650203ac376e')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'e78e09ba-5421-40d6-bdaf-268324483585', N'agent', N'AGENT', N'c70b896f-a77b-416c-9484-54e5dba019ea')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f9a80049-6c72-4429-bfb5-1bcc8dbeff7c', N'3b7c42ec-8584-4174-87b6-499fb39ec9a8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0847cdb7-0362-476f-bc8a-d82d0fcaa894', N'9df807a9-5e80-4b49-b711-414c15294a22')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'44969f8f-0437-4e56-9871-8354b2d3418f', N'9df807a9-5e80-4b49-b711-414c15294a22')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7144435a-84e7-4ec2-a021-acd3c2591c4c', N'9df807a9-5e80-4b49-b711-414c15294a22')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ca38637c-12b8-4ee0-a79d-960295becbf6', N'9df807a9-5e80-4b49-b711-414c15294a22')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'31077bd3-6d57-438e-8e03-1715a71515cb', N'e78e09ba-5421-40d6-bdaf-268324483585')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'370c734e-5f27-447d-ba39-0ae3d07eb940', N'e78e09ba-5421-40d6-bdaf-268324483585')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'85d64e51-2f57-44d7-a931-13cebdae057b', N'e78e09ba-5421-40d6-bdaf-268324483585')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c1b9d488-9293-4e66-98fc-493dc6f950a6', N'e78e09ba-5421-40d6-bdaf-268324483585')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd9b361e2-7233-4a81-865d-8ec766b91b92', N'e78e09ba-5421-40d6-bdaf-268324483585')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fc79008d-5573-4706-8cf9-856e46c35b3b', N'e78e09ba-5421-40d6-bdaf-268324483585')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0847cdb7-0362-476f-bc8a-d82d0fcaa894', NULL, 0, N'8817021c-e512-4dbe-841a-1e9136950c06_face15.jpg', N'Valeh', N'VALEH', N'valeh@gmail.com', N'VALEH@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEHs1sUeVl8qjVM52CGSD0jWHsmti6tkZb4+zgGK5izr3wWOfc3HwHLmFbN+BnUoiQw==', N'NDXHTIJYHF3IFQACI262A2BVIN3PYKJI', N'4b116808-e837-4f38-8c97-cdf75e6e6d3f', N'0104317778', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'31077bd3-6d57-438e-8e03-1715a71515cb', NULL, 1, N'148b7001-e243-4fd2-8ac6-7e1ffc1a61ca_face16.jpg', N'Vahid', N'VAHID', N'vahid@gmail.com', N'VAHID@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEI1FaWKVaul6ueylubRPRkDUmWIdogy3D4n0mIcUEoNTOKTDunOdGCPJlVhjIAu9hg==', N'II3HXKFXNFA2RXE6BOLPJRDBCOM2HNCN', N'63e27c58-d624-4b50-84d3-0cd8cbe7a369', N'0999989898', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'370c734e-5f27-447d-ba39-0ae3d07eb940', NULL, 1, N'10099d1b-f649-4c78-8361-317294b28481_face21.jpg', N'Saleh', N'SALEH', N'saleh@code.edu.az', N'SALEH@CODE.EDU.AZ', 0, N'AQAAAAEAACcQAAAAEJuYcxC5/tsDRUzY5qCxga3OWzuMJLbX6dzcEbJurW9G3Ra3VCYbZfx63XPREYwIiw==', N'LB5P6ULH52APAWZBRLEZJ3FRK77FWX5Z', N'970130a0-1049-41a1-a31a-e134e45802b3', N'0504437778', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'44969f8f-0437-4e56-9871-8354b2d3418f', NULL, 0, N'666453f2-bc4e-4cb1-85a2-f397a7511ea4_face21.jpg', N'Yusif', N'YUSIF', N'yusif@code.az', N'YUSIF@CODE.AZ', 0, N'AQAAAAEAACcQAAAAEOgK/AUKupmKdWHZ5BOx7QG02C8C3bMkxOgDauAZEPi5OEKLgrXddo08tmbtyib34w==', N'BQPNVDIKQT5FZA5J3YQUA2G2GCZTHP32', N'8e8b6b69-b437-4e3f-9a1e-1f76d27819e2', N'0556789087', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7144435a-84e7-4ec2-a021-acd3c2591c4c', NULL, 0, N'df789d43-fa1d-4b8a-8158-633612f8de52_face11.jpg', N'Xanim', N'XANIM', N'xanim@code.az', N'XANIM@CODE.AZ', 1, N'AQAAAAEAACcQAAAAEBr+EUOYTuqELKTA+Nya3OAJbWLwHNp8m0th3WtEpTVEcA+j96iQClg/0Re9e/KhBA==', N'ORPLVFIC6D5F5PQUIWFFCYORKQ3ZBJNL', N'c2d417cd-16aa-4d66-b9f8-3dcc8f63dc92', N'0774456666', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'85d64e51-2f57-44d7-a931-13cebdae057b', NULL, 1, N'2ff8b1e1-60d0-4bf4-afd3-8b7ad4e7c854_face3.jpg', N'Vasif', N'VASIF', N'vasif@code.edu.az', N'VASIF@CODE.EDU.AZ', 1, N'AQAAAAEAACcQAAAAEC0H52el6iUZ+JmAjN6WutxWbD0weXZwIo2/ttShLdLSOTq+BBnYJC1hO6GYBqwoxA==', N'INFWQCTDYURY4SBDCY4LUM4MVTENTGKK', N'9c2bdd8f-1b75-456f-a265-8fc5badbd223', N'0505488350', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c1b9d488-9293-4e66-98fc-493dc6f950a6', NULL, 1, N'055057cf-75d4-4f7d-ab21-7fa1fd12bafe_face15.jpg', N'Asif', N'ASIF', N'asif@code.az', N'ASIF@CODE.AZ', 0, N'AQAAAAEAACcQAAAAEOANU+8ljc4NAaZEozTKJ+J/yY+H9eXwCQa+Y7T1DYn9SQAUDh8dP1kZ7hjHixv1hg==', N'W6D72P5J5BTLJQBEYO4F4BOKX24QEJFC', N'4226b033-9327-47bc-a80c-be4aefb2b050', N'0513007080', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ca38637c-12b8-4ee0-a79d-960295becbf6', NULL, 0, N'0fd20a91-c166-468a-98ef-375e6ef8ae8c_face23.jpg', N'Selime', N'SELIME', N'selime@code.edu.az', N'SELIME@CODE.EDU.AZ', 1, N'AQAAAAEAACcQAAAAEI201g1Y/3zMJXqx8iK3X0LxOxS+RJaNyv0Tx0hyW8wkMuy1Lo4OtOseAmSSBj5kgA==', N'NACHQ3HTLXHHCIJDPCYFZ72WVTLPMNFF', N'76a91ff2-81a6-4f43-bc18-6e872c0595f6', N'0555555555', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd9b361e2-7233-4a81-865d-8ec766b91b92', NULL, 1, N'f3afdbc2-9dfd-455f-8e77-1101a46b3a6c_face3.jpg', N'Tahir', N'TAHIR', N'tahir@code.az', N'TAHIR@CODE.AZ', 1, N'AQAAAAEAACcQAAAAEO0QAOiemaqmqoItGsWreTiw1EEH89gxMWN8ZceA+6OM7KDcRc2ve7VVwJAJw807ng==', N'SEKOUHVO2QEYW352XL6K5SXSNBTV3WPP', N'49c5961c-00d1-4d99-9d74-e05de4a5b16d', N'0773230908', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f9a80049-6c72-4429-bfb5-1bcc8dbeff7c', NULL, 0, N'0335784d-7dda-49e0-ae8d-14b5f6826f3d_face23.jpg', N'Arzu', N'ARZU', N'arzu@code.az', N'ARZU@CODE.AZ', 1, N'AQAAAAEAACcQAAAAEIO8SURpbVe3uIxn9+Iu15d13kQiNAKAtsf1kBufnOM3NKAmki7vDw9qu1KpMtOJiQ==', N'QTZANLKGT5OGXMLUPEH22MBNJQP3UHH6', N'a1ceda6c-a5b5-4cc2-87c7-0123fb1cfa08', N'0513220908', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAgent], [Image], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fc79008d-5573-4706-8cf9-856e46c35b3b', NULL, 1, N'4d74f96b-00f4-4651-b565-9f30de349972_face27.jpg', N'Ehmed', N'EHMED', N'ehmed@code.edu.az', N'EHMED@CODE.EDU.AZ', 1, N'AQAAAAEAACcQAAAAEKFkaT3xrfXmQ6EPQRk5Z4hR8d6QKWGj5tMBXFsUBrXgjz4kTXrZtVFZv2nGO7ZeCw==', N'RA64WHAYGVF7NWHJHNNZTTK2ACXNAUNA', N'bc57d87b-ca2e-40e1-ae99-66c01ef90d65', N'0507784343', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Buy')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Rent')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name]) VALUES (1, N'Baku')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (2, N'Ganja')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (3, N'Sumgayit')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (4, N'Mingecevir')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (5, N'Shaki')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (6, N'Qusar')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Description], [Date], [AppUserId], [ProductId], [Image]) VALUES (6, N'It is very expensive...', CAST(N'2023-07-03T20:15:31.1981240' AS DateTime2), N'85d64e51-2f57-44d7-a931-13cebdae057b', 7, NULL)
INSERT [dbo].[Comments] ([Id], [Description], [Date], [AppUserId], [ProductId], [Image]) VALUES (7, N'Menzeresi cox gozeldir', CAST(N'2023-07-03T23:14:12.5710461' AS DateTime2), N'85d64e51-2f57-44d7-a931-13cebdae057b', 8, NULL)
INSERT [dbo].[Comments] ([Id], [Description], [Date], [AppUserId], [ProductId], [Image]) VALUES (8, N'Woooww', CAST(N'2023-07-03T23:15:33.6528396' AS DateTime2), N'85d64e51-2f57-44d7-a931-13cebdae057b', 8, NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Image], [Name], [Title], [Desc]) VALUES (1, N'1d18c599-53fd-4c6a-832b-9c8adaaaa2ea_10.png', N'Email Adress', N'sweethome@gmail.com', N'sweethome1@gmail.com')
INSERT [dbo].[Contacts] ([Id], [Image], [Name], [Title], [Desc]) VALUES (2, N'a0a589e1-fe01-4643-80d9-7c55030bcc60_11.png', N'Phone', N'+994777777777', N'+994555555555')
INSERT [dbo].[Contacts] ([Id], [Image], [Name], [Title], [Desc]) VALUES (3, N'd0f61c62-4e70-4601-8958-7e3026349747_12.png', N'Adress', N'Baku,Azerbaijan', N'Azadliq Prospekti')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Faq] ON 

INSERT [dbo].[Faq] ([Id], [Title], [Description]) VALUES (1, N'How to buy a product?', N'You must click order button')
INSERT [dbo].[Faq] ([Id], [Title], [Description]) VALUES (2, N'I am a new user. How should I start?', N' You must be registered as an agent')
INSERT [dbo].[Faq] ([Id], [Title], [Description]) VALUES (3, N'Are my details secured?', N'Yes,exactly')
SET IDENTITY_INSERT [dbo].[Faq] OFF
GO
SET IDENTITY_INSERT [dbo].[HomeTypes] ON 

INSERT [dbo].[HomeTypes] ([Id], [Name]) VALUES (1, N'Apartment')
INSERT [dbo].[HomeTypes] ([Id], [Name]) VALUES (2, N'Delegation House')
SET IDENTITY_INSERT [dbo].[HomeTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [AppUserId], [Status], [ProductId], [ProductName], [Price], [TeamId], [PurchasedAt]) VALUES (12, N'ca38637c-12b8-4ee0-a79d-960295becbf6', 1, 7, N'Tarqovuda kohne tikili', CAST(80000.00 AS Decimal(18, 2)), 3, CAST(N'2023-07-04T02:37:38.8596332' AS DateTime2))
INSERT [dbo].[Order] ([Id], [AppUserId], [Status], [ProductId], [ProductName], [Price], [TeamId], [PurchasedAt]) VALUES (13, N'0847cdb7-0362-476f-bc8a-d82d0fcaa894', 1, 12, N'Bileceride kiraye ev', CAST(350.00 AS Decimal(18, 2)), 11, CAST(N'2023-07-04T13:13:16.5910071' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (7, N'6a9de930-e932-492e-ad96-72cb7fabcdac_7.jpg', 1, 4)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (8, N'9ad52e17-c5b2-4942-8f59-4fb463f1896d_2.jpg', 0, 4)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (9, N'7ed7091c-71c8-4dca-ab04-c0fc096fc10c_4.jpg', 0, 4)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (10, N'ee588349-94af-4451-87f6-e108acde93cd_5.jpg', 1, 5)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (11, N'e36ea4e9-9f35-41f6-b1aa-9ac57a740f68_1.jpg', 0, 5)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (12, N'8f5c18a4-4946-44c0-b74f-6ced4ae38624_4.jpg', 0, 5)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (16, N'352c611a-0cef-47ae-a9f2-2688306b0c50_7.jpg', 1, 7)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (17, N'58b0a1b6-3d4f-4f74-b481-7a1955c2aa94_1.jpg', 0, 7)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (18, N'16a5c1bf-8f77-4e8e-aeb9-53d1df2f08cc_3.jpg', 0, 7)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (19, N'33a5dcf5-1bbe-43c9-b6b7-6ace30d47ddd_1.jpg', 1, 8)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (20, N'8e864dd9-7314-4907-94bc-7a0a3e3d1c90_3.jpg', 0, 8)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (22, N'751e5113-5271-4815-8a76-a98fb279d051_5.jpg', 0, 8)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (23, N'280eae40-8b87-425a-840d-df5596d611cc_5.jpg', 1, 9)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (24, N'0a07be54-1e48-4895-afd7-f52a36f0209e_3.jpg', 0, 9)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (25, N'a7f1975b-a9f0-4f44-aea9-4a4f499adbde_6.jpg', 0, 9)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (26, N'18a52efa-df64-43e5-a859-75f76abf48ef_2.jpg', 1, 10)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (27, N'ed837353-fa98-4025-a92c-7e461d56ca93_1.jpg', 0, 10)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (28, N'79ab0be0-47eb-48d3-a13a-34dce7a17e38_4.jpg', 0, 10)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (29, N'017e9faf-7e55-47cb-8ba5-5eeac23bf070_5.jpg', 0, 10)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (30, N'219e7422-2c37-4b0e-b97f-1133d2752752_7.jpg', 1, 11)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (31, N'0a2a3c84-7bcd-4e66-8c97-f264e3e7905c_3.jpg', 0, 11)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (32, N'c4551bab-e179-4930-b777-a9454f73eaad_6.jpg', 0, 11)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (33, N'80d20d58-07fa-4993-865d-6e2165c50715_1.jpg', 1, 12)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (34, N'28663ddc-f119-4dc8-8a61-4dcbe4dd5257_2.jpg', 0, 12)
INSERT [dbo].[ProductImages] ([Id], [Image], [IsMain], [ProductId]) VALUES (35, N'9d331f8c-7fe7-419d-9f86-1be2f72325e3_5.jpg', 0, 12)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Room], [Price], [HomeSize], [TeamId], [IsDeleted], [StatusId], [CityId], [HomeTypeId], [CategoryId]) VALUES (4, N'Yeni tikili', N'evlerimiz', 4, CAST(46000.00 AS Decimal(18, 2)), 444, 2, 0, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Room], [Price], [HomeSize], [TeamId], [IsDeleted], [StatusId], [CityId], [HomeTypeId], [CategoryId]) VALUES (5, N'Yasamal kiraye ev', N'Asan xidmet yaxinligi,kohne tikili', 3, CAST(500.00 AS Decimal(18, 2)), 50, 2, 0, 1, 1, 1, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Room], [Price], [HomeSize], [TeamId], [IsDeleted], [StatusId], [CityId], [HomeTypeId], [CategoryId]) VALUES (7, N'Tarqovuda kohne tikili', N'Nizami kucesi,Kfc yaxinligi,orta temirli bina evi', 3, CAST(80000.00 AS Decimal(18, 2)), 500, 3, 0, 1, 1, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Room], [Price], [HomeSize], [TeamId], [IsDeleted], [StatusId], [CityId], [HomeTypeId], [CategoryId]) VALUES (8, N'Gence Mall yaxinliginda ev', N'Ev tam temirlidir, istilik sistemi yeni qurasdirilib.Mirze Qasqay kucesi, ev 6 unvaninda yerlesir', 2, CAST(38000.00 AS Decimal(18, 2)), 150, 3, 0, 1, 2, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Room], [Price], [HomeSize], [TeamId], [IsDeleted], [StatusId], [CityId], [HomeTypeId], [CategoryId]) VALUES (9, N'Goredilde bag evi', N'Deniz yaxinliginda,6 sot torpaq erazisinde bag evi satilir', 4, CAST(44000.00 AS Decimal(18, 2)), 250, 3, 0, 1, 1, 2, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Room], [Price], [HomeSize], [TeamId], [IsDeleted], [StatusId], [CityId], [HomeTypeId], [CategoryId]) VALUES (10, N'Guneslide ev', N'Kohne tikilidir,3 sot torpaq ehatesinde satilir. ', 4, CAST(15000.00 AS Decimal(18, 2)), 200, 11, 0, 1, 4, 2, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Room], [Price], [HomeSize], [TeamId], [IsDeleted], [StatusId], [CityId], [HomeTypeId], [CategoryId]) VALUES (11, N'Razinde ev', N'Yeni temirli,tam seraitl ev kirayeye verilir. Yalniz aileler ucun nezerde tutulmusdur', 3, CAST(550.00 AS Decimal(18, 2)), 150, 11, 0, 1, 1, 2, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Room], [Price], [HomeSize], [TeamId], [IsDeleted], [StatusId], [CityId], [HomeTypeId], [CategoryId]) VALUES (12, N'Bileceride kiraye ev', N'Eliller binasi,ilk bina ,3cu mertebe,9 nomreli ev', 2, CAST(350.00 AS Decimal(18, 2)), 130, 11, 0, 1, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (1, N'Phone', N'+0123-456789')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (2, N'PhoneIcon', N'<i class="icon-call"></i>')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (3, N'Email', N'sweethome@gmail.com')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (4, N'EmailIcon', N'<i class="icon-mail"></i>')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (5, N'LocatIcon', N'<i class="icon-placeholder"></i>')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (6, N'Location', N'15/A, Nest Tower, NYC')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (7, N'Image', N'logo.png')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (8, N'End', N'All Rights Reserved Company')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (9, N'Desc', N'All Houses in Our Website')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (10, N'AboutImage', N'7.png')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (11, N'AboutDesc', N'The Leading Real Estate
                            Rental Marketplace')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (12, N'AboutThing', N'                            Over 39,000 people work for us in more than 70 countries all over the  This breadth of global coverage, combined with specialist services...')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (13, N'Faq', N'Still need help? Reach out to support 24/7:')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Name], [Icon], [Title], [Description], [Image]) VALUES (1, N'Real Estate', N'<i class="fas fa-home"></i>', N'Find Your Dream Home', N'All Houses in Here', N'335290c4-8ef5-407e-914b-388668eaaa17_21.png')
INSERT [dbo].[Sliders] ([Id], [Name], [Icon], [Title], [Description], [Image]) VALUES (2, N'Real Estate', N'<i class="fas fa-home"></i>', N'The Right Place of House Finding', N'All Houses in Here', N'7a5ea065-1311-4eeb-9992-ff017e4dcab5_21.png')
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([Id], [Name]) VALUES (1, N'InStock')
INSERT [dbo].[Statuses] ([Id], [Name]) VALUES (2, N'Sold')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [Phone], [Email], [Image]) VALUES (2, N'Asif', N'0513007080', N'asif@code.az', N'a91762f9-ca61-4f18-8e54-fb5ae17d7028_face15.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Phone], [Email], [Image]) VALUES (3, N'Vasif', N'0505488350', N'vasif@code.edu.az', N'40e74497-2a2c-4e82-9a26-09c95ea704a9_face3.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Phone], [Email], [Image]) VALUES (5, N'ArzuGoja', N'0513220908', N'qocayevaarzu22@gmail.com', N'23aaf5d4-236a-4f11-9fac-ba62bacd2de7_face10.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Phone], [Email], [Image]) VALUES (7, N'Tahir', N'0773230908', N'tahir@code.az', N'd0590f1f-1f72-40fb-af5b-7b360f9d6863_face3.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Phone], [Email], [Image]) VALUES (9, N'Vahid', N'0999989898', N'vahid@gmail.com', N'0bf02952-e2c2-475a-aa69-97c8d830fc53_face16.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Phone], [Email], [Image]) VALUES (10, N'Saleh', N'0504437778', N'saleh@code.edu.az', N'6d20f378-30d6-4bd6-8c16-fab8b3c42cbb_face21.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Phone], [Email], [Image]) VALUES (11, N'Ehmed', N'0507784343', N'ehmed@code.edu.az', N'cfbb0c6a-f5e3-4201-8e43-5ed5eb532b39_face27.jpg')
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Comments_AppUserId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_AppUserId] ON [dbo].[Comments]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ProductId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ProductId] ON [dbo].[Comments]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Order_AppUserId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_AppUserId] ON [dbo].[Order]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_ProductId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_ProductId] ON [dbo].[Order]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_TeamId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_TeamId] ON [dbo].[Order]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CityId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CityId] ON [dbo].[Products]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_HomeTypeId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_HomeTypeId] ON [dbo].[Products]
(
	[HomeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_StatusId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_StatusId] ON [dbo].[Products]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_TeamId]    Script Date: 7/4/2023 1:59:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_TeamId] ON [dbo].[Products]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products_ProductId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Products_ProductId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Teams_TeamId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Cities_CityId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_HomeTypes_HomeTypeId] FOREIGN KEY([HomeTypeId])
REFERENCES [dbo].[HomeTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_HomeTypes_HomeTypeId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Statuses_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Statuses_StatusId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Teams_TeamId]
GO
USE [master]
GO
ALTER DATABASE [SweetHome_MyFinalProject] SET  READ_WRITE 
GO
