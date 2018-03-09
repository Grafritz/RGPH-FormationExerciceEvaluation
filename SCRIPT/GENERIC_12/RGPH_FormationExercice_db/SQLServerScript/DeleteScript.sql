

GO 

/******  Object:  StoredProcedure [dbo].[SP_Delete_FormulaireExercices]     Script Date: 08/03/2018 18:39:09 ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Delete_FormulaireExercices] 
	(
		@ID bigint
	)
AS

	DELETE FROM Tbl_FormulaireExercices
	WHERE CodeExercise = @ID




GO 

/******  Object:  StoredProcedure [dbo].[SP_Delete_JustificationReponses]     Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Delete_JustificationReponses] 
	(
		@ID bigint
	)
AS

	DELETE FROM Tbl_JustificationReponses
	WHERE CodeJustificationReponse = @ID




GO 

/******  Object:  StoredProcedure [dbo].[SP_Delete_QuestionFormulaireExercice]     Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Delete_QuestionFormulaireExercice] 
	(
		@ID bigint
	)
AS

	DELETE FROM Tbl_QuestionFormulaireExercice
	WHERE ID = @ID




GO 

/******  Object:  StoredProcedure [dbo].[SP_Delete_Questions]     Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Delete_Questions] 
	(
		@ID bigint
	)
AS

	DELETE FROM Tbl_Questions
	WHERE CodeQuestion = @ID




GO 

/******  Object:  StoredProcedure [dbo].[SP_Delete_Reponses]     Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_Delete_Reponses] 
	(
		@ID bigint
	)
AS

	DELETE FROM Tbl_Reponses
	WHERE CodeReponse = @ID




