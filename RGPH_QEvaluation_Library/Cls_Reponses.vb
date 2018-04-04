REM Generate By [GENERIC V16] Application *******
REM  Class Cls_Reponses

REM Date:04-Apr-2018 12:22 PM
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer

Public Class Cls_Reponses
    Implements IGeneral

#Region "Attribut"
    Private _id As Long

    Private _CodeQuestion As Long
    Private _Question As Cls_Questions
    Private _LibelleReponse As String
    Private _Iscorrect As Boolean
    Private _estEnfant As Boolean
    Private _avoirEnfant As Boolean
    Private _CodeParent As String
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
    <AttributLogData(True, 1)>
    Public ReadOnly Property ID() As Long Implements IGeneral.ID
        Get
            Return _id
        End Get
    End Property

    <AttributLogData(True, 2)>
    Public Property CodeQuestion As Long
        Get
            Return _CodeQuestion
        End Get
        Set(ByVal Value As Long)
            If _CodeQuestion <> Value Then
                _isdirty = True
                _CodeQuestion = Value
            End If
        End Set
    End Property

    Public Property QuestionOBJ As Cls_Questions
        Get
            If Not (_Question Is Nothing) Then
                If (_Question.ID = 0) Or (_Question.ID <> _CodeQuestion) Then
                    _Question = New Cls_Questions(_CodeQuestion)
                End If
            Else
                _Question = New Cls_Questions(_CodeQuestion)
            End If

            Return _Question
        End Get
        Set(ByVal value As Cls_Questions)
            If value Is Nothing Then
                _isdirty = True
                _CodeQuestion = 0
            Else
                If _Question.ID <> value.ID Then
                    _isdirty = True
                    _CodeQuestion = value.ID
                End If
            End If
        End Set
    End Property


    Public ReadOnly Property LibelleQuestion As String
        Get
            Return QuestionOBJ.LibelleQuestion
        End Get
    End Property

    <AttributLogData(True, 3)>
    Public Property LibelleReponse As String
        Get
            Return _LibelleReponse
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_LibelleReponse)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _LibelleReponse = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 4)>
    Public Property Iscorrect As Boolean
        Get
            Return _Iscorrect
        End Get
        Set(ByVal Value As Boolean)
            If _Iscorrect <> Value Then
                _isdirty = True
                _Iscorrect = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 5)>
    Public Property estEnfant As Boolean
        Get
            Return _estEnfant
        End Get
        Set(ByVal Value As Boolean)
            If _estEnfant <> Value Then
                _isdirty = True
                _estEnfant = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 6)>
    Public Property avoirEnfant As Boolean
        Get
            Return _avoirEnfant
        End Get
        Set(ByVal Value As Boolean)
            If _avoirEnfant <> Value Then
                _isdirty = True
                _avoirEnfant = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 7)>
    Public Property CodeParent As String
        Get
            Return _CodeParent
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_CodeParent)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _CodeParent = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 8)>
    Public Property isdirty As Boolean
        Get
            Return _isdirty
        End Get
        Set(ByVal Value As Boolean)
            If _isdirty <> Value Then
                _isdirty = True
                _isdirty = Value
            End If
        End Set
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
        _id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_Reponses", _CodeQuestion, _LibelleReponse, _Iscorrect, _estEnfant, _avoirEnfant, _CodeParent)) ', usr))
        Return _id
    End Function

    Public Function Update(ByVal usr As String) As Integer Implements IGeneral.Update
        _LogData = GetObjectString()
        Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_Reponses", _id, _CodeQuestion, _LibelleReponse, _Iscorrect, _estEnfant, _avoirEnfant, _CodeParent) ', usr)
    End Function

    Private Sub SetProperties(ByVal dr As DataRow)
        _id = TypeSafeConversion.NullSafeLong(dr("CodeReponse"))
        _CodeQuestion = TypeSafeConversion.NullSafeLong(dr("CodeQuestion"))
        _LibelleReponse = TypeSafeConversion.NullSafeString(dr("LibelleReponse"))
        _Iscorrect = TypeSafeConversion.NullSafeBoolean(dr("Iscorrect"))
        _estEnfant = TypeSafeConversion.NullSafeBoolean(dr("estEnfant"))
        _avoirEnfant = TypeSafeConversion.NullSafeBoolean(dr("avoirEnfant"))
        _CodeParent = TypeSafeConversion.NullSafeString(dr("CodeParent"))
    End Sub

    Private Sub BlankProperties()
        _id = 0
        _CodeQuestion = 0
        '__CodeQuestion = Nothing
        _LibelleReponse = ""
        _Iscorrect = False
        _estEnfant = False
        _avoirEnfant = False
        _CodeParent = ""
        _isdirty = False
    End Sub

    Public Function Read(ByVal _idpass As Long) As Boolean Implements IGeneral.Read
        Try
            If _idpass <> 0 Then
                Dim ds As DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Reponses_ByID", _idpass)

                If ds.Tables(0).Rows.Count < 1 Then
                    BlankProperties()
                    Return False
                End If

                SetProperties(ds.Tables(0).Rows(0))
            Else
                BlankProperties()
            End If
            Return True

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Sub Delete() Implements IGeneral.Delete
        Try
            SqlHelper.ExecuteNonQuery(SqlHelperParameterCache.BuildConfigDB(), "SP_Delete_Reponses", _id)

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Function Refresh() As Boolean Implements IGeneral.Refresh
        If _id = 0 Then
            Return False
        Else
            Read(_id)
            Return True
        End If
    End Function

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
        Return SearchAll()
    End Function

    Public Shared Function SearchAll() As List(Of Cls_Reponses)
        Try
            Dim objs As New List(Of Cls_Reponses)
            Dim r As Data.DataRow
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_Reponses")
            For Each r In ds.Tables(0).Rows
                Dim obj As New Cls_Reponses

                obj.SetProperties(r)

                objs.Add(obj)
            Next r
            Return objs

        Catch ex As Exception
            Throw ex
        End Try
    End Function


    Public Shared Function SearchAllBy_CodeQuestion(ByVal _codequestion As Long) As List(Of Cls_Reponses)
        Try
            Dim objs As New List(Of Cls_Reponses)
            Dim r As Data.DataRow
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_Reponses_CodeQuestion", _codequestion)
            For Each r In ds.Tables(0).Rows
                Dim obj As New Cls_Reponses

                obj.SetProperties(r)

                objs.Add(obj)
            Next r
            Return objs
        Catch ex As Exception
            Throw ex
        End Try
    End Function

