

GO 

/******  Object:  StoredProcedure [dbo].[SP_ListAll_FormulaireExercices]    Script Date: 08/03/2018 18:39:09 ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_ListAll_FormulaireExercices] 

AS

	SELECT *
	FROM Tbl_FormulaireExercices

GO 

/******  Object:  StoredProcedure [dbo].[SP_ListAll_JustificationReponses]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_ListAll_JustificationReponses] 

AS

	SELECT *
	FROM Tbl_JustificationReponses

GO 

/******  Object:  StoredProcedure [dbo].[SP_ListAll_QuestionFormulaireExercice]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_ListAll_QuestionFormulaireExercice] 

AS

	SELECT *
	FROM Tbl_QuestionFormulaireExercice

GO 

/******  Object:  StoredProcedure [dbo].[SP_ListAll_Questions]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_ListAll_Questions] 

AS

	SELECT *
	FROM Tbl_Questions

GO 

/******  Object:  StoredProcedure [dbo].[SP_ListAll_Reponses]    Script Date: 3/8/2018 6:39:10 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE [dbo].[SP_ListAll_Reponses] 

AS

	SELECT *
	FROM Tbl_Reponses

