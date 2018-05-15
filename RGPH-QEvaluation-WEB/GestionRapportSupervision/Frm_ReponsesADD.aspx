﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPages/DashboardCZMasterPage.master" AutoEventWireup="false" CodeFile="Frm_ReponsesADD.aspx.vb" Inherits="GestionQEvaluation_Frm_ReponsesADD" %>

<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function ShowAddUpdateForm(strPage, tmpW, tmpH) {
                var oWindow = window.radopen(strPage, "AddUpdateDialog");
                //oWindow.set_autoSize(true);
                oWindow.SetSize(tmpW, tmpH);
                document.getElementById("txtWindowPage").value = strPage;
                if (oWindow) {
                    if (!oWindow.isClosed()) {
                        oWindow.center();
                        var bounds = oWindow.getWindowBounds();
                        oWindow.moveTo(bounds.x + 'px', "50px");
                    }
                }
                return false;
            }

            function ShowAddUpdateFormMaximized(strPage, tmpW, tmpH) {
                var oWindow = window.radopen(strPage, "AddUpdateDialog");
                oWindow.SetSize(tmpW, tmpH);
                document.getElementById("txtWindowPage").value = strPage;
                if (oWindow) {
                    if (!oWindow.isClosed()) {
                        oWindow.center();
                        var bounds = oWindow.getWindowBounds();
                        oWindow.moveTo(bounds.x + 'px', "50px");
                    }
                }
                oWindow.maximize();
                return false;
            } // 

            function ShowAddUpdateFormAutoSize(strPage, tmpW, tmpH) {
                var oWindow = window.radopen(strPage, "AddUpdateDialog");
                oWindow.set_autoSize(true);
                document.getElementById("txtWindowPage").value = strPage;
                if (oWindow) {
                    if (!oWindow.isClosed()) {
                        oWindow.center();
                        var bounds = oWindow.getWindowBounds();
                        oWindow.moveTo(bounds.x + 'px', "50px");
                    }
                }
                return false;
            }
            function RadWindowClosing() {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Reload");
            }

            function RadWindowClientResizeEnd() {
                var manager = GetRadWindowManager();
                var window1 = manager.getActiveWindow();
                window1.center();
                var bounds = window1.getWindowBounds();
                window1.moveTo(bounds.x + 'px', "50px");
            }

            function CloseAndRefreshListe() {
                GetRadWindow().BrowserWindow.refreshMe();
                GetRadWindow().close();
            }

            function CloseAndrefreshReponse() {
                GetRadWindow().BrowserWindow.refreshReponse();
                GetRadWindow().close();
            }
            function GetRadWindow() {
                var oWindow = null;
                if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
                else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)
                return oWindow;
            }
        </script>
    </telerik:RadCodeBlock>
    <%--<telerik:RadScriptManager ID="RadScriptManager1"  runat="server"></telerik:RadScriptManager>--%>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <%--<telerik:AjaxSetting AjaxControlID="Btn_SaveInfo">
           <UpdatedControls>
               <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
               <telerik:AjaxUpdatedControl ControlID="Panel_First" LoadingPanelID="RadAjaxLoadingPanel1" />
           </UpdatedControls>
       </telerik:AjaxSetting>--%>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <div class="container-fluid" id="pcont">
        <div class="mail-inbox">
            <section class="page-head" id="PageHeader" runat="server">
                <h3>
                    <i class="fa fa-dashboard"></i>
                    <asp:Label ID="Label_Titre" runat="server" Text="Reponses" />
                    <small id="OL_SeeAllData" runat="server">
                        <asp:Label ID="Label_SousTitre" runat="server" />
                    </small>
                    <span class="pull-right box-tools">
                        <asp:LinkButton ID="Btn_Annuler2" CausesValidation="false" runat="server" CssClass="btn btn-danger">
                            <i class="fa  fa-reply-all" ></i> Fermer
                        </asp:LinkButton>
                    </span>
                </h3>
                <!--<ol class="breadcrumb"> 
                    <li><a href="#"><i class="fa fa-dashboard"></i>Accueil</a></li>
                    <li class="active">Reponses</li>
                </ol> -->
            </section>
            <section class="content">
                <Msg:msgBox ID="Dialogue" runat="server" />
                <asp:Panel runat="server" ID="Panel_Msg" Visible="false">
                    <div id="DIV_Msg" runat="server" class="alert alert-warning alert-dismissable">
                        <i id="Icon_Msg" runat="server" class="fa fa-warning"></i>
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <asp:Image ID="Image_Msg" runat="server" />
                        <asp:Label ID="Label_Msg" runat="server" Text=""></asp:Label>
                    </div>
                </asp:Panel>

                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="GPSave" runat="server" CssClass="alert alert-danger alert-dismissable" ShowMessageBox="true" ShowSummary="true" />

                <asp:Panel ID="Panel_First" runat="server" CssClass="panel panel-default panel-body" Style="margin: 5px;">
                    <div id="DIV_Panel" class="form-horizontal group-border-dashed1" style="border-radius: 0px;">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <label>
                                    Question
                               <asp:RequiredFieldValidator ID="RFV_CodeQuestion" runat="server" ControlToValidate="DDL_CodeQuestion"
                                   ErrorMessage="_ Code Question Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                   ValidationGroup="GPSave" CssClass="text-danger" />
                                    <asp:RequiredFieldValidator ID="RFV1_CodeQuestion" runat="server" ControlToValidate="DDL_CodeQuestion"
                                        ErrorMessage=" Question Obligatoire !" InitialValue="0" SetFocusOnError="true" Display="Dynamic" Text="*"
                                        ValidationGroup="GPSave" CssClass="text-danger" />
                                </label>
                                <asp:DropDownList ID="DDL_CodeQuestion" AutoPostBack="true" CssClass="select2" Width="100%" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <label>
                                    Libelle Reponse
                               <asp:RequiredFieldValidator ID="RFV_LibelleReponse" runat="server" ControlToValidate="txt_LibelleReponse"
                                   ErrorMessage="Libelle Reponse Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                   ValidationGroup="GPSave" CssClass="text-danger" />
                                </label>
                                <asp:TextBox ID="txt_LibelleReponse" TextMode="MultiLine" Height="100px" CssClass="form-control"
                                    Width="100%" runat="server" placeholder="Libelle Reponse..."></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>
                                    Code Réponse
                                    <asp:RequiredFieldValidator ID="RFV_CodeReponseManuel" runat="server" ControlToValidate="txt_CodeReponseManuel"
                                        ErrorMessage="Code Reponse Manuel Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                        ValidationGroup="GPSave" CssClass="text-danger" />
                                </label>
                                <telerik:RadNumericTextBox ID="txt_CodeReponseManuel" runat="server" Skin="MetroTouch" Culture="en-US" NumberFormat-DecimalDigits="0"
                                    ShowSpinButtons="false"  Width="100%" EmptyMessage="0" DataType="System.Decimal"
                                    >
                                </telerik:RadNumericTextBox>
                            </div>
                            <div class="col-sm-3">
                                <label>
                                    Score Total
                                    <asp:RequiredFieldValidator ID="RFV_ScoreTotal" runat="server" ControlToValidate="txt_ScoreTotal"
                                        ErrorMessage="Score Total Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                        ValidationGroup="GPSave" CssClass="text-danger" />
                                </label>
                                <telerik:RadNumericTextBox ID="txt_ScoreTotal" runat="server" Skin="MetroTouch" Culture="en-US" NumberFormat-DecimalDigits="2"
                                    ShowSpinButtons="false" Value="0" Width="100%" EmptyMessage="0.00" DataType="System.Decimal"
                                    >
                                </telerik:RadNumericTextBox>
                            </div>
                            <div class="col-sm-8">
                                <br />
                                <br />                                                
                                <asp:CheckBox ID="CB_Iscorrect" runat="server" Text="Cette réponse est la bonne" />
                                &nbsp;  &nbsp;
                                <i class="text-danger">
                                    <asp:Literal ID="LiteralBonneReponse" runat="server" />
                                </i>
                            </div>
                        </div>
                        <br />
                            <label for="ctl00_ContentPlaceHolder1_CB_Iscorrect" class="text-danger">
                                <i>(NB:.Il ne peut y avoir deux réponses correcte)</i> </label>
                        <div id="DIV_SaveInfo" runat="server" style="margin: 5px 0px; text-align: left;">
                            <span id="span_SaveInfo" runat="server">
                                <asp:LinkButton ID="Btn_SaveInfo" runat="server" CssClass="btn btn-primary" ValidationGroup="GPSave">
                                    <i class="fa fa-save" ></i> Enregistrer et Fermer
                                </asp:LinkButton>
                            </span>
                            &nbsp;
                            <span id="span_SaveInfo_AndContinuous" runat="server">
                                <asp:LinkButton ID="Btn_SaveInfo_AndContinuous" runat="server" CssClass="btn btn-success" ValidationGroup="GPSave">
                                    <i class="fa fa-save" ></i> Enregistrer et Continuer
                                </asp:LinkButton>
                            </span>
                            &nbsp;
                            <asp:LinkButton ID="Btn_Annuler" CausesValidation="false" runat="server" CssClass="btn btn-danger">
                                <i class="fa  fa-reply-all" ></i> Fermer
                            </asp:LinkButton>
                        </div>
                    </div>
                </asp:Panel>
                <!-- FORM LOGIN -->
                <BRAIN:CULogin2 runat="server" ID="LoginWUC" Visible="false" />
                <div class="md-overlay"></div>
                <asp:TextBox ID="txt_CodeReponses_Hid" runat="server" Text="0" Visible="False" Width="1px"></asp:TextBox>
            </section>

            <asp:Literal runat="server" ID="LiteralStyleCSS"></asp:Literal>
        </div>
    </div>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" VisibleStatusbar="false" EnableViewState="false">
        <Windows>
            <telerik:RadWindow ID="AddUpdateDialog" runat="server" Title="" IconUrl="~/Images/favicon.ico" Left="75px" ReloadOnShow="true"
                ShowContentDuringLoad="false" Modal="true" OnClientClose="RadWindowClosing" Behaviors="Reload, Move, Resize, Maximize, Close"
                EnableShadow="false" OnClientResizeEnd="RadWindowClientResizeEnd" />
        </Windows>
    </telerik:RadWindowManager>
    <input id="txtWindowPage" type="hidden" />
</asp:content>
