REM Generate By [GENERIC 12] Application *******REM  Class Cls_QuestionFormulaireExerciceREM Date:08-Mar-2018 06:39 PM
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer

Public Class Cls_QuestionFormulaireExerciceImplements IGeneral

#Region "Attribut"
Private _id As Long

Private _CodeFormulaireExercice As Long
Private __CodeFormulaireExercice As Cls_CodeFormulaireExercice
Private _CodeQuestion As Long
Private __CodeQuestion As Cls_CodeQuestion
Private _isdirty As Boolean
Private _LogData As String

#End Region

#Region "New"
Public Sub New()
BlankProperties()
End Sub

Public Sub New(ByVal _idOne As Long)
Read(_idOne)
End Sub
#End Region

#Region "Properties"
<AttributLogData(True,1)> _
Public ReadOnly Property ID() As Long Implements IGeneral.ID
Get
Return _id
End Get
End Property

<AttributLogData(True, 2)> _
Public Property  CodeFormulaireExercice As Long
Get Return _CodeFormulaireExerciceEnd Get
Set(ByVal Value As Long) If _CodeFormulaireExercice <> Value Then_isdirty = True _CodeFormulaireExercice = ValueEnd IfEnd SetEnd Property

Public Property _CodeFormulaireExerciceOBJ As Cls_CodeFormulaireExercice
Get
If Not (__CodeFormulaireExercice Is Nothing) ThenIf (__CodeFormulaireExercice.ID = 0) Or (__CodeFormulaireExercice.ID <>  _CodeFormulaireExercice) Then__CodeFormulaireExercice= New Cls_CodeFormulaireExercice(_CodeFormulaireExercice)End IfElse__CodeFormulaireExercice= New Cls_CodeFormulaireExercice(_CodeFormulaireExercice)End IfReturn __CodeFormulaireExerciceEnd GetSet(ByVal value As Cls_CodeFormulaireExercice)If Value Is Nothing Then_isdirty = True_CodeFormulaireExercice = 0ElseIf __CodeFormulaireExercice.ID <> Value.ID Then_isdirty = True_CodeFormulaireExercice = Value.IDEnd IfEnd IfEnd SetEnd Property

Public ReadOnly Property _CodeFormulaireExerciceSTR As String
Get
Return _CodeFormulaireExerciceOBJ._CodeFormulaireExercice
End Get
End Property

<AttributLogData(True, 3)> _
Public Property  CodeQuestion As Long
Get Return _CodeQuestionEnd Get
Set(ByVal Value As Long) If _CodeQuestion <> Value Then_isdirty = True _CodeQuestion = ValueEnd IfEnd SetEnd Property

Public Property _CodeQuestionOBJ As Cls_CodeQuestion
Get
If Not (__CodeQuestion Is Nothing) ThenIf (__CodeQuestion.ID = 0) Or (__CodeQuestion.ID <>  _CodeQuestion) Then__CodeQuestion= New Cls_CodeQuestion(_CodeQuestion)End IfElse__CodeQuestion= New Cls_CodeQuestion(_CodeQuestion)End IfReturn __CodeQuestionEnd GetSet(ByVal value As Cls_CodeQuestion)If Value Is Nothing Then_isdirty = True_CodeQuestion = 0ElseIf __CodeQuestion.ID <> Value.ID Then_isdirty = True_CodeQuestion = Value.IDEnd IfEnd IfEnd SetEnd Property

Public ReadOnly Property _CodeQuestionSTR As String
Get
Return _CodeQuestionOBJ._CodeQuestion
End Get
End Property

ReadOnly Property IsDataDirty() As Boolean
Get
Return _isdirty
End Get
End Property

#End Region

#Region " Db Access "
Public Function Insert(ByVal usr As String) As Integer Implements IGeneral.Insert
_LogData = LogData(Me)
_id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_QuestionFormulaireExercice", _CodeFormulaireExercice, _CodeQuestion, usr))
Return _id
End Function

