
GO
/****** Object:  Table [dbo].[Tbl_FormulaireExercices]    Script Date: 03/08/2018 11:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_FormulaireExercices](
	[CodeExercise] [bigint] IDENTITY(1,1) NOT NULL,
	[LibelleExercice] [nvarchar](max) NOT NULL,
	[Descriptions] [nvarchar](max) NULL,
	[Instructions] [nvarchar](max) NULL,
	[RappelExercice] [nvarchar](max) NULL,
	[TypeEvaluation] [int] NULL,
	[Statut] [int] NULL,
	[DureeEnSeconde] [int] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Tbl_FormulaireExercices] PRIMARY KEY CLUSTERED 
(
	[CodeExercise] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Questions]    Script Date: 03/08/2018 11:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Questions](
	[CodeQuestion] [bigint] IDENTITY(1,1) NOT NULL,
	[LibelleQuestion] [nvarchar](max) NOT NULL,
	[DetailsQuestion] [nvarchar](max) NULL,
	[IndicationsQuestion] [nvarchar](max) NULL,
	[AvoirJustificationYN] [bit] NULL,
	[TypeQuestion] [int] NULL,
	[ScoreTotal] [decimal](18, 2) NOT NULL,
	[Commentaire] [nvarchar](max) NULL,
	[CaractereAccepte] [int] NULL,
	[NbreValeurMinimal] [int] NULL,
	[NbreCaractereMaximal] [int] NULL,
	[qPrecedent] [nvarchar](100) NULL,
	[qSuivant] [nvarchar](100) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Questions] PRIMARY KEY CLUSTERED 
(
	[CodeQuestion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_QuestionFormulaireExercice]    Script Date: 03/08/2018 11:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_QuestionFormulaireExercice](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CodeFormulaireExercice] [bigint] NULL,
	[CodeQuestion] [bigint] NULL,
	[OrdreQuestion] [int] NOT NULL,
	[EstDebutQuestion] [bit] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Tbl_QuestionFormulaireExercice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_JustificationReponses]    Script Date: 03/08/2018 11:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_JustificationReponses](
	[CodeJustificationReponse] [bigint] IDENTITY(1,1) NOT NULL,
	[CodeQuestion] [bigint] NOT NULL,
	[LibelleJustification] [nvarchar](max) NULL,
	[Iscorrect] [bit] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Tbl_JustificationReponses] PRIMARY KEY CLUSTERED 
(
	[CodeJustificationReponse] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Reponses]    Script Date: 03/08/2018 11:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Reponses](
	[CodeReponse] [bigint] IDENTITY(1,1) NOT NULL,
	[CodeQuestion] [bigint] NOT NULL,
	[LibelleReponse] [nvarchar](max) NOT NULL,
	[Iscorrect] [bit] NOT NULL,
	[estEnfant] [bit] NULL,
	[avoirEnfant] [bit] NULL,
	[CodeParent] [nvarchar](70) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Reponses] PRIMARY KEY CLUSTERED 
(
	[CodeReponse] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ReponseEntree]    Script Date: 03/08/2018 11:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ReponseEntree](
	[codeReponseEntree] [bigint] NOT NULL,
	[CodeReponse] [bigint] NOT NULL,
	[CodeJustificationReponse] [bigint] NULL,
	[CodeQuestion] [bigint] NULL,
	[CodeFormulaireExercice] [bigint] NULL,
	[PersonnelId] [bigint] NULL,
	[ReponseSaisie] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Tbl_ReponseEntree] PRIMARY KEY CLUSTERED 
(
	[codeReponseEntree] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF_Tbl_QuestionFormulaireExercice_EstDebutQuestion]    Script Date: 03/08/2018 11:29:54 ******/
