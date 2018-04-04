

GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Update_FormulaireExercices]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Update_FormulaireExercices] 
(
	@CodeExercise bigint
	,@LibelleExercice nvarchar(MAX)
	,@Descriptions nvarchar(MAX)
	,@Instructions nvarchar(MAX)
	,@RappelExercice nvarchar(MAX)
	,@TypeEvaluation int
	,@Statut int
	,@DureeEnSeconde int
	
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	UPDATE Tbl_FormulaireExercices
	SET

		[LibelleExercice] = @LibelleExercice
		,[Descriptions] = @Descriptions
		,[Instructions] = @Instructions
		,[RappelExercice] = @RappelExercice
		,[TypeEvaluation] = @TypeEvaluation
		,[Statut] = @Statut
		,[DureeEnSeconde] = @DureeEnSeconde
		
		
	WHERE CodeExercise = @CodeExercise

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Update_JustificationReponses]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Update_JustificationReponses] 
(
	@CodeJustificationReponse bigint
	,@CodeQuestion bigint
	,@LibelleJustification nvarchar(MAX)
	,@Iscorrect bit
	
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	UPDATE Tbl_JustificationReponses
	SET

		[CodeQuestion] = @CodeQuestion
		,[LibelleJustification] = @LibelleJustification
		,[Iscorrect] = @Iscorrect
		
		
	WHERE CodeJustificationReponse = @CodeJustificationReponse

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Update_QuestionFormulaireExercice]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Update_QuestionFormulaireExercice] 
(
	@ID bigint
	,@CodeFormulaireExercice bigint
	,@CodeQuestion bigint
	,@OrdreQuestion int
	,@EstDebutQuestion bit
	
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	UPDATE Tbl_QuestionFormulaireExercice
	SET

		[CodeFormulaireExercice] = @CodeFormulaireExercice
		,[CodeQuestion] = @CodeQuestion
		,[OrdreQuestion] = @OrdreQuestion
		,[EstDebutQuestion] = @EstDebutQuestion
		
		
	WHERE ID = @ID

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Update_Questions]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Update_Questions] 
(
	@CodeQuestion bigint
	,@LibelleQuestion nvarchar(MAX)
	,@DetailsQuestion nvarchar(MAX)
	,@IndicationsQuestion nvarchar(MAX)
	,@AvoirJustificationYN bit
	,@TypeQuestion int
	,@ScoreTotal decimal(18,2)
	,@Commentaire nvarchar(MAX)
	,@CaractereAccepte int
	,@NbreValeurMinimal int
	,@NbreCaractereMaximal int
	,@qPrecedent nvarchar(200)
	,@qSuivant nvarchar(200)
	
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	UPDATE Tbl_Questions
	SET

		[LibelleQuestion] = @LibelleQuestion
		,[DetailsQuestion] = @DetailsQuestion
		,[IndicationsQuestion] = @IndicationsQuestion
		,[AvoirJustificationYN] = @AvoirJustificationYN
		,[TypeQuestion] = @TypeQuestion
		,[ScoreTotal] = @ScoreTotal
		,[Commentaire] = @Commentaire
		,[CaractereAccepte] = @CaractereAccepte
		,[NbreValeurMinimal] = @NbreValeurMinimal
		,[NbreCaractereMaximal] = @NbreCaractereMaximal
		,[qPrecedent] = @qPrecedent
		,[qSuivant] = @qSuivant
		
		
	WHERE CodeQuestion = @CodeQuestion

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE [dbo].[SP_Update_Reponses]    Script Date: 4/4/2018 12:22:02 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Update_Reponses] 
(
	@CodeReponse bigint
	,@CodeQuestion bigint
	,@LibelleReponse nvarchar(MAX)
	,@Iscorrect bit
	,@estEnfant bit
	,@avoirEnfant bit
	,@CodeParent nvarchar(140)
	
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	UPDATE Tbl_Reponses
	SET

		[CodeQuestion] = @CodeQuestion
		,[LibelleReponse] = @LibelleReponse
		,[Iscorrect] = @Iscorrect
		,[estEnfant] = @estEnfant
		,[avoirEnfant] = @avoirEnfant
		,[CodeParent] = @CodeParent
		
		
	WHERE CodeReponse = @CodeReponse

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

