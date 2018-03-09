

GO 

/******  Object:  StoredProcedure [dbo].[SP_Update_FormulaireExercices]    Script Date: 08/03/2018 18:39:09 ******/
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
	,@Modifby nvarchar(200)
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
		,[Modifby]  = @Modifby
		,[DateModif] = GETDATE()


	WHERE CodeExercise = @CodeExercise

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

GO 

/******  Object:  StoredProcedure [dbo].[SP_Update_JustificationReponses]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Update_JustificationReponses] 
(
	@CodeJustificationReponse bigint
	,@CodeQuestion bigint
	,@Modifby nvarchar(200)
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	UPDATE Tbl_JustificationReponses
	SET

		[CodeQuestion] = @CodeQuestion
		,[Modifby]  = @Modifby
		,[DateModif] = GETDATE()


	WHERE CodeJustificationReponse = @CodeJustificationReponse

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

GO 

/******  Object:  StoredProcedure [dbo].[SP_Update_QuestionFormulaireExercice]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Update_QuestionFormulaireExercice] 
(
	@ID bigint
	,@CodeFormulaireExercice bigint
	,@CodeQuestion bigint
	,@Modifby nvarchar(200)
)
AS

	DECLARE @Error int

	BEGIN TRANSACTION 

	UPDATE Tbl_QuestionFormulaireExercice
	SET

		[CodeFormulaireExercice] = @CodeFormulaireExercice
		,[CodeQuestion] = @CodeQuestion
		,[Modifby]  = @Modifby
		,[DateModif] = GETDATE()


	WHERE ID = @ID

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

GO 

/******  Object:  StoredProcedure [dbo].[SP_Update_Questions]    Script Date: 3/8/2018 6:39:10 PM ******/
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
	,@Modifby nvarchar(200)
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
		,[Modifby]  = @Modifby
		,[DateModif] = GETDATE()


	WHERE CodeQuestion = @CodeQuestion

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

GO 

/******  Object:  StoredProcedure [dbo].[SP_Update_Reponses]    Script Date: 3/8/2018 6:39:10 PM ******/
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
	,@Modifby nvarchar(200)
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
		,[Modifby]  = @Modifby
		,[DateModif] = GETDATE()


	WHERE CodeReponse = @CodeReponse

	SET @Error = @@ERROR
	IF @Error != 0 GOTO ERROR_HANDLER

	COMMIT TRANSACTION

	RETURN(0)

ERROR_HANDLER:
	IF @@TRANCOUNT != 0 ROLLBACK TRANSACTION
	RETURN @Error

