Imports Microsoft
Imports System.Data
Imports System.Collections.Generic
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer
Imports Telerik.Web.UI
Imports RGPH_QUETIONNAIRE_EXERCICE_Library

Partial Class GestionQuestionnaire_ExportJsonData
    Inherits System.Web.UI.Page

    Dim User_Connected As Cls_User          ' INSTANCE DE LA CLASSE UTILISATEUR - UTILISER POUR L'UTILISATEUR EN SESSION 

    Private Sub GestionQuestionnaire_ExportJsonData_Load(sender As Object, e As EventArgs) Handles Me.Load
        LOAD_ALL_DATA()
    End Sub

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

#Region "Load DATA"
    Private Sub LOAD_ALL_DATA()
        Try
            Dim _action As String = Request.QueryString([Global].ACTION)
            Select Case _action
                Case [Global].DATA_QUESTION_FORMULAIRE_SESSION
                    GetAll_DATA_QUESTION_FORMULAIRE_SESSION()

                Case [Global].DATA_FORMULAIRE_SESSION
                    GetAll_DATA_FORMULAIRE_SESSION()

                Case [Global].DATA_QUESTION_SESSION
                    GetAll_DATA_QUESTION_SESSION()

                Case [Global].DATA_REPONSES_SESSION
                    GetAll_DATA_REPONSES_SESSION()

                Case [Global].DATA_JUSTIFICATION_REPONSES_SESSION
                    GetAll_DATA_JUSTIFICATION_REPONSES_SESSION()

            End Select
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            '[Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Public Shared Function TypeSafeConvertion(ByVal Val As Boolean) As Integer
        Dim _val As Long
        If Val Then
            _val = 1
        Else
            _val = 0
        End If
        Return _val
    End Function

