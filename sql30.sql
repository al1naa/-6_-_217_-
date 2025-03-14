USE [master]
GO
/****** Object:  Database [user30]    Script Date: 29.03.2024 11:53:32 ******/
CREATE DATABASE [user30]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user30', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\user30.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'user30_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\user30_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [user30] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user30].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user30] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user30] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user30] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user30] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user30] SET ARITHABORT OFF 
GO
ALTER DATABASE [user30] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [user30] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user30] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user30] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user30] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user30] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user30] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user30] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user30] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user30] SET  ENABLE_BROKER 
GO
ALTER DATABASE [user30] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user30] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user30] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user30] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user30] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user30] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user30] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user30] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [user30] SET  MULTI_USER 
GO
ALTER DATABASE [user30] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user30] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user30] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user30] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user30] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user30] SET QUERY_STORE = OFF
GO
USE [user30]
GO
/****** Object:  Table [dbo].[klient]    Script Date: 29.03.2024 11:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klient](
	[id_klient] [int] IDENTITY(1,1) NOT NULL,
	[f] [nvarchar](30) NULL,
	[i] [nvarchar](30) NULL,
	[o] [nvarchar](30) NULL,
	[pasport] [char](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_klient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[poezdki]    Script Date: 29.03.2024 11:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[poezdki](
	[id_poezdki] [int] IDENTITY(1,1) NOT NULL,
	[id_klientt] [int] NULL,
	[fio_klienta] [nvarchar](90) NULL,
	[cel_poezdki] [nvarchar](100) NULL,
	[kolvo_dney] [int] NULL,
	[stoimost_vizi] [money] NULL,
	[stoimost_1dna] [money] NULL,
	[data_nachala] [nvarchar](30) NULL,
	[data_konca] [nvarchar](30) NULL,
	[straana_naznachenia] [nvarchar](50) NULL,
	[id_marshrutii] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_poezdki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 29.03.2024 11:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.klient.id_klient, dbo.klient.f, dbo.klient.i, dbo.poezdki.straana_naznachenia
FROM            dbo.klient INNER JOIN
                         dbo.poezdki ON dbo.klient.id_klient = dbo.poezdki.id_klientt
WHERE        (dbo.klient.f = N'Пачгина') AND (dbo.klient.i = N'Ангелина')
GO
/****** Object:  View [dbo].[View_3]    Script Date: 29.03.2024 11:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT        dbo.klient.id_klient, dbo.poezdki.fio_klienta, dbo.poezdki.straana_naznachenia
FROM            dbo.klient INNER JOIN
                         dbo.poezdki ON dbo.klient.id_klient = dbo.poezdki.id_klientt
WHERE        (dbo.poezdki.straana_naznachenia = N'Россия')
GO
/****** Object:  Table [dbo].[marshruti]    Script Date: 29.03.2024 11:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marshruti](
	[id_marshruti] [int] IDENTITY(1,1) NOT NULL,
	[strana_otpravlenia] [nvarchar](50) NULL,
	[strana_naznachenia] [nvarchar](50) NULL,
	[stoimost_transport] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marshruti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[klient] ON 

INSERT [dbo].[klient] ([id_klient], [f], [i], [o], [pasport]) VALUES (1, N'Пачгина', N'Ангелина', N'Константиновна', N'2323 893458')
INSERT [dbo].[klient] ([id_klient], [f], [i], [o], [pasport]) VALUES (2, N'Тахаутдинова', N'Алина', N'Алексеевна', N'2374 397493')
INSERT [dbo].[klient] ([id_klient], [f], [i], [o], [pasport]) VALUES (3, N'Пачгина ', N'Виктория', N'Константиновна', N'2133 343748')
INSERT [dbo].[klient] ([id_klient], [f], [i], [o], [pasport]) VALUES (4, N'Загигулин', N'Руслан', N'Русланович', N'2736 823792')
INSERT [dbo].[klient] ([id_klient], [f], [i], [o], [pasport]) VALUES (5, N'Шабанов', N'Никита', N'Тенотенов', N'3649 734993')
SET IDENTITY_INSERT [dbo].[klient] OFF
GO
SET IDENTITY_INSERT [dbo].[marshruti] ON 

INSERT [dbo].[marshruti] ([id_marshruti], [strana_otpravlenia], [strana_naznachenia], [stoimost_transport]) VALUES (1, N'Россия ', N'Япония', 20972.0000)
INSERT [dbo].[marshruti] ([id_marshruti], [strana_otpravlenia], [strana_naznachenia], [stoimost_transport]) VALUES (2, N'Япония', N'Россия ', 27357.0000)
INSERT [dbo].[marshruti] ([id_marshruti], [strana_otpravlenia], [strana_naznachenia], [stoimost_transport]) VALUES (3, N'Россия ', N'Таджикистан', 20345.0000)
INSERT [dbo].[marshruti] ([id_marshruti], [strana_otpravlenia], [strana_naznachenia], [stoimost_transport]) VALUES (4, N'Таджикистан', N'Россия', 19665.0000)
INSERT [dbo].[marshruti] ([id_marshruti], [strana_otpravlenia], [strana_naznachenia], [stoimost_transport]) VALUES (5, N'Россия', N'Северная Корея', 21731681.0000)
SET IDENTITY_INSERT [dbo].[marshruti] OFF
GO
SET IDENTITY_INSERT [dbo].[poezdki] ON 

INSERT [dbo].[poezdki] ([id_poezdki], [id_klientt], [fio_klienta], [cel_poezdki], [kolvo_dney], [stoimost_vizi], [stoimost_1dna], [data_nachala], [data_konca], [straana_naznachenia], [id_marshrutii]) VALUES (1, 1, N'Пачгина А.К.', N'Отдых', 10, 12000.0000, 6590.0000, N'01.08.2024', N'10.08.2024', N'Япония', 1)
INSERT [dbo].[poezdki] ([id_poezdki], [id_klientt], [fio_klienta], [cel_poezdki], [kolvo_dney], [stoimost_vizi], [stoimost_1dna], [data_nachala], [data_konca], [straana_naznachenia], [id_marshrutii]) VALUES (2, 2, N'Тахаутдинова А.А.', N'Домой', 7, 0.0000, 32000.0000, N'30.08.2024', N'07.09.2024', N'Россия', 2)
INSERT [dbo].[poezdki] ([id_poezdki], [id_klientt], [fio_klienta], [cel_poezdki], [kolvo_dney], [stoimost_vizi], [stoimost_1dna], [data_nachala], [data_konca], [straana_naznachenia], [id_marshrutii]) VALUES (3, 3, N'Пачгина В.К.', N'Отдых', 10, 12000.0000, 5700.0000, N'01.08.2024', N'10.08.2024', N'Япония', 1)
INSERT [dbo].[poezdki] ([id_poezdki], [id_klientt], [fio_klienta], [cel_poezdki], [kolvo_dney], [stoimost_vizi], [stoimost_1dna], [data_nachala], [data_konca], [straana_naznachenia], [id_marshrutii]) VALUES (4, 4, N'Загигулин Р.Р.', N'Командировка', 5, 32555.0000, 6549.0000, N'14.03.2024', N'19.03.2024', N'Северная Корея', 5)
INSERT [dbo].[poezdki] ([id_poezdki], [id_klientt], [fio_klienta], [cel_poezdki], [kolvo_dney], [stoimost_vizi], [stoimost_1dna], [data_nachala], [data_konca], [straana_naznachenia], [id_marshrutii]) VALUES (5, 5, N'Шабанов Н.Т.', N'Манты и пиво', 14, 34000.0000, 8969.0000, N'05.04.2024', N'19.05.2024', N'Таджикистан', 3)
INSERT [dbo].[poezdki] ([id_poezdki], [id_klientt], [fio_klienta], [cel_poezdki], [kolvo_dney], [stoimost_vizi], [stoimost_1dna], [data_nachala], [data_konca], [straana_naznachenia], [id_marshrutii]) VALUES (6, 1, N'Пачгина А.К', N'Обратно домой', 10, 25637.0000, 5723.0000, N'10.08.2024', N'20.08.2024', N'Россия', 2)
SET IDENTITY_INSERT [dbo].[poezdki] OFF
GO
ALTER TABLE [dbo].[poezdki]  WITH CHECK ADD FOREIGN KEY([id_klientt])
REFERENCES [dbo].[klient] ([id_klient])
GO
ALTER TABLE [dbo].[poezdki]  WITH CHECK ADD FOREIGN KEY([id_marshrutii])
REFERENCES [dbo].[marshruti] ([id_marshruti])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "klient"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "poezdki"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "klient"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "poezdki"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
USE [master]
GO
ALTER DATABASE [user30] SET  READ_WRITE 
GO
