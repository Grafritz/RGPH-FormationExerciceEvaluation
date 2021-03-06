USE [RGPH_FormationExercice_db]
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Reponses]    Script Date: 04/25/2018 11:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_Update_Reponses] 
(
	@CodeReponse bigint
	,@CodeQuestion bigint
	,@LibelleReponse nvarchar(MAX)
	,@Iscorrect bit
	,@ScoreTotal decimal(18,2)
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
		,[ScoreTotal] = @ScoreTotal
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
------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Reponses]    Script Date: 04/25/2018 11:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_Insert_Reponses] 
(
	@CodeQuestion bigint
	,@LibelleReponse nvarchar(MAX)
	,@Iscorrect bit
	,@ScoreTotal decimal(18,2)
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
		,[ScoreTotal]
		,[estEnfant]
		,[avoirEnfant]
		,[CodeParent]
		
	)
	VALUES
	(
		@CodeQuestion
		,@LibelleReponse
		,@Iscorrect
		,@ScoreTotal
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

