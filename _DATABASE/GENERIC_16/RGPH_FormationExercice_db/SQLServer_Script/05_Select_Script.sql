

GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Select_FormulaireExercices_ByID]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Select_FormulaireExercices_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_FormulaireExercices
	WHERE CodeExercise = @ID




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Select_JustificationReponses_ByID]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Select_JustificationReponses_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_JustificationReponses
	WHERE CodeJustificationReponse = @ID




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Select_QuestionFormulaireExercice_ByID]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Select_QuestionFormulaireExercice_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_QuestionFormulaireExercice
	WHERE ID = @ID




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Select_Questions_ByID]    Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Select_Questions_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_Questions
	WHERE CodeQuestion = @ID




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Select_Reponses_ByID]    Script Date: 4/4/2018 12:22:02 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Select_Reponses_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_Reponses
	WHERE CodeReponse = @ID