ALTER TABLE [dbo].[Tbl_QuestionFormulaireExercice] ADD  CONSTRAINT [DF_Tbl_QuestionFormulaireExercice_EstDebutQuestion]  DEFAULT ((0)) FOR [EstDebutQuestion]
GO
/****** Object:  Default [DF_Tbl_Questions_AvoirJustificationYN]    Script Date: 03/08/2018 11:29:54 ******/
ALTER TABLE [dbo].[Tbl_Questions] ADD  CONSTRAINT [DF_Tbl_Questions_AvoirJustificationYN]  DEFAULT ((0)) FOR [AvoirJustificationYN]
GO
/****** Object:  ForeignKey [FK_Tbl_JustificationReponses_Tbl_Questions]    Script Date: 03/08/2018 11:29:54 ******/
ALTER TABLE [dbo].[Tbl_JustificationReponses]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_JustificationReponses_Tbl_Questions] FOREIGN KEY([CodeQuestion])
REFERENCES [dbo].[Tbl_Questions] ([CodeQuestion])
GO
ALTER TABLE [dbo].[Tbl_JustificationReponses] CHECK CONSTRAINT [FK_Tbl_JustificationReponses_Tbl_Questions]
GO
/****** Object:  ForeignKey [FK_Tbl_QuestionFormulaireExercice_Tbl_FormulaireExercices]    Script Date: 03/08/2018 11:29:54 ******/
ALTER TABLE [dbo].[Tbl_QuestionFormulaireExercice]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_QuestionFormulaireExercice_Tbl_FormulaireExercices] FOREIGN KEY([CodeFormulaireExercice])
REFERENCES [dbo].[Tbl_FormulaireExercices] ([CodeExercise])
GO
ALTER TABLE [dbo].[Tbl_QuestionFormulaireExercice] CHECK CONSTRAINT [FK_Tbl_QuestionFormulaireExercice_Tbl_FormulaireExercices]
GO
/****** Object:  ForeignKey [FK_Tbl_QuestionFormulaireExercice_Tbl_Questions]    Script Date: 03/08/2018 11:29:54 ******/
ALTER TABLE [dbo].[Tbl_QuestionFormulaireExercice]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_QuestionFormulaireExercice_Tbl_Questions] FOREIGN KEY([CodeQuestion])
REFERENCES [dbo].[Tbl_Questions] ([CodeQuestion])
GO
ALTER TABLE [dbo].[Tbl_QuestionFormulaireExercice] CHECK CONSTRAINT [FK_Tbl_QuestionFormulaireExercice_Tbl_Questions]
GO
/****** Object:  ForeignKey [FK_Tbl_ReponseEntree_Tbl_JustificationReponses]    Script Date: 03/08/2018 11:29:54 ******/
ALTER TABLE [dbo].[Tbl_ReponseEntree]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ReponseEntree_Tbl_JustificationReponses] FOREIGN KEY([CodeJustificationReponse])
REFERENCES [dbo].[Tbl_JustificationReponses] ([CodeJustificationReponse])
GO
ALTER TABLE [dbo].[Tbl_ReponseEntree] CHECK CONSTRAINT [FK_Tbl_ReponseEntree_Tbl_JustificationReponses]
GO
/****** Object:  ForeignKey [FK_Tbl_ReponseEntree_Tbl_Questions]    Script Date: 03/08/2018 11:29:54 ******/
ALTER TABLE [dbo].[Tbl_ReponseEntree]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ReponseEntree_Tbl_Questions] FOREIGN KEY([CodeQuestion])
REFERENCES [dbo].[Tbl_Questions] ([CodeQuestion])
GO
ALTER TABLE [dbo].[Tbl_ReponseEntree] CHECK CONSTRAINT [FK_Tbl_ReponseEntree_Tbl_Questions]
GO
/****** Object:  ForeignKey [FK_Tbl_ReponseEntree_Tbl_Reponses]    Script Date: 03/08/2018 11:29:54 ******/
ALTER TABLE [dbo].[Tbl_ReponseEntree]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ReponseEntree_Tbl_Reponses] FOREIGN KEY([CodeReponse])
REFERENCES [dbo].[Tbl_Reponses] ([CodeReponse])
GO
ALTER TABLE [dbo].[Tbl_ReponseEntree] CHECK CONSTRAINT [FK_Tbl_ReponseEntree_Tbl_Reponses]
GO
/****** Object:  ForeignKey [FK_Tbl_Reponses_Tbl_Questions]    Script Date: 03/08/2018 11:29:54 ******/
ALTER TABLE [dbo].[Tbl_Reponses]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Reponses_Tbl_Questions] FOREIGN KEY([CodeQuestion])
REFERENCES [dbo].[Tbl_Questions] ([CodeQuestion])
GO
ALTER TABLE [dbo].[Tbl_Reponses] CHECK CONSTRAINT [FK_Tbl_Reponses_Tbl_Questions]
GO
