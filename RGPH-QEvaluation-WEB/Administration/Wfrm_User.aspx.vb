' @Brain Development
' Saturday 21-09-2013

Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer
Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports RGPH_QCOLLECTE_Library

Partial Class Parametres_Administration_Wfrm_User
    Inherits Cls_BasePage

    Dim _message As String = ""
    Private Const Nom_page As String = "PAGE-GESTION-UTILISATEUR"
    Private Const Btn_SaveEditUser As String = "Bouton-Save-Edit-Utilisateur"
    Private Const Btn_DeleteUser As String = "Bouton-Delete-Utilisateur"
    Private Const Btn_ResetPassWordUser As String = "Bouton-Reset-PassWord-Utilisateur"
    Private Const ActionChangeUsername As String = "Action-Change-Username"

    Dim User_Connected As Cls_User
    Dim Is_Acces_Page As Boolean = True
    Dim GetOut As Boolean = False
    Dim IS_Search As Boolean = False
    Dim IS_Trouve As Boolean = False
    Private IDGroupe As Long = 0
    Private IS_SendMail As Boolean = True

    Dim GenerateRandomCode As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'CType(Me.Master.FindControl("MenuParametre").FindControl("HyperLink_Wfrm_User"), HyperLink).CssClass = "active"
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Expires = -1
        Panel_Msg.Visible = False

        SYSTEME_SECURITE()

        If Request.QueryString("IDGroupe") IsNot Nothing AndAlso IsNumeric(Request.QueryString("IDGroupe")) Then
            IDGroupe = Request.QueryString("IDGroupe")
        Else
            IDGroupe = 0
        End If

        '--- Si l'utilisateur a Acces a la page 
        If Is_Acces_Page Then
            If Not IsPostBack Then
                Me.ViewState("sortfield") = "ID"
                Me.ViewState("sortdirection") = "DESC"
                Count_DATAUser()
                LoadData_GridView_List()
                Load_Group_Utilisateur()
                NewToDo()
            End If
        End If

    End Sub

