﻿REM Generate By [GENERIC 12] Application *******
REM  Class Frm_Questions

REM Date:4/4/2018 2:40:24 PM
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer
Imports Telerik.Web.UI
Imports RGPH_QUETIONNAIRE_EXERCICE_Library

Partial Class GestionQEvaluation_Frm_QuestionsADD
    Inherits Cls_BasePage ' LA CLASSE DE LA PAGE HERITE DE CETTE CLASSE DANS LE CAS OU NOUS AVONS UNE APPLICATION WEB multilingue


#Region "ATTRIBUTS"
    Private _message As String  ' VARIABLE SERVANT A LA RECUPERATION DE TOUS LES MESSAGES D'ECHECS OU DE SUCCES

    REM DEFINITION ET INITIALISATION DES CONSTANTE POUR LA SECURITE
    Private Const Nom_page As String = "PAGE-FORMULAIRE-QUESTIONS"  ' POUR LA PAGE
    Private Const Btn_Save As String = "Bouton-SAVE-QUESTIONS"       ' POUR LE BOUTON D'ENREGISTREMENT
    Private Const Btn_Edit As String = "Bouton-EDIT-QUESTIONS"       ' POUR LE BOUTON DE MODIFICATION
    Private Const Btn_Delete As String = "Bouton-DELETE-QUESTIONS"   ' POUR LE BOUTON DE SUPPRESSION

    Dim User_Connected As Cls_User          ' INSTANCE DE LA CLASSE UTILISATEUR - UTILISER POUR L'UTILISATEUR EN SESSION 
    Dim Is_Acces_Page As Boolean = True     ' LA VARIABLE SERVANT DE TEST POUR DONNEER L'ACCES A LA PAGE
    Dim GetOut As Boolean = False           ' LA VARIABLE SERVANT DE TEST POUR REDIRIGER L'UTILISATEUR VERS LA PAGE DE CONNEXION
    Dim PAGE_MERE As Long = 0 ' PAS TROP IMPORTANT...
    Dim PAGE_TITLE As String = ""

    Private Const Question As String = "Question"
    Private Const Reponse As String = "Reponse"
    Private Const JustificationReponse As String = "JustificationReponse"

    Private Const SESSION_PAGE_TAB_1 As String = "SESSION_PAGE_REPONSE_TAB_1"
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Expires = -1
        Panel_Msg.Visible = False
        PAGE_TITLE = " Questions"
        Page.Title = [Global].Global_APP_NAME_SIGLE & " | " & PAGE_TITLE

        SYSTEME_SECURITE()  ' APPEL A LA METHODE SERVANT A TESTER LES COMPOSANTS DE LA PAGE Y COMPRIS LA PAGE ELLE MEME 

        '--- Si l'utilisateur n'a Access a la page les informations ne sont pas charger dans la Page_Load 
        If Is_Acces_Page Then
            If Not IsPostBack Then
                Label_Titre.Text = PAGE_TITLE
                LinkButton_NewJustifications.Attributes.Add("onclick", "javascript:void(alert('Entrer la question en premier'););")
                'rbtnAddQuestions.Attributes.Add("onclick", "javascript:void(ShowAddUpdateForm('Frm_QuestionsADD.aspx', 950, 650)); return false;")
                'BtnADDNew.Attributes.Add("onclick", "javascript:Open_Window('Frm_QuestionsADD.aspx', '_self',500,400); return false;") 
                LOAD_ALL_DATA()
                Me.Session(SESSION_PAGE_TAB_1) = Question
            End If
        End If

        If Session(SESSION_PAGE_TAB_1) IsNot Nothing Then
            ShowOrHidePlaceHolder(Session(SESSION_PAGE_TAB_1).ToString)
        Else
            Me.Session(SESSION_PAGE_TAB_1) = Question
            ShowOrHidePlaceHolder(Question)
        End If
    End Sub

