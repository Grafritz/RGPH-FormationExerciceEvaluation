' @Brain Development
' www.Rezo509.com
' Friday 09-09-2011

Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer
Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Public Class Cls_Departement
    Implements IGeneral


#Region " Attribut "
    Private _id As Long
    Private _latitude As Double
    Private _longitude As Double
    Private _departement As String
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

    Public Property DEPARTEMENT() As String
        Get
            Return _departement
        End Get
        Set(ByVal Value As String)
            If _departement <> Value Then
                _isdirty = True
                _departement = Value
            End If
        End Set
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


    Public ReadOnly Property IS_DIRTY() As Boolean
        Get
            Return _isdirty
        End Get
    End Property
#End Region

#Region " Db Access "
    Public Function Insert(ByVal usr As String) As Integer Implements BRAIN_DEVLOPMENT.IGeneral.Insert
        Try
            _id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_Departement", _departement, _latitude, _longitude, usr))
            Return _id
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try

    End Function

    Public Function Update(ByVal usr As String) As Integer Implements BRAIN_DEVLOPMENT.IGeneral.Update
        Try
            Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_Departement", _id, _departement, _latitude, _longitude, usr)
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try

    End Function

    Public Function Read(ByVal _idDep As Long) As Boolean Implements BRAIN_DEVLOPMENT.IGeneral.Read
        Try
            If _idDep <> 0 Then
                Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Departement_ById", _idDep)

                If ds.Tables(0).Rows.Count < 1 Then
                    BlankProperties()
                    Return False
                End If

                SetProperties(ds.Tables(0).Rows(0))
            Else
                BlankProperties()
            End If

            Return True
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try

    End Function

    Public Function Read(ByVal Description As String) As Boolean
        Try
            Dim ds As Data.DataSet
            If Description.Length <> 0 Then
                ds = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Departement_ByName", Description)

                If ds.Tables(0).Rows.Count < 1 Then
                    BlankProperties()
                    Return False
                End If

                SetProperties(ds.Tables(0).Rows(0))
            Else
                BlankProperties()
            End If

            Return True
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try
    End Function

    Private Sub SetProperties(ByVal dr As Data.DataRow)
        Try
            _id = TypeSafeConversion.NullSafeLong(dr("ID"))
            _departement = TypeSafeConversion.NullSafeString(dr("Departement"))
            _latitude = TypeSafeConversion.NullSafeDouble(dr("Latitude"))
            _longitude = TypeSafeConversion.NullSafeDouble(dr("Longitude"))

            _isdirty = False
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try

    End Sub

    Private Sub BlankProperties()
        _id = 0

        _departement = ""
        _latitude = 0
        _longitude = 0
        _isdirty = False
    End Sub

    Public Sub Delete() Implements BRAIN_DEVLOPMENT.IGeneral.Delete
        Try
            SqlHelper.ExecuteNonQuery(SqlHelperParameterCache.BuildConfigDB(), "SP_Delete_Departement", _id)
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
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
    Public Shared Function SearchAll() As List(Of Cls_Departement)
        Dim objs As New List(Of Cls_Departement)
        Dim r As Data.DataRow
        Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_Departement")

        For Each r In ds.Tables(0).Rows
            Dim obj As New Cls_Departement

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
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Departement_ByName", _departement)
            If ds.Tables(0).Rows.Count < 1 Then
                Return False
            Else
                If _id = 0 Then
                    Return True
                Else
                    If ds.Tables(0).Rows(0).Item("id_departement") <> _id Then
                        Return True
                    Else
                        Return False
                    End If
                End If
            End If
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try

    End Function

    Private Sub Validation()
        If _departement = "" Then
            Throw (New System.Exception("Département non renseigné"))
        End If

        If FoundName() Then
            Throw (New System.Exception("Département déjà enregistré"))
        End If
    End Sub

    Public Function GetObjectString() As String Implements IGeneral.GetObjectString
        Return LogStringBuilder.BuildLogString(Me)
    End Function
#End Region

End Class