#Region "SECURITE"
    Public Sub SYSTEME_SECURITE()

        User_Connected = [Global].KeepUserContinuesToWork(User_Connected)

        CType(Page.Master.FindControl("DashMenu_Securite").FindControl("liPANEL_GESTION_SECURITE"), HtmlControl).Attributes.Add("class", "active ")
        CType(Page.Master.FindControl("DashMenu_Securite").FindControl("liPAGE_GESTION_UTILISATEUR"), HtmlControl).Attributes.Add("class", "active")

        If Session([Global].GLOBAL_SESSION) IsNot Nothing Then
            User_Connected = CType(Session([Global].GLOBAL_SESSION), Cls_User)
            If Not Cls_Privilege.VerifyRightOnObject(Nom_page, User_Connected.IdGroupeuser) Then
                _message = [Global].NO_ACCES_PAGE
                MessageToShow(_message)
                Is_Acces_Page = False

                Panel_First2.Visible = False
                'UpdatePanel_First.Visible = False
                Panel_First.Visible = False
                Panel_List.Visible = False
                '--- Sorry vous n'avez pas Acces a la page 
                RemoveHandler Btn_Save.Click, AddressOf Btn_Save_Click

            Else
                '---  Okey vous avez acces a la page ---'
                'Btn_Nouveau.Visible = Cls_Privilege.VerifyRightOnObject(Btn_SaveEditUser, User_Conneted.IdGroupeuser)
                LinkButton_AddNew.Visible = Cls_Privilege.VerifyRightOnObject(Btn_SaveEditUser, User_Connected.IdGroupeuser)
                Btn_Save.Visible = Cls_Privilege.VerifyRightOnObject(Btn_SaveEditUser, User_Connected.IdGroupeuser)
                Btn_Annuler.Visible = Cls_Privilege.VerifyRightOnObject(Btn_SaveEditUser, User_Connected.IdGroupeuser)
                Btn_Reset_MotdePasse.Visible = Cls_Privilege.VerifyRightOnObject(Btn_ResetPassWordUser, User_Connected.IdGroupeuser)

                GridView_List.Columns(GridView_List.Columns.Count - 1).Visible = Cls_Privilege.VerifyRightOnObject(Btn_DeleteUser, User_Connected.IdGroupeuser)
                GridView_List.Columns(GridView_List.Columns.Count - 2).Visible = Cls_Privilege.VerifyRightOnObject(Btn_SaveEditUser, User_Connected.IdGroupeuser)
                GridView_List.Columns(GridView_List.Columns.Count - 3).Visible = Cls_Privilege.VerifyRightOnObject(Btn_ResetPassWordUser, User_Connected.IdGroupeuser)
                GridView_List.Columns(GridView_List.Columns.Count - 4).Visible = Cls_Privilege.VerifyRightOnObject(Btn_ResetPassWordUser, User_Connected.IdGroupeuser)
                GridView_List.Columns(GridView_List.Columns.Count - 5).Visible = Cls_Privilege.VerifyRightOnObject(Btn_ResetPassWordUser, User_Connected.IdGroupeuser)
                'GridView_List.Columns(GridView_List.Columns.Count - 6).Visible = Cls_Privilege.VerifyRightOnObject(ActionChangeUsername, User_Connected.IdGroupeuser)
            End If
        End If

        If Session([Global].GLOBAL_SESSION) Is Nothing Then
            '-- Session expirée --'
            GetOut = True
        Else
            Try
                User_Connected = CType(Session([Global].GLOBAL_SESSION), Cls_User)
                If Not (GlobalFunctions.IsUserStillConnected(User_Connected) And GlobalFunctions.IsUserStillActive(User_Connected)) Then
                    User_Connected.Set_Status_ConnectedUser(False)
                    User_Connected.Activite_Utilisateur_InRezo("Forced Log Off", "Forced to Log Off", Request.UserHostAddress)

                    GetOut = True
                    Session.RemoveAll()
                    _message = "Session expirée."
                    MessageToShow(_message)
                    Is_Acces_Page = True
                End If
            Catch ex As Exception
                GetOut = True
                _message = "Session expirée."
                MessageToShow(_message)
            End Try
        End If

        If GetOut Then
            Response.Redirect([Global].PAGE_LOGIN)
        End If

    End Sub
#End Region

