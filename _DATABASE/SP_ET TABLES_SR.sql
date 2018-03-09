USE [RGPH_QCollecte_db]
GO
/****** Object:  Table [dbo].[TBL_SR_MODULES]    Script Date: 03/09/2018 13:15:19 ******/
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
SET IDENTITY_INSERT [dbo].[TBL_SR_MODULES] ON
INSERT [dbo].[TBL_SR_MODULES] ([ID], [Module], [ModuleDescription], [ActifYN], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (1, N'MODULE SECURITE', N'Module de gestion de la securite du systeme', 1, NULL, NULL, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38C00A56C77 AS DateTime))
INSERT [dbo].[TBL_SR_MODULES] ([ID], [Module], [ModuleDescription], [ActifYN], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (2, N'MODULE - MATERIELS', N'MODULE - MATERIELS', 1, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C010B9475 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F394BC AS DateTime))
INSERT [dbo].[TBL_SR_MODULES] ([ID], [Module], [ModuleDescription], [ActifYN], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (3, N'MODULE - FORMATION', N'MODULE - FORMATION', 1, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C010BD539 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F3A80D AS DateTime))
INSERT [dbo].[TBL_SR_MODULES] ([ID], [Module], [ModuleDescription], [ActifYN], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (4, N'MODULE - CODIFICATION', N'MODULE - CODIFICATION', 1, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A3CA00C17423 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F4354F AS DateTime))
INSERT [dbo].[TBL_SR_MODULES] ([ID], [Module], [ModuleDescription], [ActifYN], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (5, N'MODULE - COLLECTE DONNEES', N'MODULE - COLLECTE DONNEES', 1, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A3CA00C18819 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F4975F AS DateTime))
INSERT [dbo].[TBL_SR_MODULES] ([ID], [Module], [ModuleDescription], [ActifYN], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (6, N'MODULE - ...', N'SERVICE ...', 1, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A3CA00C1A503 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F4D566 AS DateTime))
INSERT [dbo].[TBL_SR_MODULES] ([ID], [Module], [ModuleDescription], [ActifYN], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (7, N'MODULE PARAMETRES', N'MODULE PARAMETRES', 1, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A3E6008B0064 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A3F100D0B986 AS DateTime))
SET IDENTITY_INSERT [dbo].[TBL_SR_MODULES] OFF
/****** Object:  Table [dbo].[TBL_SR_GROUPE_RIGHT]    Script Date: 03/09/2018 13:15:19 ******/
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
INSERT [dbo].[TBL_SR_GROUPE_RIGHT] ([Group_ID], [Right_ID], [CreatedBy], [DateCreated]) VALUES (1, 1, N'Grafritz', CAST(0x0000A4F800ECA90C AS DateTime))
INSERT [dbo].[TBL_SR_GROUPE_RIGHT] ([Group_ID], [Right_ID], [CreatedBy], [DateCreated]) VALUES (9, 2, N'Grafritz', CAST(0x0000A507005DCABE AS DateTime))
/****** Object:  Table [dbo].[TBL_SR_GROUPE]    Script Date: 03/09/2018 13:15:19 ******/
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
 CONSTRAINT [PK_TBL_SR_GROUPE] PRIMARY KEY CLUSTERED 
(
	[ID_Group] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_SR_GROUPE] ON
