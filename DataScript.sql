USE [master]
GO
/****** Object:  Database [PRJ301_Assignment]    Script Date: 10/30/2022 11:26:03 AM ******/
CREATE DATABASE [PRJ301_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_Assignment', FILENAME = N'D:\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_Assignment_log', FILENAME = N'D:\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301_Assignment', N'ON'
GO
ALTER DATABASE [PRJ301_Assignment] SET QUERY_STORE = OFF
GO
USE [PRJ301_Assignment]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 10/30/2022 11:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[sesid] [int] NOT NULL,
	[stdid] [int] NOT NULL,
	[present] [bit] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[record_time] [datetime] NULL,
 CONSTRAINT [PK_Attandance] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC,
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 10/30/2022 11:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[sem] [varchar](150) NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 10/30/2022 11:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/30/2022 11:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 10/30/2022 11:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[sesid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[tid] [int] NOT NULL,
	[index] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[attanded] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/30/2022 11:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stdid] [int] NOT NULL,
	[stdname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Group]    Script Date: 10/30/2022 11:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Group](
	[stdid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Student_Group] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/30/2022 11:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 10/30/2022 11:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 1, 1, N'no probelm', CAST(N'2022-10-30T10:15:26.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 2, 0, N' ', CAST(N'2022-10-30T10:15:26.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 3, 1, N' ', CAST(N'2022-10-30T10:15:26.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 4, 0, N'Test', CAST(N'2022-10-30T10:15:26.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 7, 1, N'A', CAST(N'2022-10-30T10:15:26.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 1, 1, N'A', CAST(N'2022-10-30T10:25:14.673' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 2, 0, N'', CAST(N'2022-10-30T10:25:14.673' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 3, 0, N'', CAST(N'2022-10-30T10:25:14.677' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 4, 0, N'', CAST(N'2022-10-30T10:25:14.677' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 7, 0, N'', CAST(N'2022-10-30T10:25:14.677' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 1, 1, N'', CAST(N'2022-10-29T16:26:30.650' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 2, 1, N'', CAST(N'2022-10-29T16:26:30.650' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 3, 1, N'', CAST(N'2022-10-29T16:26:30.650' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 4, 0, N'', CAST(N'2022-10-29T16:26:30.650' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 7, 0, N'', CAST(N'2022-10-29T16:26:30.650' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 1, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 2, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 3, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 4, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 5, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 6, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 7, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 1, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 2, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 3, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 4, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 5, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 6, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 7, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 1, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 2, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 3, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 4, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 5, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 6, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 7, 0, N'', CAST(N'2022-10-26T10:56:01.747' AS DateTime))
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (1, N'SE1643', 1, 1, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (2, N'SE1645', 1, 1, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (3, N'AI1672', 1, 2, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (4, N'SE1643', 2, 1, N'FALL', 2022)
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (1, N'Sonnt5')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (2, N'CauPD')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (3, N'AnNT79')
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'DE-C205')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'DE-C203')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (3, N'AL-L201')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (4, N'DE-C207')
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (1, 1, 1, CAST(N'2022-10-10' AS Date), 1, 1, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (2, 1, 1, CAST(N'2022-10-12' AS Date), 1, 2, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (3, 1, 1, CAST(N'2022-10-14' AS Date), 1, 3, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (4, 1, 1, CAST(N'2022-10-17' AS Date), 1, 4, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (5, 1, 1, CAST(N'2022-10-19' AS Date), 1, 5, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (6, 2, 1, CAST(N'2022-10-10' AS Date), 2, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (7, 2, 1, CAST(N'2022-10-12' AS Date), 2, 2, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (8, 2, 1, CAST(N'2022-10-14' AS Date), 2, 3, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (9, 2, 1, CAST(N'2022-10-17' AS Date), 2, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (10, 2, 1, CAST(N'2022-10-19' AS Date), 2, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (11, 3, 2, CAST(N'2022-10-10' AS Date), 1, 1, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (12, 3, 2, CAST(N'2022-10-12' AS Date), 1, 1, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (13, 3, 2, CAST(N'2022-10-14' AS Date), 1, 1, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (14, 3, 2, CAST(N'2022-10-17' AS Date), 1, 1, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (15, 3, 2, CAST(N'2022-10-19' AS Date), 1, 1, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (16, 4, 1, CAST(N'2022-10-10' AS Date), 3, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (17, 4, 1, CAST(N'2022-10-12' AS Date), 3, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (18, 4, 1, CAST(N'2022-10-14' AS Date), 3, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (19, 4, 1, CAST(N'2022-10-17' AS Date), 3, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (20, 4, 1, CAST(N'2022-10-19' AS Date), 3, 1, 1, 0)
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (1, N'Nguyen Thanh Long')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (2, N'Hua Duy Khanh')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (3, N'Tran Van Hoang')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (4, N'Nguyen Thi Quynh Anh')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (5, N'Dang Thuy Trang')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (6, N'Hoang Chu Anh Vu')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (7, N'Nguyen Luong Khang')
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 2)
GO
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (2, N'PRO192')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (1, N'7:30 -9:00')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (2, N'9:10 - 10:40')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (3, N'10:50 - 12:20')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (4, N'12:50 - 14:20')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (5, N'14:30 - 16:00')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (6, N'16:10 - 17:40')
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Session] FOREIGN KEY([sesid])
REFERENCES [dbo].[Session] ([sesid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attandance_Session]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attandance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Lecturer]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Group]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Student]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment] SET  READ_WRITE 
GO