#Region "Other Method - SAVE"

    Private Sub MessageToShow(ByVal _message As String, Optional ByVal E_or_S As String = "E")
        Panel_Msg.Visible = True
        GlobalFunctions.Message_Image(Image_Msg, E_or_S)
        Label_Msg.Text = _message
        Dialogue.alert(_message)
        If E_or_S = "S" Then
            Label_Msg.ForeColor = Drawing.Color.Green
        Else
            Label_Msg.ForeColor = Drawing.Color.Red
        End If
    End Sub

    Public Sub NewToDo()
        Panel_First.Visible = False
        Panel_List.Visible = True
        txt_ID.Text = "0"
        txtPrenom.Text = ""
        txtNom.Text = ""
        txtEmailCompte.Text = ""
        txtTelephone.Text = ""
        DDLGroupeUtilisateur.SelectedIndex = -1

        CBXActifyn.Checked = True
        Image_participant.ImageUrl = "~/Show_Image.aspx?Action=User&ID=" & 0

        LabelLastip.Text = ""
        LabelLastlogin.Text = ""

        Btn_Reset_MotdePasse.Visible = False
    End Sub

    Public Sub EnableControls()
        If Cls_Privilege.VerifyRightOnObject(Btn_DeleteUser, User_Connected.IdGroupeuser) Then
            GridView_List.Columns(GridView_List.Columns.Count - 1).Visible = True
        End If
        If Cls_Privilege.VerifyRightOnObject(Btn_SaveEditUser, User_Connected.IdGroupeuser) Then
            GridView_List.Columns(GridView_List.Columns.Count - 2).Visible = True
            'Btn_Nouveau.Visible = True
            'LinkButton_AddNew_Annonce.Visible = True
        End If
    End Sub

    Public Sub DisableControls()
        GridView_List.Columns(GridView_List.Columns.Count - 1).Visible = False
        GridView_List.Columns(GridView_List.Columns.Count - 2).Visible = False
        'Btn_Nouveau.Visible = False
        'LinkButton_AddNew_Annonce.Visible = False
    End Sub

    Public Sub Clear_Field()
        txt_ID.Text = "0"
        txtPrenom.Text = ""
        txtNom.Text = ""
        txtEmailCompte.Text = ""
        txtTelephone.Text = ""
        DDLGroupeUtilisateur.SelectedIndex = -1
    End Sub

    Private Sub Load_DataUser(ByVal IDUser As Long)
        Try
            txtEmailCompte.Enabled = Cls_Privilege.VerifyRightOnObject(ActionChangeUsername, User_Connected.IdGroupeuser)

            Dim obj As New Cls_User(IDUser)
            If obj.ID > 0 Then
                txt_ID.Text = obj.ID
                txtPrenom.Text = obj.Prenom
                txtNom.Text = obj.Nom
                txtEmailCompte.Text = obj.Username
                txtTelephone.Text = obj.Telephone
                DDLGroupeUtilisateur.SelectedIndex = DDLGroupeUtilisateur.FindItemIndexByValue(obj.IdGroupeuser)

                CBXActifyn.Checked = obj.Actifyn
                Image_participant.ImageUrl = "~/Show_Image.aspx?Action=User&ID=" & obj.ID

                'LabelLastip.Text = obj.Lastip
                'LabelLastlogin.Text = obj.Lastlogin

                Btn_Reset_MotdePasse.Visible = True
                Btn_Reset_MotdePasse.Visible = Cls_Privilege.VerifyRightOnObject(Btn_ResetPassWordUser, User_Connected.IdGroupeuser)
            End If

        Catch ex As Exception
            _message = ex.Message
            MessageToShow(_message)
            _message = " Methode -> [ Load_DataUser ] :" & ex.Message
            [Global].WriteError(_message, User_Connected)
        End Try
    End Sub

    Private Sub SAVE1()
        Try
            Dim obj As New Cls_User(CLng(txt_ID.Text))
            'obj.USERNAME = txt_UserName.Text
            'obj.Nom = Txt_NomComplet.Text
            'obj.Actifyn = CBX_Actif.Checked
            'obj.Confirmer = CBX_Confirmation.Checked
            'obj.IdGroupeuser = DDL_GroupUtilisateur.SelectedValue
            'If obj.ID = 0 Then
            '    If txt_MotdePasse.Text.Length > 0 Then
            '        obj.PASSWORD = txt_MotdePasse.Text
            '    Else
            '        obj.PASSWORD = txt_UserName.Text
            '    End If
            'End If

            obj.Save(User_Connected.Username)
            Count_DATAUser()
            _message = "Enregistrement effectuée"
            MessageToShow(_message, "S")
        Catch ex As Exception
            MessageToShow("[ Save Utilisateur ] " & ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ SAVE Utilisateur ] " & ex.Message)
        End Try
    End Sub

    Private Sub SAVE()
        Try
            Dim obj As New Cls_User(TypeSafeConversion.NullSafeLong(txt_ID.Text))
            'obj.Username = txtEmailCompte.Text
            obj.Prenom = txtPrenom.Text.Trim
            obj.Nom = txtNom.Text.Trim
            obj.Telephone = txtTelephone.Text.Trim
            obj.Actifyn = CBXActifyn.Checked
            obj.Mustchangepassword = CBXMustChangePassword.Checked


            If obj.ID = 0 Then ' Si c'est une creation de compte
                obj.Username = txtEmailCompte.Text
                If txt_MotdePasse.Text.Length > 0 Then
                    obj.Password = txt_MotdePasse.Text
                    GenerateRandomCode = txt_MotdePasse.Text
                Else
                    obj.Password = txtEmailCompte.Text
                    GenerateRandomCode = txtEmailCompte.Text
                End If

                If CBXGenererLeMotDePasse.Checked Then
                    GenerateRandomCode = GlobalFunctions.GenerateRandomCode
                    obj.Password = GenerateRandomCode
                End If
            Else
                If Cls_Privilege.VerifyRightOnObject(ActionChangeUsername, User_Connected.IdGroupeuser) Then
                    obj.Username = txtEmailCompte.Text
                End If
            End If

            obj.IdGroupeuser = TypeSafeConversion.NullSafeLong(DDLGroupeUtilisateur.SelectedValue)

            ' PHOTO
            If FileUpload1.FileName.Length > 0 AndAlso FileUpload1.PostedFile IsNot Nothing Then
                Is_Good_Extension(FileUpload1)
                Dim strLen As Integer = CInt(FileUpload1.PostedFile.InputStream.Length)
                Dim strArr(strLen) As Byte
                'rem Read stream into byte array.
                FileUpload1.PostedFile.InputStream.Read(strArr, 0, strLen)
                obj.Photo = strArr
            End If

            obj.Save(User_Connected.Username)
            If obj.ID > 0 Then
                If CBX_SendAccountAndPassword.Checked Then
                    Send_Notification_Account(obj, IIf(CLng(txt_ID.Text) > 0, "Mise à jour de votre compte ", "Enregistrement d'un nouvel utilisateur "))
                End If
                MessageToShow("Enregistrement effectué avec succès", "S")
            End If
            txt_ID.Text = obj.ID
            Image_participant.ImageUrl = "~/Show_Image.aspx?Action=User&ID=" & obj.ID
            User_Connected.Activite_Utilisateur_InRezo(IIf(CLng(txt_ID.Text) > 0, "UPDATE ", "ADD ") & "Utilisateur", obj.ID & " - " & obj.Username, Request.UserHostAddress)
        Catch ex As Exception
            _message = ex.Message
            MessageToShow(_message)
            _message = " Methode -> [ Btn_Save_Click ] :" & ex.Message
            [Global].WriteError(_message, User_Connected)
        End Try
    End Sub
