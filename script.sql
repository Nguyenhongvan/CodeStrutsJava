USE [master]
GO
/****** Object:  Database [QuanLyCamDo]    Script Date: 3/22/2017 5:08:39 PM ******/
CREATE DATABASE [QuanLyCamDo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyCamDo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyCamDo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyCamDo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyCamDo_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyCamDo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyCamDo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyCamDo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyCamDo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyCamDo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyCamDo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyCamDo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyCamDo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyCamDo] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyCamDo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyCamDo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyCamDo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyCamDo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyCamDo]
GO
/****** Object:  Table [dbo].[ChiTietHopDong]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHopDong](
	[MaCTHD] [int] NOT NULL,
	[MaHopDong] [int] NOT NULL,
	[MaLaiSuat] [int] NOT NULL,
	[MaDongLai] [int] NULL,
	[MaTaiSan] [int] NULL,
	[NgayCam] [datetime] NULL,
	[NgayTra] [datetime] NULL,
	[SoTienCam] [int] NULL,
	[TinhTrang] [int] NULL,
	[TienThanhToan] [float] NULL,
 CONSTRAINT [PK_ChiTietHopDong_1] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DongTienLai]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongTienLai](
	[MaDongLai] [int] NOT NULL,
	[MaCTHD] [int] NULL,
	[TinhTrang] [int] NULL,
	[NgayDong] [datetime] NULL,
 CONSTRAINT [PK_DongTienLai] PRIMARY KEY CLUSTERED 
(
	[MaDongLai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaHan]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaHan](
	[MaGiaHan] [int] NOT NULL,
	[MaLaiSuat] [int] NULL,
	[MaCTHD] [int] NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
 CONSTRAINT [PK_GiaHan] PRIMARY KEY CLUSTERED 
(
	[MaGiaHan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[MaHopDong] [int] NOT NULL,
	[MaKhachHang] [int] NOT NULL,
 CONSTRAINT [PK_HopDong_1] PRIMARY KEY CLUSTERED 
(
	[MaHopDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[GioiTinh] [int] NULL,
	[CMND] [int] NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LaiSuat]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaiSuat](
	[MaLaiSuat] [int] NOT NULL,
	[MucLaiSuat] [float] NULL,
	[TienGiaHan] [float] NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_LaiSuat] PRIMARY KEY CLUSTERED 
(
	[MaLaiSuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiTaiSan]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiSan](
	[MaLoaiTaiSan] [int] NOT NULL,
	[TenLoaiTaiSan] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhMucTaiSan] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTaiSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiSan]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiSan](
	[MaTaiSan] [int] NOT NULL,
	[MaLoaiTaiSan] [int] NULL,
	[TenTaiSan] [nvarchar](50) NULL,
	[TinhTrang] [int] NOT NULL,
	[UrlHinhAnh] [nvarchar](50) NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaiSan] PRIMARY KEY CLUSTERED 
(
	[MaTaiSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhLy]    Script Date: 3/22/2017 5:08:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhLy](
	[MaThanhLy] [int] NOT NULL,
	[MaTaiSan] [int] NULL,
	[SoTienThanhLy] [float] NULL,
 CONSTRAINT [PK_ThanhLy] PRIMARY KEY CLUSTERED 
(
	[MaThanhLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (1, 1, 1, 1, 1, CAST(0x0000A6BB00000000 AS DateTime), CAST(0x0000A6BF00000000 AS DateTime), 500000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (2, 2, 2, 2, 2, CAST(0x0000A5C300000000 AS DateTime), CAST(0x0000A5D400000000 AS DateTime), 1000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (3, 3, 3, 3, 3, CAST(0x0000A67C00000000 AS DateTime), CAST(0x0000A7FE00000000 AS DateTime), 5000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (4, 4, 4, 4, 4, CAST(0x0000A58000000000 AS DateTime), CAST(0x0000A59700000000 AS DateTime), 2500000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (5, 5, 5, 5, 5, CAST(0x0000A5A000000000 AS DateTime), CAST(0x0000A5A800000000 AS DateTime), 3000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (6, 6, 6, 6, 6, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), 1250000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (7, 7, 7, 7, 7, CAST(0x0000A5DE00000000 AS DateTime), CAST(0x0000A5E600000000 AS DateTime), 4000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (8, 8, 8, 8, 8, CAST(0x0000A5FD00000000 AS DateTime), CAST(0x0000A61100000000 AS DateTime), 3300000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (9, 9, 9, 9, 9, CAST(0x0000A61D00000000 AS DateTime), CAST(0x0000A63500000000 AS DateTime), 10000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (10, 10, 10, 10, 10, CAST(0x0000A63C00000000 AS DateTime), CAST(0x0000A64E00000000 AS DateTime), 20000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (11, 11, 11, 11, 11, CAST(0x0000A65C00000000 AS DateTime), CAST(0x0000A67100000000 AS DateTime), 25000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (12, 12, 12, 12, 12, CAST(0x0000A69A00000000 AS DateTime), CAST(0x0000A6AF00000000 AS DateTime), 4000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (13, 13, 13, 13, 13, CAST(0x0000A58100000000 AS DateTime), CAST(0x0000A59E00000000 AS DateTime), 50000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (14, 14, 14, 14, 14, CAST(0x0000A5A000000000 AS DateTime), CAST(0x0000A5B800000000 AS DateTime), 6000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (15, 15, 15, 15, 15, CAST(0x0000A5DE00000000 AS DateTime), CAST(0x0000A5F700000000 AS DateTime), 15000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (16, 16, 16, 16, 16, CAST(0x0000A5FD00000000 AS DateTime), CAST(0x0000A61500000000 AS DateTime), 1800000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (17, 17, 17, 17, 17, CAST(0x0000A61D00000000 AS DateTime), CAST(0x0000A63200000000 AS DateTime), 660000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (18, 18, 18, 18, 18, CAST(0x0000A63C00000000 AS DateTime), CAST(0x0000A65400000000 AS DateTime), 5500000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (19, 19, 19, 19, 19, CAST(0x0000A65C00000000 AS DateTime), CAST(0x0000A67200000000 AS DateTime), 1300000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (20, 20, 20, 20, 20, CAST(0x0000A67C00000000 AS DateTime), CAST(0x0000A69100000000 AS DateTime), 7700000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (21, 21, 21, 1, 21, CAST(0x0000A58000000000 AS DateTime), CAST(0x0000A59700000000 AS DateTime), 2500000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (22, 22, 22, 2, 22, CAST(0x0000A5A000000000 AS DateTime), CAST(0x0000A5A800000000 AS DateTime), 3000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (23, 23, 23, 3, 23, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), 1250000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (24, 24, 24, 4, 24, CAST(0x0000A5DE00000000 AS DateTime), CAST(0x0000A5E600000000 AS DateTime), 4000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (25, 25, 25, 5, 1, CAST(0x0000A5FD00000000 AS DateTime), CAST(0x0000A61100000000 AS DateTime), 3300000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (26, 26, 1, 6, 2, CAST(0x0000A61D00000000 AS DateTime), CAST(0x0000A63500000000 AS DateTime), 10000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (27, 27, 2, 7, 3, CAST(0x0000A63C00000000 AS DateTime), CAST(0x0000A64E00000000 AS DateTime), 20000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (28, 28, 3, 8, 4, CAST(0x0000A65C00000000 AS DateTime), CAST(0x0000A67100000000 AS DateTime), 25000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (30, 30, 4, 9, 5, CAST(0x0000A67C00000000 AS DateTime), CAST(0x0000A7FE00000000 AS DateTime), 5000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (31, 31, 5, 10, 6, CAST(0x0000A69A00000000 AS DateTime), CAST(0x0000A6AF00000000 AS DateTime), 4000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (32, 32, 6, 11, 7, CAST(0x0000A6BB00000000 AS DateTime), CAST(0x0000A6BF00000000 AS DateTime), 500000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (33, 33, 7, 12, 8, CAST(0x0000A6DA00000000 AS DateTime), CAST(0x0000A6ED00000000 AS DateTime), 8400000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (34, 34, 8, 13, 9, CAST(0x0000A6DA00000000 AS DateTime), CAST(0x0000A6EA00000000 AS DateTime), 9930000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (35, 35, 9, 14, 10, CAST(0x0000A6DA00000000 AS DateTime), CAST(0x0000A6E200000000 AS DateTime), 7410000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (36, 36, 10, 15, 11, CAST(0x0000A58000000000 AS DateTime), CAST(0x0000A59700000000 AS DateTime), 2500000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (37, 37, 11, 16, 12, CAST(0x0000A5A000000000 AS DateTime), CAST(0x0000A5A800000000 AS DateTime), 3000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (38, 38, 12, 17, 13, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), 1250000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (39, 39, 13, 18, 14, CAST(0x0000A5DE00000000 AS DateTime), CAST(0x0000A5E600000000 AS DateTime), 4000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (40, 40, 14, 19, 15, CAST(0x0000A5FD00000000 AS DateTime), CAST(0x0000A61100000000 AS DateTime), 3300000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (41, 41, 15, 20, 16, CAST(0x0000A61D00000000 AS DateTime), CAST(0x0000A63500000000 AS DateTime), 10000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (42, 42, 16, 1, 17, CAST(0x0000A63C00000000 AS DateTime), CAST(0x0000A64E00000000 AS DateTime), 20000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (43, 43, 17, 2, 18, CAST(0x0000A65C00000000 AS DateTime), CAST(0x0000A67100000000 AS DateTime), 25000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (44, 44, 18, 3, 19, CAST(0x0000A67C00000000 AS DateTime), CAST(0x0000A7FE00000000 AS DateTime), 5000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (45, 45, 19, 4, 20, CAST(0x0000A69A00000000 AS DateTime), CAST(0x0000A6AF00000000 AS DateTime), 4000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (46, 46, 20, 5, 21, CAST(0x0000A6BB00000000 AS DateTime), CAST(0x0000A6BF00000000 AS DateTime), 500000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (47, 47, 21, 6, 22, CAST(0x0000A6BB00000000 AS DateTime), CAST(0x0000A6BF00000000 AS DateTime), 4000000, 0, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (48, 48, 22, 7, 23, CAST(0x0000A5A000000000 AS DateTime), CAST(0x0000A5A800000000 AS DateTime), 3000000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (49, 49, 23, 8, 24, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), 2500000, 1, NULL)
INSERT [dbo].[ChiTietHopDong] ([MaCTHD], [MaHopDong], [MaLaiSuat], [MaDongLai], [MaTaiSan], [NgayCam], [NgayTra], [SoTienCam], [TinhTrang], [TienThanhToan]) VALUES (50, 50, 24, 9, 1, CAST(0x0000A5FD00000000 AS DateTime), CAST(0x0000A61100000000 AS DateTime), 3300000, 0, NULL)
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (1, 1, 10000, CAST(0x0000A6BC00000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (2, 2, 20000, CAST(0x0000A5C500000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (3, 3, 30000, CAST(0x0000A68200000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (4, 4, 40000, CAST(0x0000A58900000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (5, 5, 50000, CAST(0x0000A5A400000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (6, 6, 100000, CAST(0x0000A5C300000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (7, 7, 150000, CAST(0x0000A5E400000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (8, 8, 300000, CAST(0x0000A60C00000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (9, 9, 440000, CAST(0x0000A62B00000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (10, 10, 200000, CAST(0x0000A64900000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (11, 11, 250000, CAST(0x0000A66800000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (12, 12, 85000, CAST(0x0000A6A400000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (13, 13, 220000, CAST(0x0000A58900000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (14, 14, 550000, CAST(0x0000A5A800000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (15, 15, 440000, CAST(0x0000A5EE00000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (16, 16, 80000, CAST(0x0000A60D00000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (17, 17, 990000, CAST(0x0000A62B00000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (18, 18, 330000, CAST(0x0000A64900000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (19, 19, 660000, CAST(0x0000A66800000000 AS DateTime))
INSERT [dbo].[DongTienLai] ([MaDongLai], [MaCTHD], [TinhTrang], [NgayDong]) VALUES (20, 20, 770000, CAST(0x0000A68C00000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (1, 1, 1, CAST(0x0000A6BB00000000 AS DateTime), CAST(0x0000A6BF00000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (2, 2, 2, CAST(0x0000A5C300000000 AS DateTime), CAST(0x0000A5D400000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (3, 3, 3, CAST(0x0000A67C00000000 AS DateTime), CAST(0x0000A69100000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (4, 4, 4, CAST(0x0000A58000000000 AS DateTime), CAST(0x0000A59700000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (5, 1, 1, CAST(0x0000A5A000000000 AS DateTime), CAST(0x0000A5A800000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (6, 1, 1, CAST(0x0000A5DE00000000 AS DateTime), CAST(0x0000A5E900000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (7, 2, 2, CAST(0x0000A5FD00000000 AS DateTime), CAST(0x0000A60700000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (8, 2, 2, CAST(0x0000A61D00000000 AS DateTime), CAST(0x0000A63300000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (9, 3, 3, CAST(0x0000A63C00000000 AS DateTime), CAST(0x0000A64300000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (10, 3, 3, CAST(0x0000A65C00000000 AS DateTime), CAST(0x0000A66E00000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (11, 4, 4, CAST(0x0000A69B00000000 AS DateTime), CAST(0x0000A6B000000000 AS DateTime))
INSERT [dbo].[GiaHan] ([MaGiaHan], [MaLaiSuat], [MaCTHD], [NgayBatDau], [NgayKetThuc]) VALUES (12, 4, 4, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5D000000000 AS DateTime))
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (1, 1)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (2, 2)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (3, 3)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (4, 4)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (5, 5)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (6, 6)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (7, 7)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (8, 8)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (9, 9)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (10, 10)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (11, 11)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (12, 12)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (13, 13)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (14, 14)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (15, 15)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (16, 16)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (17, 17)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (18, 18)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (19, 19)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (20, 20)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (21, 21)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (22, 22)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (23, 23)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (24, 24)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (25, 25)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (26, 26)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (27, 27)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (28, 28)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (30, 30)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (31, 31)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (32, 32)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (33, 33)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (34, 34)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (35, 35)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (36, 36)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (37, 37)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (38, 38)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (39, 39)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (40, 40)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (41, 41)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (42, 42)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (43, 43)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (44, 44)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (45, 45)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (46, 46)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (47, 47)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (48, 48)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (49, 49)
INSERT [dbo].[HopDong] ([MaHopDong], [MaKhachHang]) VALUES (50, 50)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (1, N'Trần Tuấn Vũ', 1, 194556683, N'Quảng Bình')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (2, N'Võ Văn Phương', 1, 194556682, N'Quãng Ngãi')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (3, N'Võ Thị Mỹ Hương', 0, 194556681, N'Quãng Nam')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (4, N'Trần Phúc Vinh', 1, 194556680, N'Đà Nẵng')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (5, N'Nguyễn Hồng Vân', 0, 194556684, N'Huế')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (6, N'Nguyễn Đại Phước', 1, 194556675, N'Quảng Ninh')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (7, N'Lê Ngọc Hiếu', 1, 194556689, N'Quảng Nam')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (8, N'Phạm Ngọc Duy', 1, 194556623, N'Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (9, N'Hồ Ngọc Hà', 0, 194556614, N'Lệ Thủy')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (10, N'Tăng Thanh Hà', 0, 194556633, N'Hải Phòng')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (11, N'Noo Phước Thịnh', 1, 194556677, N'TP. Hồ Chí Minh')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (12, N'Đàm Vĩnh Hưng', 1, 194556622, N'TP. Hồ Chí Minh')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (13, N'Tóc Tiên', 0, 194556644, N'Đà Lạt')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (14, N'Đông Nhi', 0, 194556633, N'Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (15, N'Ông Cao Thắng', 1, 194556611, N'Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (16, N'Trương Tam Phong', 1, 194556636, N'Cà Mau')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (17, N'Lý Tiểu Long', 1, 194566632, N'Bình Định')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (18, N'Mỹ Tâm', 0, 194556611, N'Vũng Tàu')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (19, N'Sơn Tùng MTP', 1, 194556617, N'Thái Bình')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (20, N'Vinh Thịt Lợn', 1, 194556699, N'Nghệ An')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (21, N'Dương Quá', 1, 194555511, N'Vinh')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (22, N'Cô Cô', 0, 194556637, N'Cần Thơ')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (23, N'Lý Liên Kiệt', 1, 194563657, N'Đồng Nai')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (24, N'Obama', 1, 194552357, N'Cao Bằng')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (25, N'Nông Đức Mạnh', 1, 194578934, N'Lạng Sơn')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (26, N'Nguyễn Xuân Phúc', 1, 194536977, N'Lai Châu')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (27, N'Agela BaBy', 0, 194575332, N'Vĩnh Long')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (28, N'Selena Gomez', 0, 194563647, N'Long An')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (29, N'Cristian Ronaldo', 1, 194563278, N'Tây Nguyên')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (30, N'Gareth Bale', 1, 194563282, N'Đồng Nai')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (31, N'Fernaldo Torres', 1, 194568832, N'Bình Phước')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (32, N'Nguyễn Tấn Dũng', 1, 194533698, N'Bình Thuận')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (33, N'Phạm Hương', 0, 194531112, N'Bình Dương')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (34, N'Xuân Lan', 0, 194536823, N'Bình Định')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (35, N'Nguyễn Cao Kỳ Duyên', 0, 194536982, N'Lệ Thủy')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (36, N'Mỹ Linh', 0, 194536688, N'Điện Biên')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (37, N'Trọng Tấn', 1, 194586222, N'Sơn La')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (38, N'Đan Trường', 1, 194563358, N'Hải Phòng')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (39, N'Hoài Linh', 1, 194535867, N'Tây Ninh')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (40, N'Trường Giang', 1, 194536823, N'Gia Lai')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (41, N'Chí Tài', 1, 194586337, N'Kon Tum')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (42, N'Việt Hương', 0, 194585836, N'Hà Tĩnh')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (43, N'Trấn Thành', 1, 194563398, N'Vũng Tàu')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (44, N'Hari Won', 0, 194532223, N'Đà Lạt')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (45, N'Quang Lê', 1, 194533688, N'Nghệ An')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (46, N'Quang Dũng', 1, 194587739, N'Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (47, N'Tùng Dương', 1, 194586325, N'Hải Phòng')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (48, N'Tuấn Hưng', 1, 194588300, N'Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (49, N'Thu Minh', 0, 194538698, N'Đà Lạt')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [CMND], [DiaChi]) VALUES (50, N'Big Bang', 1, 194568235, N'Korea')
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (1, 0.02, 10000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (2, 0.04, 20000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (3, 0.01, 5000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (4, 0.03, 30000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (5, 0.05, 50000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (6, 0.02, 10000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (7, 0.04, 20000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (8, 0.01, 500000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (9, 0.03, 100000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (10, 0.05, 200000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (11, 0.1, 50000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (12, 0.2, 80000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (13, 0.3, 100000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (14, 0.4, 200000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (15, 0.5, 300000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (16, 0.6, 400000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (17, 0.7, 500000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (18, 0.8, 600000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (19, 0.9, 700000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (20, 0.07, 800000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (21, 0.02, 250000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (22, 0.03, 586000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (23, 0.5, 100000, NULL)
INSERT [dbo].[LaiSuat] ([MaLaiSuat], [MucLaiSuat], [TienGiaHan], [MoTa]) VALUES (24, 0.01, 900000, NULL)
INSERT [dbo].[LoaiTaiSan] ([MaLoaiTaiSan], [TenLoaiTaiSan]) VALUES (1, N'Xe')
INSERT [dbo].[LoaiTaiSan] ([MaLoaiTaiSan], [TenLoaiTaiSan]) VALUES (2, N'Thiết bị điện tử')
INSERT [dbo].[LoaiTaiSan] ([MaLoaiTaiSan], [TenLoaiTaiSan]) VALUES (3, N'Trang sức')
INSERT [dbo].[LoaiTaiSan] ([MaLoaiTaiSan], [TenLoaiTaiSan]) VALUES (4, N'Các loại giấy tờ')
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau]) VALUES (N'admin', N'12345')
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau]) VALUES (N'phuongvv', N'12345')
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau]) VALUES (N'vutt', N'12345')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (1, 1, N'Xe máy Honda', 1, NULL, N'Đã qua sử dụng 5 tháng, chất lượng đảm bảo.')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (2, 1, N'Xe đạp Asama', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (3, 1, N'Xe máy Exciter', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (4, 2, N'Điện thoại LG', 1, NULL, N'Dòng LG Optimus, đã qua sử dụng 3 tháng')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (5, 2, N'Loa Sony', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (6, 2, N'Máy tính bảng', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (7, 3, N'Vòng bạc', 1, NULL, N'Chất lượng tốt, mẫu mã bắt mắt')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (8, 3, N'Dây chuyền vàng', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (9, 3, N'Bông tai vàng', 1, NULL, N'Chất lượng tốt, mẫu mã bắt mắt')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (10, 4, N'Chứng minh  nhân dân', 1, NULL, N'Chưa thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (11, 4, N'Bằng lái xe', 1, NULL, N'Chưa thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (12, 4, N'Sổ đỏ', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (13, 1, N'Xe máy Suzuki', 1, NULL, N'Đã qua sử dụng 1 năm')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (14, 1, N'Xe máy Lead', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (15, 1, N'Xe máy Wave', 1, NULL, N'Đã qua sử dụng 7 tháng')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (16, 1, N'Xe đạp leo núi', 1, NULL, N'Mới sử dụng 2 tháng')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (17, 2, N'Điện thoại iphone', 1, NULL, N'Mới sử dụng 1 tháng, máy tốt')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (18, 2, N'Điện thoại SamSung', 1, NULL, N'Dòng galaxy S7, máy tốt')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (19, 2, N'Note 3', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (20, 2, N'Laptop Dell', 1, NULL, N'Đã sử dụng 5 tháng, còn bảo hành')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (21, 2, N'Laptop Asus', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (22, 3, N'Lắc tay vàng', 1, NULL, N'Chất lượng tốt')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (23, 3, N'Nhẫn kim cương', 0, NULL, N'Đã thanh lý')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (24, 3, N'Dây chuyền bạc', 1, NULL, N'Chất lượng tốt')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (25, 3, N'Nhẫn vàng', 1, NULL, N'Chất lượng tốt')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (26, 2, N'May Tinh Asus', 11, N'images/1490064573026.jpg', N'da qua su dung 12 thang')
INSERT [dbo].[TaiSan] ([MaTaiSan], [MaLoaiTaiSan], [TenTaiSan], [TinhTrang], [UrlHinhAnh], [MoTa]) VALUES (30, 2, N'Laptop Asus', 12, N'images/1490065735096.jpg', N'no')
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (1, 1, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (2, 2, 1000000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (3, 3, 35000000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (4, 4, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (5, 5, 700000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (6, 6, 10000000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (7, 7, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (8, 8, 5000000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (9, 9, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (10, 10, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (11, 11, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (12, 12, 2000000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (13, 13, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (14, 14, 30000000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (15, 15, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (16, 16, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (17, 17, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (18, 18, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (19, 19, 10000000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (20, 20, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (21, 21, 9000000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (22, 22, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (23, 23, 12000000)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (24, 24, 0)
INSERT [dbo].[ThanhLy] ([MaThanhLy], [MaTaiSan], [SoTienThanhLy]) VALUES (25, 25, 0)
ALTER TABLE [dbo].[ChiTietHopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHopDong_DongTienLai] FOREIGN KEY([MaDongLai])
REFERENCES [dbo].[DongTienLai] ([MaDongLai])
GO
ALTER TABLE [dbo].[ChiTietHopDong] CHECK CONSTRAINT [FK_ChiTietHopDong_DongTienLai]
GO
ALTER TABLE [dbo].[ChiTietHopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHopDong_HopDong] FOREIGN KEY([MaHopDong])
REFERENCES [dbo].[HopDong] ([MaHopDong])
GO
ALTER TABLE [dbo].[ChiTietHopDong] CHECK CONSTRAINT [FK_ChiTietHopDong_HopDong]
GO
ALTER TABLE [dbo].[ChiTietHopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHopDong_LaiSuat] FOREIGN KEY([MaTaiSan])
REFERENCES [dbo].[LaiSuat] ([MaLaiSuat])
GO
ALTER TABLE [dbo].[ChiTietHopDong] CHECK CONSTRAINT [FK_ChiTietHopDong_LaiSuat]
GO
ALTER TABLE [dbo].[ChiTietHopDong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHopDong_TaiSan] FOREIGN KEY([MaTaiSan])
REFERENCES [dbo].[TaiSan] ([MaTaiSan])
GO
ALTER TABLE [dbo].[ChiTietHopDong] CHECK CONSTRAINT [FK_ChiTietHopDong_TaiSan]
GO
ALTER TABLE [dbo].[GiaHan]  WITH CHECK ADD  CONSTRAINT [FK_GiaHan_ChiTietHopDong] FOREIGN KEY([MaCTHD])
REFERENCES [dbo].[ChiTietHopDong] ([MaCTHD])
GO
ALTER TABLE [dbo].[GiaHan] CHECK CONSTRAINT [FK_GiaHan_ChiTietHopDong]
GO
ALTER TABLE [dbo].[GiaHan]  WITH CHECK ADD  CONSTRAINT [FK_GiaHan_LaiSuat1] FOREIGN KEY([MaLaiSuat])
REFERENCES [dbo].[LaiSuat] ([MaLaiSuat])
GO
ALTER TABLE [dbo].[GiaHan] CHECK CONSTRAINT [FK_GiaHan_LaiSuat1]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HopDong_KhachHang]
GO
ALTER TABLE [dbo].[TaiSan]  WITH CHECK ADD  CONSTRAINT [FK_TaiSan_DanhMucTaiSan] FOREIGN KEY([MaLoaiTaiSan])
REFERENCES [dbo].[LoaiTaiSan] ([MaLoaiTaiSan])
GO
ALTER TABLE [dbo].[TaiSan] CHECK CONSTRAINT [FK_TaiSan_DanhMucTaiSan]
GO
ALTER TABLE [dbo].[ThanhLy]  WITH CHECK ADD  CONSTRAINT [FK_ThanhLy_TaiSan] FOREIGN KEY([MaTaiSan])
REFERENCES [dbo].[TaiSan] ([MaTaiSan])
GO
ALTER TABLE [dbo].[ThanhLy] CHECK CONSTRAINT [FK_ThanhLy_TaiSan]
GO
USE [master]
GO
ALTER DATABASE [QuanLyCamDo] SET  READ_WRITE 
GO
