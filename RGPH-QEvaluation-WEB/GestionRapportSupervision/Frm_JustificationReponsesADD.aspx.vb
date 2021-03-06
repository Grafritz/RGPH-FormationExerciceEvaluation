﻿REM Generate By [GENERIC 12] Application *******
REM  Class Frm_JustificationReponses

REM Date:4/5/2018 12:58:02 PM
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer
Imports Telerik.Web.UI
Imports RGPH_QUETIONNAIRE_EXERCICE_Library

Partial Class GestionQEvaluation_Frm_JustificationReponsesADD
    Inherits Cls_BasePage ' LA CLASSE DE LA PAGE HERITE DE CETTE CLASSE DANS LE CAS OU NOUS AVONS UNE APPLICATION WEB multilingue


#Region "ATTRIBUTS"
    Private _message As String  ' VARIABLE SERVANT A LA RECUPERATION DE TOUS LES MESSAGES D'ECHECS OU DE SUCCES

    REM DEFINITION ET INITIALISATION DES CONSTANTE POUR LA SECURITE
    Private Const Nom_page As String = "PAGE-FORMULAIRE-JUSTIFICATIONREPONSES"  ' POUR LA PAGE
    Private Const Btn_Save As String = "Bouton-SAVE-JUSTIFICATIONREPONSES"       ' POUR LE BOUTON D'ENREGISTREMENT
    Private Const Btn_Edit As String = "Bouton-EDIT-JUSTIFICATIONREPONSES"       ' POUR LE BOUTON DE MODIFICATION
    Private Const Btn_Delete As String = "Bouton-DELETE-JUSTIFICATIONREPONSES"   ' POUR LE BOUTON DE SUPPRESSION

    Dim User_Connected As Cls_User          ' INSTANCE DE LA CLASSE UTILISATEUR - UTILISER POUR L'UTILISATEUR EN SESSION 
    Dim Is_Acces_Page As Boolean = True     ' LA VARIABLE SERVANT DE TEST POUR DONNEER L'ACCES A LA PAGE
    Dim GetOut As Boolean = False           ' LA VARIABLE SERVANT DE TEST POUR REDIRIGER L'UTILISATEUR VERS LA PAGE DE CONNEXION
    Dim PAGE_MERE As Long = 0 ' PAS TROP IMPORTANT...
    Dim PAGE_TITLE As String = ""
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Expires = -1
        Panel_Msg.Visible = False
        PAGE_TITLE = " Justification Reponses"
        Page.Title = [Global].Global_APP_NAME_SIGLE & " | " & PAGE_TITLE

        SYSTEME_SECURITE()  ' APPEL A LA METHODE SERVANT A TESTER LES COMPOSANTS DE LA PAGE Y COMPRIS LA PAGE ELLE MEME 

        '--- Si l'utilisateur n'a Access a la page les informations ne sont pas charger dans la Page_Load 
        If Is_Acces_Page Then
            If Not IsPostBack Then
                Label_Titre.Text = PAGE_TITLE
                'btnCancel.Attributes.Add("onclick", "javascript:void(closeWindow());")
                'rbtnAddJustificationReponses.Attributes.Add("onclick", "javascript:void(ShowAddUpdateForm('Frm_JustificationReponsesADD.aspx', 950, 650)); return false;")
                'BtnADDNew.Attributes.Add("onclick", "javascript:Open_Window('Frm_JustificationReponsesADD.aspx', '_self',500,400); return false;") 
                LOAD_ALL_DATA()
            End If
        End If
    End Sub