#Region "SECURITE"
    Public Sub SYSTEME_SECURITE()
        Try
            User_Connected = [Global].KeepUserContinuesToWork(User_Connected)

            'CType(Page.Master.FindControl("li_Questions"), HtmlControl).Attributes.Add("class", "active ")
            'CType(Page.Master.FindControl("i_Questions"), HtmlControl).Attributes.Add("class", "fa fa-folder-open fa-lg ")
            'CType(Page.Master.FindControl("DashMenu_2").FindControl("liGROUPE_PARAMETRES"), HtmlControl).Attributes.Add("class", "active treeview")
            'CType(Page.Master.FindControl("DashMenu_2").FindControl("liCentreDeDetentionListe"), HtmlControl).Attributes.Add("class", "active")
            CType(Page.Master.FindControl("LIAPP_MOBILE"), HtmlControl).Attributes.Add("class", "active parent open")
            CType(Page.Master.FindControl("li_QuestionsListing"), HtmlControl).Attributes.Add("class", "active")

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
                    'Btn_ADD_Questions.Visible = _check
                    Btn_SaveInfo.Visible = _check
                    'rdgQuestions.MasterTableView.Columns.FindByUniqueNameSafe("editer").Visible = _check
                    If Request.QueryString([Global].ACTION) IsNot Nothing Then
                        If Request.QueryString([Global].ACTION).Equals([Global].HideMenuHeader) Then
                            Btn_SaveInfo.Visible = _check
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
        LOAD_QUESTIONS()
    End Sub

    Private Sub LOAD_QUESTIONS()
        Try
            If Request.QueryString("ID") IsNot Nothing Then
                Dim _id As Long = TypeSafeConversion.NullSafeLong(Request.QueryString("ID"))
                txt_CodeQuestions_Hid.Text = _id
                Dim obj As New Cls_Questions(_id)
                If obj.ID > 0 Then
                    'PanelChoixReponse.Visible = True
                    'rbtnAddPossibiliteReponse.Attributes.Add("onclick", "javascript:void(ShowAddUpdateForm('Frm_Questions_ReponsesADD.aspx?IDQuestion=" & obj.ID & "&" & [Global].ACTION & "=" & [Global].HideMenuHeader & ", 850, 550)); return false;")
                    LinkButton_NewReponse.Attributes.Add("onclick", "javascript:void(ShowAddUpdateFormMaximized('Frm_ReponsesADD.aspx?IDQuestion=" & obj.ID & "&" & [Global].ACTION & "=" & [Global].HideMenuHeader & "',900,650)); return false;")
                    LinkButton_NewJustifications.Attributes.Add("onclick", "javascript:void(ShowAddUpdateFormMaximized('Frm_JustificationReponsesADD.aspx?IDQuestion=" & obj.ID & "&" & [Global].ACTION & "=" & [Global].HideMenuHeader & "',900,650)); return false;")

                    Btn_SaveInfo.Visible = Cls_Privilege.VerifyRightOnObject(Btn_Edit, User_Connected.IdGroupeuser)
                    With obj
                        txt_CodeQuestions_Hid.Text = .ID
                        txt_LibelleQuestion.Text = .LibelleQuestion
                        'txt_DetailsQuestion.Text = .DetailsQuestion
                        'txt_IndicationsQuestion.Text = .IndicationsQuestion
                        CB_AvoirJustificationYN.Checked = .AvoirJustificationYN
                        'txt_TypeQuestion.Text = .TypeQuestion
                        txt_ScoreTotal.Text = .ScoreTotal
                        'txt_Commentaire.Text = .Commentaire
                        'txt_CaractereAccepte.Text = .CaractereAccepte
                        'txt_NbreValeurMinimal.Text = .NbreValeurMinimal
                        'txt_NbreCaractereMaximal.Text = .NbreCaractereMaximal
                        'txt_qPrecedent.Text = .qPrecedent
                        'txt_qSuivant.Text = .qSuivant

                        BindGrid()

                        li_JustificationReponse.Visible = CB_AvoirJustificationYN.Checked
                        PanelListeJustifications.Visible = CB_AvoirJustificationYN.Checked

                        If CB_AvoirJustificationYN.Checked Then
                            BindGrid_Justification()
                        End If
                    End With
                End If
            ElseIf Request.QueryString("IDFormulaire") IsNot Nothing Then
                Dim obj As New Cls_FormulaireExercices(TypeSafeConversion.NullSafeLong(Request.QueryString("IDFormulaire")))
                If obj.ID > 0 Then
                    DIV_InfoFormExercice.Visible = True
                    Literal_LibelleExercice.Text = obj.LibelleExercice
                    txt_IDFormulaire_Hide.Text = obj.ID
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

    Private Sub BindGrid(Optional ByVal _refresh As Boolean = True)
        Dim objs As List(Of Cls_Reponses)
        Dim _ret As Long = 0
        Try
            Dim _CodeQuestion As String = TypeSafeConversion.NullSafeString(txt_CodeQuestions_Hid.Text)
            objs = Cls_Reponses.SearchAllBy_CodeQuestion(_CodeQuestion)
            rdgQuestions_Reponses.DataSource = objs
            If _refresh Then
                rdgQuestions_Reponses.DataBind()
            End If
            _ret = objs.Count
            LabelReponseTitre.Text = " <small class=""badge badge-primary"">" & _ret & "</small>"
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Sub BindGrid_Justification(Optional ByVal _refresh As Boolean = True)
        Dim objs As List(Of Cls_JustificationReponses)
        Dim _ret As Long = 0
        Try
            Dim _CodeQuestion As String = TypeSafeConversion.NullSafeString(txt_CodeQuestions_Hid.Text)
            objs = Cls_JustificationReponses.SearchAllBy_CodeQuestion(_CodeQuestion)
            RadGrid_Justifications.DataSource = objs
            If _refresh Then
                RadGrid_Justifications.DataBind()
            End If
            _ret = objs.Count
            Literal_Justifications.Text = " <small class=""badge badge-warning"">" & _ret & "</small>"
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
    Private Sub SAVE_QUESTIONS()
        Try
            Dim _id As Long = TypeSafeConversion.NullSafeLong(txt_CodeQuestions_Hid.Text)
            Dim obj As New Cls_Questions(_id)
            With obj
                .LibelleQuestion = txt_LibelleQuestion.Text
                '.DetailsQuestion = txt_DetailsQuestion.Text
                '.IndicationsQuestion = txt_IndicationsQuestion.Text
                .AvoirJustificationYN = CB_AvoirJustificationYN.Checked
                .TypeQuestion = 1 'txt_TypeQuestion.Text
                .ScoreTotal = txt_ScoreTotal.Text
                '.Commentaire = txt_Commentaire.Text
                '.CaractereAccepte = txt_CaractereAccepte.Text
                '.NbreValeurMinimal = txt_NbreValeurMinimal.Text
                '.NbreCaractereMaximal = txt_NbreCaractereMaximal.Text
                '.qPrecedent = txt_qPrecedent.Text
                '.qSuivant = txt_qSuivant.Text
            End With
            obj.Save(User_Connected.Username)
            REM TRACE UTILUSATEUR / Trace Transaction
            User_Connected.Activite_Utilisateur_InRezo(IIf(_id <= 0, "ADD ", "EDIT ") & " Questions", obj.LogData(obj), Request.UserHostAddress)
            txt_CodeQuestions_Hid.Text = obj.ID
            '_message = "Sauvegarde Effectuée"
            MessageToShow([Global].Msg_Enregistrement_Effectue, "S", False)

            li_JustificationReponse.Visible = CB_AvoirJustificationYN.Checked
            PanelListeJustifications.Visible = CB_AvoirJustificationYN.Checked

            ''RadAjaxManager1.ResponseScripts.Add("CloseAndRefreshListeQuestions();")
            'RadAjaxManager1.ResponseScripts.Add("CloseAndRefreshListe();")
            'Dim id2 As Long = TypeSafeConversion.NullSafeLong(Request.QueryString("ID"))
            'If id2 <= 0 Then
            '    'Response.Redirect("~/GestionQEvaluation/Frm_QuestionsADD.aspx?ID=" & obj.ID & "&" & [Global].ACTION & "=" & [Global].HideMenuHeader & "")
            'Else
            Me.Session(SESSION_PAGE_TAB_1) = Reponse
                ShowOrHidePlaceHolder(Reponse)
                'PanelChoixReponse.Visible = True
                LinkButton_NewReponse.Attributes.Add("onclick", "javascript:void(ShowAddUpdateFormMaximized('Frm_ReponsesADD.aspx?IDQuestion=" & obj.ID & "&" & [Global].ACTION & "=" & [Global].HideMenuHeader & "',900,650)); return false;")
            LinkButton_NewJustifications.Attributes.Add("onclick", "javascript:void(ShowAddUpdateFormMaximized('Frm_JustificationReponsesADD.aspx?IDQuestion=" & obj.ID & "&" & [Global].ACTION & "=" & [Global].HideMenuHeader & "',900,650)); return false;")
            Btn_SaveInfo.Visible = Cls_Privilege.VerifyRightOnObject(Btn_Edit, User_Connected.IdGroupeuser)
            'End If

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
        SAVE_QUESTIONS()
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
#End Region


