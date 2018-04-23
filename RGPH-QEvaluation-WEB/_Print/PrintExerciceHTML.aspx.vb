
REM Date:13-Apr-2018 01:11 PM
Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer
Imports Telerik.Web.UI
Imports RGPH_QUETIONNAIRE_EXERCICE_Library
Imports SelectPdf

Partial Class _Print_PrintExerciceHTML
    Inherits Cls_BasePage ' LA CLASSE DE LA PAGE HERITE DE CETTE CLASSE DANS LE CAS OU NOUS AVONS UNE APPLICATION WEB multilingue


#Region "ATTRIBUTS"
    Private _message As String  ' VARIABLE SERVANT A LA RECUPERATION DE TOUS LES MESSAGES D'ECHECS OU DE SUCCES

    REM DEFINITION ET INITIALISATION DES CONSTANTE POUR LA SECURITE
    Private Const Nom_page As String = "PAGE-FORMULAIRE-FORMULAIREEXERCICES"  ' POUR LA PAGE
    Private Const Btn_Save As String = "Bouton-SAVE-FORMULAIREEXERCICES"       ' POUR LE BOUTON D'ENREGISTREMENT
    Private Const Btn_Edit As String = "Bouton-EDIT-FORMULAIREEXERCICES"       ' POUR LE BOUTON DE MODIFICATION
    Private Const Btn_Delete As String = "Bouton-DELETE-FORMULAIREEXERCICES"   ' POUR LE BOUTON DE SUPPRESSION

    Dim User_Connected As Cls_User          ' INSTANCE DE LA CLASSE UTILISATEUR - UTILISER POUR L'UTILISATEUR EN SESSION 
    Dim Is_Acces_Page As Boolean = True     ' LA VARIABLE SERVANT DE TEST POUR DONNEER L'ACCES A LA PAGE
    Dim GetOut As Boolean = False           ' LA VARIABLE SERVANT DE TEST POUR REDIRIGER L'UTILISATEUR VERS LA PAGE DE CONNEXION
    Dim PAGE_MERE As Long = 0 ' PAS TROP IMPORTANT...
    Dim PAGE_TITLE As String = ""

    Private Const FormulaireExercice As String = "FormulaireExercice"
    Private Const Question As String = "Question"

    Private Const SESSION_PAGE_TAB_1 As String = "SESSION_PAGE_FORM_TAB_1"

    Public countRowIndex As Integer = 0
    Public objFormulaireExercice_List As List(Of Cls_FormulaireExercices)
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Expires = -1
        Panel_Msg.Visible = False
        PAGE_TITLE = " Exercices"
        Page.Title = [Global].Global_APP_NAME_SIGLE & " | " & PAGE_TITLE

        'SYSTEME_SECURITE()  ' APPEL A LA METHODE SERVANT A TESTER LES COMPOSANTS DE LA PAGE Y COMPRIS LA PAGE ELLE MEME 

        '--- Si l'utilisateur n'a Access a la page les informations ne sont pas charger dans la Page_Load 
        If Is_Acces_Page Then
            If Not IsPostBack Then
                'Label_Titre.Text = PAGE_TITLE
                'btnCancel.Attributes.Add("onclick", "javascript:void(closeWindow());")
                'rbtnAddFormulaireExercices.Attributes.Add("onclick", "javascript:void(ShowAddUpdateForm('Frm_FormulaireExercicesADD.aspx', 950, 650)); return false;")
                'BtnADDNew.Attributes.Add("onclick", "javascript:Open_Window('Frm_FormulaireExercicesADD.aspx', '_self',500,400); return false;") 
                LOAD_ALL_DATA()
                ' Me.Session(SESSION_PAGE_TAB_1) = FormulaireExercice
            End If
        End If
    End Sub