#Region "SECURITE"
    Public Sub SYSTEME_SECURITE()
        Try
            User_Connected = [Global].KeepUserContinuesToWork(User_Connected)

            'CType(Page.Master.FindControl("li_JustificationReponses"), HtmlControl).Attributes.Add("class", "active ")
            'CType(Page.Master.FindControl("i_JustificationReponses"), HtmlControl).Attributes.Add("class", "fa fa-folder-open fa-lg ")
            'CType(Page.Master.FindControl("DashMenu_2").FindControl("liGROUPE_PARAMETRES"), HtmlControl).Attributes.Add("class", "active treeview")
            'CType(Page.Master.FindControl("DashMenu_2").FindControl("liCentreDeDetentionListe"), HtmlControl).Attributes.Add("class", "active")
            CType(Page.Master.FindControl("LIAPP_MOBILE2"), HtmlControl).Attributes.Add("class", "active parent open")
            CType(Page.Master.FindControl("li_JustificationReponsesListing2"), HtmlControl).Attributes.Add("class", "active")

            LiteralStyleCSS.Text = ""
            If Request.QueryString([Global].ACTION) IsNot Nothing Then
                Select Case Request.QueryString([Global].ACTION)
                    Case [Global].HideMenuHeader
                        CType(Page.Master.FindControl([Global].Head_Nav_Menu), HtmlControl).Visible = False
                        CType(Page.Master.FindControl([Global].Head_Nav_MenuVertical), HtmlControl).Visible = False
                        Dim StyleCss As String = "<style type=""text/css""> #cl-wrapper { padding-top: 0px; } </style>"
                        LiteralStyleCSS.Text = StyleCss
                    Case Else
                        'span_SaveInfo_CloseAfter.Visible = False
                        'Btn_SaveInfo_CloseAfter.Visible = False
                End Select
            Else
                'span_SaveInfo_CloseAfter.Visible = False
                'Btn_SaveInfo_CloseAfter.Visible = False
            End If

            If Session([Global].GLOBAL_SESSION) IsNot Nothing Then
                User_Connected = CType(Session([Global].GLOBAL_SESSION), Cls_User)
                If Not Cls_Privilege.VerifyRightOnObject(Nom_page, User_Connected.IdGroupeuser) Then    ' VERIFICATION SI L'UTILISATEUR N'A PAS ACCES A LA PAGE
                    _message = [Global].NO_ACCES_PAGE
                    MessageToShow(_message)
                    Is_Acces_Page = False

                    Panel_First.Visible = False
                Else    ' SI L'UTILISATEUR A ACCES A LA PAGE ON VERIFIE POUR LES BOUTONS ET LES LIENS
                    '---  Okey vous avez acces a la page ---'
                    Dim _check As Boolean = Cls_Privilege.VerifyRightOnObject(Btn_Save, User_Connected.IdGroupeuser)
                    'Btn_ADD_JustificationReponses.Visible = _check
                    Btn_SaveInfo.Visible = _check
                    Btn_SaveInfo_AndContinuous.Visible = _check
                    'rdgJustificationReponses.MasterTableView.Columns.FindByUniqueNameSafe("editer").Visible = _check
                    If Request.QueryString([Global].ACTION) IsNot Nothing Then
                        If Request.QueryString([Global].ACTION).Equals([Global].HideMenuHeader) Then
                            Btn_SaveInfo.Visible = _check
                            Btn_SaveInfo_AndContinuous.Visible = _check
                        End If
                    End If
                End If
            End If

            If Session([Global].GLOBAL_SESSION) Is Nothing Then
                '-- Session expirée --'
                GetOut = True
            Else
                Try
                    User_Connected = CType(Session([Global].GLOBAL_SESSION), Cls_User)  ' ON VERIFIE SI LÚTILISATEUR A ETE FORCE DE SE CONNECTER 'PAR L'ADM
                    If Not (GlobalFunctions.IsUserStillConnected(User_Connected) And GlobalFunctions.IsUserStillActive(User_Connected)) Then
                        User_Connected.Set_Status_ConnectedUser(False)
                        User_Connected.Activite_Utilisateur_InRezo("Forced Log Off", "Forced to Log Off", Request.UserHostAddress)

                        GetOut = True
                        Session.RemoveAll()
                        '_message = "Session expirée."
                        'MessageToShow(_message)
                        Is_Acces_Page = True
                    End If
                Catch ex As Exception
                    GetOut = True
                    '_message = "Session expirée."
                    'MessageToShow(_message)
                End Try
            End If

            If GetOut Then ' REDIRECTIONNEMENT DE L'UTILISATUER OU PAS.
                CType(Page.Master.FindControl([Global].htmlMasterPage), HtmlControl).Attributes.Add("class", "lockscreen")
                CType(Page.Master.FindControl([Global].bodyMasterPage), HtmlControl).Attributes.Add("class", "texture")
                CType(Page.Master.FindControl([Global].Head_Nav_Menu), HtmlControl).Visible = False
                CType(Page.Master.FindControl([Global].Head_Nav_MenuVertical), HtmlControl).Visible = False

                Is_Acces_Page = False
                PageHeader.Attributes.Add("style", "visibility:hidden;")
                Panel_First.Visible = False
                LoginWUC.Visible = True
                Session([Global].GLOBAL_PAGENAME) = System.Web.HttpContext.Current.Request.Url.ToString()
                'Response.Redirect([Global].PAGE_LOGIN)
            End If

        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            Is_Acces_Page = False
            Panel_First.Visible = False
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub
#End Region