#End Region

#Region "Load DATA"

    Private Sub LoadData_GridView_List()
        Dim objs As New List(Of Cls_User)
        Try
            objs = Cls_User.SearchAll_User_LIKE(txt_Search.Text.Trim, IDGroupe)

            BrainBaseArrayList.ApplySortSTR(objs, Me.ViewState("sortfield"), Me.ViewState("sortdirection"))
            GridView_List.DataSource = objs
            GridView_List.DataBind()
            If objs.Count = 0 Then
                'NewToDo()
                PagingPane.Visible = False
                Label_Result.Visible = True
            Else
                PagingPane.Visible = True
                Label_Result.Visible = False
            End If
        Catch ex As Exception
            MessageToShow(ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ LoadData_GridView_List Utilisateur ] " & ex.Message)
        End Try
    End Sub

    Private Sub Count_DATAUser()
        'Dim CompteAdmin As String = "Compte Admin: " & Cls_User.Count_AllUser_ByGroupe(1)
        'Dim CompteEntreprise As String = "Compte Entreprise: " & Cls_User.Count_AllUser_ByGroupe(2)
        'Dim CompteOperateur As String = "Compte Opérateur: " & Cls_User.Count_AllUser_ByGroupe(3)
        'Dim CompteAbonne As String = "Compte Abonnée: " & Cls_User.Count_AllUser_ByGroupe(4)

        'Label_Utilisateur.Text = "UTILISATEURS ( TOTAL: " & Cls_User.Count_AllUser_ByGroupe(0) & " )"
        'Label_CompteAdmin.Text = CompteAdmin
        'Label_CompteAdmin2.Text = CompteAdmin

        'Label_CompteEntreprise.Text = CompteEntreprise

        'LabelCompteOperateur.Text = CompteOperateur
        'LabelCompteOperateur2.Text = CompteOperateur

        'Label_CompteAbonne.Text = CompteAbonne
        'Label_CompteAbonne2.Text = CompteAbonne
    End Sub

    Private Sub Load_Group_Utilisateur()
        Dim obj As New List(Of Cls_GroupeUser)
        Try
            obj = Cls_GroupeUser.SearchAll
            DDLGroupeUtilisateur.Items.Clear()
            DDLGroupeUtilisateur.DataTextField = "GROUPE_DESCRIPTION"
            DDLGroupeUtilisateur.DataValueField = "ID"
            DDLGroupeUtilisateur.DataSource = obj
            DDLGroupeUtilisateur.DataBind()

            ''DDLGroupeUtilisateur.SelectedIndex = DDLGroupeUtilisateur.FindItemIndexByValue([Global]._GroupeEnum.Participant)
        Catch ex As Exception
            _message = ex.Message
            MessageToShow(_message)
            _message = " Methode -> [ Load_Group_Utilisateur ] :" & ex.Message
            [Global].WriteError(_message, User_Connected)
        End Try
    End Sub
