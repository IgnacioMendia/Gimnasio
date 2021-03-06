USE [master]
GO
/****** Object:  Database [Gimnasio]    Script Date: 10/6/2020 14:35:09 ******/
CREATE DATABASE [Gimnasio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gimnasio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gimnasio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gimnasio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gimnasio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Gimnasio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gimnasio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gimnasio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gimnasio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gimnasio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gimnasio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gimnasio] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gimnasio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gimnasio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gimnasio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gimnasio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gimnasio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gimnasio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gimnasio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gimnasio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gimnasio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gimnasio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gimnasio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gimnasio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gimnasio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gimnasio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gimnasio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gimnasio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gimnasio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gimnasio] SET RECOVERY FULL 
GO
ALTER DATABASE [Gimnasio] SET  MULTI_USER 
GO
ALTER DATABASE [Gimnasio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gimnasio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gimnasio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gimnasio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gimnasio] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gimnasio', N'ON'
GO
ALTER DATABASE [Gimnasio] SET QUERY_STORE = OFF
GO
USE [Gimnasio]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionArticulo] [nchar](50) NULL,
	[CantidadDeposito] [int] NULL,
	[CantidadVendida] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaArticulos]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaArticulos]
AS
SELECT        id, DescripcionArticulo, CantidadDeposito, Precio
FROM            dbo.Articulos
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellido] [varchar](20) NULL,
	[FechaIngreso] [date] NULL,
	[IdActividad] [int] NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividades](
	[IdActividad] [int] IDENTITY(1,1) NOT NULL,
	[NombreActividad] [nchar](50) NULL,
	[Precio] [int] NULL,
 CONSTRAINT [PK_Actividades_1] PRIMARY KEY CLUSTERED 
(
	[IdActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaAlumnos]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaAlumnos]
AS
SELECT        dbo.Alumnos.Id, dbo.Alumnos.Apellido, dbo.Alumnos.Nombre, dbo.Alumnos.FechaIngreso AS [Fecha de ingreso], dbo.Actividades.IdActividad, dbo.Actividades.NombreActividad
FROM            dbo.Actividades INNER JOIN
                         dbo.Alumnos ON dbo.Actividades.IdActividad = dbo.Alumnos.IdActividad
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellido] [nchar](20) NULL,
	[FechaContratacion] [datetime] NULL,
	[Titulo] [nchar](50) NULL,
	[IdActividad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaProfesores]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaProfesores]
AS
SELECT        dbo.Profesores.ID, dbo.Profesores.Nombre, dbo.Profesores.Apellido, dbo.Profesores.FechaContratacion, dbo.Profesores.Titulo, dbo.Actividades.NombreActividad AS [Actividad principal]
FROM            dbo.Actividades INNER JOIN
                         dbo.Profesores ON dbo.Actividades.IdActividad = dbo.Profesores.ID
