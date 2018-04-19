
Imports RGPH_QUETIONNAIRE_EXERCICE_Library
Imports BRAIN_DEVLOPMENT
Imports BRAIN_DEVLOPMENT.DataAccessLayer
Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Data
Imports Microsoft.Reporting.WebForms

Partial Class Pages_Fen_Report_ShowReport
    Inherits System.Web.UI.Page

#Region "ATTRIBUT"
    Private _message As String = ""
    Private indexsubreport As Integer = 0
    Private indexdrilltrough As Integer = 0
    Private indextest As Integer = 0
    Private User_Connected As Cls_User
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("ReportingSSRS") = Nothing
        If Not IsPostBack Then
            'launchReports_FormulaireExercice()
            'InitializeReport()
        End If
    End Sub

#Region "MESSAGE"
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
#End Region

#Region "METHODES REPORTS"
    Private Function LoadData(ByVal StoredName As String, ByVal ParamArray Param() As Object) As DataTable
        Try
            If Session("ReportingSSRS") IsNot Nothing Then
                Dim ReportDocument As Cls_ReportHelper = Session("ReportingSSRS")
                Dim table As DataTable = Nothing

                Dim dataSet As DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), StoredName, Param)
                Try
                    table = dataSet.Tables(0)
                Finally
                    If dataSet IsNot Nothing Then
                        dataSet.Dispose()
                    End If
                End Try

                Return table
            Else
                Return Nothing
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Function

    Private Function LoadData2(ByVal StoredName As String, ByVal ParamArray Param() As Object) As DataTable
        If Session("ReportingSSRS") IsNot Nothing Then
            Dim ReportDocument As Cls_ReportHelper = Session("ReportingSSRS")
            Dim table As DataTable = Nothing

            Dim dataSet As DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), StoredName)
            Try
                table = dataSet.Tables(0)
            Finally
                If dataSet IsNot Nothing Then
                    dataSet.Dispose()
                End If
            End Try

            Return table
        Else
            Return Nothing
        End If
    End Function

    Public Sub InitializeReport()
        Try
            If Session("ReportingSSRS") IsNot Nothing Then
                Dim ReportDocument As Cls_ReportHelper = Session("ReportingSSRS")
                Dim Parameter As Cls_ReportHelper.StoredParameter

                ReportViewer1.ProcessingMode = ProcessingMode.Local

                ReportViewer1.LocalReport.ReportPath = ReportDocument.ReportFolderPath + "\" + ReportDocument.ReportName

                Dim paramList As New Generic.List(Of ReportParameter)

                Dim pinfo As ReportParameterInfoCollection

                pinfo = ReportViewer1.LocalReport.GetParameters()

                Dim paramet As String = String.Empty

                If pinfo.Count > 0 Then

                    For Each p As ReportParameterInfo In pinfo
                        For Each Parameter In ReportDocument.ListofParameter
                            If (paramet = String.Empty) Then
                                paramet = Parameter.Value
                            Else
                                paramet = paramet + "," + Parameter.Value
                            End If
                            If p.Name = Parameter.Name Then
                                paramList.Add(New ReportParameter(p.Name, Parameter.Value))
                            End If
                        Next
                    Next

                    Me.ReportViewer1.LocalReport.SetParameters(paramList)

                    Me.ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource(ReportViewer1.LocalReport.GetDataSourceNames()(0), LoadData(ReportDocument.StoredProcedureName, paramet)))
                ElseIf (pinfo.Count = 0 And ReportDocument.StoredProcedureName <> "") Then
                    Me.ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource(ReportViewer1.LocalReport.GetDataSourceNames()(0), LoadData2(ReportDocument.StoredProcedureName, paramet)))
                Else

                End If
                If ReportDocument.HasSubreport = True Then
                    AddHandler ReportViewer1.LocalReport.SubreportProcessing, AddressOf ReportViewer1_SubreportProcessing
                End If
                If ReportDocument.ListofDrillTroughReport.Count > 0 Then
                    'RaiseEvent ReportViewer1_Drillthough()

                    '       AddHandler ReportViewer1.Drillthrough, New DrillthroughEventHandler(AddressOf ReportViewer1_Drillthrough)
                End If

            Else
                'Return Nothing
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Sub ReportViewer1_SubreportProcessing(ByVal sender As Object, ByVal e As SubreportProcessingEventArgs)
        Try
            If Session("ReportingSSRS") IsNot Nothing Then
                Dim ReportDocument As Cls_ReportHelper = Session("ReportingSSRS")

                e.DataSources.Add(New ReportDataSource(e.DataSourceNames(0), LoadDetailsData(ReportDocument.ListofSubReport(indexsubreport))))
                indexsubreport = indexsubreport + 1
            Else
                'Return Nothing
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Function LoadDetailsData(ByVal SubReport As Cls_ReportHelper) As DataTable
        Dim table As DataTable = Nothing
        Dim paramet As String = String.Empty

        For Each Parameter In SubReport.ListofParameter
            If (paramet = String.Empty) Then
                paramet = Parameter.Value
            Else
                paramet = paramet + "," + Parameter.Value
            End If
        Next
        Dim dataSet As DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), SubReport.StoredProcedureName, paramet)
        Try
            table = dataSet.Tables(0)
        Finally
            If dataSet IsNot Nothing Then
                dataSet.Dispose()
            End If
        End Try
        Return table
    End Function

    Protected Sub ReportViewer1_Drillthrough(ByVal sender As Object, ByVal e As DrillthroughEventArgs) Handles ReportViewer1.Drillthrough
        Try
            If Session("ReportingSSRS") IsNot Nothing Then
                Dim ReportDocument As Cls_ReportHelper = Session("ReportingSSRS")
                Dim localreport As LocalReport = DirectCast(e.Report, LocalReport)
                Dim tblstring As String() = localreport.ReportPath.Split("\")
                Dim CurrentReport As String = tblstring(tblstring.Length - 1)
                indexdrilltrough = 0
                For Each Report In ReportDocument.ListofDrillTroughReport
                    If CurrentReport = Report.ReportName Then
                        localreport.DataSources.Add(New ReportDataSource(localreport.GetDataSourceNames(0), LoadDetailDrillTroughReport(ReportDocument.ListofDrillTroughReport(indexdrilltrough))))
                        localreport.Refresh()
                        indexdrilltrough = indexdrilltrough + 1
                    End If
                Next
            Else
                'Return Nothing
            End If
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Function LoadDetailDrillTroughReport(ByVal Drillthrough As Cls_ReportHelper) As DataTable
        Dim table As DataTable = Nothing
        Dim paramet As String = String.Empty
        For Each Parameter In Drillthrough.ListofParameter
            If (paramet = String.Empty) Then
                paramet = Parameter.Value
            Else
                paramet = paramet + "," + Parameter.Value
            End If
        Next
        Dim DataSet As New DataSet
        If paramet = "" Then
            DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), Drillthrough.StoredProcedureName)
        Else
            DataSet = SqlHelper.ExecuteDataset(SqlHelperParameterCache.BuildConfigDB(), Drillthrough.StoredProcedureName, paramet)
        End If


        Try
            table = DataSet.Tables(0)
        Finally
            If DataSet IsNot Nothing Then
                DataSet.Dispose()
            End If
        End Try
        Return table
    End Function
