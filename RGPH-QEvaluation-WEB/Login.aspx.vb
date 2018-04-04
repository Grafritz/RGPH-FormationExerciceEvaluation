' @Brain Development
' Lundi 26-01-2015

Imports BRAIN_DEVLOPMENT
Imports RGPH_QUETIONNAIRE_EXERCICE_Library

Partial Class Login
    Inherits Cls_BasePage

    Private _message As String
    Dim Cookies As HttpCookie
    Dim User_Connected As Cls_User
    'Dim ThermeVariables As Cls_ThermeVariables

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Username_Connected()
        End If
        If Not IsPostBack Then
            Load_SESSION_Informations_ByDefault()
            'If Session([Global].Global_ECOLE_DEFAULT) Is Nothing Then
            '    Load_Informations_ByDefault()
            'End If
        End If
        'Connexion("duverseau.jeanfritz@gmail.com", "passpass")
    End Sub

    Public Sub Username_Connected()
        Try
            Dim CoookiesSupported As Boolean = Request.Browser.Cookies
            If Not CoookiesSupported Then
                ' Response.Write("<script> alert('Désolé !!! Votre navigateur ne supporte les cookies'); </script>")
                _message = "Désolé !!! Votre navigateur ne supporte les cookies"
                MessageToShow(_message)
            End If

            'If Request.QueryString("SESSION") IsNot Nothing Then
            '    MessageToShow(Request.QueryString("SESSION"))
            'End If

            Cookies = Request.Cookies([Global].GLOBAL_COOKIES)
            If Cookies IsNot Nothing Then
                Dim RedirectUrl As String = ""
                'If Request.QueryString("RedirectUrl") IsNot Nothing Then
                '    RedirectUrl = "?RedirectUrl=" & Request.QueryString("RedirectUrl")
                'End If

                'Response.Redirect("~/GestionReunions/LockScreen.aspx" & RedirectUrl)
                'txt_CodeReferenceReunion.Text = Cookies([Global].GLOBAL_COOKIES_IDREUNION)

                Dim userName As String = Cookies([Global].GLOBAL_COOKIES_USERNAME)
                Dim user() As String = userName.Split(",")
                If user.Count > 1 Then
                    userName = user(0)
                End If

                txt_UserName.Text = userName
                'txt_UserName.BackColor = Drawing.Color.Transparent
                'txt_UserName.BorderColor = Drawing.Color.Transparent
                txt_UserName.Font.Bold = True
                txt_UserName.Attributes.Add("readonly", "readonly")
                'txt_UserName.Enabled = False
                txt_MotdePasse.Focus()
                LinkButton_CeNestPasMonCompte.Visible = True
            Else
                txt_UserName.Focus()
                LinkButton_CeNestPasMonCompte.Visible = False
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, Nothing)
        End Try
    End Sub

    'Private Sub MessageToShow(ByVal _message As String, Optional ByVal E_or_S As String = "E")
    '    Panel_Msg.Visible = True
    '    GlobalFunctions.Message_Image(Image_Msg, E_or_S)
    '    Label_Msg.Text = _message
    '    Dialogue.alert(_message)
    '    If E_or_S = "S" Then
    '        Label_Msg.ForeColor = Drawing.Color.Green
    '    Else
    '        Label_Msg.ForeColor = Drawing.Color.Red
    '    End If
    'End Sub

    Private Sub MessageToShow(ByVal _message As String, Optional ByVal E_or_S As String = "E")
        Panel_Msg.Visible = True
        GlobalFunctions.Message_Image(Image_Msg, E_or_S)
        Label_Msg.Text = _message
        'RadAjaxManager1.ResponseScripts.Add("alert('" & [Global].GetTextFromHtml(_message).Replace("'", "\'") & "');")
        Dialogue.alert([Global].GetTextFromHtml(_message))
        If E_or_S = "S" Then
            Style_Division(DIV_Msg, "alert alert-success alert-dismissable")
            Style_Division(Icon_Msg, "fa  fa-thumbs-up")
        Else
            Style_Division(DIV_Msg, "alert alert-danger alert-dismissable")
            Style_Division(Icon_Msg, "fa fa-thumbs-down")
        End If
    End Sub

    Private Sub Connexion(ByVal txt_UserName As String, ByVal txt_MotdePasse As String)
        Dim _err As String = ""
        Try
            Dim usern As String() = txt_UserName.Replace(";", ",").Split(",")
            If usern.Count > 1 Then
                User_Connected = New Cls_User(1, usern(0), txt_MotdePasse)
            Else
                User_Connected = New Cls_User(txt_UserName, txt_MotdePasse)
            End If

            If User_Connected.Actifyn Then
                'CheckLicence()

                ''FormsAuthentication.SetAuthCookie(txt_UserName, True)
                'FormsAuthentication.RedirectFromLoginPage(txt_UserName, True)

                User_Connected.Set_Status_ConnectedUser(True)
                User_Connected.Set_Status_IsForcedOut(False)

                Session.Add([Global].GLOBAL_SESSION, User_Connected)
                'Session.Add([Global].Global_ECOLE_DEFAULT, User_Connected.Ecole)

                '[Global].SetSessionThermeVariables(User_Connected.ID_Ecole)

                If CBX_GarderSession.Checked Then
                    REM Creation de Cookies
                    Dim cookie As HttpCookie
                    cookie = New HttpCookie([Global].GLOBAL_COOKIES)
                    cookie.Values.Add([Global].GLOBAL_COOKIES_IDUSER, User_Connected.ID)
                    cookie.Values.Add([Global].GLOBAL_COOKIES_USERNAME, User_Connected.Username)
                    cookie.Values.Add([Global].GLOBAL_COOKIES_USERNAME, User_Connected.Username)
                    'cookie.Values.Add([Global].GLOBAL_COOKIES_NomCOMPLET, User_Connected.NOMCOMPLET)

                    Response.Cookies.Add(cookie)

                    'FormsAuthentication.SetAuthCookie(txt_UserName, True)
                    'FormsAuthentication.RedirectFromLoginPage(txt_UserName, True)

                End If

                User_Connected.Activite_Utilisateur_InRezo("Login", "Login, System Entry", Request.UserHostName)
                User_Connected.Trace_LastLogin(Request.UserHostName)

                REM si l'utilisateur doit change son mot de passe
                'If User_Connected.Mustchangepassword Then
                '    Response.Redirect("~/Motdepasse.aspx?Action=Mustchangepassword")
                'End If

                If Request.QueryString("RedirectUrl") IsNot Nothing Then
                    Response.Redirect(Request.QueryString("RedirectUrl"))
                End If

                Dim PageDefault As String = User_Connected.GroupeUser.PageDefault
                Response.Redirect(PageDefault)

                Panel_Msg.Visible = True
            Else
                _message = "Votre compte n'est pas active "
                'If Not User_Connected.Confirmer Then
                '    _message &= "Verifiez votre email "
                'End If
                Session.Remove([Global].GLOBAL_SESSION)
                MessageToShow(_message)
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, Nothing)
        End Try
    End Sub

    Protected Sub Btn_Connexion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_connection.Click
        Connexion(txt_UserName.Text, txt_MotdePasse.Text)
    End Sub

    Protected Sub LinkButton_CeNestPasMonCompte_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_CeNestPasMonCompte.Click
        Cookies = Request.Cookies([Global].GLOBAL_COOKIES)
        Response.Cookies([Global].GLOBAL_COOKIES).Expires = DateTime.Now.AddDays(-1)
        Session.RemoveAll()
        Session([Global].GLOBAL_SESSION) = Nothing
        Response.Redirect("Login.aspx")
    End Sub