#Region "RADGRID EVENTS"

#Region "RADGRID EVENTS REPONSES"
    Protected Sub rdgQuestions_Reponses_ItemCommand(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles rdgQuestions_Reponses.ItemCommand
        Try
            Dim _id As Long = TypeSafeConversion.NullSafeLong(e.CommandArgument)
            Select Case e.CommandName
                Case "delete"
                    Dim obj As New Cls_Reponses(_id)
                    obj.Delete()
                    User_Connected.Activite_Utilisateur_InRezo("DELETE " & PAGE_TITLE, obj.LogData(obj), Request.UserHostAddress)
                    'User_Connected.Activite_Utilisateur_InRezo("DELETE Questions_Reponses ", obj.ID & " - Code:" & obj.Titrerapport & " Prop:", Request.UserHostAddress)
                    MessageToShow([Global].Msg_Information_Supprimee_Avec_Succes, "S")
                    rdgQuestions_Reponses.Rebind()
            End Select
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Protected Sub rdgQuestions_Reponses_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles rdgQuestions_Reponses.ItemDataBound
        Try
            Dim gridDataItem = TryCast(e.Item, GridDataItem)
            If e.Item.ItemType = GridItemType.Item Or e.Item.ItemType = GridItemType.AlternatingItem Then
                'Dim _lnk As HyperLink = DirectCast(gridDataItem.FindControl("hlk"), HyperLink)
                'Dim _lbl_ID As Label = DirectCast(gridDataItem.FindControl("lbl_ID"), Label)
                '_lnk.Attributes.Clear()
                '_lnk.Attributes.Add("onclick", "javascript:void(ShowAddUpdateForm('Frm_Questions_ReponsesADD.aspx?ID=" & CLng(_lbl_ID.Text) & "', 750, 400));")
            End If

            If (gridDataItem IsNot Nothing) Then
                Dim item As GridDataItem = gridDataItem
                CType(item.FindControl("lbOrder"), Label).Text = rdgQuestions_Reponses.PageSize * rdgQuestions_Reponses.CurrentPageIndex + (item.RowIndex / 2)

                Dim imagedelete As ImageButton = CType(item("delete").Controls(0), ImageButton)
                Dim imageediter As ImageButton = CType(item("editer").Controls(0), ImageButton)
                imagedelete.ToolTip = "Effacer"
                imageediter.ToolTip = "Editer"
                imagedelete.CommandArgument = CType(DataBinder.Eval(e.Item.DataItem, "ID"), String)
                imageediter.Attributes.Add("onclick", "javascript:void(ShowAddUpdateForm('Frm_ReponsesADD.aspx?ID=" & CType(DataBinder.Eval(e.Item.DataItem, "ID"), Long) & "&" & [Global].ACTION & "=" & [Global].HideMenuHeader & "',900,650));")
                REM Privilege
                'imageediter.Visible = Cls_Privilege.VerifyRightOnObject(Btn_Save, User_Connected.IdGroupeuser)
                'imagedelete.Visible = Cls_Privilege.VerifyRightOnObject(Btn_Delete, User_Connected.IdGroupeuser)
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Protected Sub rdgQuestions_Reponses_NeedDataSource(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles rdgQuestions_Reponses.NeedDataSource
        If IsPostBack Then
            BindGrid(False)
        End If
    End Sub
#End Region

#Region "RADGRID EVENTS JUSTIFICATION"
    Protected Sub RadGrid_Justifications_ItemCommand(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid_Justifications.ItemCommand
        Try
            Dim _id As Long = TypeSafeConversion.NullSafeLong(e.CommandArgument)
            Select Case e.CommandName
                Case "delete"
                    Dim obj As New Cls_JustificationReponses(_id)
                    obj.Delete()
                    'User_Connected.Activite_Utilisateur_InRezo("DELETE " & PAGE_TITLE, obj.LogData(obj), Request.UserHostAddress)
                    'User_Connected.Activite_Utilisateur_InRezo("DELETE Questions_Reponses ", obj.ID & " - Code:" & obj.Titrerapport & " Prop:", Request.UserHostAddress)
                    MessageToShow([Global].Msg_Information_Supprimee_Avec_Succes, "S")
                    RadGrid_Justifications.Rebind()
            End Select
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Protected Sub RadGrid_Justifications_Reponses_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Justifications.ItemDataBound
        Try
            Dim gridDataItem = TryCast(e.Item, GridDataItem)
            If e.Item.ItemType = GridItemType.Item Or e.Item.ItemType = GridItemType.AlternatingItem Then
                'Dim _lnk As HyperLink = DirectCast(gridDataItem.FindControl("hlk"), HyperLink)
                'Dim _lbl_ID As Label = DirectCast(gridDataItem.FindControl("lbl_ID"), Label)
                '_lnk.Attributes.Clear()
                '_lnk.Attributes.Add("onclick", "javascript:void(ShowAddUpdateForm('Frm_Questions_ReponsesADD.aspx?ID=" & CLng(_lbl_ID.Text) & "', 750, 400));")
            End If

            If (gridDataItem IsNot Nothing) Then
                Dim item As GridDataItem = gridDataItem
                CType(item.FindControl("lbOrder"), Label).Text = RadGrid_Justifications.PageSize * RadGrid_Justifications.CurrentPageIndex + (item.RowIndex / 2)

                Dim imagedelete As ImageButton = CType(item("delete").Controls(0), ImageButton)
                Dim imageediter As ImageButton = CType(item("editer").Controls(0), ImageButton)
                imagedelete.ToolTip = "Effacer"
                imageediter.ToolTip = "Editer"
                imagedelete.CommandArgument = CType(DataBinder.Eval(e.Item.DataItem, "ID"), String)
                imageediter.Attributes.Add("onclick", "javascript:void(ShowAddUpdateForm('Frm_JustificationReponsesADD.aspx?ID=" & CType(DataBinder.Eval(e.Item.DataItem, "ID"), Long) & "&" & [Global].ACTION & "=" & [Global].HideMenuHeader & "',900,650));")
                REM Privilege
                'imageediter.Visible = Cls_Privilege.VerifyRightOnObject(Btn_Save, User_Connected.IdGroupeuser)
                'imagedelete.Visible = Cls_Privilege.VerifyRightOnObject(Btn_Delete, User_Connected.IdGroupeuser)
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Protected Sub RadGrid_Justifications_NeedDataSource(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles RadGrid_Justifications.NeedDataSource
        If IsPostBack Then
            BindGrid_Justification(False)
        End If
    End Sub
#End Region

#End Region


#Region "TABULATION /  ONGLETS / EVENTS"
    Private Sub ShowOrHidePlaceHolder(ByVal _placeHolderName As String)

        li_Question.Attributes.Add("class", "")
        i_Question.Attributes.Add("class", "fa fa-folder")
        DIV_Content_Question.Attributes.Add("class", "tab-pane cont")
        DIV_Content_Question.Visible = False

        li_Reponse.Attributes.Add("class", "")
        i_Reponse.Attributes.Add("class", "fa fa-folder")
        DIV_Content_Reponse.Attributes.Add("class", "tab-pane cont")
        DIV_Content_Reponse.Visible = False

        li_JustificationReponse.Attributes.Add("class", "")
        i_JustificationReponse.Attributes.Add("class", "fa fa-folder")
        DIV_Content_JustificationReponse.Attributes.Add("class", "tab-pane cont")
        DIV_Content_JustificationReponse.Visible = False


        Select Case _placeHolderName
            Case Question
                li_Question.Attributes.Add("class", "active")
                i_Question.Attributes.Add("class", "fa fa-folder-open")
                DIV_Content_Question.Attributes.Add("class", "tab-pane active cont")
                DIV_Content_Question.Visible = True

            Case Reponse
                li_Reponse.Attributes.Add("class", "active")
                i_Reponse.Attributes.Add("class", "fa fa-folder-open")
                DIV_Content_Reponse.Attributes.Add("class", "tab-pane active cont")
                DIV_Content_Reponse.Visible = True

            Case JustificationReponse
                li_JustificationReponse.Attributes.Add("class", "active")
                i_JustificationReponse.Attributes.Add("class", "fa fa-folder-open")
                DIV_Content_JustificationReponse.Attributes.Add("class", "tab-pane active cont")
                DIV_Content_JustificationReponse.Visible = True

        End Select
    End Sub

    Protected Sub LinkButton_Question_Click(sender As Object, e As EventArgs) Handles LinkButton_Question.Click
        Me.Session(SESSION_PAGE_TAB_1) = Question
        ShowOrHidePlaceHolder(Question)
    End Sub

    Protected Sub LinkButton_Reponse_Click(sender As Object, e As EventArgs) Handles LinkButton_Reponse.Click
        Me.Session(SESSION_PAGE_TAB_1) = Reponse
        ShowOrHidePlaceHolder(Reponse)
    End Sub

    Protected Sub LinkButton_JustificationReponse_Click(sender As Object, e As EventArgs) Handles LinkButton_JustificationReponse.Click
        Me.Session(SESSION_PAGE_TAB_1) = JustificationReponse
        ShowOrHidePlaceHolder(JustificationReponse)
    End Sub
#End Region

    Protected Sub RadAjaxManager1_AjaxRequest(ByVal sender As Object, ByVal e As Telerik.Web.UI.AjaxRequestEventArgs) Handles RadAjaxManager1.AjaxRequest
        Try
            Select Case e.Argument
                Case "Reload"
                    BindGrid(True)
                    BindGrid_Justification(True)
                Case "refreshReponse"
                    BindGrid(True)
                Case "refreshListeJustification"
                    BindGrid_Justification(True)
            End Select
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

End Class
