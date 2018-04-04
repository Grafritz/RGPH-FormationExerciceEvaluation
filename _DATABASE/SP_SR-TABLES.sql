
GO
/****** Object:  ForeignKey [FK_TBL_SR_GROUPE_RIGHT_TBL_SR_RIGHTS]    Script Date: 04/04/2018 11:23:26 ******/
ALTER TABLE [dbo].[TBL_SR_GROUPE_RIGHT] DROP CONSTRAINT [FK_TBL_SR_GROUPE_RIGHT_TBL_SR_RIGHTS]
GO
/****** Object:  ForeignKey [FK_TBL_SR_USER_Tbl_Ecole]    Script Date: 04/04/2018 11:23:26 ******/
--ALTER TABLE [dbo].[TBL_SR_USER] DROP CONSTRAINT [FK_TBL_SR_USER_Tbl_Ecole]
GO
/****** Object:  ForeignKey [FK_TBL_SR_USER_TBL_SR_GROUPE]    Script Date: 04/04/2018 11:23:27 ******/
ALTER TABLE [dbo].[TBL_SR_USER] DROP CONSTRAINT [FK_TBL_SR_USER_TBL_SR_GROUPE]
GO
/****** Object:  Table [dbo].[TBL_SR_GROUPE_RIGHT]    Script Date: 04/04/2018 11:23:26 ******/
ALTER TABLE [dbo].[TBL_SR_GROUPE_RIGHT] DROP CONSTRAINT [FK_TBL_SR_GROUPE_RIGHT_TBL_SR_RIGHTS]
GO
DROP TABLE [dbo].[TBL_SR_GROUPE_RIGHT]
GO
/****** Object:  Table [dbo].[TBL_SR_USER]    Script Date: 04/04/2018 11:23:26 ******/
ALTER TABLE [dbo].[TBL_SR_USER] DROP CONSTRAINT [FK_TBL_SR_USER_Tbl_Ecole]
GO
ALTER TABLE [dbo].[TBL_SR_USER] DROP CONSTRAINT [FK_TBL_SR_USER_TBL_SR_GROUPE]
GO
ALTER TABLE [dbo].[TBL_SR_USER] DROP CONSTRAINT [DF_TBL_SR_USER_Confirmer]
GO
DROP TABLE [dbo].[TBL_SR_USER]
GO
/****** Object:  Table [dbo].[TBL_SR_USER_ACTIVITE]    Script Date: 04/04/2018 11:23:27 ******/
DROP TABLE [dbo].[TBL_SR_USER_ACTIVITE]
GO
/****** Object:  Table [dbo].[TBL_SR_GROUPE]    Script Date: 04/04/2018 11:23:26 ******/
DROP TABLE [dbo].[TBL_SR_GROUPE]
GO
/****** Object:  Table [dbo].[TBL_SR_MODULES]    Script Date: 04/04/2018 11:23:26 ******/
DROP TABLE [dbo].[TBL_SR_MODULES]
GO
/****** Object:  Table [dbo].[TBL_SR_OBJECT_RIGHT]    Script Date: 04/04/2018 11:23:26 ******/
DROP TABLE [dbo].[TBL_SR_OBJECT_RIGHT]
GO
/****** Object:  Table [dbo].[TBL_SR_OBJECTS]    Script Date: 04/04/2018 11:23:26 ******/
ALTER TABLE [dbo].[TBL_SR_OBJECTS] DROP CONSTRAINT [DF_TBL_SR_OBJECTS_IsProduitsRezo509_1]
GO
DROP TABLE [dbo].[TBL_SR_OBJECTS]
GO
/****** Object:  Table [dbo].[Tbl_SR_PRIVILEGE_SERVICES]    Script Date: 04/04/2018 11:23:26 ******/
DROP TABLE [dbo].[Tbl_SR_PRIVILEGE_SERVICES]
GO
/****** Object:  Table [dbo].[TBL_SR_RIGHTS]    Script Date: 04/04/2018 11:23:26 ******/
DROP TABLE [dbo].[TBL_SR_RIGHTS]
GO
/****** Object:  Table [dbo].[TBL_SR_RIGHTS]    Script Date: 04/04/2018 11:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_RIGHTS](
	[Right_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Privilege] [nvarchar](100) NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[ModifBy] [nvarchar](100) NULL,
	[DateModif] [datetime] NULL,
 CONSTRAINT [PK_TBL_SR_RIGHTS] PRIMARY KEY CLUSTERED 
(
	[Right_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_TBL_SR_RIGHTS] UNIQUE NONCLUSTERED 
(
	[Privilege] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SR_PRIVILEGE_SERVICES]    Script Date: 04/04/2018 11:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SR_PRIVILEGE_SERVICES](
	[ID] [bigint] NOT NULL,
	[ID_User] [bigint] NULL,
	[ID_Services] [bigint] NULL,
	[DateAjout] [datetime] NULL,
	[DateLimite] [datetime] NULL,
	[ActifYN] [bit] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[ModifBy] [nvarchar](100) NULL,
	[DateModif] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SR_OBJECTS]    Script Date: 04/04/2018 11:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_OBJECTS](
	[Object_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Object] [nvarchar](100) NOT NULL,
	[ObjectDescription] [nvarchar](200) NOT NULL,
	[ObjectType] [nvarchar](20) NOT NULL,
	[ID_Modules] [bigint] NULL,
	[IsProduitsRezo509] [bit] NULL CONSTRAINT [DF_TBL_SR_OBJECTS_IsProduitsRezo509_1]  DEFAULT ((0)),
	[CreatedBy] [nvarchar](100) NOT NULL,
	[DateCreated] [datetime] NULL,
	[ModifBy] [nvarchar](100) NULL,
	[DateModif] [datetime] NULL,
 CONSTRAINT [PK_TBL_OBJECTS] PRIMARY KEY CLUSTERED 
(
	[Object_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_TBL_OBJECTS] UNIQUE NONCLUSTERED 
(
	[Object] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SR_OBJECT_RIGHT]    Script Date: 04/04/2018 11:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_OBJECT_RIGHT](
	[Right_ID] [bigint] NOT NULL,
	[Object_ID] [bigint] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_TBL_SR_OBJECT_RIGHT] PRIMARY KEY CLUSTERED 
(
	[Right_ID] ASC,
	[Object_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SR_MODULES]    Script Date: 04/04/2018 11:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_MODULES](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Module] [nvarchar](100) NOT NULL,
	[ModuleDescription] [nvarchar](200) NULL,
	[ActifYN] [bit] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[ModifBy] [nvarchar](100) NULL,
	[DateModif] [datetime] NULL,
 CONSTRAINT [PK_TBL_SR_MODULES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SR_GROUPE]    Script Date: 04/04/2018 11:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_GROUPE](
	[ID_Group] [bigint] IDENTITY(1,1) NOT NULL,
	[Groupe_Description] [nvarchar](100) NOT NULL,
	[PageDefault] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[ModifBy] [nvarchar](100) NULL,
	[DateModif] [datetime] NULL,
 CONSTRAINT [PK_tbl_Groupe] PRIMARY KEY CLUSTERED 
(
	[ID_Group] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SR_USER_ACTIVITE]    Script Date: 04/04/2018 11:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_USER_ACTIVITE](
	[ID_Activite] [bigint] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](max) NOT NULL,
	[Activity] [nvarchar](max) NOT NULL,
	[IPUser] [nvarchar](max) NULL,
	[Date_Activite] [datetime] NOT NULL,
	[Description_Activite] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TBL_SR_USER_ACTIVITE] PRIMARY KEY CLUSTERED 
(
	[ID_Activite] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SR_USER]    Script Date: 04/04/2018 11:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_USER](
	[ID_User] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Ecole] [bigint] NULL,
	[ID_GroupeUser] [bigint] NULL,
	[Photo] [image] NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NULL,
	[Civilite] [nvarchar](10) NULL,
	[Nom] [nvarchar](200) NULL,
	[Prenom] [nvarchar](100) NULL,
	[Sexe] [nvarchar](10) NULL,
	[Telephone] [nvarchar](50) NULL,
	[DateNaissance] [date] NULL,
	[ID_PaysNaissance] [bigint] NULL,
	[ID_Occupation] [bigint] NULL,
	[ID_Departement] [bigint] NULL,
	[ID_Commune] [bigint] NULL,
	[ID_PaysAdresse] [bigint] NULL,
	[AdresseRue] [nvarchar](200) NULL,
	[AdresseCity] [nvarchar](100) NULL,
	[AdresseProvince] [nvarchar](100) NULL,
	[AdresseCodePostal] [nvarchar](100) NULL,
	[AlerteNouveaute] [bit] NULL,
	[AutreAlerte] [bit] NULL,
	[ActifYN] [bit] NOT NULL,
	[LastLogin] [datetime] NULL,
	[ConnecterYN] [bit] NULL,
	[LastIP] [nvarchar](15) NULL,
	[MustChangePassword] [bit] NULL,
	[IsForcedOut] [bit] NULL,
	[Confirmer] [bit] NULL CONSTRAINT [DF_TBL_SR_USER_Confirmer]  DEFAULT ((0)),
	[IdAppFireBase] [nvarchar](max) NULL,
	[IdFirebaseToken] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[ModifBy] [nvarchar](100) NULL,
	[DateModif] [datetime] NULL,
 CONSTRAINT [PK_TBL_USER] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_TBL_USER] UNIQUE NONCLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SR_GROUPE_RIGHT]    Script Date: 04/04/2018 11:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_GROUPE_RIGHT](
	[Group_ID] [bigint] NOT NULL,
	[Right_ID] [bigint] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_TBL_SR_GROUPE_RIGHT] PRIMARY KEY CLUSTERED 
(
	[Group_ID] ASC,
	[Right_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_TBL_SR_GROUPE_RIGHT_TBL_SR_RIGHTS]    Script Date: 04/04/2018 11:23:26 ******/
