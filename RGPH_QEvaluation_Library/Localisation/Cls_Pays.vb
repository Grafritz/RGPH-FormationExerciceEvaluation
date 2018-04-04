' @Brain Development
' www.Rezo509.com
' Samedi 07-04-2012

Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer
Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Public Class Cls_Pays
    Implements IGeneral

#Region "ATTRIBUTS"
    Private _id As Long
    Private _CodePays As String
    Private _SigleCourt As String
    Private _SigleLong As String
    Private _NomEnGb As String
    Private _NomFrDbq As String
    Private _NomFrGb As String
    Private _Nationalite As String
    Private _Statut As Boolean

    Private isdirty As Boolean
#End Region

#Region "CONSTRUCTEURS"
    Public Shared CODE_HAITI As Long = 1

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

#Region "PROPRIETES"
    Public ReadOnly Property ID() As Long Implements BRAIN_DEVLOPMENT.IGeneral.ID
        Get
            Return _id
        End Get
    End Property

    Public Property CodePays As String
        Get
            Return _CodePays
        End Get
        Set(ByVal Value As String)
            If _CodePays <> Value Then
                isdirty = True
                _CodePays = Value
            End If
        End Set
    End Property

    Public Property SigleCourt As String
        Get
            Return _SigleCourt
        End Get
        Set(ByVal Value As String)
            If _SigleCourt <> Value Then
                isdirty = True
                _SigleCourt = Value
            End If
        End Set
    End Property

    Public Property SigleLong As String
        Get
            Return _SigleLong
        End Get
        Set(ByVal Value As String)
            If _SigleLong <> Value Then
                isdirty = True
                _SigleLong = Value
            End If
        End Set
    End Property

    Public Property NomEnGb As String
        Get
            Return _NomEnGb
        End Get
        Set(ByVal Value As String)
            If _NomEnGb <> Value Then
                isdirty = True
                _NomEnGb = Value
            End If
        End Set
    End Property

    Public Property NomFrGb() As String
        Get
            Return _NomFrGb
        End Get
        Set(ByVal Value As String)
            If _NomFrGb <> Value Then
                isdirty = True
                _NomFrGb = Value
            End If
        End Set
    End Property

    Public Property Nationalite() As String
        Get
            Return _Nationalite
        End Get
        Set(ByVal Value As String)
            If _Nationalite <> Value Then
                isdirty = True
                _Nationalite = Value
            End If
        End Set
    End Property

    Public ReadOnly Property Nationalite_OU_NomFrGb As String
        Get
            If _Nationalite.Trim.Equals("") Then
                Return _NomFrGb
            Else
                Return _Nationalite
            End If
        End Get
    End Property

    Public Property STATUT() As Boolean
        Get
            Return _Statut
        End Get
        Set(ByVal Value As Boolean)
            If _Statut <> Value Then
                isdirty = True
                _Statut = Value
            End If
        End Set
    End Property

    Public ReadOnly Property STATUT_IMAGE As String
        Get
            Return Cls_Statut.Statut_Image(_Statut)
        End Get
    End Property

    Public ReadOnly Property IS_DIRTY() As Boolean
        Get
            Return isdirty
        End Get
    End Property
#End Region

#Region "Accès à la Base De Données"
    Public Function Insert(ByVal usr As String) As Integer Implements BRAIN_DEVLOPMENT.IGeneral.Insert
        Try
            _id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_Pays", _NomFrGb, _Statut, usr))
            Return _id
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function Update(ByVal usr As String) As Integer Implements BRAIN_DEVLOPMENT.IGeneral.Update
        Try
            Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_Pays", _id, _NomFrGb, _Statut, usr)
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function Read(ByVal _id As Long) As Boolean Implements BRAIN_DEVLOPMENT.IGeneral.Read
        Try
            If _id <> 0 Then
                Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Pays_ById", _id)

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

    Public Function Read(ByVal Desc As String) As Boolean
        Try
            Dim ds As Data.DataSet
            If Desc.Length <> 0 Then
                ds = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Pays_ByName", Desc)

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

    Public Sub Delete() Implements BRAIN_DEVLOPMENT.IGeneral.Delete
        Try
            SqlHelper.ExecuteNonQuery(SqlHelperParameterCache.BuildConfigDB(), "SP_Delete_Pays", _id)
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try

    End Sub

    Private Sub SetProperties(ByVal dr As Data.DataRow)
        Try
            _id = TypeSafeConversion.NullSafeLong(dr("IdPays"))
            _CodePays = TypeSafeConversion.NullSafeString(dr("CodePays"))
            _SigleCourt = TypeSafeConversion.NullSafeString(dr("SigleCourt"))
            _SigleLong = TypeSafeConversion.NullSafeString(dr("SigleLong"))
            _NomEnGb = TypeSafeConversion.NullSafeString(dr("NomEnGb"))
            _NomFrGb = TypeSafeConversion.NullSafeString(dr("NomFrGb"))
            _Nationalite = TypeSafeConversion.NullSafeString(dr("Nationalite"))
            _Statut = TypeSafeConversion.NullSafeBoolean(dr("Statut"))

            isdirty = False
        Catch ex As Rezo509Exception
            ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try

    End Sub

    Private Sub BlankProperties()
        _id = 0
        _CodePays = ""
        _SigleCourt = ""
        _SigleLong = ""
        _NomEnGb = ""
        _NomFrGb = ""
        _Nationalite = ""
        _Statut = True

        isdirty = False
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
        If isdirty Then
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

        isdirty = False
        Return val
    End Function
#End Region

#Region "Other Methods"
    Private Function FoundName() As Boolean
        Try
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Pays_ByName", _NomFrGb)
            If ds.Tables(0).Rows.Count < 1 Then
                Return False
            Else
                If _id = 0 Then
                    Return True
                Else
                    If ds.Tables(0).Rows(0).Item("IdPays") <> _id Then
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
        If _NomFrGb.Trim = "" Then
            Throw (New Rezo509Exception("Nom pays non renseigné"))
        End If

        If FoundName() Then
            Throw (New Rezo509Exception(" Pays [ " & _NomFrGb & " ] déjà enregistré"))
        End If
    End Sub

    Public Function GetObjectString() As String Implements IGeneral.GetObjectString
        Return LogStringBuilder.BuildLogString(Me)
    End Function
#End Region

#Region "RECHERCHER"
    Public Shared Function SearchAll(Optional Statut As String = "FO") As List(Of Cls_Pays)
        Dim objs As New List(Of Cls_Pays)
        Dim r As Data.DataRow
        Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_Pays", Statut)

        For Each r In ds.Tables(0).Rows
            Dim obj As New Cls_Pays

            obj.SetProperties(r)

            objs.Add(obj)
        Next r

        Return objs
    End Function

    Public Shared Function SearchAll_Pays_LIKE(ByVal Critere_String As String) As List(Of Cls_Pays)
        Dim objs As New List(Of Cls_Pays)
        Dim r As Data.DataRow
        Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Seach_Pays_Like", Critere_String)

        For Each r In ds.Tables(0).Rows
            Dim obj As New Cls_Pays

            obj.SetProperties(r)

            objs.Add(obj)
        Next r

        Return objs
    End Function

    Public Function Search() As System.Collections.ICollection Implements BRAIN_DEVLOPMENT.IGeneral.Search
        Return Nothing
    End Function
#End Region


End Class
