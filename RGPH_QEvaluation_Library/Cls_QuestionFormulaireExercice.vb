REM Generate By [GENERIC V16] Application *******
REM  Class Cls_QuestionFormulaireExercice

REM Date:04-Apr-2018 12:22 PM
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer

Public Class Cls_QuestionFormulaireExercice
    Implements IGeneral

#Region "Attribut"
    Private _id As Long

    Private _CodeFormulaireExercice As Long
    Private _FormulaireExercice As Cls_FormulaireExercices
    Private _CodeQuestion As Long
    Private _Question As Cls_Questions
    Private _OrdreQuestion As Integer
    Private _EstDebutQuestion As Boolean
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
    Public Property CodeFormulaireExercice As Long
        Get
            Return _CodeFormulaireExercice
        End Get
        Set(ByVal Value As Long)
            If _CodeFormulaireExercice <> Value Then
                _isdirty = True
                _CodeFormulaireExercice = Value
            End If
        End Set
    End Property

    Public Property FormulaireExerciceOBJ As Cls_FormulaireExercices
        Get
            If Not (_FormulaireExercice Is Nothing) Then
                If (_FormulaireExercice.ID = 0) Or (_FormulaireExercice.ID <> _CodeFormulaireExercice) Then
                    _FormulaireExercice = New Cls_FormulaireExercices(_CodeFormulaireExercice)
                End If
            Else
                _FormulaireExercice = New Cls_FormulaireExercices(_CodeFormulaireExercice)
            End If

            Return _FormulaireExercice
        End Get
        Set(ByVal value As Cls_FormulaireExercices)
            If value Is Nothing Then
                _isdirty = True
                _CodeFormulaireExercice = 0
            Else
                If _FormulaireExercice.ID <> value.ID Then
                    _isdirty = True
                    _CodeFormulaireExercice = value.ID
                End If
            End If
        End Set
    End Property


    Public ReadOnly Property LibelleExercice As String
        Get
            Return FormulaireExerciceOBJ.LibelleExercice
        End Get
    End Property

    <AttributLogData(True, 3)>
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

    <AttributLogData(True, 4)>
    Public Property OrdreQuestion As Integer
        Get
            Return _OrdreQuestion
        End Get
        Set(ByVal Value As Integer)
            If _OrdreQuestion <> Value Then
                _isdirty = True
                _OrdreQuestion = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 5)>
    Public Property EstDebutQuestion As Boolean
        Get
            Return _EstDebutQuestion
        End Get
        Set(ByVal Value As Boolean)
            If _EstDebutQuestion <> Value Then
                _isdirty = True
                _EstDebutQuestion = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 6)>
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
        _id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_QuestionFormulaireExercice", _CodeFormulaireExercice, _CodeQuestion, _OrdreQuestion, _EstDebutQuestion, usr))
        Return _id
    End Function

    Public Function Update(ByVal usr As String) As Integer Implements IGeneral.Update
        _LogData = GetObjectString()
        Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_QuestionFormulaireExercice", _id, _CodeFormulaireExercice, _CodeQuestion, _OrdreQuestion, _EstDebutQuestion, usr)
    End Function

    Private Sub SetProperties(ByVal dr As DataRow)
        _id = TypeSafeConversion.NullSafeLong(dr("ID"))
        _CodeFormulaireExercice = TypeSafeConversion.NullSafeLong(dr("CodeFormulaireExercice"))
        _CodeQuestion = TypeSafeConversion.NullSafeLong(dr("CodeQuestion"))
        _OrdreQuestion = TypeSafeConversion.NullSafeInteger(dr("OrdreQuestion"))
        _EstDebutQuestion = TypeSafeConversion.NullSafeBoolean(dr("EstDebutQuestion"))
    End Sub

    Private Sub BlankProperties()
        _id = 0
        _CodeFormulaireExercice = 0
        '__CodeFormulaireExercice = Nothing
        _CodeQuestion = 0
        '__CodeQuestion = Nothing
        _OrdreQuestion = 0
        _EstDebutQuestion = False
        _isdirty = False
    End Sub

    Public Function Read(ByVal _idpass As Long) As Boolean Implements IGeneral.Read
        Try
            If _idpass <> 0 Then
                Dim ds As DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_QuestionFormulaireExercice_ByID", _idpass)

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
            SqlHelper.ExecuteNonQuery(SqlHelperParameterCache.BuildConfigDB(), "SP_Delete_QuestionFormulaireExercice", _id)

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

    Public Shared Function SearchAll() As List(Of Cls_QuestionFormulaireExercice)
        Try
            Dim objs As New List(Of Cls_QuestionFormulaireExercice)
            Dim r As Data.DataRow
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_QuestionFormulaireExercice")
            For Each r In ds.Tables(0).Rows
                Dim obj As New Cls_QuestionFormulaireExercice

                obj.SetProperties(r)

                objs.Add(obj)
            Next r
            Return objs

        Catch ex As Exception
            Throw ex
        End Try
    End Function


    Public Shared Function SearchAllBy_CodeFormulaireExercice(ByVal _codeformulaireexercice As Long) As List(Of Cls_QuestionFormulaireExercice)
        Try
            Dim objs As New List(Of Cls_QuestionFormulaireExercice)
            Dim r As Data.DataRow
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_QuestionFormulaireExercice_CodeFormulaireExercice", _codeformulaireexercice)
            For Each r In ds.Tables(0).Rows
                Dim obj As New Cls_QuestionFormulaireExercice

                obj.SetProperties(r)

                objs.Add(obj)
            Next r
            Return objs
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function SearchAllBy_CodeQuestion(ByVal _codequestion As Long) As List(Of Cls_QuestionFormulaireExercice)
        Try
            Dim objs As New List(Of Cls_QuestionFormulaireExercice)
            Dim r As Data.DataRow
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_QuestionFormulaireExercice_CodeQuestion", _codequestion)
            For Each r In ds.Tables(0).Rows
                Dim obj As New Cls_QuestionFormulaireExercice

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

        If _CodeFormulaireExercice = 0 Then
            Throw (New Rezo509Exception("  Code Formulaire Exercice Obligatoire"))
        End If

        If _CodeQuestion = 0 Then
            Throw (New Rezo509Exception("  Code Question Obligatoire"))
        End If

        If _OrdreQuestion = 0 Then
            Throw (New Rezo509Exception("  Ordre Question Obligatoire."))
        End If


    End Sub

    Public Function Encode(ByVal str As Byte()) As String
        Return Convert.ToBase64String(str)
    End Function

    Public Function Decode(ByVal str As String) As Byte()
        Dim decbuff As Byte() = Convert.FromBase64String(str)
        Return decbuff
    End Function

    Public Function GetObjectString() As String Implements IGeneral.GetObjectString
        Return LogData(New Cls_QuestionFormulaireExercice(Me.ID))
    End Function

    Function LogData(obj As Cls_QuestionFormulaireExercice) As String
        Return LogStringBuilder.BuildLogStringHTML(obj)
    End Function

    Function LogData() As String
        Return LogStringBuilder.BuildLogStringHTML(Me)
    End Function
#End Region

End Class