#Region "Load DATA"
    Private Sub LOAD_ALL_DATA()
        LOAD_FORMULAIREEXERCICES()
    End Sub

    Private Sub LOAD_FORMULAIREEXERCICES()
        Try
            If Request.QueryString("ID") IsNot Nothing Then
                Dim _id As Long = TypeSafeConversion.NullSafeLong(Request.QueryString("ID"))
                txt_CodeFormulaireExercices_Hid.Text = _id
                txt_IsCorectum_Hide.Text = "0"
                Dim obj As New Cls_FormulaireExercices(_id)
                SetDataFormulaireExercice(obj)
            ElseIf Request.QueryString("IDCOREC") IsNot Nothing Then
                Dim _id As Long = TypeSafeConversion.NullSafeLong(Request.QueryString("IDCOREC"))
                txt_CodeFormulaireExercices_Hid.Text = _id
                txt_IsCorectum_Hide.Text = "1"
                Dim obj As New Cls_FormulaireExercices(_id)
                SetDataFormulaireExercice(obj)
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

#Region "Other Method - MessageToShow"
    Private Sub MessageToShow(ByVal _message As String, Optional ByVal E_or_S As String = "E", Optional ByVal ShowPopUp As Boolean = True)
        Panel_Msg.Visible = True
        GlobalFunctions.Message_Image(Image_Msg, E_or_S)
        Label_Msg.Text = _message
        If ShowPopUp Then
            'RadAjaxManager1.ResponseScripts.Add("alert('" & [Global].GetTextFromHtml(_message).Replace("'", "\'") & "');")
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

#Region "EVENTS BUTTON"
    Private Sub SetDataFormulaireExercice(obj As Cls_FormulaireExercices)
        Try
            If obj.ID > 0 Then
                With obj
                    txt_CodeFormulaireExercices_Hid.Text = .ID
                    Label_IDExercice.Text = "EXERCICE " & .ID
                    Label_LibelleExercice.Text = "<h4 style='font-weight: bold;'>" & .LibelleExercice & "</h3>" & "<br />"
                    Label_LibelleExercice.Visible = IIf(.LibelleExercice.Trim.Equals(""), False, True)
                    'Label_SousTitre.Text = .LibelleExercice

                    Label_Descriptions.Text = "<h4 style='color:#2494F2;'>Descriptions:</h4>" & .Descriptions & "<br /><br />"
                    Label_Descriptions.Visible = IIf(.Descriptions.Trim.Equals(""), False, True)

                    Label_Instructions.Text = "<h4 style='color:#2494F2;'>Instructions:</h4>" & .Instructions & "<br /><br />"
                    Label_Instructions.Visible = IIf(.Instructions.Trim.Equals(""), False, True)

                    Label_RappelExercice.Text = "<h4 style='color:#2494F2;'>Rappel:</h4>" & .RappelExercice & "<br /><br />"
                    Label_RappelExercice.Visible = IIf(.RappelExercice.Trim.Equals(""), False, True)

                    'txt_TypeEvaluation.Text = .TypeEvaluation
                    'txt_Statut.Text = .Statut
                    'txt_DureeEnSeconde.Text = .DureeEnSeconde
                End With
                FillAllQuestions()
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

#Region "Load DATA"
    Private Sub FillAllQuestions()
        Dim objs As List(Of Cls_QuestionFormulaireExercice)
        Dim IsCorectum = TypeSafeConversion.NullSafeBoolean(txt_IsCorectum_Hide.Text, False)
        Try
            Dim result = ""
            objs = Cls_QuestionFormulaireExercice.SearchAllBy_CodeFormulaireExercice(TypeSafeConversion.NullSafeLong(txt_CodeFormulaireExercices_Hid.Text))
            If objs.Count > 0 Then
                For Each quest As Cls_QuestionFormulaireExercice In objs
                    result &= "<tr>"
                    result &= "<td>" & quest.LibelleQuestion & "<span  Style='color: red; font-weight: bold;'>" & quest.ScoreTotalStr & "</span>" & "</td>"
                    result &= "<td>" & IIf(IsCorectum, quest.ReponsesListeCorectum, quest.ReponsesListeNormal) & "</td>"
                    result &= "<td>" & IIf(IsCorectum, quest.JustificationReponseListeCorectum, quest.JustificationReponseListeNormal) & "</td>"
                Next
            End If
            literal_QuestionReponseJustification.Text = result

        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub
#End Region
End Class