#End Region

#Region "GridView Events"

    Protected Sub GridView_List_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView_List.PageIndexChanging
        Try
            GridView_List.PageIndex = e.NewPageIndex
            LoadData_GridView_List()
        Catch ex As Exception
            MessageToShow(ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ GridView_List_PageIndexChanging Utilisateur ] " & ex.Message)
        End Try
    End Sub

    Protected Sub GridView_List_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView_List.RowCommand
        Try
            Select Case e.CommandName
                Case "RESET_PASSWORD"
                    Dim obj As New Cls_User(TypeSafeConversion.NullSafeLong(e.CommandArgument))
                    Reset_Password(obj.ID)
                Case "DISCONNECT_USER"
                    Dim obj As New Cls_User(TypeSafeConversion.NullSafeLong(e.CommandArgument))
                    'obj.Set_Status_IsForcedOut(True)

                    Cls_User.Disconnect_User_ById(TypeSafeConversion.NullSafeLong(e.CommandArgument))
                    LoadData_GridView_List()
                    obj.Activite_Utilisateur_InRezo("Force Log Off", "Force " & obj.NOMCOMPLET & " to Log Off by" & User_Connected.Username, Request.UserHostAddress)
                    MessageToShow("L'utilisateur '<b>" & obj.NOMCOMPLET & "</b>' a été forcé de se reconnecter.", "S")
                Case "SEND_EMAIL"
                    Panel_NotificationSendEmail.Visible = True
                    Dim obj As New Cls_User(CLng(e.CommandArgument))
                    Dim Email As String = ""
                    If obj.ID > 0 Then
                        If txt_EmailTo.Text.Trim = "" Then
                            txt_EmailTo.Text = obj.Username
                            Me.Session("EMAIL") = obj.Username
                            Label_EmailDestination.Text = CLng(Label_EmailDestination.Text) + 1
                        Else
                            If Me.Session("EMAIL") <> obj.Username Then
                                txt_EmailTo.Text &= "," & obj.Username
                                Me.Session("EMAIL") = obj.Username
                                Label_EmailDestination.Text = CLng(Label_EmailDestination.Text) + 1
                            End If
                        End If
                        'txt_EmailTo.Text = Email.Replace("", "")
                    End If
                    'MessageToShow("SEND_EMAIL to " & obj.NOM_COMPLET_or_USERANAME, "S")
            End Select
        Catch ex As Exception
            MessageToShow(ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ GridView_List_RowCommand Utilisateur ] " & ex.Message)
            GlobalFunctions.Send_Mail_Erreur("[ " & User_Connected.Username & " ] Methode -> [ GridView_List_RowCommand Utilisateur ] " & ex.Message, ex.Message)
        End Try
    End Sub

    Protected Sub GridView_List_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView_List.RowDataBound
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                If GridView_List.PageIndex > 0 Then
                    CType(e.Row.FindControl("lbOrder"), Label).Text = GridView_List.PageSize * GridView_List.PageIndex + e.Row.RowIndex + 1
                Else
                    CType(e.Row.FindControl("lbOrder"), Label).Text = e.Row.RowIndex + 1
                End If

                CType(e.Row.FindControl("Btn_Del"), ImageButton).Attributes.Add("onclick", "return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur ')")
                CType(e.Row.FindControl("Btn_ResetPassword"), ImageButton).Attributes.Add("onclick", "return confirm('Êtes-vous sûr de vouloir réinitialiser le mot de passe de cet utilisateur ')")

                CType(e.Row.FindControl("Btn_Disconnect"), ImageButton).Visible = CType(e.Row.FindControl("CBX_CONNECTED_YN"), CheckBox).Checked

            End If
        Catch ex As Exception
            MessageToShow(ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ GridView_List_RowDataBound Utilisateur ] " & ex.Message)
        End Try
    End Sub

    Protected Sub GridView_List_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView_List.RowDeleting
        Try
            Dim obj As New Cls_User
            Try
                obj.Read(CLng(GridView_List.DataKeys(e.RowIndex).Value))
                obj.Delete()
                LoadData_GridView_List()
            Catch ex As Exception
                ErreurLog.WriteError(ex.Message)
                _message = ex.Message
                MessageToShow(_message)
                Label_Msg.Text = ex.Message
                Label_Msg.ForeColor = Drawing.Color.OrangeRed
            End Try
        Catch ex As Exception
            MessageToShow(ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ GridView_List_RowDeleting Utilisateur ] " & ex.Message)
        End Try
    End Sub

    Protected Sub GridView_List_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView_List.RowEditing
        Panel_First.Visible = True
        DisableControls()

        Try
            'Dim obj As New Cls_User
            'obj.Read(CLng(GridView_List.DataKeys(e.NewEditIndex).Value))
            'txt_ID.Text = obj.ID
            'txt_UserName.Text = obj.USERNAME
            'Txt_NomComplet.Text = obj.NOMCOMPLET
            'DDL_GroupUtilisateur.SelectedValue = obj.IdGroupeuser

            Load_DataUser(TypeSafeConversion.NullSafeLong(GridView_List.DataKeys(e.NewEditIndex).Value))
        Catch ex As Exception
            _message = ex.Message
            MessageToShow(_message)
            _message = " Methode -> [ GridView_List_RowEditing Utilisateur ] :" & ex.Message
            [Global].WriteError(_message, User_Connected)
        End Try
    End Sub

    Protected Sub GridView_List_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridView_List.Sorting
        Try
            Dim tmp As String = ""

            tmp = Me.ViewState("sortfield")
            Me.ViewState("sortfield") = e.SortExpression

            If tmp = Me.ViewState("sortfield") Then
                If Me.ViewState("sortdirection") = "ASC" Then
                    Me.ViewState("sortdirection") = "DESC"
                Else
                    Me.ViewState("sortdirection") = "ASC"
                End If
            Else
                Me.ViewState("sortdirection") = "ASC"
            End If
            LoadData_GridView_List()
        Catch ex As Exception
            MessageToShow(ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ Sorting Utilisateur ] " & ex.Message)
        End Try
    End Sub

    Private Sub DDL_PageSize_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DDL_PageSize.SelectedIndexChanged
        Try
            If DDL_PageSize.SelectedValue = 30000 Then
                GridView_List.AllowPaging = False
            Else
                GridView_List.AllowPaging = True
            End If
            GridView_List.PageSize = DDL_PageSize.SelectedValue
            LoadData_GridView_List()
        Catch ex As Exception
            MessageToShow(ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ PageSize Utilisateur ] " & ex.Message)
        End Try
    End Sub

