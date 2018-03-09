
GO 

/******  Object:  StoredProcedure [dbo].[SP_ListAll_JustificationReponses_CodeQuestion]   Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_ListAll_JustificationReponses_CodeQuestion] 
	(
		@CodeQuestion bigint
	)

AS

	SELECT *
	FROM Tbl_JustificationReponses
	WHERE CodeQuestion = @CodeQuestion




GO 

/******  Object:  StoredProcedure [dbo].[SP_ListAll_QuestionFormulaireExercice_CodeFormulaireExercice]   Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_ListAll_QuestionFormulaireExercice_CodeFormulaireExercice] 
	(
		@CodeFormulaireExercice bigint
	)

AS

	SELECT *
	FROM Tbl_QuestionFormulaireExercice
	WHERE CodeFormulaireExercice = @CodeFormulaireExercice




GO 

/******  Object:  StoredProcedure [dbo].[SP_ListAll_QuestionFormulaireExercice_CodeQuestion]   Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_ListAll_QuestionFormulaireExercice_CodeQuestion] 
	(
		@CodeQuestion bigint
	)

AS

	SELECT *
	FROM Tbl_QuestionFormulaireExercice
	WHERE CodeQuestion = @CodeQuestion




GO 

/******  Object:  StoredProcedure [dbo].[SP_ListAll_Reponses_CodeQuestion]   Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_ListAll_Reponses_CodeQuestion] 
	(
		@CodeQuestion bigint
	)

AS

	SELECT *
	FROM Tbl_Reponses
	WHERE CodeQuestion = @CodeQuestion




