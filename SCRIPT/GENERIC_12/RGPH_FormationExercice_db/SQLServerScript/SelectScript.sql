

GO 

/******  Object:  StoredProcedure [dbo].[SP_Select_FormulaireExercices_ByID]    Script Date: 08/03/2018 18:39:09 ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Select_FormulaireExercices_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_FormulaireExercices
	WHERE CodeExercise = @ID




GO 

/******  Object:  StoredProcedure [dbo].[SP_Select_JustificationReponses_ByID]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Select_JustificationReponses_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_JustificationReponses
	WHERE CodeJustificationReponse = @ID




GO 

/******  Object:  StoredProcedure [dbo].[SP_Select_QuestionFormulaireExercice_ByID]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Select_QuestionFormulaireExercice_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_QuestionFormulaireExercice
	WHERE ID = @ID




GO 

/******  Object:  StoredProcedure [dbo].[SP_Select_Questions_ByID]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Select_Questions_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_Questions
	WHERE CodeQuestion = @ID




GO 

/******  Object:  StoredProcedure [dbo].[SP_Select_Reponses_ByID]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Select_Reponses_ByID] 

	(
		@ID bigint
	)
AS

	SELECT *
	FROM Tbl_Reponses
	WHERE CodeReponse = @ID




