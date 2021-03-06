/*
   27 April 201812:57:44
   User: sa
   Server: localhost\MSSQLSERVER08_R2
   Database: RGPH_FormationExercice_db
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Tbl_Reponses
	DROP CONSTRAINT FK_Tbl_Reponses_Tbl_Questions
GO
ALTER TABLE dbo.Tbl_Questions SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Tbl_Reponses
	DROP CONSTRAINT DF_Tbl_Reponses_estEnfant
GO
CREATE TABLE dbo.Tmp_Tbl_Reponses
	(
	CodeReponse bigint NOT NULL IDENTITY (1, 1),
	CodeReponseManuel int NULL,
	CodeQuestion bigint NOT NULL,
	LibelleReponse nvarchar(MAX) NOT NULL,
	Iscorrect bit NOT NULL,
	ScoreTotal decimal(18, 2) NULL,
	estEnfant bit NULL,
	avoirEnfant bit NULL,
	CodeParent nvarchar(70) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Tbl_Reponses SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_Tbl_Reponses ADD CONSTRAINT
	DF_Tbl_Reponses_estEnfant DEFAULT ((0)) FOR estEnfant
GO
SET IDENTITY_INSERT dbo.Tmp_Tbl_Reponses ON
GO
IF EXISTS(SELECT * FROM dbo.Tbl_Reponses)
	 EXEC('INSERT INTO dbo.Tmp_Tbl_Reponses (CodeReponse, CodeQuestion, LibelleReponse, Iscorrect, ScoreTotal, estEnfant, avoirEnfant, CodeParent)
		SELECT CodeReponse, CodeQuestion, LibelleReponse, Iscorrect, ScoreTotal, estEnfant, avoirEnfant, CodeParent FROM dbo.Tbl_Reponses WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Tbl_Reponses OFF
GO
ALTER TABLE dbo.Tbl_ReponseEntree
	DROP CONSTRAINT FK_Tbl_ReponseEntree_Tbl_Reponses
GO
DROP TABLE dbo.Tbl_Reponses
GO
EXECUTE sp_rename N'dbo.Tmp_Tbl_Reponses', N'Tbl_Reponses', 'OBJECT' 
GO
ALTER TABLE dbo.Tbl_Reponses ADD CONSTRAINT
	PK_Tbl_Reponses PRIMARY KEY CLUSTERED 
	(
	CodeReponse
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Tbl_Reponses ADD CONSTRAINT
	FK_Tbl_Reponses_Tbl_Questions FOREIGN KEY
	(
	CodeQuestion
	) REFERENCES dbo.Tbl_Questions
	(
	CodeQuestion
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Tbl_ReponseEntree ADD CONSTRAINT
	FK_Tbl_ReponseEntree_Tbl_Reponses FOREIGN KEY
	(
	CodeReponse
	) REFERENCES dbo.Tbl_Reponses
	(
	CodeReponse
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Tbl_ReponseEntree SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