#Region "SESSION"

    Private Sub GetAll_DATA_QUESTION_FORMULAIRE_SESSION()
        Dim objs As New List(Of Cls_QuestionFormulaireExercice)
        Dim Result As String = ""
        Dim ValJson As String = ""
        Try
            'FileName: data_question_formulaire_exercices.json
            If Session([Global].DATA_QUESTION_FORMULAIRE_SESSION) IsNot Nothing Then
                objs = CType(Session([Global].DATA_QUESTION_FORMULAIRE_SESSION), List(Of Cls_QuestionFormulaireExercice))
            End If
            With objs
                If .Count > 0 Then
                    For Each item As Cls_QuestionFormulaireExercice In objs
                        If Result.Equals("") Then
                            Result = getStringJSON_Question_Formulaire(item)
                        Else
                            Result &= Chr(13)
                            Result &= "," & getStringJSON_Question_Formulaire(item)
                        End If
                    Next

                    ValJson &= "["
                    ValJson &= Chr(13)
                    ValJson &= Result
                    ValJson &= Chr(13)
                    ValJson &= "]"

                    Response.Buffer = True
                    Response.Charset = ""
                    Response.Cache.SetCacheability(HttpCacheability.NoCache)
                    Response.ContentType = "application/octet-stream"
                    Response.AddHeader("content-disposition", "attachment;filename=data_question_formulaire_exercices.json")

                    Response.Write(ValJson)

                    Response.Flush()
                    Response.End()
                End If
            End With


        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            '[Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Sub GetAll_DATA_FORMULAIRE_SESSION()
        Dim objs As New List(Of Cls_FormulaireExercices)
        Dim Result As String = ""
        Dim ValJson As String = ""
        Try
            'FileName: data_formulaire_exercices.json
            If Session([Global].DATA_FORMULAIRE_SESSION) IsNot Nothing Then
                objs = CType(Session([Global].DATA_FORMULAIRE_SESSION), List(Of Cls_FormulaireExercices))
            End If
            With objs
                If .Count > 0 Then
                    For Each item As Cls_FormulaireExercices In objs
                        If Result.Equals("") Then
                            Result = getStringJSON_Formulaire(item)
                        Else
                            Result &= Chr(13)
                            Result &= "," & getStringJSON_Formulaire(item)
                        End If
                    Next

                    ValJson &= "["
                    ValJson &= Chr(13)
                    ValJson &= Result
                    ValJson &= Chr(13)
                    ValJson &= "]"

                    Response.Buffer = True
                    Response.Charset = ""
                    Response.Cache.SetCacheability(HttpCacheability.NoCache)
                    Response.ContentType = "application/octet-stream"
                    Response.AddHeader("content-disposition", "attachment;filename=data_formulaire_exercices.json")

                    Response.Write(ValJson)

                    Response.Flush()
                    Response.End()
                End If
            End With


        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            '[Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Sub GetAll_DATA_QUESTION_SESSION()
        Dim _questionList As New List(Of Cls_Questions)
        Dim Result As String = ""
        Dim ValJson As String = ""
        Try
            If Session([Global].DATA_QUESTION_SESSION) IsNot Nothing Then
                _questionList = CType(Session([Global].DATA_QUESTION_SESSION), List(Of Cls_Questions))
            End If
            'FileName: data_questions.json
            With _questionList
                If .Count > 0 Then
                    For Each item As Cls_Questions In _questionList
                        If Result.Equals("") Then
                            Result = getStringJSON_Question(item)
                        Else
                            Result &= Chr(13)
                            Result &= "," & getStringJSON_Question(item)
                        End If
                    Next

                    ValJson &= "["
                    ValJson &= Chr(13)
                    ValJson &= Result
                    ValJson &= Chr(13)
                    ValJson &= "]"

                    Response.Buffer = True
                    Response.Charset = ""
                    Response.Cache.SetCacheability(HttpCacheability.NoCache)
                    Response.ContentType = "application/octet-stream"
                    Response.AddHeader("content-disposition", "attachment;filename=data_questions.json")

                    Response.Write(ValJson)

                    Response.Flush()
                    Response.End()
                End If
            End With


        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            '[Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Sub GetAll_DATA_REPONSES_SESSION()
        Dim _reponseList As New List(Of Cls_Reponses)
        Dim Result As String = ""
        Dim ValJson As String = ""

        Try
            If Session([Global].DATA_REPONSES_SESSION) IsNot Nothing Then
                _reponseList = CType(Session([Global].DATA_REPONSES_SESSION), List(Of Cls_Reponses))
            End If
            'FileName: data_reponses.json
            With _reponseList
                If .Count > 0 Then
                    For Each item As Cls_Reponses In _reponseList
                        If Result.Equals("") Then
                            Result = getStringJSON_Reponse(item)
                        Else
                            Result &= Chr(13)
                            Result &= "," & getStringJSON_Reponse(item)
                        End If
                    Next

                    ValJson &= "["
                    ValJson &= Chr(13)
                    ValJson &= Result
                    ValJson &= Chr(13)
                    ValJson &= "]"

                    Response.Buffer = True
                    Response.Charset = ""
                    Response.Cache.SetCacheability(HttpCacheability.NoCache)
                    Response.ContentType = "application/octet-stream"
                    Response.AddHeader("content-disposition", "attachment;filename=data_reponses.json")

                    Response.Write(ValJson)

                    Response.Flush()
                    Response.End()
                End If
            End With
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Sub GetAll_DATA_JUSTIFICATION_REPONSES_SESSION()
        Dim _reponseList As New List(Of Cls_JustificationReponses)
        Dim Result As String = ""
        Dim ValJson As String = ""

        Try
            If Session([Global].DATA_JUSTIFICATION_REPONSES_SESSION) IsNot Nothing Then
                _reponseList = CType(Session([Global].DATA_JUSTIFICATION_REPONSES_SESSION), List(Of Cls_JustificationReponses))
            End If
            'FileName: data_justification.json
            With _reponseList
                If .Count > 0 Then
                    For Each item As Cls_JustificationReponses In _reponseList
                        If Result.Equals("") Then
                            Result = getStringJSON_JustificationReponse(item)
                        Else
                            Result &= Chr(13)
                            Result &= "," & getStringJSON_JustificationReponse(item)
                        End If
                    Next

                    ValJson &= "["
                    ValJson &= Chr(13)
                    ValJson &= Result
                    ValJson &= Chr(13)
                    ValJson &= "]"

                    Response.Buffer = True
                    Response.Charset = ""
                    Response.Cache.SetCacheability(HttpCacheability.NoCache)
                    Response.ContentType = "application/octet-stream"
                    Response.AddHeader("content-disposition", "attachment;filename=data_justification.json")

                    Response.Write(ValJson)

                    Response.Flush()
                    Response.End()
                End If
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

    Private Function getStringJSON_Question_Formulaire(item As Cls_QuestionFormulaireExercice) As String
        Dim Result As String = "{"
        Result &= Chr(13)
        Result &= """codeFormulaireExercice"":" & item.CodeFormulaireExercice & ""
        Result &= Chr(13)
        Result &= """codeQuestion"":" & item.CodeQuestion & ""
        Result &= Chr(13)
        Result &= ",""ordreQuestion"":""" & item.OrdreQuestion & """"
        Result &= Chr(13)
        Result &= ",""estDebutQuestion"":" & IIf(item.EstDebutQuestion, "true", "false") & ""
        Result &= Chr(13)
        Result &= "}"

        Return Result
    End Function

    Private Function getStringJSON_Formulaire(item As Cls_FormulaireExercices) As String
        Dim Result As String = "{"
        Result &= Chr(13)
        Result &= """codeExercice"":""" & item.CodeExercice & """"
        Result &= Chr(13)
        Result &= ",""libelleExercice"":""" & item.LibelleExercice.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""descriptions"":""" & item.Descriptions.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""instructions"":""" & item.Instructions.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""rappelExercice"":""" & item.RappelExercice.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""typeEvaluation"":" & item.TypeEvaluation & ""
        Result &= Chr(13)
        Result &= ",""dureeEnSeconde"":" & item.DureeEnSeconde & ""
        Result &= Chr(13)
        Result &= ",""statut"":" & item.Statut & ""
        Result &= Chr(13)
        Result &= "}"

        Return Result
    End Function

    Private Function getStringJSON_Question(item As Cls_Questions) As String
        Dim Result As String = "{"
        Result &= Chr(13)
        Result &= """codeQuestion"":""" & item.codeQuestion & """"
        Result &= Chr(13)
        Result &= ",""libelle"":""" & item.LibelleQuestion.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""detailsQuestion"":""" & item.DetailsQuestion.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""indicationsQuestion"":""" & item.IndicationsQuestion.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""avoirJustificationYN"":" & IIf(item.AvoirJustificationYN, "true", "false") & ""
        Result &= Chr(13)
        Result &= ",""typeQuestion"":" & item.TypeQuestion & ""
        Result &= Chr(13)
        Result &= ",""scoreTotal"":" & item.ScoreTotal & ""
        Result &= Chr(13)
        Result &= ",""caratereAccepte"":" & item.CaractereAccepte & ""
        Result &= Chr(13)
        Result &= ",""nbreValeurMinimal"":" & item.NbreValeurMinimal & ""
        Result &= Chr(13)
        Result &= ",""nbreCaratereMaximal"":" & item.NbreCaractereMaximal & ""
        Result &= Chr(13)
        Result &= ",""qPrecedent"":""" & item.qPrecedent.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""qSuivant"":""" & item.qSuivant.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= "}"

        Return Result
    End Function

    Private Function getStringJSON_Reponse(item As Cls_Reponses) As String
        Dim Result As String = "{"
        Result &= Chr(13)
        Result &= """codeQuestion"":""" & item.CodeQuestion & """"
        Result &= Chr(13)
        Result &= ",""codeReponse"":""" & item.codeReponse & """"
        Result &= Chr(13)
        Result &= ",""libelleReponse"":""" & item.LibelleReponse.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""isCorrect"":" & IIf(item.Iscorrect, "true", "false") & ""
        Result &= Chr(13)
        Result &= ",""estEnfant"":" & IIf(item.estEnfant, "true", "false") & ""
        Result &= Chr(13)
        Result &= ",""avoirEnfant"":" & IIf(item.avoirEnfant, "true", "false") & ""
        Result &= Chr(13)
        Result &= ",""codeParent"":""" & item.CodeParent.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= "}"

        Return Result
    End Function

    Private Function getStringJSON_JustificationReponse(item As Cls_JustificationReponses) As String
        Dim Result As String = "{"
        Result &= Chr(13)
        Result &= """codeQuestion"":""" & item.CodeQuestion & """"
        Result &= Chr(13)
        Result &= ",""codeJustification"":""" & item.codeJustification & """"
        Result &= Chr(13)
        Result &= ",""libelle"":""" & item.LibelleJustification.Replace("""", "\""") & """"
        Result &= Chr(13)
        Result &= ",""isCorrect"":" & IIf(item.Iscorrect, "true", "false") & ""
        Result &= Chr(13)
        Result &= "}"

        Return Result
    End Function

#End Region

End Class
