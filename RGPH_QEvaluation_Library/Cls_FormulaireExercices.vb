REM Generate By [GENERIC 12] Application *******
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer

Public Class Cls_FormulaireExercices

#Region "Attribut"
Private _id As Long

Private _LibelleExercice As String
Private _Descriptions As String
Private _Instructions As String
Private _RappelExercice As String
Private _TypeEvaluation As Integer
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
Public Property  LibelleExercice As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 3)> _
Public Property  Descriptions As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 4)> _
Public Property  Instructions As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 5)> _
Public Property  RappelExercice As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 6)> _
Public Property  TypeEvaluation As Integer
Get
Set(ByVal Value As Integer)

ReadOnly Property IsDataDirty() As Boolean
Get
Return _isdirty
End Get
End Property

#End Region

#Region " Db Access "
Public Function Insert(ByVal usr As String) As Integer Implements IGeneral.Insert
_LogData = LogData(Me)
_id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_FormulaireExercices", _LibelleExercice, _Descriptions, _Instructions, _RappelExercice, _TypeEvaluation, usr))
Return _id
End Function

Public Function Update(ByVal usr As String) As Integer Implements IGeneral.Update
_LogData = GetObjectString()
Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_FormulaireExercices", _id, _LibelleExercice, _Descriptions, _Instructions, _RappelExercice, _TypeEvaluation, usr)
End Function
Private Sub SetProperties(ByVal dr As DataRow)
_id = TypeSafeConversion.NullSafeLong(dr("CodeExercise"))
_LibelleExercice = TypeSafeConversion.NullSafeString(dr("LibelleExercice"))
_Descriptions = TypeSafeConversion.NullSafeString(dr("Descriptions"))
_Instructions = TypeSafeConversion.NullSafeString(dr("Instructions"))
_RappelExercice = TypeSafeConversion.NullSafeString(dr("RappelExercice"))
_TypeEvaluation = TypeSafeConversion.NullSafeInteger(dr("TypeEvaluation"))
End Sub
Private Sub BlankProperties()
_id = 0
_LibelleExercice = ""
_Descriptions = ""
_Instructions = ""
_RappelExercice = ""
_TypeEvaluation = 0
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
Public Shared Function SearchAll() As List(Of Cls_FormulaireExercices)
Catch ex As Exception
Throw ex
End Try
End Function


#End Region

#Region " Other Methods "
Private Sub Validation() 
If _LibelleExercice = "" Then 

'If Len(_LibelleExercice) > -1 Then

If _Descriptions = "" Then 

'If Len(_Descriptions) > -1 Then

If _Instructions = "" Then 

'If Len(_Instructions) > -1 Then

If _RappelExercice = "" Then 

'If Len(_RappelExercice) > -1 Then

If _TypeEvaluation = 0 Then 


End Sub
Public Function Encode(ByVal str As Byte()) As String
Return Convert.ToBase64String(str)
End Function

Public Function Decode(ByVal str As String) As Byte()
Dim decbuff As Byte() = Convert.FromBase64String(str)
Return decbuff
End Function

 Public Function GetObjectString() As String Implements IGeneral.GetObjectString
Function LogData(obj As Cls_FormulaireExercices) As String
Return LogStringBuilder.BuildLogStringHTML(obj)
End Function

Function LogData() As String
Return LogStringBuilder.BuildLogStringHTML(Me)
End Function
#End Region

End Class
