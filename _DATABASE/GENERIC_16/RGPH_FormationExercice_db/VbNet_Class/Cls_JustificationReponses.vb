REM Generate By [GENERIC V16] Application *******
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer

Public Class Cls_JustificationReponses

#Region "Attribut"
Private _id As Long

Private _CodeQuestion As Long
Private _CodeQuestion As Cls_CodeQuestion
Private _LibelleJustification As String
Private _Iscorrect As Boolean
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
Public Property  CodeQuestion As Long
Get
Set(ByVal Value As Long)

Public Property CodeQuestionOBJ As Cls_CodeQuestion
Get
If Not (_CodeQuestion Is Nothing) Then

Public ReadOnly Property CodeQuestionSTR As String
Get
Return CodeQuestionOBJ.CodeQuestion
End Get
End Property

<AttributLogData(True, 3)> _
Public Property  LibelleJustification As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 4)> _
Public Property  Iscorrect As Boolean
Get
Set(ByVal Value As Boolean)

<AttributLogData(True, 5)> _
Public Property  isdirty As Boolean
Get
Set(ByVal Value As Boolean)

<AttributLogData(True, 6)> _
Public Property  LogData As String
Get
Set(ByVal Value As String)

ReadOnly Property IsDataDirty() As Boolean
Get
Return _isdirty
End Get
End Property

#End Region

#Region " Db Access "
Public Function Insert(ByVal usr As String) As Integer Implements IGeneral.Insert
_LogData = LogData(Me)
_id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_JustificationReponses", _CodeQuestion, _LibelleJustification, _Iscorrect, usr))
Return _id
End Function

Public Function Update(ByVal usr As String) As Integer Implements IGeneral.Update
_LogData = GetObjectString()
Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_JustificationReponses", _id, _CodeQuestion, _LibelleJustification, _Iscorrect, usr)
End Function
Private Sub SetProperties(ByVal dr As DataRow)
_id = TypeSafeConversion.NullSafeLong(dr("CodeJustificationReponse"))
_CodeQuestion = TypeSafeConversion.NullSafeLong(dr("CodeQuestion"))
_LibelleJustification = TypeSafeConversion.NullSafeString(dr("LibelleJustification"))
_Iscorrect = TypeSafeConversion.NullSafeBoolean(dr("Iscorrect"))
End Sub
Private Sub BlankProperties()
_id = 0
_CodeQuestion = 0
__CodeQuestion = Nothing
_LibelleJustification = ""
_Iscorrect = False
_isdirty = False
End Sub
Public Function Read(ByVal _idpass As Long) As Boolean Implements IGeneral.Read
Try 
If _idpass <> 0 Then 
Catch ex As Exception
Throw ex
End Try
End Function

Public Sub Delete() Implements IGeneral.Delete
Public Function Refresh() As Boolean Implements IGeneral.Refresh
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
Public Function Search() As System.Collections.ICollection Implements IGeneral.Search
Public Shared Function SearchAll() As List(Of Cls_JustificationReponses)
Catch ex As Exception
Throw ex
End Try
End Function


Public Shared Function SearchAllBy_CodeQuestion(Byval _codequestion As Long) As List(Of Cls_JustificationReponses)
Catch ex As Exception
Throw ex
End Try
End Function

#End Region

#Region " Other Methods "
Private Sub Validation() 
If _CodeQuestion = 0 Then 

If _LibelleJustification = "" Then 

'If Len(_LibelleJustification) > -1 Then


End Sub
Public Function Encode(ByVal str As Byte()) As String
Return Convert.ToBase64String(str)
End Function

Public Function Decode(ByVal str As String) As Byte()
Dim decbuff As Byte() = Convert.FromBase64String(str)
Return decbuff
End Function

 Public Function GetObjectString() As String Implements IGeneral.GetObjectString
Function LogData(obj As Cls_JustificationReponses) As String
Return LogStringBuilder.BuildLogStringHTML(obj)
End Function

Function LogData() As String
Return LogStringBuilder.BuildLogStringHTML(Me)
End Function
#End Region

End Class
