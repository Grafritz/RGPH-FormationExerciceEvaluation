' @Brain Development
' www.Rezo509.com
' Friday 09-09-2011

Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer
Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Public Class Cls_Commune
    Implements IGeneral

#Region " Attribut "
    Private _id As Long
    Private _idDepartement As Long
    Private _latitude As Double
    Private _longitude As Double
    Private _departement As Cls_Departement
    Private _commune As String
    Private _isdirty As Boolean = False
#End Region

#Region " New "
    Public Sub New()
        BlankProperties()
    End Sub

    Public Sub New(ByVal _idOne As Long)
        Read(_idOne)
    End Sub

    Public Sub New(ByVal dr As Data.DataRow)
        Me.SetProperties(dr)
    End Sub
#End Region

#Region " Properties "

    Public ReadOnly Property ID() As Long Implements BRAIN_DEVLOPMENT.IGeneral.ID
        Get
            Return _id
        End Get
    End Property

    Public Property ID_DEPATEMENT() As Long
        Get
            Return _idDepartement
        End Get
        Set(ByVal value As Long)
            _idDepartement = value
            _isdirty = True
        End Set
    End Property

    Public Property DEPARTEMENT_OBJ() As Cls_Departement
        Get
            If Not (_departement Is Nothing) Then
                If (_departement.ID = 0) Or (_departement.ID <> _idDepartement) Then
                    _departement = New Cls_Departement(_idDepartement)
                End If
            Else
                _departement = New Cls_Departement(_idDepartement)
            End If

            Return _departement
        End Get
        Set(ByVal Value As Cls_Departement)
            If Value Is Nothing Then
                _isdirty = True
                _idDepartement = 0
            Else
                If Me._departement.ID <> Value.ID Then
                    _isdirty = True
                    _idDepartement = Value.ID
                End If
            End If
        End Set
    End Property

    Public ReadOnly Property DEPARTEMENT_STR() As String
        Get
            Return DEPARTEMENT_OBJ.DEPARTEMENT
        End Get
    End Property

    Public ReadOnly Property DEPARTEMENT_STR_OrAnd_COMMUNE_STR() As String
        Get
            If DEPARTEMENT_STR.Length > 0 Then
                Return DEPARTEMENT_STR & ", " & COMMUNE
            Else
                Return COMMUNE
            End If
        End Get
    End Property

    Public Property LONGITUDE() As Double
        Get
            Return _longitude
        End Get
        Set(ByVal Value As Double)
            If _longitude <> Value Then
                _isdirty = True
                _longitude = Value
            End If
        End Set
    End Property

    Public Property LATITUDE() As Double
        Get
            Return _latitude
        End Get
        Set(ByVal Value As Double)
            If _latitude <> Value Then
                _isdirty = True
                _latitude = Value
            End If
        End Set
    End Property

    Public Property COMMUNE() As String
        Get
            Return _commune
        End Get
        Set(ByVal Value As String)
            If _commune <> Value Then
                _isdirty = True
                _commune = Value
            End If
        End Set
    End Property

    Public ReadOnly Property IS_DIRTY() As Boolean
        Get
            Return _isdirty
        End Get
    End Property
#End Region

