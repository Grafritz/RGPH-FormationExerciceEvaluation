<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ShowReport.aspx.vb" Inherits="Pages_Fen_Report_ShowReport" %>

<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>

<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>
<%--<%@ Register TagPrefix="Msg" Namespace="BunnyBear" Assembly="msgBox" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rapport</title>
    <style type="text/css">
        .Classe_Msg
        {
            background-color: #D6DCFC;
            border-style: solid;
            border-color: #719FCE;
            border-width: thin 20px thin 20px;
            padding: 5px;
            margin: 2px;
            color: #800000;
            font-family: 'trebuchet MS';
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <Msg:msgBox ID="Dialogue" runat="server" />
    <asp:Panel runat="server" ID="Panel_Msg" Visible="false">
        <div class="Classe_Msg">
            <asp:Image ID="Image_Msg" runat="server" />
            <asp:Label ID="Label_Msg" runat="server" Text=""></asp:Label>
        </div>
    </asp:Panel>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <!---->
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="100%" Width="100%"
            ZoomMode="PageWidth" ShowCredentialPrompts="true" ShowDocumentMapButton="true"
            ShowExportControls="true" ShowRefreshButton="true" ShowToolBar="true" ShowBackButton="true"
            SizeToReportContent="true" ShowFindControls="true" ShowPrintButton="true" >
        </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
