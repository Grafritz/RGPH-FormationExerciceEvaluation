
GO 

/******    REM Generate By [GENERIC 12] Application    ******/
/******  Object:  StoredProcedure [dbo].[SP_Insert_FormulaireExercices]    Script Date: 08/03/2018 18:39:09 ******/
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
		,[DateCreated]
	)
	VALUES
	(
		@LibelleExercice
		,@Descriptions
		,@Instructions
		,@RappelExercice
		,@TypeEvaluation
		,@Statut
		,GETDATE()
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

/******    REM Generate By [GENERIC 12] Application    ******/
/******  Object:  StoredProcedure [dbo].[SP_Insert_JustificationReponses]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Insert_JustificationReponses] 
(
	@CodeQuestion bigint
	,@LibelleJustification nvarchar(MAX)
)
AS
	DECLARE @Error int
	DECLARE @ID bigint

	BEGIN TRANSACTION 
	INSERT INTO Tbl_JustificationReponses
	(
		[CodeQuestion]
		,[LibelleJustification]
		,[DateCreated]
	)
	VALUES
	(
		@CodeQuestion
		,@LibelleJustification
		,GETDATE()
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

/******    REM Generate By [GENERIC 12] Application    ******/
/******  Object:  StoredProcedure [dbo].[SP_Insert_QuestionFormulaireExercice]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Insert_QuestionFormulaireExercice] 
(
	@CodeFormulaireExercice bigint
	,@CodeQuestion bigint
	,@OrdreQuestion int
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
		,[DateCreated]
	)
	VALUES
	(
		@CodeFormulaireExercice
		,@CodeQuestion
		,@OrdreQuestion
		,GETDATE()
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

/******    REM Generate By [GENERIC 12] Application    ******/
/******  Object:  StoredProcedure [dbo].[SP_Insert_Questions]    Script Date: 3/8/2018 6:39:10 PM ******/
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
		,[DateCreated]
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
		,GETDATE()
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

/******    REM Generate By [GENERIC 12] Application    ******/
/******  Object:  StoredProcedure [dbo].[SP_Insert_Reponses]    Script Date: 3/8/2018 6:39:10 PM ******/
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
		,[DateCreated]
	)
	VALUES
	(
		@CodeQuestion
		,@LibelleReponse
		,@Iscorrect
		,@estEnfant
		,@avoirEnfant
		,GETDATE()
	)
	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	SET @ID = @@Identity 

	COMMIT TRANSACTION

	SELECT @ID

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error