#End Region

#Region "EVENTS BUTTON"
    Protected Sub Btn_Save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Save.Click
        Try
            SAVE()
            Clear_Field()
            Panel_First.Visible = False
            EnableControls()
            LoadData_GridView_List()
        Catch ex As Exception
            MessageToShow(ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ Btn_Save Utilisateur ] " & ex.Message)
        End Try
    End Sub

    Protected Sub Btn_Annuler_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Annuler.Click
        NewToDo()
        EnableControls()
    End Sub

    ''Protected Sub Btn_Nouveau_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_AddNew_Annonce.Click 'Btn_Nouveau.Click,
    ''    NewToDo()
    ''    Panel_First.Visible = True
    ''    DisableControls()
    ''    Clear_Field()
    ''End Sub

    Private Sub Reset_Password(ByVal IdUser As Long)
        Try
            Dim obj As New Cls_User(IdUser)
            If txt_MotdePasse.Text.Length > 0 Then
                obj.Password = txt_MotdePasse.Text
                GenerateRandomCode = txt_MotdePasse.Text
            Else
                obj.Password = txtEmailCompte.Text
                GenerateRandomCode = txtEmailCompte.Text
            End If

            If CBXGenererLeMotDePasse.Checked Then
                GenerateRandomCode = GlobalFunctions.GenerateRandomCode
                obj.Password = GenerateRandomCode
            End If
            obj.Mustchangepassword = True
            obj.ResetPassword(obj.Username)
            obj.Save(User_Connected.Username)
            If CBX_SendAccountAndPassword.Checked Then
                Send_Notification_Account(obj, "Mot de passe réinitialiser")
            End If
            _message = "Mot de passe utilisateur <b> " & obj.NOM_COMPLET_AND_USERANAME & "</b> vient d'être réinitialisé." & _
                "<br />L'utilisateur '<b>" & obj.Username & "</b>'  doit changer son Mot de passe."
            MessageToShow(_message, "S")
        Catch ex As Exception
            MessageToShow(ex.Message)
            ErreurLog.WriteError("[ " & User_Connected.Username & " ] Methode -> [ Reset_MotdePasse Utilisateur ] " & ex.Message)
            GlobalFunctions.Send_Mail_Erreur("[ " & User_Connected.Username & " ] Methode -> [ Reset_MotdePasse Utilisateur ] " & ex.Message, ex.Message)
        End Try
    End Sub

    Protected Sub Btn_Reset_MotdePasse_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Reset_MotdePasse.Click
        Reset_Password(CLng(txt_ID.Text))
    End Sub

    Protected Sub Btn_Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Search.Click
        IS_Search = True
        LoadData_GridView_List()
        'If Not IS_Trouve Then
        '    Label_Result.Visible = True
        'End If
    End Sub

    Protected Sub ButtonCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonCancel.Click
        Panel_NotificationSendEmail.Visible = False
        txt_EmailTo.Text = ""
    End Sub

    Protected Sub Btn_SendNotification_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_SendNotification.Click

    End Sub
