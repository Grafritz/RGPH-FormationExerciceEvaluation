
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
            launchReports_FormulaireExercice()
            InitializeReport()
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
                .ReportName = "Report_Question_Reponse_Justification.rdlc"
                .ReportFolderPath = "_reports/_rpEvaluation"
                .SetParameter("CodeExercice", CodeExercice)
                .HasSubreport = False
                .StoredProcedureName = "_REPORT_SP_QuestionReponseJustification_ByCodeExercice"
            End With
            crReportDocument.ListofSubReport.Add(SubReport_Questions)

            'REM Questions
            'Dim SubReport_Questions As New Cls_ReportHelper
            'With SubReport_Questions
            '    .ReportName = "Report_Questions.rdlc"
            '    .ReportFolderPath = "_reports/_rpEvaluation"
            '    .SetParameter("CodeExercice", CodeExercice)
            '    .HasSubreport = True
            '    .StoredProcedureName = "_REPORT_SP_Questions_ByCodeExercice"
            'End With
            'crReportDocument.ListofSubReport.Add(SubReport_Questions)


            'REM Reponse
            'Dim SubReport_Reponse As New Cls_ReportHelper
            'With SubReport_Reponse
            '    .ReportName = "Report_Reponses.rdlc"
            '    .ReportFolderPath = "_reports/_rpEvaluation"
            '    .SetParameter("CodeQuestion", CodeExercice)
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

#End Region

End Class