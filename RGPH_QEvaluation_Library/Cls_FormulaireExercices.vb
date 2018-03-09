REM Generate By [GENERIC 12] Application *******
REM  Class Cls_FormulaireExercices

REM Date:08-Mar-2018 06:39 PM
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer

Public Class Cls_FormulaireExercices
    Implements IGeneral

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
    <AttributLogData(True, 1)>
    Public ReadOnly Property ID() As Long Implements IGeneral.ID
        Get
            Return _id
        End Get
    End Property

    <AttributLogData(True, 2)>
    Public Property LibelleExercice As String
        Get
            Return _LibelleExercice
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_LibelleExercice)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _LibelleExercice = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 3)>
    Public Property Descriptions As String
        Get
            Return _Descriptions
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_Descriptions)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _Descriptions = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 4)>
    Public Property Instructions As String
        Get
            Return _Instructions
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_Instructions)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _Instructions = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 5)>
    Public Property RappelExercice As String
        Get
            Return _RappelExercice
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_RappelExercice)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _RappelExercice = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 6)>
    Public Property TypeEvaluation As Integer
        Get
            Return _TypeEvaluation
        End Get
        Set(ByVal Value As Integer)
            If _TypeEvaluation <> Value Then
                _isdirty = True
                _TypeEvaluation = Value
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
                Dim ds As DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_FormulaireExercices_ByID", _idpass)

                If ds.Tables(0).Rows.Count < 1 Then
                    BlankProperties()
                    Return False
                End If

                SetProperties(ds.tables(0).rows(0))
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
            SqlHelper.ExecuteNonQuery(SqlHelperParameterCache.BuildConfigDB(), "SP_Delete_FormulaireExercices", _id)

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

    Public Shared Function SearchAll() As List(Of Cls_FormulaireExercices)
        Try
            Dim objs As New List(Of Cls_FormulaireExercices)
            Dim r As Data.DataRow
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_FormulaireExercices")
            For Each r In ds.Tables(0).Rows
                Dim obj As New Cls_FormulaireExercices

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

        If _LibelleExercice = "" Then
            Throw (New Rezo509Exception("  Libelle Exercice Obligatoire"))
        End If

        'If Len(_LibelleExercice) > -1 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Libelle Exercice  (la longueur doit être inférieure a -1 caractères.  )"))
        'End If

        If _Descriptions = "" Then
            Throw (New Rezo509Exception("  Descriptions Obligatoire"))
        End If

        'If Len(_Descriptions) > -1 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Descriptions  (la longueur doit être inférieure a -1 caractères.  )"))
        'End If

        If _Instructions = "" Then
            Throw (New Rezo509Exception("  Instructions Obligatoire"))
        End If

        'If Len(_Instructions) > -1 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Instructions  (la longueur doit être inférieure a -1 caractères.  )"))
        'End If

        If _RappelExercice = "" Then
            Throw (New Rezo509Exception("  Rappel Exercice Obligatoire"))
        End If

        'If Len(_RappelExercice) > -1 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Rappel Exercice  (la longueur doit être inférieure a -1 caractères.  )"))
        'End If

        If _TypeEvaluation = 0 Then
            Throw (New Rezo509Exception("  Type Evaluation Obligatoire."))
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
        Return LogData(New Cls_FormulaireExercices(Me.ID))
    End Function

    Function LogData(obj As Cls_FormulaireExercices) As String
        Return LogStringBuilder.BuildLogStringHTML(obj)
    End Function

    Function LogData() As String
        Return LogStringBuilder.BuildLogStringHTML(Me)
    End Function
#End Region

End Class


