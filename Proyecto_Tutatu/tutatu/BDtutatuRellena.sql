USE [master]
GO
/****** Object:  Database [tutatu]    Script Date: 01/11/2016 23:32:27 ******/
CREATE DATABASE [tutatu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tutatu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\tutatu.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tutatu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\tutatu_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tutatu] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tutatu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tutatu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tutatu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tutatu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tutatu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tutatu] SET ARITHABORT OFF 
GO
ALTER DATABASE [tutatu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tutatu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tutatu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tutatu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tutatu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tutatu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tutatu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tutatu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tutatu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tutatu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tutatu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tutatu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tutatu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tutatu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tutatu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tutatu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tutatu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tutatu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tutatu] SET  MULTI_USER 
GO
ALTER DATABASE [tutatu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tutatu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tutatu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tutatu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [tutatu] SET DELAYED_DURABILITY = DISABLED 
GO
USE [tutatu]
GO
/****** Object:  Table [dbo].[comentario]    Script Date: 01/11/2016 23:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comentario](
	[id-com] [smallint] IDENTITY(1,1) NOT NULL,
	[id-u] [smallint] NOT NULL,
	[date] [datetime] NOT NULL,
	[zone-id] [smallint] NOT NULL,
	[cont-id] [smallint] NULL,
	[content] [varchar](max) NULL,
 CONSTRAINT [PK_comentario] PRIMARY KEY CLUSTERED 
(
	[id-com] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 01/11/2016 23:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empresa](
	[id-emp] [smallint] IDENTITY(1,1) NOT NULL,
	[id-u] [smallint] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[cif] [varchar](10) NOT NULL,
	[address] [varchar](200) NULL,
	[phone] [varchar](15) NULL,
	[owner] [varchar](50) NOT NULL,
	[email] [varchar](100) NULL,
	[web] [varchar](100) NOT NULL,
	[services] [varchar](max) NOT NULL,
	[trayectoria] [varchar](max) NOT NULL,
 CONSTRAINT [PK_empresa] PRIMARY KEY CLUSTERED 
(
	[id-emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[noticia]    Script Date: 01/11/2016 23:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[noticia](
	[id-not] [smallint] IDENTITY(1,1) NOT NULL,
	[id-u] [smallint] NOT NULL,
	[date] [datetime] NOT NULL,
	[zone-id] [smallint] NOT NULL,
	[cont-id] [smallint] NULL,
	[content] [varchar](max) NULL,
 CONSTRAINT [PK_noticia] PRIMARY KEY CLUSTERED 
(
	[id-not] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tatuador]    Script Date: 01/11/2016 23:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tatuador](
	[id-tat] [smallint] IDENTITY(1,1) NOT NULL,
	[id-emp] [smallint] NOT NULL,
	[fname-tat] [varchar](50) NOT NULL,
	[sname-tat] [varchar](50) NOT NULL,
	[email-tat] [varchar](100) NULL,
	[phone-tat] [varchar](15) NULL,
	[style-tat] [varchar](max) NULL,
	[ink-tat] [varchar](200) NOT NULL,
	[designer-tat] [bit] NOT NULL,
	[trayectory-tat] [varchar](max) NULL,
	[study-tat] [varchar](100) NULL,
 CONSTRAINT [PK_tatuador] PRIMARY KEY CLUSTERED 
(
	[id-tat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tatuaje]    Script Date: 01/11/2016 23:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tatuaje](
	[id-tatoo] [smallint] IDENTITY(1,1) NOT NULL,
	[id-wu] [smallint] NOT NULL,
	[id-tat] [smallint] NOT NULL,
	[style-tatoo] [varchar](100) NULL,
	[color-tatoo] [bit] NOT NULL,
	[date-tatoo] [datetime] NOT NULL,
	[time-tatoo] [time](7) NOT NULL,
	[price-tatoo] [money] NULL,
	[shoot-date] [datetime] NOT NULL,
 CONSTRAINT [PK_tatuaje] PRIMARY KEY CLUSTERED 
(
	[id-tatoo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 01/11/2016 23:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id-u] [smallint] IDENTITY(1,1) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[pass1] [varchar](100) NOT NULL,
	[pass2] [varchar](100) NOT NULL,
	[date-reg] [datetime] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id-u] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[webuser]    Script Date: 01/11/2016 23:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[webuser](
	[id-wu] [smallint] IDENTITY(1,1) NOT NULL,
	[id-u] [smallint] NOT NULL,
	[fname] [varchar](50) NOT NULL,
	[sname] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[b-date] [datetime] NULL,
	[sexo] [varchar](10) NULL,
 CONSTRAINT [PK_webuser] PRIMARY KEY CLUSTERED 
(
	[id-wu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zona]    Script Date: 01/11/2016 23:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zona](
	[id-zone] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_zona] PRIMARY KEY CLUSTERED 
(
	[id-zone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[comentario]  WITH CHECK ADD  CONSTRAINT [FK_comentario_usuarios] FOREIGN KEY([id-u])
REFERENCES [dbo].[usuarios] ([id-u])
GO
ALTER TABLE [dbo].[comentario] CHECK CONSTRAINT [FK_comentario_usuarios]
GO
ALTER TABLE [dbo].[comentario]  WITH CHECK ADD  CONSTRAINT [FK_comentario_zona] FOREIGN KEY([zone-id])
REFERENCES [dbo].[zona] ([id-zone])
GO
ALTER TABLE [dbo].[comentario] CHECK CONSTRAINT [FK_comentario_zona]
GO
ALTER TABLE [dbo].[empresa]  WITH CHECK ADD  CONSTRAINT [FK_empresa_usuarios] FOREIGN KEY([id-u])
REFERENCES [dbo].[usuarios] ([id-u])
GO
ALTER TABLE [dbo].[empresa] CHECK CONSTRAINT [FK_empresa_usuarios]
GO
ALTER TABLE [dbo].[noticia]  WITH CHECK ADD  CONSTRAINT [FK_noticia_usuarios] FOREIGN KEY([id-u])
REFERENCES [dbo].[usuarios] ([id-u])
GO
ALTER TABLE [dbo].[noticia] CHECK CONSTRAINT [FK_noticia_usuarios]
GO
ALTER TABLE [dbo].[noticia]  WITH CHECK ADD  CONSTRAINT [FK_noticia_zona] FOREIGN KEY([zone-id])
REFERENCES [dbo].[zona] ([id-zone])
GO
ALTER TABLE [dbo].[noticia] CHECK CONSTRAINT [FK_noticia_zona]
GO
ALTER TABLE [dbo].[tatuador]  WITH CHECK ADD  CONSTRAINT [FK_tatuador_empresa] FOREIGN KEY([id-emp])
REFERENCES [dbo].[empresa] ([id-emp])
GO
ALTER TABLE [dbo].[tatuador] CHECK CONSTRAINT [FK_tatuador_empresa]
GO
ALTER TABLE [dbo].[tatuaje]  WITH CHECK ADD  CONSTRAINT [FK_tatuaje_tatuador] FOREIGN KEY([id-tat])
REFERENCES [dbo].[tatuador] ([id-tat])
GO
ALTER TABLE [dbo].[tatuaje] CHECK CONSTRAINT [FK_tatuaje_tatuador]
GO
ALTER TABLE [dbo].[tatuaje]  WITH CHECK ADD  CONSTRAINT [FK_tatuaje_webuser] FOREIGN KEY([id-wu])
REFERENCES [dbo].[webuser] ([id-wu])
GO
ALTER TABLE [dbo].[tatuaje] CHECK CONSTRAINT [FK_tatuaje_webuser]
GO
ALTER TABLE [dbo].[webuser]  WITH CHECK ADD  CONSTRAINT [FK_webuser_usuarios] FOREIGN KEY([id-u])
REFERENCES [dbo].[usuarios] ([id-u])
GO
ALTER TABLE [dbo].[webuser] CHECK CONSTRAINT [FK_webuser_usuarios]
GO
USE [master]
GO
ALTER DATABASE [tutatu] SET  READ_WRITE 
GO