#End Region

    Protected Sub LinkButton_AddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_AddNew.Click
        txt_ID.Text = "0"
        Panel_First.Visible = True
        DisableControls()
    End Sub

#Region ""

    REM SAVE Photo
    Protected Sub Btn_ChargerPhoto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_ChargerPhoto.Click
        Try
            ' --- Save --- '
            Dim obj As New Cls_User(TypeSafeConversion.NullSafeLong(txt_ID.Text))
            ' PHOTO
            If FileUpload1.FileName.Length > 0 AndAlso FileUpload1.PostedFile IsNot Nothing Then
                Is_Good_Extension(FileUpload1)
                Dim strLen As Integer = CInt(FileUpload1.PostedFile.InputStream.Length)
                Dim strArr(strLen) As Byte
                ' Read stream into byte array.
                FileUpload1.PostedFile.InputStream.Read(strArr, 0, strLen)
                obj.Photo = strArr
            Else
                IS_SendMail = False
                Throw New Exception("Téléchargez la photo à partir de votre ordinateur.<br />-La taille ne doit pas dépassée <b>100Kb</b>.<br /><a href='#' class='LinkSite' target='_blank'><i>Technique pour compresser une Image</i></a>.")
            End If
            obj.Save(User_Connected.Username)
            User_Connected.Activite_Utilisateur_InRezo(IIf(CLng(txt_ID.Text) > 0, "UPDATE ", "ADD ") & "Photo utilisateur", obj.ID & " - " & obj.NOMCOMPLET, Request.UserHostAddress)

            txt_ID.Text = obj.ID
            Image_participant.ImageUrl = "~/Show_Image.aspx?Action=User&ID=" & obj.ID
        Catch ex As Exception
            _message = ex.Message
            MessageToShow(_message)
            _message = "Methode -> [ Btn_ChargerPhoto_Click ] : : : " & ex.Message
            [Global].WriteError(_message, User_Connected, IS_SendMail)
        End Try
    End Sub

    REM verification de l'extention du fichier de la Photo
    Public Sub Is_Good_Extension(ByVal _FileUpload_ As FileUpload)
        Dim Liste_Ext() As String = Split(".jpg,.png,.bmp,.jpeg,.gif", ",")
        Dim Ext_Ok As Boolean = False
        REM 1Kb = 1024b |-|  50Kb = 51200b  |-|  1Mb = 1024Kb  |-|   1Mb = 1048576 byte
        If _FileUpload_.PostedFile.ContentLength > 102400 Then ' Taille limite 100Kb
            IS_SendMail = False
            Throw New Exception("La taille de l'image est trop volumineuse ! Taille limite 100 Kilo-octet [100Kb]")
        End If
        Dim _GetExtension As String = System.IO.Path.GetExtension(_FileUpload_.FileName).ToLower

        For i As Integer = 0 To Liste_Ext.Length - 1
            If _GetExtension.Trim.ToLower = Liste_Ext(i).Trim.ToLower Then
                Ext_Ok = True
                Exit For
            End If
        Next
        If Not Ext_Ok Then
            IS_SendMail = False
            Throw New Exception("Ce fichier n'est pas une image de type (gif, jpg, jpeg, png, bmp)...")
        End If
    End Sub