#End Region

#Region " Other Methods "
    Private Sub Validation()

        If _CodeQuestion = 0 Then
            Throw (New Rezo509Exception("  Code Question Obligatoire"))
        End If

        If _LibelleReponse = "" Then
            Throw (New Rezo509Exception("  Libelle Reponse Obligatoire"))
        End If

        'If Len(_LibelleReponse) > -1 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Libelle Reponse  (la longueur doit être inférieure a -1 caractères.  )"))
        'End If

        'If _CodeParent = "" Then
        '    Throw (New Rezo509Exception("  Code Parent Obligatoire"))
        'End If

        'If Len(_CodeParent) > 140 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Code Parent  (la longueur doit être inférieure a 140 caractères.  )"))
        'End If


    End Sub

    Public Function Encode(ByVal str As Byte()) As String
        Return Convert.ToBase64String(str)
    End Function

    Public Function Decode(ByVal str As String) As Byte()
        Dim decbuff As Byte() = Convert.FromBase64String(str)
        Return decbuff
    End Function

    Public Function GetObjectString() As String Implements IGeneral.GetObjectString
        Return LogData(New Cls_Reponses(Me.ID))
    End Function

    Function LogData(obj As Cls_Reponses) As String
        Return LogStringBuilder.BuildLogStringHTML(obj)
    End Function

    Function LogData() As String
        Return LogStringBuilder.BuildLogStringHTML(Me)
    End Function
#End Region

End Class