#Region " Db Access "
    Public Function Insert(ByVal usr As String) As Integer Implements BRAIN_DEVLOPMENT.IGeneral.Insert
        Try
            _id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_Commune", _commune, _longitude, _latitude, _idDepartement, usr))
            Return _id
        Catch ex As Exception
            ErreurLog.WriteError(ex.Message)
            'Throw  ex
        End Try
        Return _id
    End Function

    Public Function Update(ByVal usr As String) As Integer Implements BRAIN_DEVLOPMENT.IGeneral.Update
        Try
            Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_Commune", _id, _commune, _longitude, _latitude, _idDepartement, usr)
        Catch ex As Exception
            ErreurLog.WriteError(ex.Message)
            'Throw  ex
        End Try
        Return _id
    End Function

    Public Function Read(ByVal _idcom As Long) As Boolean Implements BRAIN_DEVLOPMENT.IGeneral.Read
        Try
            If _idcom <> 0 Then
                Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Commune_ById", _idcom)

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
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try

    End Function

    Public Function Read(ByVal Description As String) As Boolean
        Try
            Dim ds As Data.DataSet
            If Description.Length <> 0 Then
                ds = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Commune_ByName", Description)

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
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try
    End Function

    Private Sub SetProperties(ByVal dr As Data.DataRow)
        Try
            _id = TypeSafeConversion.NullSafeLong(dr("ID"))
            _idDepartement = TypeSafeConversion.NullSafeLong(dr("id_Departement"))
            _latitude = TypeSafeConversion.NullSafeDouble(dr("latitude"))
            _longitude = TypeSafeConversion.NullSafeDouble(dr("longitude"))
            _commune = TypeSafeConversion.NullSafeString(dr("Commune"))
            _isdirty = False
        Catch ex As Exception
            ErreurLog.WriteError(ex.Message)
            'Throw ex
        End Try

    End Sub

    Private Sub BlankProperties()
        _id = 0
        _commune = ""

        _isdirty = False
    End Sub

    Public Sub Delete() Implements BRAIN_DEVLOPMENT.IGeneral.Delete
        Try
            SqlHelper.ExecuteNonQuery(SqlHelperParameterCache.BuildConfigDB(), "SP_Delete_Commune", _id)
        Catch ex As Exception
            ErreurLog.WriteError(ex.Message)
            'Throw ex
        End Try

    End Sub

    Public Function Refresh() As Boolean Implements BRAIN_DEVLOPMENT.IGeneral.Refresh
        If _id = 0 Then
            Return False
        Else
            Read(_id)
            Return True
        End If
    End Function

    Public Function Save(ByVal usr As String) As Integer Implements BRAIN_DEVLOPMENT.IGeneral.Save
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
    Public Shared Function SearchAll() As List(Of Cls_Commune)
        Dim objs As New List(Of Cls_Commune)
        Dim r As Data.DataRow
        Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_Commune")

        For Each r In ds.Tables(0).Rows
            Dim obj As New Cls_Commune

            obj.SetProperties(r)

            objs.Add(obj)
        Next r

        Return objs
    End Function

    Public Shared Function SearchAll_Commune_Bydepartement(ByVal Dep As Long) As List(Of Cls_Commune)
        Dim objs As New List(Of Cls_Commune)
        Dim r As Data.DataRow
        Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_Commune_ByDepartement", Dep)

        For Each r In ds.Tables(0).Rows
            Dim obj As New Cls_Commune

            obj.SetProperties(r)

            objs.Add(obj)
        Next r

        Return objs
    End Function

    Public Function Search() As System.Collections.ICollection Implements BRAIN_DEVLOPMENT.IGeneral.Search
        Return Nothing
    End Function

#End Region

#Region " Other Methods "

    Private Function FoundName() As Boolean
        Try
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Commune_ByName", _commune)
            If ds.Tables(0).Rows.Count < 1 Then
                Return False
            Else
                If _id = 0 Then
                    Return True
                Else
                    If ds.Tables(0).Rows(0).Item("id_commune") <> _id Then
                        Return True
                    Else
                        Return False
                    End If
                End If
            End If
        Catch ex As Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try

    End Function

    Private Sub Validation()
        If _commune.Trim = "" Then
            Throw (New Rezo509Exception("Commune non renseign�"))
        End If

        If _idDepartement = -1 Then
            Throw (New Rezo509Exception("D�partement non renseign�"))
        End If

        If FoundName() Then
            Throw (New Rezo509Exception("Commune d�j� enregistr�"))
        End If
    End Sub

    Public Function GetObjectString() As String Implements IGeneral.GetObjectString
        Return LogStringBuilder.BuildLogString(Me)
    End Function
#End Region

End Class
