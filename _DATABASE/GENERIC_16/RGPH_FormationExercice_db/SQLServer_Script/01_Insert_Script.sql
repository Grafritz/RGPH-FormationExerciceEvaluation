
GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Insert_FormulaireExercices]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Insert_FormulaireExercices] 
(
	@LibelleExercice nvarchar(MAX)
	,@Descriptions nvarchar(MAX)
	,@Instructions nvarchar(MAX)
	,@RappelExercice nvarchar(MAX)
	,@TypeEvaluation int
	,@Statut int
	,@DureeEnSeconde int
)
AS
	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 
	INSERT INTO Tbl_FormulaireExercices
	(
		[LibelleExercice]
		,[Descriptions]
		,[Instructions]
		,[RappelExercice]
		,[TypeEvaluation]
		,[Statut]
		,[DureeEnSeconde]
		
	)
	VALUES
	(
		@LibelleExercice
		,@Descriptions
		,@Instructions
		,@RappelExercice
		,@TypeEvaluation
		,@Statut
		,@DureeEnSeconde
		
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

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Insert_JustificationReponses]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Insert_JustificationReponses] 
(
	@CodeQuestion bigint
	,@LibelleJustification nvarchar(MAX)
	,@Iscorrect bit
)
AS
	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 
	INSERT INTO Tbl_JustificationReponses
	(
		[CodeQuestion]
		,[LibelleJustification]
		,[Iscorrect]
		
	)
	VALUES
	(
		@CodeQuestion
		,@LibelleJustification
		,@Iscorrect
		
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

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Insert_QuestionFormulaireExercice]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Insert_QuestionFormulaireExercice] 
(
	@CodeFormulaireExercice bigint
	,@CodeQuestion bigint
	,@OrdreQuestion int
	,@EstDebutQuestion bit
)
AS
	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 
	INSERT INTO Tbl_QuestionFormulaireExercice
	(
		[CodeFormulaireExercice]
		,[CodeQuestion]
		,[OrdreQuestion]
		,[EstDebutQuestion]
		
	)
	VALUES
	(
		@CodeFormulaireExercice
		,@CodeQuestion
		,@OrdreQuestion
		,@EstDebutQuestion
		
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

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Insert_Questions]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Insert_Questions] 
(
	@LibelleQuestion nvarchar(MAX)
	,@DetailsQuestion nvarchar(MAX)
	,@IndicationsQuestion nvarchar(MAX)
	,@AvoirJustificationYN bit
	,@TypeQuestion int
	,@ScoreTotal decimal(18,2)
	,@Commentaire nvarchar(MAX)
	,@CaractereAccepte int
	,@NbreValeurMinimal int
	,@NbreCaractereMaximal int
	,@qPrecedent nvarchar(100)
	,@qSuivant nvarchar(100)
)
AS
	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 
	INSERT INTO Tbl_Questions
	(
		[LibelleQuestion]
		,[DetailsQuestion]
		,[IndicationsQuestion]
		,[AvoirJustificationYN]
		,[TypeQuestion]
		,[ScoreTotal]
		,[Commentaire]
		,[CaractereAccepte]
		,[NbreValeurMinimal]
		,[NbreCaractereMaximal]
		,[qPrecedent]
		,[qSuivant]
		
	)
	VALUES
	(
		@LibelleQuestion
		,@DetailsQuestion
		,@IndicationsQuestion
		,@AvoirJustificationYN
		,@TypeQuestion
		,@ScoreTotal
		,@Commentaire
		,@CaractereAccepte
		,@NbreValeurMinimal
		,@NbreCaractereMaximal
		,@qPrecedent
		,@qSuivant
		
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

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Insert_Reponses]    Script Date: 4/4/2018 12:22:02 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Insert_Reponses] 
(
	@CodeQuestion bigint
	,@LibelleReponse nvarchar(MAX)
	,@Iscorrect bit
	,@estEnfant bit
	,@avoirEnfant bit
	,@CodeParent nvarchar(70)
)
AS
	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 
	INSERT INTO Tbl_Reponses
	(
		[CodeQuestion]
		,[LibelleReponse]
		,[Iscorrect]
		,[estEnfant]
		,[avoirEnfant]
		,[CodeParent]
		
	)
	VALUES
	(
		@CodeQuestion
		,@LibelleReponse
		,@Iscorrect
		,@estEnfant
		,@avoirEnfant
		,@CodeParent
		
	)
	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity 

	COMMIT TRANSACTION

	SELECT @ID

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error