#Region "Other Method - MessageToShow"
    Private Sub MessageToShow(ByVal _message As String, Optional ByVal E_or_S As String = "E", Optional ByVal ShowPopUp As Boolean = True)
        Panel_Msg.Visible = True
        GlobalFunctions.Message_Image(Image_Msg, E_or_S)
        Label_Msg.Text = _message
        If ShowPopUp Then
            RadAjaxManager1.ResponseScripts.Add("alert('" & [Global].GetTextFromHtml(_message).Replace("'", "\'") & "');")
            'Dialogue.alert([Global].GetTextFromHtml(_message))
        End If
        If E_or_S = "S" Then
            Style_Division(DIV_Msg, "alert alert-success alert-dismissable")
            Style_Division(Icon_Msg, "fa  fa-thumbs-up")
        Else
            Style_Division(DIV_Msg, "alert alert-danger alert-dismissable")
            Style_Division(Icon_Msg, "fa  fa-thumbs-down")
        End If
    End Sub
#End Region

#Region "Load DATA"
    Private Sub LOAD_ALL_DATA()
        FillCombo_CodeQuestion()
        LOAD_JUSTIFICATIONREPONSES()
    End Sub

    Private Sub LOAD_JUSTIFICATIONREPONSES()
        Try
            If Request.QueryString("ID") IsNot Nothing Then
                Dim _id As Long = TypeSafeConversion.NullSafeLong(Request.QueryString("ID"))
                txt_CodeJustificationReponses_Hid.Text = _id
                Dim obj As New Cls_JustificationReponses(_id)
                If obj.ID > 0 Then

                    Dim _Check = Cls_Privilege.VerifyRightOnObject(Btn_Edit, User_Connected.IdGroupeuser)
                    Btn_SaveInfo.Visible = _Check
                    Btn_SaveInfo_AndContinuous.Visible = _Check
                    With obj
                        DDL_CodeQuestion.SelectedIndex = DDL_CodeQuestion.Items.IndexOf(DDL_CodeQuestion.Items.FindByValue(.CodeQuestion))
                        txt_LibelleJustification.Text = .LibelleJustification
                        CB_Iscorrect.Checked = .Iscorrect
                    End With
                End If
            ElseIf Request.QueryString("IDQuestion") IsNot Nothing Then
                Dim obj As New Cls_Questions(TypeSafeConversion.NullSafeLong(Request.QueryString("IDQuestion")))
                If obj.ID > 0 Then
                    DDL_CodeQuestion.SelectedIndex = DDL_CodeQuestion.Items.IndexOf(DDL_CodeQuestion.Items.FindByValue(obj.ID))
                    DDL_CodeQuestion.Enabled = False
                    'rem Selectionner la reponse identifier comme etant la bonne
                    CheckIsSaveBonneReponse(obj.ID)
                End If
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Sub FillCombo_CodeQuestion()
        Try
            Dim objs1 As List(Of Cls_Questions) = Cls_Questions.SearchAll
            With DDL_CodeQuestion
                .DataSource = objs1
                .DataValueField = "ID"
                .DataTextField = "LibelleQuestion"
                .DataBind()
                .Items.Insert(0, New ListItem(" - Choisir(" & objs1.Count & ") - ", 0))
                .SelectedIndex = -1
                '.Items.Sort()
                '.Items.Insert(0, New RadComboBoxItem(" - Choisir -", ""))
                '.SelectedIndex = 0
                '.EmptyMessage = "- Choisir -"
            End With
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

