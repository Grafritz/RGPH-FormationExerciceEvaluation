REM Generate By [GENERIC V16] Application *******
REM  Class Cls_Questions

REM Date:04-Apr-2018 12:22 PM
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer

Public Class Cls_Questions
    Implements IGeneral

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
    <AttributLogData(True, 1)>
    Public ReadOnly Property ID() As Long Implements IGeneral.ID
        Get
            Return _id
        End Get
    End Property

    Public ReadOnly Property codeQuestion As Long
        Get
            Return _id
        End Get
    End Property

    <AttributLogData(True, 2)>
    Public Property LibelleQuestion As String
        Get
            Return _LibelleQuestion
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_LibelleQuestion)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _LibelleQuestion = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 3)>
    Public Property DetailsQuestion As String
        Get
            Return _DetailsQuestion
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_DetailsQuestion)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _DetailsQuestion = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 4)>
    Public Property IndicationsQuestion As String
        Get
            Return _IndicationsQuestion
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_IndicationsQuestion)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _IndicationsQuestion = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 5)>
    Public Property AvoirJustificationYN As Boolean
        Get
            Return _AvoirJustificationYN
        End Get
        Set(ByVal Value As Boolean)
            If _AvoirJustificationYN <> Value Then
                _isdirty = True
                _AvoirJustificationYN = Value
            End If
        End Set
    End Property

    Public ReadOnly Property AvoirJustificationYN_Image As String
        Get
            Return Cls_Statut.Statut_Image(_AvoirJustificationYN)
        End Get
    End Property

    Public ReadOnly Property AvoirJustificationYN_OuiNon As String
        Get
            Return Cls_Statut.ConvertBool_To_OuiNon(_AvoirJustificationYN)
        End Get
    End Property

    <AttributLogData(True, 6)>
    Public Property TypeQuestion As Integer
        Get
            Return _TypeQuestion
        End Get
        Set(ByVal Value As Integer)
            If _TypeQuestion <> Value Then
                _isdirty = True
                _TypeQuestion = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 7)>
    Public Property ScoreTotal As Decimal
        Get
            Return _ScoreTotal
        End Get
        Set(ByVal Value As Decimal)
            If _ScoreTotal <> Value Then
                _isdirty = True
                _ScoreTotal = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 8)>
    Public Property Commentaire As String
        Get
            Return _Commentaire
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_Commentaire)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _Commentaire = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 9)>
    Public Property CaractereAccepte As Integer
        Get
            Return _CaractereAccepte
        End Get
        Set(ByVal Value As Integer)
            If _CaractereAccepte <> Value Then
                _isdirty = True
                _CaractereAccepte = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 10)>
    Public Property NbreValeurMinimal As Integer
        Get
            Return _NbreValeurMinimal
        End Get
        Set(ByVal Value As Integer)
            If _NbreValeurMinimal <> Value Then
                _isdirty = True
                _NbreValeurMinimal = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 11)>
    Public Property NbreCaractereMaximal As Integer
        Get
            Return _NbreCaractereMaximal
        End Get
        Set(ByVal Value As Integer)
            If _NbreCaractereMaximal <> Value Then
                _isdirty = True
                _NbreCaractereMaximal = Value
            End If
        End Set
    End Property

    <AttributLogData(True, 12)>
    Public Property qPrecedent As String
        Get
            Return _qPrecedent
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_qPrecedent)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _qPrecedent = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 13)>
    Public Property qSuivant As String
        Get
            Return _qSuivant
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_qSuivant)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _qSuivant = Trim(Value)
            End If
        End Set
    End Property

    <AttributLogData(True, 14)>
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
        _id = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Insert_Questions", _LibelleQuestion, _DetailsQuestion, _IndicationsQuestion, _AvoirJustificationYN, _TypeQuestion, _ScoreTotal, _Commentaire, _CaractereAccepte, _NbreValeurMinimal, _NbreCaractereMaximal, _qPrecedent, _qSuivant)) ', usr))
        Return _id
    End Function

    Public Function Update(ByVal usr As String) As Integer Implements IGeneral.Update
        _LogData = GetObjectString()
        Return SqlHelper.ExecuteScalar(SqlHelperParameterCache.BuildConfigDB(), "SP_Update_Questions", _id, _LibelleQuestion, _DetailsQuestion, _IndicationsQuestion, _AvoirJustificationYN, _TypeQuestion, _ScoreTotal, _Commentaire, _CaractereAccepte, _NbreValeurMinimal, _NbreCaractereMaximal, _qPrecedent, _qSuivant) ', usr)
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
        _NbreValeurMinimal = -1
        _NbreCaractereMaximal = -1
        _qPrecedent = ""
        _qSuivant = ""
        _isdirty = False
    End Sub

    Public Function Read(ByVal _idpass As Long) As Boolean Implements IGeneral.Read
        Try
            If _idpass <> 0 Then
                Dim ds As DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Questions_ByID", _idpass)

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
            SqlHelper.ExecuteNonQuery(SqlHelperParameterCache.BuildConfigDB(), "SP_Delete_Questions", _id)

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

    Public Shared Function SearchAll() As List(Of Cls_Questions)
        Try
            Dim objs As New List(Of Cls_Questions)
            Dim r As Data.DataRow
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_Questions")
            For Each r In ds.Tables(0).Rows
                Dim obj As New Cls_Questions
                obj.SetProperties(r)
                objs.Add(obj)
            Next r
            Return objs
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function SearchAll_NotIn_QuestionFormulaire_ByIDFormulaire(ByVal IDFormulaire As Long) As List(Of Cls_Questions)
        Try
            Dim objs As New List(Of Cls_Questions)
            Dim r As Data.DataRow
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_Questions_NotIn_QuestionFormulaire_ByIDFormulaire", IDFormulaire)
            For Each r In ds.Tables(0).Rows
                Dim obj As New Cls_Questions
                obj.SetProperties(r)
                objs.Add(obj)
            Next r
            Return objs
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function SearchAll_In_QuestionFormulaire_ByIDFormulaire(ByVal IDFormulaire As Long) As List(Of Cls_Questions)
        Try
            Dim objs As New List(Of Cls_Questions)
            Dim r As Data.DataRow
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_ListAll_Questions_In_QuestionFormulaire_ByIDFormulaire", IDFormulaire)
            For Each r In ds.Tables(0).Rows
                Dim obj As New Cls_Questions
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

        If _LibelleQuestion = "" Then
            Throw (New Rezo509Exception("  Libelle Question Obligatoire"))
        End If

        'If Len(_LibelleQuestion) > -1 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Libelle Question  (la longueur doit être inférieure a -1 caractères.  )"))
        'End If

        'If _DetailsQuestion = "" Then
        '    Throw (New Rezo509Exception("  Details Question Obligatoire"))
        'End If

        'If Len(_DetailsQuestion) > -1 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Details Question  (la longueur doit être inférieure a -1 caractères.  )"))
        'End If

        'If _IndicationsQuestion = "" Then
        '    Throw (New Rezo509Exception("  Indications Question Obligatoire"))
        'End If

        'If Len(_IndicationsQuestion) > -1 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Indications Question  (la longueur doit être inférieure a -1 caractères.  )"))
        'End If

        'If _TypeQuestion = 0 Then
        '    Throw (New Rezo509Exception("  Type Question Obligatoire."))
        'End If

        'If _ScoreTotal = 0 Then
        '    Throw (New Rezo509Exception("  Score Total Obligatoire."))
        'End If

        'If _Commentaire = "" Then
        '    Throw (New Rezo509Exception("  Commentaire Obligatoire"))
        'End If

        'If Len(_Commentaire) > -1 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour  Commentaire  (la longueur doit être inférieure a -1 caractères.  )"))
        'End If

        'If _CaractereAccepte = 0 Then
        '    Throw (New Rezo509Exception("  Caractere Accepte Obligatoire."))
        'End If

        'If _NbreValeurMinimal = 0 Then
        '    Throw (New Rezo509Exception("  Nbre Valeur Minimal Obligatoire."))
        'End If

        'If _NbreCaractereMaximal = 0 Then
        '    Throw (New Rezo509Exception("  Nbre Caractere Maximal Obligatoire."))
        'End If

        'If _qPrecedent = "" Then
        '    Throw (New Rezo509Exception(" q Precedent Obligatoire"))
        'End If

        ''If Len(_qPrecedent) > 200 Then
        ''Throw (New Rezo509Exception(" Trop de caractères insérés pour q Precedent  (la longueur doit être inférieure a 200 caractères.  )"))
        ''End If

        'If _qSuivant = "" Then
        '    Throw (New Rezo509Exception(" q Suivant Obligatoire"))
        'End If

        'If Len(_qSuivant) > 200 Then
        'Throw (New Rezo509Exception(" Trop de caractères insérés pour q Suivant  (la longueur doit être inférieure a 200 caractères.  )"))
        'End If

        If FoundName() Then
            Throw (New Rezo509Exception("Cette question  [ " & _LibelleQuestion & " ] est déjà enregistrée."))
        End If
    End Sub

    Private Function FoundName() As Boolean
        Try
            Dim ds As Data.DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), "SP_Select_Questions_ByLibelleQuestion", _LibelleQuestion)
            If ds.Tables(0).Rows.Count < 1 Then
                Return False
            Else
                If _id = 0 Then
                    Return True
                Else
                    If ds.Tables(0).Rows(0).Item("CodeQuestion") <> _id Then
                        Return True
                    Else
                        Return False
                    End If
                End If
            End If
        Catch ex As Exception
            'ErreurLog.WriteError(ex.Message)
            Throw ex
        End Try
    End Function

    Public Function Encode(ByVal str As Byte()) As String
        Return Convert.ToBase64String(str)
    End Function

    Public Function Decode(ByVal str As String) As Byte()
        Dim decbuff As Byte() = Convert.FromBase64String(str)
        Return decbuff
    End Function

    Public Function GetObjectString() As String Implements IGeneral.GetObjectString
        Return LogData(New Cls_Questions(Me.ID))
    End Function

    Function LogData(obj As Cls_Questions) As String
        Return LogStringBuilder.BuildLogStringHTML(obj)
    End Function

    Function LogData() As String
        Return LogStringBuilder.BuildLogStringHTML(Me)
    End Function
#End Region

End Class


