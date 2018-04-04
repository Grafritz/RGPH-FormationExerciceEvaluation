REM Generate By [GENERIC V16] Application *******
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer

Public Class Cls_Questions

#Region "Attribut"
Private _id As Long

Private _LibelleQuestion As String
Private _DetailsQuestion As String
Private _IndicationsQuestion As String
Private _AvoirJustificationYN As Boolean
Private _TypeQuestion As Integer
Private _ScoreTotal As Decimal
Private _Commentaire As String
Private _CaractereAccepte As Integer
Private _NbreValeurMinimal As Integer
Private _NbreCaractereMaximal As Integer
Private _qPrecedent As String
Private _qSuivant As String
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
Public Property  LibelleQuestion As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 3)> _
Public Property  DetailsQuestion As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 4)> _
Public Property  IndicationsQuestion As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 5)> _
Public Property  AvoirJustificationYN As Boolean
Get
Set(ByVal Value As Boolean)

<AttributLogData(True, 6)> _
Public Property  TypeQuestion As Integer
Get
Set(ByVal Value As Integer)

<AttributLogData(True, 7)> _
Public Property  ScoreTotal As Decimal
Get
Set(ByVal Value As Decimal)

<AttributLogData(True, 8)> _
Public Property  Commentaire As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 9)> _
Public Property  CaractereAccepte As Integer
Get
Set(ByVal Value As Integer)

<AttributLogData(True, 10)> _
Public Property  NbreValeurMinimal As Integer
Get
Set(ByVal Value As Integer)

<AttributLogData(True, 11)> _
Public Property  NbreCaractereMaximal As Integer
Get
Set(ByVal Value As Integer)

<AttributLogData(True, 12)> _
Public Property  qPrecedent As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 13)> _
Public Property  qSuivant As String
Get
Set(ByVal Value As String)

<AttributLogData(True, 14)> _
Public Property  isdirty As Boolean
Get
Set(ByVal Value As Boolean)

<AttributLogData(True, 15)> _
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
_id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_Questions", _LibelleQuestion, _DetailsQuestion, _IndicationsQuestion, _AvoirJustificationYN, _TypeQuestion, _ScoreTotal, _Commentaire, _CaractereAccepte, _NbreValeurMinimal, _NbreCaractereMaximal, _qPrecedent, _qSuivant, usr))
Return _id
End Function

Public Function Update(ByVal usr As String) As Integer Implements IGeneral.Update
_LogData = GetObjectString()
Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_Questions", _id, _LibelleQuestion, _DetailsQuestion, _IndicationsQuestion, _AvoirJustificationYN, _TypeQuestion, _ScoreTotal, _Commentaire, _CaractereAccepte, _NbreValeurMinimal, _NbreCaractereMaximal, _qPrecedent, _qSuivant, usr)
End Function
Private Sub SetProperties(ByVal dr As DataRow)
_id = TypeSafeConversion.NullSafeLong(dr("CodeQuestion"))
_LibelleQuestion = TypeSafeConversion.NullSafeString(dr("LibelleQuestion"))
_DetailsQuestion = TypeSafeConversion.NullSafeString(dr("DetailsQuestion"))
_IndicationsQuestion = TypeSafeConversion.NullSafeString(dr("IndicationsQuestion"))
_AvoirJustificationYN = TypeSafeConversion.NullSafeBoolean(dr("AvoirJustificationYN"))
_TypeQuestion = TypeSafeConversion.NullSafeInteger(dr("TypeQuestion"))
_ScoreTotal = TypeSafeConversion.NullSafeDecimal(dr("ScoreTotal"))
_Commentaire = TypeSafeConversion.NullSafeString(dr("Commentaire"))
_CaractereAccepte = TypeSafeConversion.NullSafeInteger(dr("CaractereAccepte"))
_NbreValeurMinimal = TypeSafeConversion.NullSafeInteger(dr("NbreValeurMinimal"))
_NbreCaractereMaximal = TypeSafeConversion.NullSafeInteger(dr("NbreCaractereMaximal"))
_qPrecedent = TypeSafeConversion.NullSafeString(dr("qPrecedent"))
_qSuivant = TypeSafeConversion.NullSafeString(dr("qSuivant"))
End Sub
Private Sub BlankProperties()
_id = 0
_LibelleQuestion = ""
_DetailsQuestion = ""
_IndicationsQuestion = ""
_AvoirJustificationYN = False
_TypeQuestion = 0
_ScoreTotal = 0
_Commentaire = ""
_CaractereAccepte = 0
_NbreValeurMinimal = 0
_NbreCaractereMaximal = 0
_qPrecedent = ""
_qSuivant = ""
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
Public Shared Function SearchAll() As List(Of Cls_Questions)
Catch ex As Exception
Throw ex
End Try
End Function


#End Region

#Region " Other Methods "
Private Sub Validation() 
If _LibelleQuestion = "" Then 

'If Len(_LibelleQuestion) > -1 Then

If _DetailsQuestion = "" Then 

'If Len(_DetailsQuestion) > -1 Then

If _IndicationsQuestion = "" Then 

'If Len(_IndicationsQuestion) > -1 Then

If _TypeQuestion = 0 Then 

If _ScoreTotal = 0 Then 

If _Commentaire = "" Then 

'If Len(_Commentaire) > -1 Then

If _CaractereAccepte = 0 Then 

If _NbreValeurMinimal = 0 Then 

If _NbreCaractereMaximal = 0 Then 

If _qPrecedent = "" Then 

'If Len(_qPrecedent) > 200 Then

If _qSuivant = "" Then 

'If Len(_qSuivant) > 200 Then


End Sub
Public Function Encode(ByVal str As Byte()) As String
Return Convert.ToBase64String(str)
End Function

Public Function Decode(ByVal str As String) As Byte()
Dim decbuff As Byte() = Convert.FromBase64String(str)
Return decbuff
End Function

 Public Function GetObjectString() As String Implements IGeneral.GetObjectString
Function LogData(obj As Cls_Questions) As String
Return LogStringBuilder.BuildLogStringHTML(obj)
End Function

Function LogData() As String
Return LogStringBuilder.BuildLogStringHTML(Me)
End Function
#End Region

End Class