Public Function Update(ByVal usr As String) As Integer Implements IGeneral.Update
_LogData = GetObjectString()
Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_QuestionFormulaireExercice", _id, _CodeFormulaireExercice, _CodeQuestion, usr)
End Function
Private Sub SetProperties(ByVal dr As DataRow)
_id = TypeSafeConversion.NullSafeLong(dr("ID"))
_CodeFormulaireExercice = TypeSafeConversion.NullSafeLong(dr("CodeFormulaireExercice"))
_CodeQuestion = TypeSafeConversion.NullSafeLong(dr("CodeQuestion"))
End Sub
Private Sub BlankProperties()
_id = 0
_CodeFormulaireExercice = 0
__CodeFormulaireExercice = Nothing
_CodeQuestion = 0
__CodeQuestion = Nothing
_isdirty = False
End Sub
Public Function Read(ByVal _idpass As Long) As Boolean Implements IGeneral.Read
Try 
If _idpass <> 0 Then Dim ds As DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(),"SP_Select_QuestionFormulaireExercice_ByID", _idpass)If ds.Tables(0).Rows.Count < 1 ThenBlankProperties()Return FalseEnd IfSetProperties(ds.tables(0).rows(0))ElseBlankProperties()End IfReturn True
Catch ex As Exception
Throw ex
End Try
End Function

Public Sub Delete() Implements IGeneral.DeleteTrySqlHelper.ExecuteNonQuery(SqlHelperParameterCache.BuildConfigDB(), "SP_Delete_QuestionFormulaireExercice", _id)Catch ex As ExceptionThrow exEnd TryEnd Sub
Public Function Refresh() As Boolean Implements IGeneral.RefreshIf _id = 0 ThenReturn FalseElseRead(_id)Return TrueEnd IfEnd Function
Public Function Save(ByVal usr As String) As Integer Implements IGeneral.Save
    Dim val As Integer = 0
    If _isdirty Then
        Validation()
        If _id = 0 Then
            val = Insert(usr)
        Else
            If _id > 0 Then
                val = Update(usr)
            Else
                val = _id = 0
                Return False
            End If
        End If
    End If
    _isdirty = False
     Return val
End Function

#End Region

#Region " Search "
Public Function Search() As System.Collections.ICollection Implements IGeneral.SearchReturn SearchAll()End Function
Public Shared Function SearchAll() As List(Of Cls_QuestionFormulaireExercice)Try Dim objs As New List(Of Cls_QuestionFormulaireExercice)Dim r As Data.DataRowDim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_QuestionFormulaireExercice")For Each r In ds.Tables(0).RowsDim obj As New Cls_QuestionFormulaireExerciceobj.SetProperties(r)objs.Add(obj)Next rReturn objs
Catch ex As Exception
Throw ex
End Try
End Function


Public Shared Function SearchAllBy_CodeFormulaireExercice(Byval _codeformulaireexercice As Long) As List(Of Cls_QuestionFormulaireExercice)Try Dim objs As New List(Of Cls_QuestionFormulaireExercice)Dim r As Data.DataRowDim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_QuestionFormulaireExercice_CodeFormulaireExercice",_codeformulaireexercice)For Each r In ds.Tables(0).RowsDim obj As New Cls_QuestionFormulaireExerciceobj.SetProperties(r)objs.Add(obj)Next rReturn objs
Catch ex As Exception
Throw ex
End Try
End Function

Public Shared Function SearchAllBy_CodeQuestion(Byval _codequestion As Long) As List(Of Cls_QuestionFormulaireExercice)Try Dim objs As New List(Of Cls_QuestionFormulaireExercice)Dim r As Data.DataRowDim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_QuestionFormulaireExercice_CodeQuestion",_codequestion)For Each r In ds.Tables(0).RowsDim obj As New Cls_QuestionFormulaireExerciceobj.SetProperties(r)objs.Add(obj)Next rReturn objs
Catch ex As Exception
Throw ex
End Try
End Function

#End Region

#Region " Other Methods "
Private Sub Validation() 
If _CodeFormulaireExercice = 0 Then Throw (New Rezo509Exception("  Code Formulaire Exercice Obligatoire"))End If

If _CodeQuestion = 0 Then Throw (New Rezo509Exception("  Code Question Obligatoire"))End If


End Sub
Public Function Encode(ByVal str As Byte()) As String
Return Convert.ToBase64String(str)
End Function

Public Function Decode(ByVal str As String) As Byte()
Dim decbuff As Byte() = Convert.FromBase64String(str)
Return decbuff
End Function

 Public Function GetObjectString() As String Implements IGeneral.GetObjectStringReturn LogData(New Cls_QuestionFormulaireExercice(Me.ID))End Function
Function LogData(obj As Cls_QuestionFormulaireExercice) As String
Return LogStringBuilder.BuildLogStringHTML(obj)
End Function

Function LogData() As String
Return LogStringBuilder.BuildLogStringHTML(Me)
End Function
#End Region

End Class