INSERT [dbo].[TBL_SR_GROUPE] ([ID_Group], [Groupe_Description], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (1, N'Admin', N'~/', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TBL_SR_GROUPE] OFF
/****** Object:  Table [dbo].[TBL_SR_USER_ACTIVITE]    Script Date: 03/09/2018 13:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_USER_ACTIVITE](
	[ID_Activite] [bigint] IDENTITY(1,1) NOT NULL,
	[User_ID] [nvarchar](100) NOT NULL,
	[Activity] [nvarchar](200) NOT NULL,
	[IPUser] [nvarchar](20) NULL,
	[Date_Activite] [datetime] NOT NULL,
	[Description_Activite] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TBL_SR_USER_ACTIVITE] PRIMARY KEY CLUSTERED 
(
	[ID_Activite] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_SR_USER]    Script Date: 03/09/2018 13:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SR_USER](
	[ID_User] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_GroupeUser] [bigint] NULL,
	[Photo] [image] NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NULL,
	[Civilite] [nvarchar](10) NULL,
	[Nom] [nvarchar](200) NULL,
	[Prenom] [nvarchar](100) NULL,
	[Sexe] [nvarchar](10) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Poste] [nvarchar](80) NULL,
	[Signature] [image] NULL,
	[ActifYN] [bit] NOT NULL,
	[LastLogin] [datetime] NULL,
	[ConnecterYN] [bit] NULL,
	[LastIP] [nvarchar](15) NULL,
	[MustChangePassword] [bit] NULL,
	[IsForcedOut] [bit] NULL,
	[AskPassword] [nvarchar](80) NULL,
	[Confirmer] [bit] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[ModifBy] [nvarchar](100) NULL,
	[DateModif] [datetime] NULL,
 CONSTRAINT [PK_TBL_SR_USER] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_SR_USER] ON
INSERT [dbo].[TBL_SR_USER] ([ID_User], [ID_GroupeUser], [Photo], [UserName], [Password], [Civilite], [Nom], [Prenom], [Sexe], [Telephone], [Poste], [Signature], [ActifYN], [LastLogin], [ConnecterYN], [LastIP], [MustChangePassword], [IsForcedOut], [AskPassword], [Confirmer], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (3, 1, NULL, N'duverseau.jeanfritz@gmail.com', N'C5-B4-A4-56-23-0B-45-A0-E8-FE-9D-62-A4-5A-C6-C3', N'', N'Duverseau', N'Jean Fritz', N'M', N'+509', N'', NULL, 1, CAST(0x0000A4F800FCF3BC AS DateTime), 1, N'::1', 0, 0, NULL, 0, NULL, NULL, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800FCF3BC AS DateTime))
SET IDENTITY_INSERT [dbo].[TBL_SR_USER] OFF
/****** Object:  Table [dbo].[TBL_SR_RIGHTS]    Script Date: 03/09/2018 13:15:19 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_SR_RIGHTS] ON
INSERT [dbo].[TBL_SR_RIGHTS] ([Right_ID], [Privilege], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (1, N'Tâche Administrateur', N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EC5C4D AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_RIGHTS] ([Right_ID], [Privilege], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (2, N'Tâche Responsable de Codification', N'Admin', CAST(0x0000A507005DB92C AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TBL_SR_RIGHTS] OFF
/****** Object:  Table [dbo].[Profile]    Script Date: 03/09/2018 13:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ProfileId] [int] NOT NULL,
	[ProfileName] [nvarchar](180) NOT NULL,
	[PageDefault] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
	[ModifBy] [nvarchar](100) NULL,
	[DateModif] [datetime] NULL,
 CONSTRAINT [Profile_pk] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Profile_Name_unique] UNIQUE NONCLUSTERED 
(
	[ProfileName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Profile] ([ProfileId], [ProfileName], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (1, N'Administrateur', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ProfileId], [ProfileName], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (2, N'Resp. Departemental', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ProfileId], [ProfileName], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (3, N'Resp. Communal', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ProfileId], [ProfileName], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (4, N'Agent de Support TIC', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ProfileId], [ProfileName], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (5, N'Agent Superviseur', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ProfileId], [ProfileName], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (6, N'Agent Recenseur', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ProfileId], [ProfileName], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (7, N'Superviseur de Codification', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ProfileId], [ProfileName], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (8, N'Agent Codificateur', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ProfileId], [ProfileName], [PageDefault], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (9, N'Responsable de Codification', N'~/', NULL, NULL, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EBAFA3 AS DateTime))
/****** Object:  StoredProcedure [dbo].[SR_Select_SR_MODULES_ByName]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_SR_MODULES_ByName] (	@Module as nvarchar(100))AS SELECT * FROM TBL_SR_MODULES WHERE Module = @Module
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Right_ByName]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Right_ByName]
(
	@Nom nvarchar(50)
)
AS

	SELECT * FROM TBL_SR_RIGHTS
	WHERE Privilege = @Nom
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Right_ById]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Right_ById]
(
	@ID int
)
AS

	SELECT * FROM TBL_SR_RIGHTS
	WHERE Right_ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Utilisateur_InLog]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Utilisateur_InLog]
AS
	SELECT DISTINCT User_ID FROM dbo.TBL_SR_USER_ACTIVITE
	ORDER BY User_ID
GO
/****** Object:  StoredProcedure [dbo].[SR_Search_ActiviteUser_ByUser_AndDate]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE [dbo].[SR_Search_ActiviteUser_ByUser_AndDate] '','Forced Log Off','01-01-2011','08-11-2012'

CREATE PROCEDURE [dbo].[SR_Search_ActiviteUser_ByUser_AndDate]
(
	@User_ID AS NVARCHAR(200),
	@Activity AS NVARCHAR(200),
	@DateDebut AS DATETIME,
	@DateFin AS DATETIME
)
AS	
if(LEN(@User_ID) > 0 AND LEN(@Activity) > 0 )
	SELECT *
	FROM [dbo].[TBL_SR_USER_ACTIVITE]
	WHERE 1=1
	AND [User_ID] = @User_ID
	AND [Activity] = @Activity
	AND [Date_Activite] BETWEEN @DateDebut AND @DateFin
	ORDER BY [Date_Activite] DESC

if(LEN(@User_ID) > 0 AND LEN(@Activity) = 0 )
	SELECT *
	FROM [dbo].[TBL_SR_USER_ACTIVITE]
	WHERE 1=1
	AND [User_ID] = @User_ID
	AND [Date_Activite] BETWEEN @DateDebut AND @DateFin
	ORDER BY [Date_Activite] DESC

if(LEN(@User_ID) = 0 AND LEN(@Activity) > 0 )
	SELECT *
	FROM [dbo].[TBL_SR_USER_ACTIVITE]
	WHERE 1=1
	AND [Activity] = @Activity
	AND [Date_Activite] BETWEEN @DateDebut AND @DateFin
	ORDER BY [Date_Activite] DESC

if(LEN(@User_ID) = 0 AND LEN(@Activity) = 0 )
	SELECT *
	FROM [dbo].[TBL_SR_USER_ACTIVITE]
	WHERE 1=1
	--AND [Date_Activite] <= @DateDebut AND [Date_Activite] >= @DateFin
	AND [Date_Activite] BETWEEN @DateDebut AND @DateFin
	ORDER BY [Date_Activite] DESC
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_GroupeUser_ById2]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_GroupeUser_ById2]
(
	@ID_Group BIGINT
)
AS
	SELECT * FROM dbo.TBL_SR_GROUPE
	WHERE ID_Group = @ID_Group

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_GroupeUser_ById]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_GroupeUser_ById]
(
	@ID_Group BIGINT
)
AS
	SELECT * FROM [Profile]
	WHERE ProfileId = @ID_Group

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
-------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Groupe_ByName2]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Groupe_ByName2]
(
	@Groupe_Description NVARCHAR(100)
)
AS

SELECT * FROM TBL_SR_GROUPE 
WHERE Groupe_Description = @Groupe_Description
-----------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Groupe_ByName]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Groupe_ByName]
(
	@Groupe_Description NVARCHAR(100)
)
AS

SELECT * FROM [Profile] 
WHERE ProfileName = @Groupe_Description
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_SR_MODULES_Actif]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_SR_MODULES_Actif] AS SELECT * FROM TBL_SR_MODULES WHERE ActifYN=1
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_SR_MODULES]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_SR_MODULES] AS SELECT * FROM TBL_SR_MODULES
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Rights_NotIn_GroupeRight]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Rights_NotIn_GroupeRight]
(
	@idgrp int
)
AS

	SELECT * FROM TBL_SR_RIGHTS
	WHERE Right_ID not in (
							SELECT Right_ID
							FROM TBL_SR_GROUPE_RIGHT
							WHERE Group_ID = @idgrp
						   )
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Rights_ByGroupe]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Rights_ByGroupe]
(
	@ID bigint
)
AS

	SELECT * FROM TBL_SR_RIGHTS
	WHERE Right_ID in (
						SELECT Right_ID FROM TBL_SR_GROUPE_RIGHT
						WHERE Group_ID = @ID
					  )
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Rights]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Rights]

AS

	SELECT * FROM TBL_SR_RIGHTS
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Poste_User]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Poste_User] 

AS
	SELECT DISTINCT Poste FROM TBL_SR_USER
	WHERE Poste IS NOT NULL
GO
/****** Object:  StoredProcedure [dbo].[SR_Delete_Right]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Delete_Right]
(
	@ID int
)
AS

DELETE FROM TBL_SR_RIGHTS
WHERE Right_ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_User_InAnnonce]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_User_InAnnonce]
(
	@ActifYN NVARCHAR(100)
)
AS
IF (@ActifYN <> 'FO')
		BEGIN
			SELECT * FROM dbo.TBL_SR_USER
			WHERE ActifYN = @ActifYN
			AND ID_User IN (SELECT IDUser FROM dbo.tbl_Annonce)
			ORDER BY NomComplet ASC
		END
	ELSE
		BEGIN
			SELECT * FROM dbo.TBL_SR_USER
			WHERE ID_User IN (SELECT IDUser FROM dbo.tbl_Annonce)
			ORDER BY NomComplet ASC
		END
GO
/****** Object:  Table [dbo].[Personnel]    Script Date: 03/09/2018 13:15:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnel](
	[PersId] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](120) NOT NULL,
	[Prenom] [nvarchar](150) NOT NULL,
	[Sexe] [nvarchar](1) NULL,
	[Cin] [nvarchar](22) NULL,
	[Nif] [nvarchar](15) NULL,
	[Titre] [nvarchar](150) NULL,
	[NomUtilisateur] [nvarchar](70) NOT NULL,
	[MotDePasse] [nvarchar](255) NOT NULL,
	[Mention] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[TelDigicel] [nvarchar](15) NULL,
	[TelNatcom] [nvarchar](15) NULL,
	[Valide] [nvarchar](12) NULL,
	[EstAssigne] [nvarchar](20) NULL,
	[DerniereDateConnexion] [nvarchar](70) NULL,
	[ComNaissance] [nvarchar](10) NULL,
	[LieuNaissance] [nvarchar](70) NULL,
	[ProfileId] [int] NOT NULL,
	[DeptId] [nvarchar](10) NULL,
	[ComID] [nvarchar](10) NULL,
	[VqseId] [nvarchar](10) NULL,
	[EquipeCodification] [int] NULL,
	[CreePar] [nvarchar](120) NULL,
	[DateCreation] [nvarchar](70) NULL,
	[ModifierPar] [nvarchar](120) NULL,
	[DateModification] [nvarchar](70) NULL,
	[Photo] [image] NULL,
	[ActifYN] [bit] NULL,
	[ConnecterYN] [bit] NULL,
	[MustChangePassword] [bit] NULL,
	[IsForcedOut] [bit] NULL,
	[LastIP] [nvarchar](15) NULL,
 CONSTRAINT [Personnel_pk] PRIMARY KEY CLUSTERED 
(
	[PersId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Email_unique] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Nom_Compte_unique] UNIQUE NONCLUSTERED 
(
	[NomUtilisateur] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Personnel] ON
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (1, N'Admin', N'Utilisateur', N'M', NULL, NULL, NULL, N'Admin', N'21232f297a57a5a743894a0e4a801fc3', NULL, NULL, NULL, NULL, N'Oui', N'Pas encore', N'Mar  9 2018  9:33AM', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'Admin', N'Mar  9 2018  9:33AM', NULL, 1, 1, NULL, 0, N'::1')
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (2, N'Responsable de Codification', N'Default', N'M', NULL, NULL, NULL, N'0090000', N'21232f297a57a5a743894a0e4a801fc3', NULL, N'responsable@gamil.com', NULL, NULL, N'Oui', N'Pas encore', N'Sep  2 2015  6:40AM', NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, N'0090000', N'Sep  2 2015  6:40AM', NULL, 1, 1, NULL, 0, N'127.0.0.1')
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (3, N'MARCELLUS', N'PIERRE MICHEL', N'M', NULL, NULL, NULL, N'0070005', N'e293482b0feefb6388d38f6c35335174', NULL, N'marcelluspierremichel71@gmail.com', N'3453-0343', NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (4, N'CIVIL', N'CHIMENE', N'F', NULL, NULL, NULL, N'0070006', N'5bacf3759cd33780725b0f1381d42cdc', NULL, N'chimenecivil@yahoo.fr', N'3714-1592', NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (5, N'VALON', N'LUNA', N'F', NULL, NULL, NULL, N'0080007', N'd4fd481cd64c78865a15fda4b04e1965', NULL, N'luna.valon@yahoo.com', N'3464-6066', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (6, N'JEAN SIMON', N'DAVID', N'M', NULL, NULL, NULL, N'0080008', N'07db24b0b3958c99b486f3606cac52d0', NULL, N'djeansimon90@yahoo.fr', N'4617-7088', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (7, N'FONTAINE', N'REJEAN', N'M', NULL, NULL, NULL, N'0080009', N'96821d90e1638ea4ab4f0dad4a1aecca', NULL, N'rjft99@yahoo.fr', N'4737-2378', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (8, N'DIORO', N'YVES-BENZ', N'M', NULL, NULL, NULL, N'0080010', N'575c3855aa9b95c5ecceea26ac33aacc', NULL, N'yvesbenzdioro@gmail.com', N'4460-0810', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (9, N'MOISE', N'MAGDA EMMANUELLE JEAN LOUIS', N'F', NULL, NULL, NULL, N'0080011', N'3e8475e1ecaf8edaf74f28367185d2df', NULL, N'magdoue26@yahoo.fr', N'4651-9674', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (10, N'DUCLONAS', N'JEAN EMMANUEL', N'M', NULL, NULL, NULL, N'0080012', N'027c5102994b0bc2ec685f1f533cb301', NULL, N'j.emmmanuel8100@yahoo.fr', N'3722-2876', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (11, N'FRANCOIS', N'NIXON', N'M', NULL, NULL, NULL, N'0080013', N'5e4fd33a4717187bbfa84d5979a9fb5e', NULL, N'nixon_francois@yahoo.com', N'4499-5129', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (12, N'PORT LOUIS', N'GUETER', N'M', NULL, NULL, NULL, N'0080014', N'448d707e4e9f168d1a643ddb9b2d376c', NULL, N'gueter89@yahoo.fr', N'3835-9085', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (13, N'DESGRANGES', N'Garline Yacinthe', N'F', NULL, NULL, NULL, N'0080015', N'a6f1809c67be54b77a806888579b3e39', NULL, N'dgarline3@yahoo.com', N'3755-6879', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (14, N'Masson', N'Moise', N'M', NULL, NULL, NULL, N'0070016', N'71f71880693ff3140105bba5748bff5b', NULL, N'scaidebenjaminel@gmail.com', N'4083-1652', NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[Personnel] ([PersId], [Nom], [Prenom], [Sexe], [Cin], [Nif], [Titre], [NomUtilisateur], [MotDePasse], [Mention], [Email], [TelDigicel], [TelNatcom], [Valide], [EstAssigne], [DerniereDateConnexion], [ComNaissance], [LieuNaissance], [ProfileId], [DeptId], [ComID], [VqseId], [EquipeCodification], [CreePar], [DateCreation], [ModifierPar], [DateModification], [Photo], [ActifYN], [ConnecterYN], [MustChangePassword], [IsForcedOut], [LastIP]) VALUES (15, N'Sabin', N'Frantz', N'M', NULL, NULL, NULL, N'0080017', N'bd321df8a28a0b14c1067b1646fd8c26', NULL, N'lonervevaleus@gmail.com', N'3147-3446', NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Personnel] OFF
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Groupe2]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Groupe2]
AS
	SELECT * FROM dbo.TBL_SR_GROUPE

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Groupe]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Groupe]
AS
	SELECT * FROM [Profile] 

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_ActivityUser_InLog]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_ActivityUser_InLog]
AS
	SELECT DISTINCT Activity FROM dbo.TBL_SR_USER_ACTIVITE
	ORDER BY Activity
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Activite_Utilisateur]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Activite_Utilisateur]
AS	
	SELECT *
	FROM [dbo].[TBL_SR_USER_ACTIVITE]
	ORDER BY [Date_Activite] DESC
GO
/****** Object:  StoredProcedure [dbo].[SR_InsertSR_MODULES]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_InsertSR_MODULES] 	(		@Module nvarchar(200)		,@ModuleDescription nvarchar(400)		,@ActifYN bit		,@CreatedBy nvarchar(200)	)AS	DECLARE @Error int	DECLARE @ID bigint	BEGIN TRANSACTION 	INSERT INTO TBL_SR_MODULES		(		[Module]		,[ModuleDescription]		,[ActifYN]		,[CreatedBy]		,datecreated	)	VALUES	(		@Module		,@ModuleDescription		,@ActifYN		,@CreatedBy		,GETDATE()	)	SET @Error = @@ERROR	IF @Error != 0 GOTO ERROR_HANDLER	SET @ID = @@Identity 	COMMIT TRANSACTION	SELECT @IDERROR_HANDLER:	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_UserActivite_InRezo]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_UserActivite_InRezo]
(
	@User_ID nvarchar(100)
   ,@Activity nvarchar(200)
   ,@IPUser nvarchar(20)
   ,@Description_Activite nvarchar(max)
)
AS

	DECLARE @Error int
	DECLARE @ID int

	BEGIN TRANSACTION 
	
	INSERT INTO dbo.TBL_SR_USER_ACTIVITE
	(
		[User_ID]
       ,[Activity]
       ,[IPUser]
       ,[Date_Activite]
       ,[Description_Activite]
	)
	VALUES
	(   
		@User_ID
	   ,@Activity
	   ,@IPUser
	   ,GETDATE()
	   ,@Description_Activite
	)

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity 
	
	COMMIT TRANSACTION

	SELECT @ID

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_User]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_User]
	(
		@ID_GroupeUser bigint
		,@Photo image
		,@UserName nvarchar(200)
		,@Password nvarchar(200)
		,@Civilite nvarchar(20)
		,@Nom nvarchar(400)
		,@Prenom nvarchar(200)
		,@Sexe nvarchar(20)
		,@Telephone nvarchar(100)
		,@ActifYN bit
		,@Confirmer bit
		,@Poste nvarchar(100)
		,@CreatedBy nvarchar(200)
	)
AS
	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 
	INSERT INTO TBL_SR_USER
		(
		[ID_GroupeUser]
		,[Photo]
		,[UserName]
		,[Password]
		,[Civilite]
		,[Nom]
		,[Prenom]
		,[Sexe]
		,[Telephone]
		,[ActifYN]
		,[Confirmer]
		,[Poste]
		,[CreatedBy]
		,[DateCreated]
	)
	VALUES
	(
		@ID_GroupeUser
		,@Photo
		,@UserName
		,@Password
		,@Civilite
		,@Nom
		,@Prenom
		,@Sexe
		,@Telephone
		,@ActifYN
		,@Confirmer
		,@Poste
		,@CreatedBy
		,GETDATE()
	)
	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity 

	COMMIT TRANSACTION

	SELECT @ID AS ID_User 

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_Right]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_Right]
(
	@Nom nvarchar(500),
	@usrcr nvarchar(200)
)
AS

	DECLARE @Error int
	DECLARE @ID int

	BEGIN TRANSACTION 

	INSERT INTO TBL_SR_RIGHTS
	(
		Privilege,
		CreatedBy, 
		DateCreated
	)
	VALUES
	(   
		@Nom,
		@usrcr,
		getdate()
	)

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity 
	
	COMMIT TRANSACTION

	SELECT @ID AS Right_ID  

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Delete_Groupe2]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Delete_Groupe2]
(
	@ID int
)
AS

DELETE FROM TBL_SR_GROUPE 
WHERE ID_Group = @ID
GO
/****** Object:  StoredProcedure [dbo].[SR_Delete_Groupe_Right_ById_Groupe_AND_ById_Right]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Delete_Groupe_Right_ById_Groupe_AND_ById_Right]
(
	@id bigint,
	@idprq bigint
)
AS

DELETE FROM dbo.TBL_SR_GROUPE_RIGHT
WHERE 
	Group_ID = @id AND Right_ID = @idprq
GO
/****** Object:  StoredProcedure [dbo].[SR_Delete_Groupe_Right_ById_AND_NameRight]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Delete_Groupe_Right_ById_AND_NameRight]
(
	@id bigint,
	@nmprq nvarchar(100)
)
AS

DELETE FROM TBL_SR_GROUPE_RIGHT
WHERE 
	Group_ID = @id
	AND Right_ID in (SELECT Right_ID FROM dbo.TBL_SR_RIGHTS
	WHERE Privilege = @nmprq)
GO
/****** Object:  StoredProcedure [dbo].[SR_Delete_Groupe]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Delete_Groupe]
(
	@ID int
)
AS

DELETE FROM [Profile]
WHERE ProfileId = @ID
-----------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_Groupe2]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_Groupe2]
(
	@Groupe_Description nvarchar(100),
	@PageDefault nvarchar(max),
	@CreatedBy nvarchar(100)
)
AS

	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 

	INSERT INTO TBL_SR_GROUPE 
	(
		Groupe_Description,
		PageDefault, 
		CreatedBy, 
		DateCreated
	)
	VALUES
	(   
		@Groupe_Description,
		@PageDefault,
		@CreatedBy,
		getdate()
	)

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity 
	
	COMMIT TRANSACTION

	SELECT @ID AS ID_Group  

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_Groupe_Right_ByName_Right]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_Groupe_Right_ByName_Right]
(
	@idgrp bigint,
	@prq nvarchar(200),
	@usrcr nvarchar(200)
)
AS

	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 

	INSERT INTO dbo.TBL_SR_GROUPE_RIGHT 
	(
		Group_ID, Right_ID, CreatedBy, DateCreated
	)
	SELECT @idgrp, Right_ID, @usrcr, getdate() FROM dbo.TBL_SR_RIGHTS WHERE Privilege = @prq
	

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity  

	COMMIT TRANSACTION

	SELECT @ID

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_Groupe_Right]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_Groupe_Right]
(
	@Group_ID bigint,
	@Right_ID bigint,
	@usrcr nvarchar(100)
)
AS

	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 

	INSERT INTO TBL_SR_GROUPE_RIGHT
	(
		Group_ID, Right_ID, CreatedBy, DateCreated
	)
	VALUES
	(   
		@Group_ID, @Right_ID, @usrcr, getdate()
	)

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity  

	COMMIT TRANSACTION

	SELECT @ID

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_Groupe]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_Groupe]
(
	@ProfileName nvarchar(200),
	@PageDefault nvarchar(max),
	@CreatedBy nvarchar(100)
)
AS

	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 

	INSERT INTO [Profile] 
	(
		ProfileName,
		PageDefault, 
		CreatedBy, 
		DateCreated
	)
	VALUES
	(   
		@ProfileName,
		@PageDefault,
		@CreatedBy,
		getdate()
	)

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity 
	
	COMMIT TRANSACTION

	--SELECT @ID AS ID_Group  
	SELECT @ID AS ProfileId  

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  Table [dbo].[TBL_SR_OBJECTS]    Script Date: 03/09/2018 13:15:19 ******/
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
	[CreatedBy] [nvarchar](100) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[ModifBy] [nvarchar](100) NULL,
	[DateModif] [datetime] NULL,
 CONSTRAINT [PK_TBL_SR_OBJECTS] PRIMARY KEY CLUSTERED 
(
	[Object_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_SR_OBJECTS] ON
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (1, N'PAGE-GESTION-OBJET', N'SR-Page Objets système', N'Page', 1, N'Grafritz', CAST(0x00009F98006AB00D AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38C009E55F4 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (2, N'PAGE-GESTION-GROUPE-UTILISATEUR', N'SR-PAGE-GESTION-GROUPE-UTILISATEUR', N'Page', 1, N'Grafritz', CAST(0x00009F98007BC533 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A3860136C0A3 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (3, N'Bouton-Save-Edit-Objet', N'SR-Ajouter Editer Objet Système', N'Action', 1, N'Grafritz', CAST(0x00009F98007CBABF AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00D16D4A AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (4, N'Bouton-Delete-Objet', N'SR-Supprimer Objet Système', N'Action', 1, N'Grafritz', CAST(0x00009F98007D0423 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00D148F3 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (5, N'Bouton-Save-Edit-Groupe', N'SR-Ajouter Editer Groupe', N'Action', 1, N'Grafritz', CAST(0x00009F98007D3F62 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00D220AB AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (6, N'PAGE-GESTION-UTILISATEUR', N'SR-PAGE Utilisateur', N'Page', 1, N'Grafritz', CAST(0x00009F990075C7C6 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38601369B45 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (7, N'Bouton-Save-Edit-Utilisateur', N'SR-Save-Edit-Utilisateur', N'Action', 1, N'Grafritz', CAST(0x00009F990076B1C9 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00D07FEB AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (8, N'Bouton-Delete-Utilisateur', N'SR-Bouton Supprimer Utilisateur', N'Action', 1, N'Grafritz', CAST(0x00009F990077C163 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00D0AAD5 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (9, N'Bouton-Reset-PassWord-Utilisateur', N'SR-Reset PassWord Utilisateur', N'Action', 1, N'Grafritz', CAST(0x00009F990089E231 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00D0C632 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (10, N'Bouton-Delete-Groupe', N'SR-Supprimer Groupe', N'Action', 1, N'Grafritz', CAST(0x00009F990096554F AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00D23286 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (11, N'PAGE-GESTION-TACHES-UTILISATEURS', N'SR-PAGE Tâches Utilisateur', N'Page', 1, N'Grafritz', CAST(0x00009F99009F8A7F AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38C009F54FC AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (12, N'Bouton-Save-Edit-Taches', N'SR-Ajouter Tâches Utilisateur', N'Action', 1, N'Grafritz', CAST(0x00009F9900A009B2 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00DA0C89 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (13, N'Bouton-Delete-Taches', N'SR-Supprimer Tâches Utilisateur', N'Action', 1, N'Grafritz', CAST(0x00009F9900A02EF7 AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00DA2E98 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (14, N'PAGE-PRIVILEGE-GROUPE', N'SR-Page Tâches Groupe d''Utilisateur', N'Page', 1, N'Grafritz', CAST(0x00009F9900A2A824 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38601364F47 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (15, N'PAGE-PRIVILEGES-DES-TACHES-UTILISATEURS', N'SR-PAGE-PRIVILEGES-DES-TACHES-UTILISATEURS', N'Page', 1, N'BrainD', CAST(0x00009F9900A83744 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38601364858 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (16, N'Action-Change-Username', N'SR-Action Change Username', N'Action', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38600E178DF AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A38C00D0DAA2 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (17, N'PAGE-UTILISATEURS-CONNECTES', N'SR-PAGE-UTILISATEURS-CONNECTES', N'Page', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38600E4CDF6 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A3860136324B AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (18, N'PAGE-ACTIVITES-UTILISATEUR', N'SR-PAGE-ACTIVITES-UTILISATEUR', N'Page', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38600E689E0 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A3860136294E AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (19, N'Bouton-Ajouter-Privilege', N'SR-Bouton-Ajouter-Privilege', N'Action', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A3860108CCC0 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38B00E7FE1B AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (20, N'Bouton-Remove-Privilege', N'SR-Bouton-Remove-Privilege', N'Action', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A3860108F0B5 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A386013617E3 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (21, N'PANEL-GESTION-SECURITE', N'MENU - SR-PANEL-GESTION-SECURITE', N'Action', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A386012EB1AE AS DateTime), N'duverseau.jeanfritz@gmail.com', CAST(0x0000A3F100CF8C00 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (22, N'Bouton-Ajouter-Privilege-des-taches-utilisateur', N'SR-Bouton-Ajouter-Privilege-des-taches-utilisateur', N'Action', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A3860133F533 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A3860136051E AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (23, N'Bouton-Remove-Privilege-des-taches-utilisateur', N'SR-Bouton-Remove-Privilege-des-taches-utilisateur', N'Action', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38601340BDB AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A3860135FCFE AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (24, N'PAGE-MODULES', N'SR-PAGE-MODULES', N'Page', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38B0111072D AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38B0124B964 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (25, N'Bouton-Save-Edit-Module', N'SR-Bouton-Save-Edit-Module', N'Action', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38B011158CD AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38B0124A21B AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (26, N'Bouton-Delete-Module', N'SR-Bouton-Delete-Module', N'Action', 1, N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38B01116BB6 AS DateTime), N'duverseau.jeanfritz@brain-dev.net', CAST(0x0000A38B012492AD AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (27, N'PAGE-LISTING-STATUT', N'PAGE-LISTING-STATUT', N'Page', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F610E1 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (28, N'Bouton-SAVE-STATUT', N'Bouton-SAVE-STATUT', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F623B6 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (29, N'Bouton-EDIT-STATUT', N'Bouton-EDIT-STATUT', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F6307E AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (30, N'Bouton-DELETE-STATUT', N'Bouton-DELETE-STATUT', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F63D68 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (31, N'PAGE-FORMULAIRE-PLANIFICATION-FORMATION', N'PAGE-FORMULAIRE-PLANIFICATION-FORMATION', N'Page', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800FD5492 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (32, N'Bouton-SAVE-PLANIFICATION-FORMATION', N'Bouton-SAVE-PLANIFICATION-FORMATION', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800FD8BF7 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (33, N'Bouton-EDIT-PLANIFICATION-FORMATION', N'Bouton-EDIT-PLANIFICATION-FORMATION', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800FDB09D AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (34, N'Bouton-DELETE-PLANIFICATION-FORMATION', N'Bouton-DELETE-PLANIFICATION-FORMATION', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800FDBE23 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (35, N'Bouton-DELETE-AGENT-FORMATEUR-FORMATION', N'Bouton-DELETE-AGENT-FORMATEUR-FORMATION', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA00EB93EF AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (36, N'PAGE-LISTING-PLANIFICATION-EXAMEN', N'PAGE-LISTING-PLANIFICATION-EXAMEN', N'Page', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA00F64884 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (37, N'Bouton-SAVE-PLANIFICATION-EXAMEN', N'Bouton-SAVE-PLANIFICATION-EXAMEN', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA00F657C2 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (38, N'Bouton-EDIT-PLANIFICATION-EXAMEN', N'Bouton-EDIT-PLANIFICATION-EXAMEN', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA00F666B6 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (39, N'Bouton-DELETE-PLANIFICATION-EXAMEN', N'Bouton-DELETE-PLANIFICATION-EXAMEN', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA00F6C528 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (40, N'PAGE-LISTING-FORMULAIRE-EXAMEN', N'PAGE-LISTING-FORMULAIRE-EXAMEN', N'Page', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00B7BD24 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (41, N'Bouton-SAVE-FORMULAIRE-EXAMEN', N'Bouton-SAVE-FORMULAIRE-EXAMEN', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00B7CDB3 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (42, N'Bouton-EDIT-FORMULAIRE-EXAMEN', N'Bouton-EDIT-FORMULAIRE-EXAMEN', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00B7DC52 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (43, N'Bouton-DELETE-FORMULAIRE-EXAMEN', N'Bouton-DELETE-FORMULAIRE-EXAMEN', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00B7EC9C AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (44, N'PAGE-LISTING-QUESTIONS', N'PAGE-LISTING-QUESTIONS', N'Page', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00DFB6C3 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (45, N'Bouton-SAVE-QUESTIONS', N'Bouton-SAVE-QUESTIONS', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00DFC79F AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (46, N'Bouton-EDIT-QUESTIONS', N'Bouton-EDIT-QUESTIONS', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00E02053 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (47, N'Bouton-DELETE-QUESTIONS', N'Bouton-DELETE-QUESTIONS', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00E0346F AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (48, N'PAGE-LISTING-PLANIFICATION-EXAMEN-PARTICIPANT', N'PAGE-LISTING-PLANIFICATION-EXAMEN-PARTICIPANT', N'Page', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A501009D8B98 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (49, N'Bouton-SAVE-PLANIFICATION-EXAMEN-PARTICIPANT', N'Bouton-SAVE-PLANIFICATION-EXAMEN-PARTICIPANT', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A501009D9A96 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (50, N'Bouton-EDIT-PLANIFICATION-EXAMEN-PARTICIPANT', N'Bouton-EDIT-PLANIFICATION-EXAMEN-PARTICIPANT', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A501009DA98E AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (51, N'Bouton-DELETE-PLANIFICATION-EXAMEN-PARTICIPANT', N'Bouton-DELETE-PLANIFICATION-EXAMEN-PARTICIPANT', N'Action', 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A501009DB976 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (52, N'PAGE-FORMATION-RESULTAT-ALL-EXAMEN', N'PAGE-FORMATION-RESULTAT-ALL-EXAMEN', N'Page', 3, N'Admin', CAST(0x0000A50601160CBC AS DateTime), N'Admin', CAST(0x0000A507004B8BDC AS DateTime))
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (53, N'PAGE-FORMATION-EVALUATION-PARTICIPANT', N'PAGE-FORMATION-EVALUATION-PARTICIPANT', N'Page', 3, N'Admin', CAST(0x0000A50700493E66 AS DateTime), NULL, NULL)
INSERT [dbo].[TBL_SR_OBJECTS] ([Object_ID], [Object], [ObjectDescription], [ObjectType], [ID_Modules], [CreatedBy], [DateCreated], [ModifBy], [DateModif]) VALUES (54, N'PAGE-FORMATION-RESULTAT-EXAMEN', N'PAGE-FORMATION-RESULTAT-EXAMEN', N'Page', 3, N'Admin', CAST(0x0000A507004C0CE5 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TBL_SR_OBJECTS] OFF
/****** Object:  StoredProcedure [dbo].[SR_UpdateUser_AskPassword]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_UpdateUser_AskPassword] 
	(
		@ID bigint
		,@AskPassword NVARCHAR(80)
		,@user nvarchar(100)
	)
AS

	DECLARE @Error int
	BEGIN TRANSACTION 
	UPDATE TBL_SR_USER
	SET
		[AskPassword] = @AskPassword
		,Modifby = @user
		,DateModif = GETDATE()
	Where ID_User = @ID

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_UpdateSR_MODULES]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_UpdateSR_MODULES] 	(		@ID bigint		,@Module nvarchar(200)		,@ModuleDescription nvarchar(400)		,@ActifYN bit		,@user nvarchar(100)	)AS	DECLARE @Error int	BEGIN TRANSACTION 	UPDATE TBL_SR_MODULES	SET		[Module] = @Module		,[ModuleDescription] = @ModuleDescription		,[ActifYN] = @ActifYN		,Modifby =@user		,DateModif=GETDATE()	Where ID = @ID	SET @Error = @@ERROR	IF @Error != 0 GOTO ERROR_HANDLER	COMMIT TRANSACTION	RETURN(0)ERROR_HANDLER:	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Update_Groupe2]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Update_Groupe2]
(
	@id bigint,
	@Groupe_Description nvarchar(100),
	@PageDefault nvarchar(max),
	@usrup nvarchar(100)
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	Update TBL_SR_GROUPE
	Set 
		Groupe_Description = @Groupe_Description,
		PageDefault = @PageDefault,
		ModifBy = @usrup,
		DateModif = getdate()
	Where ID_Group = @id

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER
	
	COMMIT TRANSACTION
	
	RETURN(0) 

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Update_Groupe]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Update_Groupe]
(
	@id bigint,
	@Groupe_Description nvarchar(200),
	@PageDefault nvarchar(max),
	@usrup nvarchar(100)
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	Update [Profile]
	Set 
		ProfileName = @Groupe_Description,
		PageDefault = @PageDefault,
		ModifBy = @usrup,
		DateModif = getdate()
	Where ProfileId = @id

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER
	
	COMMIT TRANSACTION
	
	RETURN(0) 

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
-----------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SR_SelectSR_MODULES_ByID]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_SelectSR_MODULES_ByID] 	(		@ID bigint	)AS	SELECT * FROM TBL_SR_MODULES	WHERE ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[SR_Update_User]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Update_User] 
	(
		@ID_User bigint
		,@ID_GroupeUser bigint
		,@Photo image
		,@UserName nvarchar(200)
		,@Civilite nvarchar(20)
		,@Nom nvarchar(400)
		,@Prenom nvarchar(200)
		,@Sexe nvarchar(20)
		,@Telephone nvarchar(100)
		,@ActifYN bit
		,@Confirmer bit
		,@MustChangePassword bit
		,@Poste nvarchar(100)
		,@user nvarchar(200)
	)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	UPDATE TBL_SR_USER
	SET

		[ID_GroupeUser] = @ID_GroupeUser
		,[Photo] = @Photo
		,[UserName] = @UserName
		,[Civilite] = @Civilite
		,[Nom] = @Nom
		,[Prenom] = @Prenom
		,[Sexe] = @Sexe
		,[Telephone] = @Telephone
		,[ActifYN] = @ActifYN
		,[Confirmer] = @Confirmer
		,[MustChangePassword] = @MustChangePassword
		,[Poste] = @Poste
		,Modifby = @user
		,DateModif = GETDATE()
	Where ID_User = @ID_User

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Update_Right]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Update_Right]
(
	@id bigint,
	@Nom nvarchar(500),
	@usrup nvarchar(200)
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	Update TBL_SR_RIGHTS
	Set 
		Privilege = @Nom,
		ModifBy = @usrup,
		DateModif = getdate()
	Where Right_ID = @id

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION
	
	RETURN(0) 

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Update_Password_User]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Update_Password_User]
(
	@id bigint,
	@pass nvarchar(100),
	@usrup nvarchar(100)
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	Update dbo.TBL_SR_USER
	Set 
		[Password] = @pass,
		MustChangePassword = 0,
		ModifBy = @usrup,
		DateModif = getdate()
	Where ID_User = @id

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0) 

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Objects]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Objects]
AS

SELECT * FROM dbo.TBL_SR_OBJECTS
GO
/****** Object:  StoredProcedure [dbo].[SR_Update_Object]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Update_Object]
(
	@id bigint,
	@Nom nvarchar(100),
	@Desc nvarchar(200),
	@Type nvarchar(20),
	@ID_Modules bigint,
	@usrup nvarchar(100)
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	Update dbo.TBL_SR_OBJECTS
	Set 
		[Object] = @Nom,
		ObjectDescription = @Desc,
		ObjectType = @Type,
		ID_Modules = @ID_Modules,
		ModifBy = @usrup,
		DateModif = getdate()
	Where [Object_ID] = @id

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0) 

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_User_ByUserName]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_User_ByUserName]
(
	@UserName NVARCHAR(100)
)
AS

	SELECT * FROM dbo.Personnel
	WHERE [NomUtilisateur] = @UserName
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_User_ById]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_User_ById]
(
	@PersId Bigint
)
AS

	SELECT * FROM dbo.Personnel
	WHERE [PersId] = @PersId
GO
/****** Object:  StoredProcedure [dbo].[SR_Update_User_Trace_LastLogin]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Update_User_Trace_LastLogin]
(
	@id bigint,
	@lastIP nvarchar(20),
	@ModifBy nvarchar(100)
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	Update dbo.Personnel
	Set 
		DerniereDateConnexion = getdate()
		,LastIP = @lastIP
		,ModifierPar = @ModifBy
		,DateModification = getdate()
	Where PersId = @id

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0) 

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Update_User_Statut_Connexion]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Update_User_Statut_Connexion]
(
	@PersId bigint
	,@ConnecterYN bit
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	Update dbo.Personnel
	Set ConnecterYN = @ConnecterYN
	Where PersId = @PersId

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0) 

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Update_User_ForcedOut]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Update_User_ForcedOut]
(
	@PersId bigint
	,@IsForcedOut bit
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	Update dbo.Personnel
	Set 
		IsForcedOut = @IsForcedOut
	Where PersId = @PersId

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0) 

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  Table [dbo].[TBL_SR_OBJECT_RIGHT]    Script Date: 03/09/2018 13:15:19 ******/
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
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 1, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800ECFA1C AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 2, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800ECFA1D AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 3, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDD9 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 4, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDD9 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 5, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDD9 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 6, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800ECFA1E AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 7, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDD9 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 8, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDDA AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 9, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDDA AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 10, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDDB AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 11, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800ECFA1E AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 12, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDDB AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 13, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDDB AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 14, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800ECFA1E AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 15, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800ECFA1F AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 16, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDE1 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 17, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800ECFA20 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 18, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800ECFA20 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 19, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDE1 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 20, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDE2 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 21, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDE2 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 22, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDE2 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 23, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDE2 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 24, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800ECFA21 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 25, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDE3 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 26, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800EDDDE3 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 27, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F6520B AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 28, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F66169 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 29, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F6F8DC AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 30, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4F800F6FEEC AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 31, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FE00BB1CCD AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 32, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FE00BB426E AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 35, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA00EBD980 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 36, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA00F6D1B6 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 37, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA00FC2E17 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 38, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA01009414 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 39, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FA01009798 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 40, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00B7F9CF AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 41, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00B817F9 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 42, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00B83F24 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 43, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00B840C3 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 44, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00E05B56 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 45, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00E17CA6 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 46, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00E183A3 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 47, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A4FB00E183A4 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 48, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A501009DCCC3 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 49, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A50100A0B30A AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 50, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A50100A0B5C5 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 51, N'duverseau.jeanfritz@gmail.com', CAST(0x0000A50100A0B81C AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 52, N'Admin', CAST(0x0000A50700507741 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 53, N'Admin', CAST(0x0000A507004952FD AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (1, 54, N'Admin', CAST(0x0000A507004C1FEC AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (2, 53, N'Admin', CAST(0x0000A507005DFCA2 AS DateTime))
INSERT [dbo].[TBL_SR_OBJECT_RIGHT] ([Right_ID], [Object_ID], [CreatedBy], [DateCreated]) VALUES (2, 54, N'Admin', CAST(0x0000A507005DF99A AS DateTime))
/****** Object:  StoredProcedure [dbo].[SR_Disconnect_USER_ById]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SR_Disconnect_USER_ById]
(
	@PersId BIGINT
)
AS 
    DECLARE @Error int
    DECLARE @ID bigint

    BEGIN TRANSACTION 

	UPDATE dbo.Personnel 
	SET 
		ConnecterYN = 0,  
		IsForcedOut = 1 
	WHERE 
		PersId = @PersId
		
 COMMIT TRANSACTION
ERROR_HANDLER:
    IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
    select @Error as  PersId
GO
/****** Object:  StoredProcedure [dbo].[SR_Disconnect_AllUser]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Disconnect_AllUser]
AS 
    DECLARE @Error int
    DECLARE @ID bigint

    BEGIN TRANSACTION 

	UPDATE dbo.Personnel 
	SET 
		ConnecterYN = 0,  
		IsForcedOut = 1
		
 COMMIT TRANSACTION
ERROR_HANDLER:
    IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
    select @Error as  ID
GO
/****** Object:  StoredProcedure [dbo].[SR_Delete_User]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Delete_User]
(
	@PersId BIGINT
)
AS

	DELETE FROM dbo.Personnel
	WHERE PersId = @PersId
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_User_ByIDGroup_ByStatut]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_User_ByIDGroup_ByStatut]
(
	@ID_Group AS BIGINT,
	@ActifYN AS BIT
)
AS
BEGIN
		 
		SELECT * FROM dbo.Personnel WHERE 1=1
		AND ActifYN = @ActifYN
		AND ProfileId = @ID_Group
		ORDER BY DerniereDateConnexion ASC
END
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_User]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_User]
(
	@ActifYN NVARCHAR(100)
)
AS
IF (@ActifYN <> 'FO')
		BEGIN
			SELECT * FROM dbo.Personnel
			WHERE ActifYN = @ActifYN
			-- ORDER BY DateCreated DESC
		END
	ELSE
		BEGIN
			SELECT * FROM dbo.Personnel
			-- ORDER BY DateCreated DESC
		END
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_TypeObject]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_TypeObject]

AS

	SELECT Distinct(ObjectType) as TypeObj
	FROM TBL_SR_OBJECTS
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_Object]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_Object]
(
	@Nom nvarchar(100),
	@Desc nvarchar(200),
	@Type nvarchar(20),
	@ID_Modules bigint,
	@usrcr nvarchar(100)
)
AS

	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 

	INSERT INTO dbo.TBL_SR_OBJECTS
	(
		[Object],
		ObjectDescription,
		ObjectType,
		ID_Modules,
		CreatedBy, 
		DateCreated
	)
	VALUES
	(   
		@Nom,
		@Desc,
		@Type,
		@ID_Modules,
		@usrcr,
		getdate()
	)

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity  

	COMMIT TRANSACTION

	SELECT @ID AS [Object_ID]  

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Delete_Object]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Delete_Object]
(
	@ID int
)
AS

DELETE FROM dbo.TBL_SR_OBJECTS
WHERE [Object_ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[SR_Search_User_Like]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Jean Fritz DUVERSEAU>
-- Create date: <Friday 13th, 2012>
-- =============================================

CREATE PROCEDURE [dbo].[SR_Search_User_Like]
(
	@String_Search AS VARCHAR(200),
	@ID_Group AS BIGINT
)
AS
BEGIN
	IF (LEN(@String_Search) > 0 AND @ID_Group = 0)
		SELECT * FROM dbo.Personnel WHERE 1=1
			 AND (NomUtilisateur LIKE '%' + @String_Search + '%' OR Nom LIKE '%' + @String_Search + '%'  OR Prenom LIKE '%' + @String_Search + '%' )
			 ORDER BY DateCreation ASC
			 
	IF (LEN(@String_Search) > 0 AND @ID_Group > 0)
		SELECT * FROM dbo.Personnel WHERE 1=1
		AND (NomUtilisateur LIKE '%' + @String_Search + '%' OR Nom LIKE '%' + @String_Search + '%'  OR Prenom LIKE '%' + @String_Search + '%' )
		AND ProfileId = @ID_Group
		ORDER BY DateCreation ASC
			 
	IF (LEN(@String_Search) = 0 AND @ID_Group > 0)
		SELECT * FROM dbo.Personnel WHERE 1=1
		AND ProfileId = @ID_Group
		ORDER BY DateCreation ASC
		
	IF (LEN(@String_Search) = 0 AND @ID_Group = 0)			 
		SELECT * FROM dbo.Personnel WHERE 1=1
		ORDER BY DateCreation ASC
END
GO
/****** Object:  StoredProcedure [dbo].[SR_Search_Object_Like]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Jean Fritz DUVERSEAU>
-- Create date: <Friday 13th, 2012>
-- =============================================

CREATE PROCEDURE [dbo].[SR_Search_Object_Like]
(
	@String_Search AS VARCHAR(200),
	@ObjectType AS VARCHAR(200),
	@ID_Modules AS BIGINT
)
AS
BEGIN		
	IF (LEN(@String_Search) > 0 AND LEN(@ObjectType) = 0 AND @ID_Modules = 0)
	SELECT * FROM dbo.TBL_SR_OBJECTS WHERE 1=1
		 AND ([Object] LIKE '%' + @String_Search + '%' OR ObjectDescription  LIKE '%' + @String_Search + '%' )
		 ORDER BY DateCreated ASC
			 
	IF (LEN(@String_Search) > 0 AND LEN(@ObjectType) > 0 AND @ID_Modules = 0)
		SELECT * FROM dbo.TBL_SR_OBJECTS WHERE 1=1
		AND ([Object] LIKE '%' + @String_Search + '%' OR ObjectDescription  LIKE '%' + @String_Search + '%'  )
		AND ObjectType = @ObjectType
		ORDER BY DateCreated ASC
			 
	IF (LEN(@String_Search) = 0 AND LEN(@ObjectType) > 0 AND @ID_Modules = 0)
		SELECT * FROM dbo.TBL_SR_OBJECTS WHERE 1=1
		AND ObjectType = @ObjectType
		ORDER BY DateCreated ASC
		
	IF (LEN(@String_Search) = 0 AND LEN(@ObjectType) = 0 AND @ID_Modules = 0)			 
		SELECT * FROM dbo.TBL_SR_OBJECTS WHERE 1=1
		ORDER BY DateCreated ASC
		
	IF (LEN(@String_Search) > 0 AND LEN(@ObjectType) > 0 AND @ID_Modules > 0)			 
		SELECT * FROM dbo.TBL_SR_OBJECTS WHERE 1=1
		AND ([Object] LIKE '%' + @String_Search + '%' OR ObjectDescription  LIKE '%' + @String_Search + '%'  )
		AND ObjectType = @ObjectType
		AND ID_Modules = @ID_Modules
		ORDER BY DateCreated ASC
		
	IF (LEN(@String_Search) = 0 AND LEN(@ObjectType) > 0 AND @ID_Modules > 0)			 
		SELECT * FROM dbo.TBL_SR_OBJECTS WHERE 1=1
		-- AND ([Object] LIKE '%' + @String_Search + '%' OR ObjectDescription  LIKE '%' + @String_Search + '%'  )
		AND ObjectType = @ObjectType
		AND ID_Modules = @ID_Modules
		ORDER BY DateCreated ASC
		
	IF (LEN(@String_Search) = 0 AND LEN(@ObjectType) = 0 AND @ID_Modules > 0)			 
		SELECT * FROM dbo.TBL_SR_OBJECTS WHERE 1=1
		--AND ([Object] LIKE '%' + @String_Search + '%' OR ObjectDescription  LIKE '%' + @String_Search + '%'  )
		--AND ObjectType = @ObjectType
		AND ID_Modules = @ID_Modules
		ORDER BY DateCreated ASC
END
GO
/****** Object:  StoredProcedure [dbo].[SR_ListeAll_Objets_ByObjectType]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListeAll_Objets_ByObjectType]
	@ObjectType as NVARCHAR(100)
AS
BEGIN
	SELECT * FROM [TBL_SR_OBJECTS]
	WHERE [ObjectType] = @ObjectType
END
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_UserConnected]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_UserConnected]
(
	@ID_Group BIGINT
)
AS
	IF @ID_Group = 0
		SELECT * FROM dbo.Personnel
		WHERE ConnecterYN = 1
		ORDER BY DerniereDateConnexion DESC
	ELSE
		SELECT * FROM dbo.Personnel
		WHERE ConnecterYN = 1 
		AND ProfileId = @ID_Group
		ORDER BY DerniereDateConnexion DESC
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Object_ByName]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Object_ByName]
(
	@Nom nvarchar(100)
)
AS

	SELECT * FROM TBL_SR_OBJECTS
	WHERE [Object] = @Nom
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Object_ById]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Object_ById]
(
	@ID bigint
)
AS

	SELECT * FROM dbo.TBL_SR_OBJECTS
	WHERE [Object_ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Object_ByGroup_ByName2]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Object_ByGroup_ByName2]
(
	@idgrp bigint,
	@objrequest nvarchar(100)
)
AS
	
	Select Distinct(TBL_SR_OBJECTS.Object) 
	From TBL_SR_GROUPE, TBL_SR_GROUPE_RIGHT, TBL_SR_RIGHTS, TBL_SR_OBJECT_RIGHT, TBL_SR_OBJECTS
    Where TBL_SR_GROUPE.ID_Group = TBL_SR_GROUPE_RIGHT.Group_ID
		AND TBL_SR_GROUPE_RIGHT.Right_ID = TBL_SR_RIGHTS.Right_ID
		AND TBL_SR_RIGHTS.Right_ID = TBL_SR_OBJECT_RIGHT.Right_ID
		AND TBL_SR_OBJECT_RIGHT.Object_ID = TBL_SR_OBJECTS.Object_ID
		AND TBL_SR_GROUPE.ID_Group = @idgrp
		AND TBL_SR_OBJECTS.Object = @objrequest
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Object_ByGroup_ByName_Actif2]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Object_ByGroup_ByName_Actif2]
(
	@idgrp bigint,
	@objrequest nvarchar(100)
)
AS
	
	Select Distinct(TBL_SR_OBJECTS.Object) 
	From TBL_SR_GROUPE, TBL_SR_GROUPE_RIGHT, TBL_SR_RIGHTS, TBL_SR_OBJECT_RIGHT, TBL_SR_OBJECTS
    Where TBL_SR_GROUPE.ID_Group = TBL_SR_GROUPE_RIGHT.Group_ID
		AND TBL_SR_GROUPE_RIGHT.Right_ID = TBL_SR_RIGHTS.Right_ID
		AND TBL_SR_RIGHTS.Right_ID = TBL_SR_OBJECT_RIGHT.Right_ID
		AND TBL_SR_OBJECT_RIGHT.Object_ID = TBL_SR_OBJECTS.Object_ID
		AND TBL_SR_GROUPE.ID_Group = @idgrp
		AND TBL_SR_OBJECTS.Object = @objrequest
		AND TBL_SR_OBJECTS.ID_Modules IN (SELECT ID FROM TBL_SR_MODULES WHERE ActifYN=1)
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Object_ByGroup_ByName_Actif]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Object_ByGroup_ByName_Actif]
(
	@idgrp bigint,
	@objrequest nvarchar(100)
)
AS
	
	Select Distinct(TBL_SR_OBJECTS.Object) 
	From [Profile], TBL_SR_GROUPE_RIGHT, TBL_SR_RIGHTS, TBL_SR_OBJECT_RIGHT, TBL_SR_OBJECTS
    Where [Profile].ProfileId = TBL_SR_GROUPE_RIGHT.Group_ID
		AND TBL_SR_GROUPE_RIGHT.Right_ID = TBL_SR_RIGHTS.Right_ID
		AND TBL_SR_RIGHTS.Right_ID = TBL_SR_OBJECT_RIGHT.Right_ID
		AND TBL_SR_OBJECT_RIGHT.Object_ID = TBL_SR_OBJECTS.Object_ID
		AND [Profile].ProfileId = @idgrp
		AND TBL_SR_OBJECTS.Object = @objrequest
		AND TBL_SR_OBJECTS.ID_Modules IN (SELECT ID FROM TBL_SR_MODULES WHERE ActifYN=1)
-----------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SR_Select_Object_ByGroup_ByName]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Select_Object_ByGroup_ByName]
(
	@idgrp bigint,
	@objrequest nvarchar(100)
)
AS	
	Select Distinct(TBL_SR_OBJECTS.Object) 
	From [Profile], TBL_SR_GROUPE_RIGHT, TBL_SR_RIGHTS, TBL_SR_OBJECT_RIGHT, TBL_SR_OBJECTS
    Where [Profile].ProfileId = TBL_SR_GROUPE_RIGHT.Group_ID
		AND TBL_SR_GROUPE_RIGHT.Right_ID = TBL_SR_RIGHTS.Right_ID
		AND TBL_SR_RIGHTS.Right_ID = TBL_SR_OBJECT_RIGHT.Right_ID
		AND TBL_SR_OBJECT_RIGHT.Object_ID = TBL_SR_OBJECTS.Object_ID
		AND [Profile].ProfileId = @idgrp
		AND TBL_SR_OBJECTS.Object = @objrequest
GO
/****** Object:  StoredProcedure [dbo].[SR_Delete_ObjectRight_ById_Groupe_AND_ById_Right]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Delete_ObjectRight_ById_Groupe_AND_ById_Right]
(
	@id bigint,
	@idprq bigint
)
AS

DELETE FROM dbo.TBL_SR_OBJECT_RIGHT
WHERE 
	Right_ID = @id AND [Object_ID] = @idprq
GO
/****** Object:  StoredProcedure [dbo].[SR_Delete_ObjectRight_ById_AND_NameObject]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Delete_ObjectRight_ById_AND_NameObject]
(
	@id bigint,
	@nmprq nvarchar(50)
)
AS

DELETE FROM TBL_SR_OBJECT_RIGHT
WHERE 
	Right_ID = @id
	AND [Object_ID] in (
							SELECT [Object_ID] FROM dbo.TBL_SR_OBJECTS
							WHERE ObjectDescription = @nmprq
					    )
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Objets_NotIn_Right_ByID_Modules]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Objets_NotIn_Right_ByID_Modules]
(
	@ID bigint,
	@ID_Modules bigint,
	@typeobj nvarchar(100)
)
AS

	SELECT * FROM TBL_SR_OBJECTS
	WHERE [Object_ID] not in (
								SELECT [Object_ID] FROM TBL_SR_OBJECT_RIGHT
								WHERE Right_ID = @ID
							  )
	AND ObjectType = @typeobj
	AND ID_Modules = @ID_Modules
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Objets_NotIn_Right]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Objets_NotIn_Right]
(
	@ID bigint,
	@typeobj nvarchar(100)
)
AS

	SELECT * FROM TBL_SR_OBJECTS
	WHERE [Object_ID] not in (
								SELECT [Object_ID] FROM TBL_SR_OBJECT_RIGHT
								WHERE Right_ID = @ID
							  )
	AND ObjectType = @typeobj
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Objects_In_Right_ByType_ByID_Modules]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Objects_In_Right_ByType_ByID_Modules]
(
	@ID bigint,
	@ID_Modules bigint,
	@typeobj nvarchar(100)
)
AS

	SELECT * FROM dbo.TBL_SR_OBJECTS
	WHERE ObjectType = @typeobj
	AND ID_Modules = @ID_Modules
		AND [Object_ID] in (
								SELECT [Object_ID] FROM dbo.TBL_SR_OBJECT_RIGHT
								WHERE Right_ID = @ID
						   )
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Objects_In_Right_ByType]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Objects_In_Right_ByType]
(
	@ID bigint,
	@typeobj nvarchar(100)
)
AS

	SELECT * FROM dbo.TBL_SR_OBJECTS
	WHERE ObjectType = @typeobj
		AND [Object_ID] in (
								SELECT [Object_ID] FROM dbo.TBL_SR_OBJECT_RIGHT
								WHERE Right_ID = @ID
						   )
GO
/****** Object:  StoredProcedure [dbo].[SR_ListAll_Objects_In_Right]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_ListAll_Objects_In_Right]
(
	@ID bigint
)
AS

	SELECT * FROM TBL_SR_OBJECTS
	WHERE [Object_ID] in (
							SELECT [Object_ID] FROM dbo.TBL_SR_OBJECT_RIGHT
							WHERE Right_ID = @ID
						 )
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_ObjetRight]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_ObjetRight]
(
	@idrght bigint,
	@idprq bigint,
	@usrcr nvarchar(200)
)
AS

	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 

	INSERT INTO TBL_SR_OBJECT_RIGHT
	(
		Right_ID, [Object_ID], CreatedBy, DateCreated
	)
	VALUES
	(   
		@idrght, @idprq, @usrcr, getdate()
	)

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity  

	COMMIT TRANSACTION

	SELECT @ID

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  StoredProcedure [dbo].[SR_Insert_ObjectRight_ByName_Object]    Script Date: 03/09/2018 13:15:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SR_Insert_ObjectRight_ByName_Object]
(
	@idrght bigint,
	@prq nvarchar(200),
	@usrcr nvarchar(200)
)
AS

	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 

	INSERT INTO  TBL_SR_OBJECT_RIGHT
	(
		Right_ID, [Object_ID], CreatedBy, DateCreated
	)
	SELECT @idrght, [Object_ID], @usrcr, getdate() FROM dbo.TBL_SR_OBJECTS WHERE ObjectDescription = @prq
	

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity  

	COMMIT TRANSACTION

	SELECT @ID

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error
GO
/****** Object:  Default [DF__Personnel__Sexe__0C85DE4D]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[Personnel] ADD  DEFAULT ('M') FOR [Sexe]
GO
/****** Object:  Default [DF__Personnel__Valid__0D7A0286]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[Personnel] ADD  DEFAULT ('Pas encore') FOR [Valide]
GO
/****** Object:  Default [DF__Personnel__EstAs__0E6E26BF]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[Personnel] ADD  DEFAULT ('Pas encore') FOR [EstAssigne]
GO
/****** Object:  Default [DF_TBL_SR_MODULES_ActifYN]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[TBL_SR_MODULES] ADD  CONSTRAINT [DF_TBL_SR_MODULES_ActifYN]  DEFAULT ((0)) FOR [ActifYN]
GO
/****** Object:  Check [Check_Pers_EstAssigne]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD  CONSTRAINT [Check_Pers_EstAssigne] CHECK  (([EstAssigne]='Oui' OR [EstAssigne]='Non' OR [EstAssigne]='Pas encore'))
GO
ALTER TABLE [dbo].[Personnel] CHECK CONSTRAINT [Check_Pers_EstAssigne]
GO
/****** Object:  Check [Check_Pers_Valide]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD  CONSTRAINT [Check_Pers_Valide] CHECK  (([Valide]='Oui' OR [Valide]='Non' OR [Valide]='Pas encore'))
GO
ALTER TABLE [dbo].[Personnel] CHECK CONSTRAINT [Check_Pers_Valide]
GO
/****** Object:  Check [Check_Sexe]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD  CONSTRAINT [Check_Sexe] CHECK  (([Sexe]='F' OR [Sexe]='M'))
GO
ALTER TABLE [dbo].[Personnel] CHECK CONSTRAINT [Check_Sexe]
GO
/****** Object:  ForeignKey [Personnel_Profile_fk]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD  CONSTRAINT [Personnel_Profile_fk] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[Profile] ([ProfileId])
GO
ALTER TABLE [dbo].[Personnel] CHECK CONSTRAINT [Personnel_Profile_fk]
GO
/****** Object:  ForeignKey [FK_TBL_SR_OBJECT_RIGHT_TBL_SR_OBJECTS]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[TBL_SR_OBJECT_RIGHT]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SR_OBJECT_RIGHT_TBL_SR_OBJECTS] FOREIGN KEY([Object_ID])
REFERENCES [dbo].[TBL_SR_OBJECTS] ([Object_ID])
GO
ALTER TABLE [dbo].[TBL_SR_OBJECT_RIGHT] CHECK CONSTRAINT [FK_TBL_SR_OBJECT_RIGHT_TBL_SR_OBJECTS]
GO
/****** Object:  ForeignKey [FK_TBL_SR_OBJECT_RIGHT_TBL_SR_RIGHTS]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[TBL_SR_OBJECT_RIGHT]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SR_OBJECT_RIGHT_TBL_SR_RIGHTS] FOREIGN KEY([Right_ID])
REFERENCES [dbo].[TBL_SR_RIGHTS] ([Right_ID])
GO
ALTER TABLE [dbo].[TBL_SR_OBJECT_RIGHT] CHECK CONSTRAINT [FK_TBL_SR_OBJECT_RIGHT_TBL_SR_RIGHTS]
GO
/****** Object:  ForeignKey [FK_TBL_SR_OBJECTS_TBL_SR_MODULES]    Script Date: 03/09/2018 13:15:19 ******/
ALTER TABLE [dbo].[TBL_SR_OBJECTS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_SR_OBJECTS_TBL_SR_MODULES] FOREIGN KEY([ID_Modules])
REFERENCES [dbo].[TBL_SR_MODULES] ([ID])
GO
ALTER TABLE [dbo].[TBL_SR_OBJECTS] CHECK CONSTRAINT [FK_TBL_SR_OBJECTS_TBL_SR_MODULES]
GO
