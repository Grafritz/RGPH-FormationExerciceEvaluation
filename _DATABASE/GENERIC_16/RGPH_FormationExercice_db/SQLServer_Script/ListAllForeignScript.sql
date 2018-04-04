
GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredProcedure [dbo].[SP_ListAll_JustificationReponses_CodeQuestion]   Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

 PROCEDURE [dbo].[SP_ListAll_JustificationReponses_CodeQuestion] 
	(
		@CodeQuestion bigint
	)

AS

	SELECT *
	FROM Tbl_JustificationReponses
	WHERE CodeQuestion = @CodeQuestion




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredProcedure [dbo].[SP_ListAll_QuestionFormulaireExercice_CodeFormulaireExercice]   Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

 PROCEDURE [dbo].[SP_ListAll_QuestionFormulaireExercice_CodeFormulaireExercice] 
	(
		@CodeFormulaireExercice bigint
	)

AS

	SELECT *
	FROM Tbl_QuestionFormulaireExercice
	WHERE CodeFormulaireExercice = @CodeFormulaireExercice




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredProcedure [dbo].[SP_ListAll_QuestionFormulaireExercice_CodeQuestion]   Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

 PROCEDURE [dbo].[SP_ListAll_QuestionFormulaireExercice_CodeQuestion] 
	(
		@CodeQuestion bigint
	)

AS

	SELECT *
	FROM Tbl_QuestionFormulaireExercice
	WHERE CodeQuestion = @CodeQuestion




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredProcedure [dbo].[SP_ListAll_Reponses_CodeQuestion]   Script Date: 4/4/2018 12:22:02 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

 PROCEDURE [dbo].[SP_ListAll_Reponses_CodeQuestion] 
	(
		@CodeQuestion bigint
	)

AS

	SELECT *
	FROM Tbl_Reponses
	WHERE CodeQuestion = @CodeQuestion