GO
/****** Object:  Table [dbo].[Administrativos]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrativos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Apellido] [nchar](50) NULL,
	[FechaContratacion] [datetime] NULL,
 CONSTRAINT [PK_Administrativos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Limpieza]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Limpieza](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](30) NULL,
	[Apellido] [nchar](30) NULL,
	[FechaContratacion] [datetime] NULL,
 CONSTRAINT [PK_Limpieza] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registros]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[CantidadVendida] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
	[Fecha] [datetime] NULL,
	[Cliente] [nchar](50) NULL,
	[FormaPago] [nchar](20) NULL,
	[PrecioFinal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Registros] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actividades] ON 

INSERT [dbo].[Actividades] ([IdActividad], [NombreActividad], [Precio]) VALUES (1, N'Musculacion                                       ', 1500)
INSERT [dbo].[Actividades] ([IdActividad], [NombreActividad], [Precio]) VALUES (2, N'Funcional                                         ', 1800)
INSERT [dbo].[Actividades] ([IdActividad], [NombreActividad], [Precio]) VALUES (3, N'Spinning                                          ', 1700)
INSERT [dbo].[Actividades] ([IdActividad], [NombreActividad], [Precio]) VALUES (4, N'Alto rendimiento                                  ', 2500)
INSERT [dbo].[Actividades] ([IdActividad], [NombreActividad], [Precio]) VALUES (5, N'Yoga                                              ', 1300)
INSERT [dbo].[Actividades] ([IdActividad], [NombreActividad], [Precio]) VALUES (6, N'Danza                                             ', 1300)
INSERT [dbo].[Actividades] ([IdActividad], [NombreActividad], [Precio]) VALUES (7, N'Zumba                                             ', 1500)
INSERT [dbo].[Actividades] ([IdActividad], [NombreActividad], [Precio]) VALUES (8, N'Grupo de entrenamiento                            ', 2500)
SET IDENTITY_INSERT [dbo].[Actividades] OFF
GO
SET IDENTITY_INSERT [dbo].[Administrativos] ON 

INSERT [dbo].[Administrativos] ([ID], [Nombre], [Apellido], [FechaContratacion]) VALUES (1002, N'Mauro                                             ', N'Matos                                             ', CAST(N'2020-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Administrativos] ([ID], [Nombre], [Apellido], [FechaContratacion]) VALUES (1003, N'Angel                                             ', N'Correa                                            ', CAST(N'2019-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Administrativos] ([ID], [Nombre], [Apellido], [FechaContratacion]) VALUES (1004, N'Tito                                              ', N'Villalba                                          ', CAST(N'2019-12-04T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Administrativos] OFF
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaIngreso], [IdActividad]) VALUES (6, N'TorreS', N'Aureliano', CAST(N'2020-12-05' AS Date), 2)
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaIngreso], [IdActividad]) VALUES (8, N'Ignacio', N'Mendia', CAST(N'2020-12-05' AS Date), 5)
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaIngreso], [IdActividad]) VALUES (9, N'Diego', N'Simeone', CAST(N'2019-05-10' AS Date), 2)
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaIngreso], [IdActividad]) VALUES (10, N'Gabriel', N'Batistuta', CAST(N'2020-08-04' AS Date), 4)
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 

INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (1, N'RemeraS                                           ', 9, NULL, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (2, N'RemeraM                                           ', 6, NULL, CAST(525 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (3, N'RemeraL                                           ', 43, NULL, CAST(550 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (4, N'RemeraXL                                          ', 15, NULL, CAST(575 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (5, N'CalzaS                                            ', 26, NULL, CAST(690 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (6, N'CalzaM                                            ', 18, NULL, CAST(710 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (7, N'CalzaL                                            ', 29, NULL, CAST(750 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (8, N'CalzaXL                                           ', 27, NULL, CAST(750 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (9, N'ShortS                                            ', 15, NULL, CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (10, N'ShortM                                            ', 27, NULL, CAST(320 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (11, N'ShortL                                            ', 36, NULL, CAST(320 AS Decimal(18, 0)))
INSERT [dbo].[Articulos] ([id], [DescripcionArticulo], [CantidadDeposito], [CantidadVendida], [Precio]) VALUES (12, N'ShortXL                                           ', 12, NULL, CAST(350 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Limpieza] ON 

INSERT [dbo].[Limpieza] ([ID], [Nombre], [Apellido], [FechaContratacion]) VALUES (1002, N'Julio                         ', N'Buffarini                     ', CAST(N'2020-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Limpieza] ([ID], [Nombre], [Apellido], [FechaContratacion]) VALUES (1003, N'Morro                         ', N'Garcia                        ', CAST(N'2020-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Limpieza] ([ID], [Nombre], [Apellido], [FechaContratacion]) VALUES (1004, N'Ariel                         ', N'Garce                         ', CAST(N'2020-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Limpieza] ([ID], [Nombre], [Apellido], [FechaContratacion]) VALUES (1005, N'Felix                         ', N'Orode                         ', CAST(N'2020-03-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Limpieza] OFF
GO
SET IDENTITY_INSERT [dbo].[Profesores] ON 

INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [FechaContratacion], [Titulo], [IdActividad]) VALUES (1, N'Juan Roman', N'Riquelme            ', CAST(N'2020-05-10T00:00:00.000' AS DateTime), N'Profesor nacional de educación fisica             ', 1)
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [FechaContratacion], [Titulo], [IdActividad]) VALUES (2, N'Atilio', N'Romagnoli           ', CAST(N'2020-05-07T00:00:00.000' AS DateTime), N'Instructor de spinning                            ', 1)
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [FechaContratacion], [Titulo], [IdActividad]) VALUES (3, N'Nicolas', N'Blandi              ', CAST(N'2020-03-04T00:00:00.000' AS DateTime), N'Profesor nacional de educación fisica             ', 1)
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [FechaContratacion], [Titulo], [IdActividad]) VALUES (4, N'Juan', N'Mercier             ', CAST(N'2020-05-04T00:00:00.000' AS DateTime), N'Profesor nacional de educación fisica             ', 1)
SET IDENTITY_INSERT [dbo].[Profesores] OFF
GO
SET IDENTITY_INSERT [dbo].[Registros] ON 

INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (1, NULL, 2, NULL, CAST(N'2020-05-15T14:51:36.910' AS DateTime), N'Ignacio Mendia                                    ', N'Efectivo            ', NULL)
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (2, 2, 2, NULL, CAST(N'2020-05-15T14:54:30.153' AS DateTime), N'Ignacio Mendia                                    ', N'Efectivo            ', NULL)
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (4, 1, 9, NULL, CAST(N'2020-05-15T21:09:47.140' AS DateTime), N'Carlos                                            ', N'Tarjeta de credito  ', CAST(575 AS Decimal(18, 0)))
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (6, 4, 9, NULL, CAST(N'2020-05-15T21:17:25.593' AS DateTime), N'Martinex                                          ', N'Efectivo            ', NULL)
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (7, 2, 5, NULL, CAST(N'2020-05-15T21:18:44.590' AS DateTime), N'Juan Carlos                                       ', N'Cheque              ', NULL)
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (8, 2, 6, NULL, CAST(N'2020-05-15T22:16:21.073' AS DateTime), N'Lautaro Martinez                                  ', N'Efectivo            ', CAST(755 AS Decimal(18, 0)))
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (9, 3, 2, NULL, CAST(N'2020-05-15T22:19:06.833' AS DateTime), N'Leonel Messi                                      ', N'Cheque              ', NULL)
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (10, 4, 1, CAST(575 AS Decimal(18, 0)), CAST(N'2020-05-15T22:23:53.187' AS DateTime), N'Nicolas Blandi                                    ', N'Tarjeta de debito   ', NULL)
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (11, 8, 5, CAST(750 AS Decimal(18, 0)), CAST(N'2020-05-15T22:27:57.503' AS DateTime), N'Luis Suarez                                       ', N'canje               ', NULL)
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (12, 3, 3, CAST(550 AS Decimal(18, 0)), CAST(N'2020-05-18T13:06:55.260' AS DateTime), N'Griezman                                          ', N'Tarjeta de credito  ', NULL)
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (13, 2, 4, CAST(525 AS Decimal(18, 0)), CAST(N'2020-05-18T13:24:09.247' AS DateTime), N'Ignacio Mendia                                    ', N'Efectivo            ', CAST(2100 AS Decimal(18, 0)))
INSERT [dbo].[Registros] ([Id], [IdProducto], [CantidadVendida], [Precio], [Fecha], [Cliente], [FormaPago], [PrecioFinal]) VALUES (14, 3, 2, CAST(550 AS Decimal(18, 0)), CAST(N'2020-05-19T13:14:17.770' AS DateTime), N'Leonel Messi                                      ', N'Efectivo            ', CAST(1100 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Registros] OFF
GO
/****** Object:  Index [IX_Actividades]    Script Date: 10/6/2020 14:35:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Actividades] ON [dbo].[Actividades]
(
	[IdActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Registros]  WITH CHECK ADD  CONSTRAINT [FK_Registros_Articulos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Articulos] ([id])
GO
ALTER TABLE [dbo].[Registros] CHECK CONSTRAINT [FK_Registros_Articulos]
GO
/****** Object:  StoredProcedure [dbo].[ProcTraer]    Script Date: 10/6/2020 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProcTraer]
( @Tabla nvarchar(20) )
as
declare @sentencia nvarchar(200)
set @sentencia='select * from ' + @Tabla 
execute (@sentencia)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[43] 2[5] 3) )"
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
         Begin Table = "Actividades"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Alumnos"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 136
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 1
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaAlumnos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaAlumnos'
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
         Begin Table = "Articulos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 1
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaArticulos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaArticulos'
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
         Begin Table = "Actividades"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Profesores"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 3
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaProfesores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaProfesores'
GO
USE [master]
GO
ALTER DATABASE [Gimnasio] SET  READ_WRITE 
GO