#End Region

#Region "NOTIFICATION EMAIL"
    REM Mail Notification to Admin
    Public Sub Send_Notification_Account(ByVal _ObjUser As Cls_User, Optional ByVal _Sujet As String = "Création Compte")
        Dim SMTPServer As String = [Global].SMTPServer
        Dim EmailFrom As String = [Global].EmailFrom
        Dim EmailPassword As String = [Global].EmailPassword

        Dim _SendTo As String = System.Configuration.ConfigurationManager.AppSettings("EmailToCopyTo")
        Dim _template As String

        Try
            Dim Courrier As New Cls_SendMail(SMTPServer, EmailFrom, EmailPassword)

            _template = "<h3 style='color:#0366FF;'>" & _Sujet & "</h3>"
            _template &= "<b> Date :</b>" & Now.ToString("dd-MM-yyyy") & "<hr />"
            _template &= "<b>Compte:  </b>" & _ObjUser.Username
            If CBX_SendAccountAndPassword.Checked Then
                _template &= "<br /><b>Mot de passe: </b>" & GenerateRandomCode & ""
            End If
            _template &= "<hr /><b>Prénom/Nom:  </b>" & _ObjUser.NOMCOMPLET
            _template &= "<br /><b>Téléphone: </b> " & _ObjUser.Telephone


            Courrier.From = EmailFrom
            Courrier.Subject = _Sujet
            Courrier.SendTo = _ObjUser.Username
            If CBX_SendAccountAndPassword.Checked Then
                Courrier.BCC = User_Connected.Username
            End If

            Courrier.DispalyName = "Administration"
            Courrier.Body = _template
            Courrier.MailMessage_2()
        Catch ex As Exception
            _message = [Global].MAIL_NOT_SENT & " Methode -> [ Send_Notification_ByAdmin ] ::: " & ex.Message
            [Global].WriteError(_message, User_Connected)
        Finally
        End Try
    End Sub
#End Region

End Class