#Region "INFO ECOLE"

    Private Sub Load_Informations_ByDefault()
        Try
            'Dim obj As New Cls_Ecole()
            'obj.getEcole_EnCours()
            'If obj.ID > 0 Then
            '    Session.Add([Global].Global_ECOLE_DEFAULT, obj)
            '    SetDataEcole(obj)
            'End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, Nothing)
        End Try
    End Sub

    Private Sub Load_SESSION_Informations_ByDefault()
        'Try
        '    If Session([Global].Global_ECOLE_DEFAULT) IsNot Nothing Then
        '        Dim obj As Cls_Ecole
        '        obj = CType(Session([Global].Global_ECOLE_DEFAULT), Cls_Ecole)
        '        SetDataEcole(obj)
        '    End If
        'Catch ex As Threading.ThreadAbortException
        'Catch ex As Rezo509Exception
        '    MessageToShow(ex.Message)
        'Catch ex As Exception
        '    MessageToShow(ex.Message)
        '    [Global].WriteError(ex, Nothing)
        'End Try
    End Sub
    'Private Sub SetDataEcole(obj As Cls_Ecole)
    '    Try
    '        If obj.ID > 0 Then
    '            'Image_LogoEcole.ImageUrl = "~/Show_Image.aspx?Action=Ecole&ID=" & obj.ID
    '            Label_NomEcole.Text = obj.NomEcole '& " | " & obj.Devise
    '            Page.Title = "SYGAS | " & obj.NomEcole & " - " & obj.Devise
    '            'Label_Slogan.Text = obj.Devise & ""
    '        End If
    '    Catch ex As Threading.ThreadAbortException
    '    Catch ex As Rezo509Exception
    '        MessageToShow(ex.Message)
    '    Catch ex As Exception
    '        MessageToShow(ex.Message)
    '        [Global].WriteError(ex, Nothing)
    '    End Try
    'End Sub

#End Region

End Class