#End Region

#Region "METHODES RAPPORTS"
    Private Sub launchReports_FormulaireExercice()
        Try
            Dim CodeExercice As Long = 0

            If Request.QueryString("ID") IsNot Nothing AndAlso IsNumeric(Request.QueryString("ID")) Then
                CodeExercice = TypeSafeConversion.NullSafeLong(Request.QueryString("ID"))
            End If

            Dim crReportDocument As New Cls_ReportHelper
            With crReportDocument
                .ReportName = "FormulaireExerciceRepport.rdlc"
                .ReportFolderPath = "_reports/_rpEvaluation"
                .SetParameter("CodeExercice", CodeExercice)
                .HasSubreport = True
                .StoredProcedureName = "_REPORT_SP_FormulaireExercices_ByCodeExercise"
            End With

            REM Questions
            Dim SubReport_Questions As New Cls_ReportHelper
            With SubReport_Questions
                .ReportName = "Report_Questions.rdlc"
                .ReportFolderPath = "_reports/_rpEvaluation"
                .SetParameter("CodeExercice", CodeExercice)
                .HasSubreport = True
                .StoredProcedureName = "_REPORT_SP_Questions_ByCodeExercice"
            End With
            crReportDocument.ListofSubReport.Add(SubReport_Questions)

            'REM Reponse
            'Dim SubReport_Reponse As New Cls_ReportHelper
            'With SubReport_Reponse
            '    .ReportName = "Report_Reponses.rdlc"
            '    .ReportFolderPath = "_reports/_rpEvaluation"
            '    '.SetParameter("ID_Reunion", IDFormulaire)
            '    .HasSubreport = False
            '    .StoredProcedureName = "_REPORT_SP_Reponsess_ByCodeQuestion"
            'End With
            'crReportDocument.ListofSubReport.Add(SubReport_Reponse)

            'REM Rapport Resolution
            'Dim SubReport_Resolution As New Cls_ReportHelper
            'With SubReport_Resolution
            '    .ReportName = "REPORT_ReunionResolution.rdlc"
            '    .ReportFolderPath = "_reports/_rpReunion"
            '    .SetParameter("ID_Reunion", IDFormulaire)
            '    '.HasSubreport = False
            '    .StoredProcedureName = "SP_ListAll_ReunionResolutionOrdreDuJour_IsValider_ByIdReunion2"
            'End With
            'crReportDocument.ListofSubReport.Add(SubReport_Resolution)

            'REM Rapport Tableau Suivi Resolution
            'Dim SubReport_TableauSuivi As New Cls_ReportHelper
            'With SubReport_TableauSuivi
            '    .ReportName = "Report_TableauSuiviDesResolution.rdlc"
            '    .ReportFolderPath = "_reports/_rpReunion"
            '    .SetParameter("ID_Reunion", IDFormulaire)
            '    '.HasSubreport = False
            '    .StoredProcedureName = "REPORT_TableauSuiviResolution_OrdreDuJour_ByIdReunion"
            'End With
            'crReportDocument.ListofSubReport.Add(SubReport_TableauSuivi)

            Session("ReportingSSRS") = crReportDocument
        Catch ex As Threading.ThreadAbortException
        Catch ex As Rezo509Exception
            MessageToShow(ex.Message)
        Catch ex As Exception
            MessageToShow(ex.Message)
            [Global].WriteError(ex, User_Connected)
        End Try
    End Sub

    Private Sub launchReports_Reunion()
        Try
            Dim IDReunion As Long = 0
            Dim ShowCV As Boolean = False

            If Request.QueryString("IDReunion") IsNot Nothing AndAlso IsNumeric(Request.QueryString("IDReunion")) Then
                'If Session([Global].GLOBAL_SESSION) IsNot Nothing Then
                'User_Connected = CType(Session([Global].GLOBAL_SESSION), Cls_User)
                IDReunion = TypeSafeConversion.NullSafeLong(Request.QueryString("IDReunion"))
                'Page.Title = "" & User_Connected.NOMCOMPLET
                'Else
                '    ShowCV = False
                '    '-- Session expirée --'
                '    MessageToShow("Session expirée.")
                '    Response.Write("<script> window.close(); </script>")
                'End If
            End If

            Dim crReportDocument As New Cls_ReportHelper
            With crReportDocument
                .ReportName = "REPORT_InformationsReunion.rdlc"
                .ReportFolderPath = "_reports/_rpReunion"
                .SetParameter("ID", IDReunion)
                .HasSubreport = True
                .StoredProcedureName = "SP_SelectReunion_ByID"
            End With

            REM Rapport Presence
            Dim SubReport_Presence As New Cls_ReportHelper
            With SubReport_Presence
                .ReportName = "REPPORT_ReunionPresence.rdlc"
                .ReportFolderPath = "_reports/_rpReunion"
                .SetParameter("IDReunion", IDReunion)
                '.HasSubreport = False
                .StoredProcedureName = "_REPPORT_ListeAll_Participant_InReunion_ByIdReunion"
            End With
            crReportDocument.ListofSubReport.Add(SubReport_Presence)

            REM Rapport Ordre du jour
            Dim SubReport_OrdreDuJour As New Cls_ReportHelper
            With SubReport_OrdreDuJour
                .ReportName = "Report_ReunionOrdreDuJour.rdlc"
                .ReportFolderPath = "_reports/_rpReunion"
                .SetParameter("ID_Reunion", IDReunion)
                '.HasSubreport = False
                .StoredProcedureName = "SP_ListAll_ReunionOrdreDuJour_IsValider_ByIDReunion"
            End With
            crReportDocument.ListofSubReport.Add(SubReport_OrdreDuJour)

            REM Rapport Resolution
            Dim SubReport_Resolution As New Cls_ReportHelper
            With SubReport_Resolution
                .ReportName = "REPORT_ReunionResolution.rdlc"
                .ReportFolderPath = "_reports/_rpReunion"
                .SetParameter("ID_Reunion", IDReunion)
                '.HasSubreport = False
                .StoredProcedureName = "SP_ListAll_ReunionResolutionOrdreDuJour_IsValider_ByIdReunion2"
            End With
            crReportDocument.ListofSubReport.Add(SubReport_Resolution)

            REM Rapport Tableau Suivi Resolution
            Dim SubReport_TableauSuivi As New Cls_ReportHelper
            With SubReport_TableauSuivi
                .ReportName = "Report_TableauSuiviDesResolution.rdlc"
                .ReportFolderPath = "_reports/_rpReunion"
                .SetParameter("ID_Reunion", IDReunion)
                '.HasSubreport = False
                .StoredProcedureName = "REPORT_TableauSuiviResolution_OrdreDuJour_ByIdReunion"
            End With
            crReportDocument.ListofSubReport.Add(SubReport_TableauSuivi)

            Session("ReportingSSRS") = crReportDocument
            'Session("ReportingSSRS") = SubReport_OrdreDuJour
        Catch ex As Exception
            _message = ex.Message
            MessageToShow(_message & " - ")
            ErreurLog.WriteError("Methode -> [ launchReports_Reunion report ] " & _message)
        End Try
    End Sub

    Private Sub launchReports_PAys(Optional ByVal rowid As Long = 0)
        Try
            If Request.QueryString("PAYS") IsNot Nothing Then
                Dim crReportDocument As New Cls_ReportHelper
                With crReportDocument
                    .ReportName = "Pays.rdlc"
                    .ReportFolderPath = "REPORTS_/ReportsFolder"
                    .SetParameter("Statut", 1)
                    .HasSubreport = False
                    .StoredProcedureName = "SP_ListAll_Pays"
                End With

                Session("ReportingSSRS") = crReportDocument
                'ClientScript.RegisterClientScriptBlock(Me.GetType, "MRScript", "window.open('../REPORTS_/Fen_Report/ShowReport.aspx', '_blank', 'width=1024px,height=768px,status=0,resizable=1,alwaysRaised=1,scrollbars=1');", True)
            End If
        Catch ex As Exception
            _message = ex.Message
            ErreurLog.WriteError("Methode -> [ launchReports_PAys report ] " & _message)
            MessageToShow(_message)
        End Try
    End Sub

    Private Sub launchReports_CVInformationPersonnelle()
        Try
            Dim IDUser As Long = 0
            Dim ShowCV As Boolean = False
            If Request.QueryString("PAGE") IsNot Nothing AndAlso Request.QueryString("PAGE").ToString = "CVImportation" Then
                If Session([Global].GLOBAL_SESSION) IsNot Nothing Then
                    User_Connected = CType(Session([Global].GLOBAL_SESSION), Cls_User)
                    IDUser = User_Connected.ID
                    ShowCV = True

                    Page.Title = "CV de " & User_Connected.NOMCOMPLET
                Else
                    ShowCV = False
                    '-- Session expirée --'
                    MessageToShow("Session expirée.")
                    Response.Write("<script> window.close(); </script>")
                End If
            End If

            If Request.QueryString("PAGE") IsNot Nothing AndAlso Request.QueryString("PAGE").ToString = "CVCandidat" AndAlso Request.QueryString("IDUser") IsNot Nothing AndAlso IsNumeric(Request.QueryString("IDUser")) Then
                IDUser = CLng(Request.QueryString("IDUser"))
                ShowCV = True
            End If

            If Request.QueryString("PAGECV") IsNot Nothing AndAlso Request.QueryString("Shared") IsNot Nothing AndAlso IsNumeric(Request.QueryString("Shared")) Then
                IDUser = CLng(Request.QueryString("Shared"))
                ShowCV = True
            End If

            REM --------------------------------------------------

            Page.Title = ""

            If ShowCV Then
                Dim crReportDocument As New Cls_ReportHelper
                With crReportDocument
                    .ReportName = "REPORT_CV_InformationsReport.rdlc"
                    .ReportFolderPath = "REPORTS_/ReportsFolder"
                    .SetParameter("IDUser", IDUser)
                    .HasSubreport = True
                    .StoredProcedureName = "REPORT_Select_CV_InfoPersonnelle_ByIdUser"
                End With

                REM Rapport Etude Universitaire et Formation Professionnelle
                Dim SubReport_EtudeUniversitaire As New Cls_ReportHelper
                With SubReport_EtudeUniversitaire
                    .ReportName = "REPORT_CV_EtudeUniversitaireFormations.rdlc"
                    .ReportFolderPath = "REPORTS_/ReportsFolder"
                    .SetParameter("IDUser", IDUser)
                    .StoredProcedureName = "REPORT_Select_CV_EtudeUniversitaireFormations_ByIdUser"
                End With
                crReportDocument.ListofSubReport.Add(SubReport_EtudeUniversitaire)

                REM Rapport Experience De Travail
                Dim SubReport_ExperienceDeTravail As New Cls_ReportHelper
                With SubReport_ExperienceDeTravail
                    .ReportName = "REPORT_CV_ExperienceDeTravail.rdlc"
                    .ReportFolderPath = "REPORTS_/ReportsFolder"
                    .SetParameter("IDUser", IDUser)
                    .StoredProcedureName = "REPORT_Select_CV_ExperienceDeTravail_ByIdUser"
                End With
                crReportDocument.ListofSubReport.Add(SubReport_ExperienceDeTravail)

                REM Rapport Connaissances Linguistiques
                Dim SubReport_ConnaissancesLinguistiques As New Cls_ReportHelper
                With SubReport_ConnaissancesLinguistiques
                    .ReportName = "REPORT_CV_ConnaissancesLinguistiques.rdlc"
                    .ReportFolderPath = "REPORTS_/ReportsFolder"
                    .SetParameter("IDUser", IDUser)
                    .StoredProcedureName = "REPORT_Select_CV_ConnaissanceLinguistique_ByIdUser"
                End With
                crReportDocument.ListofSubReport.Add(SubReport_ConnaissancesLinguistiques)

                REM Rapport Autres Competence
                Dim SubReport_AutresCompetence As New Cls_ReportHelper
                With SubReport_AutresCompetence
                    .ReportName = "REPORT_CV_AutresCompetence.rdlc"
                    .ReportFolderPath = "REPORTS_/ReportsFolder"
                    .SetParameter("IDUser", IDUser)
                    .StoredProcedureName = "REPORT_Select_CV_AutresCompetence_ByIdUser"
                End With
                crReportDocument.ListofSubReport.Add(SubReport_AutresCompetence)

                REM Rapport Reference
                Dim SubReport_Reference As New Cls_ReportHelper
                With SubReport_Reference
                    .ReportName = "REPORT_CV_Reference.rdlc"
                    .ReportFolderPath = "REPORTS_/ReportsFolder"
                    .SetParameter("IDUser", IDUser)
                    .StoredProcedureName = "REPORT_Select_CV_Reference_ByIdUser"
                End With
                crReportDocument.ListofSubReport.Add(SubReport_Reference)

                Session("ReportingSSRS") = crReportDocument
            End If
        Catch ex As Exception
            _message = ex.Message
            ErreurLog.WriteError("Methode -> [ launchReports_CVInformationPersonnelle report ] " & _message)
            GlobalFunctions.Send_Mail_Erreur("Methode -> [ launchReports_CVInformationPersonnelle report ] ", ex.Message)
            MessageToShow(_message)
        End Try
    End Sub
#End Region

End Class