#End Region

#Region "METHODES - SAVE"
    Private Sub SAVE_JUSTIFICATIONREPONSES(Optional isClose As Boolean = True)
        Try
            Dim _id As Long = TypeSafeConversion.NullSafeLong(txt_CodeJustificationReponses_Hid.Text)
            Dim obj As New Cls_JustificationReponses(_id)
            With obj
                .CodeQuestion = DDL_CodeQuestion.SelectedValue
                .LibelleJustification = txt_LibelleJustification.Text
                .Iscorrect = CB_Iscorrect.Checked
            End With
            obj.Save(User_Connected.Username)

            If CB_Iscorrect.Checked Then
                obj.Set_Iscorrect_ForOnly_ThisID()
            End If
            REM TRACE UTILUSATEUR / Trace Transaction
            User_Connected.Activite_Utilisateur_InRezo(IIf(_id <= 0, "ADD ", "EDIT ") & " JustificationReponses", obj.LogData(obj), Request.UserHostAddress)
            txt_CodeJustificationReponses_Hid.Text = obj.ID
            '_message = "Sauvegarde Effectuée"
            MessageToShow([Global].Msg_Enregistrement_Effectue, "S", False)
            'RadAjaxManager1.ResponseScripts.Add("CloseAndRefreshListeJustificationReponses();")
            If isClose Then
                If Request.QueryString("IDQuestion") IsNot Nothing Then
                    RadAjaxManager1.ResponseScripts.Add("CloseAndrefreshJustification();")
                Else
                    RadAjaxManager1.ResponseScripts.Add("CloseAndRefreshListe();")
                End If
            Else
                txt_CodeJustificationReponses_Hid.Text = "0"
                txt_LibelleJustification.Text = String.Empty
                CB_Iscorrect.Checked = False
                CheckIsSaveBonneReponse(obj.CodeQuestion)
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Sub CheckIsSaveBonneReponse(ByVal CodeQuestion As Long)
        Try
            CB_Iscorrect.Enabled = True
            Dim brep As New Cls_JustificationReponses(CodeQuestion, [Global].BONNE_REPONSE)
            If brep.ID > 0 Then
                LiteralBonneReponse.Text = "<span style='color:green;'>Bonne Justification:</span>" & brep.LibelleJustification
                Dim CodeReponse As Long = TypeSafeConversion.NullSafeLong(txt_CodeJustificationReponses_Hid.Text)
                If CodeReponse > 0 Then
                    If brep.ID = CodeReponse Then

                    Else
                        CB_Iscorrect.Checked = False
                        'CB_Iscorrect.Enabled = False
                    End If
                End If
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub
#End Region

#Region "EVENTS BUTTON"
    Protected Sub Btn_SaveInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_SaveInfo.Click
        SAVE_JUSTIFICATIONREPONSES()
    End Sub

    Protected Sub Btn_SaveInfo_AndContinuous_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_SaveInfo_AndContinuous.Click
        SAVE_JUSTIFICATIONREPONSES(False)
    End Sub

    Protected Sub Btn_Annuler_Click(sender As Object, e As EventArgs) Handles Btn_Annuler.Click, Btn_Annuler2.Click
        PAGE_MERE = TypeSafeConversion.NullSafeLong(Request.QueryString([Global].PAGE_MERE))
        If Request.QueryString([Global].ACTION) IsNot Nothing Then
            Select Case Request.QueryString([Global].ACTION)
                Case [Global].HideMenuHeader
                    RadAjaxManager1.ResponseScripts.Add("CloseAndRefreshListe();")
                Case Else
                    Response.Redirect([Global].GetPath_PageMere(PAGE_MERE))
            End Select
        Else
            Response.Redirect([Global].GetPath_PageMere(PAGE_MERE))
        End If
    End Sub

    Private Sub DDL_CodeQuestion_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL_CodeQuestion.SelectedIndexChanged
        CheckIsSaveBonneReponse(TypeSafeConversion.NullSafeLong(DDL_CodeQuestion.SelectedValue))
    End Sub
#End Region

End Class
