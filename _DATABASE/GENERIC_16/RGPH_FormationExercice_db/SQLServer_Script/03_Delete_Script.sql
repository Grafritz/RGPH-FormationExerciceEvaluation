﻿

GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Delete_FormulaireExercices]     Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Delete_FormulaireExercices] 
(
	@ID bigint
)
AS

	WHERE CodeExercise = @ID




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Delete_JustificationReponses]     Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Delete_JustificationReponses] 
(
	@ID bigint
)
AS

	WHERE CodeJustificationReponse = @ID




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Delete_QuestionFormulaireExercice]     Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Delete_QuestionFormulaireExercice] 
(
	@ID bigint
)
AS

	WHERE ID = @ID




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Delete_Questions]     Script Date: 4/4/2018 12:22:01 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Delete_Questions] 
(
	@ID bigint
)
AS

	WHERE CodeQuestion = @ID




GO 

/******    REM Generate By [ GENERIC V16 ] Application    ******/
/******  Object:  StoredCREATE PROCEDURE  [dbo].[SP_Delete_Reponses]     Script Date: 4/4/2018 12:22:02 PM ******/
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO 

CREATE PROCEDURE  [dbo].[SP_Delete_Reponses] 
(
	@ID bigint
)
AS

	WHERE CodeReponse = @ID