ALTER TABLE [dbo].[TBL_SR_GROUPE_RIGHT]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SR_GROUPE_RIGHT_TBL_SR_RIGHTS] FOREIGN KEY([Right_ID])
REFERENCES [dbo].[TBL_SR_RIGHTS] ([Right_ID])
GO
ALTER TABLE [dbo].[TBL_SR_GROUPE_RIGHT] CHECK CONSTRAINT [FK_TBL_SR_GROUPE_RIGHT_TBL_SR_RIGHTS]
GO
/****** Object:  ForeignKey [FK_TBL_SR_USER_Tbl_Ecole]    Script Date: 04/04/2018 11:23:26 ******/
ALTER TABLE [dbo].[TBL_SR_USER]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SR_USER_Tbl_Ecole] FOREIGN KEY([ID_Ecole])
REFERENCES [dbo].[Tbl_Ecole] ([ID])
GO
ALTER TABLE [dbo].[TBL_SR_USER] CHECK CONSTRAINT [FK_TBL_SR_USER_Tbl_Ecole]
GO
/****** Object:  ForeignKey [FK_TBL_SR_USER_TBL_SR_GROUPE]    Script Date: 04/04/2018 11:23:27 ******/
ALTER TABLE [dbo].[TBL_SR_USER]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SR_USER_TBL_SR_GROUPE] FOREIGN KEY([ID_GroupeUser])
REFERENCES [dbo].[TBL_SR_GROUPE] ([ID_Group])
GO
ALTER TABLE [dbo].[TBL_SR_USER] CHECK CONSTRAINT [FK_TBL_SR_USER_TBL_SR_GROUPE]
GO
