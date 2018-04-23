<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPages/DashboardCZMasterPage.master" AutoEventWireup="false" CodeFile="Frm_DetailFormulaireExercice.aspx.vb" Inherits="GestionQEvaluation_Frm_DetailFormulaireExercice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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

            function refreshMe() {
                //$find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Reload");
            }
            function refreshReponse() {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("refreshReponse");
            }
            function refreshListeJustification() {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("refreshJustificationReponse");
            }
            function closeWindow() {
                //GetRadWindow().BrowserWindow.refreshMe();
                //GetRadWindow().close();
            }
            function CloseAndRefreshListe() {
                GetRadWindow().BrowserWindow.refreshMe();
                GetRadWindow().close();
            }
            function GetRadWindow() {
                var oWindow = null;
                if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
                else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)
                return oWindow;
            }


            function Open_Window1(page, _width, _height) {
                var largeurEcran = (screen.width - _width) / 2;
                var hauteurEcran = (screen.height - _height) / 2;
                window.open(page, 'APIDashBord', ' width=' + _width + ', height=' + _height + ', top=' + hauteurEcran + ', left=' + largeurEcran + ', toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0')
            }
            function Open_Window(page, nomFenetre, _width, _height) {
                var largeurEcran = (screen.width - _width) / 2;
                var hauteurEcran = (screen.height - _height) / 2;
                window.open(page, nomFenetre, ' width=' + _width + ', height=' + _height + ', top=' + hauteurEcran + ', left=' + largeurEcran + ', toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0')
            }
            function Open_WindowMaximize(page, nomFenetre) {
                var largeurEcran = (screen.width) / 2;
                var hauteurEcran = (screen.height) / 2;
                window.open(page, nomFenetre, ' top=' + hauteurEcran + ', left=' + largeurEcran + ', toolbar=0, location=0, directories=0, status=0, scrollbars=1, resizable=0, copyhistory=0, menuBar=0')
            }
        </script>
    </telerik:RadCodeBlock>
    <%--<telerik:RadScriptManager ID="RadScriptManager1"  runat="server"></telerik:RadScriptManager>--%>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <%--<telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="Panel_First" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="PageHeader" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="LinkButtonPrecedent1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="Panel_First" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="PageHeader" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="LinkButtonSuivant1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="Panel_First" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="PageHeader" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>--%>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <div class="container-fluid" id="pcont">
        <div class="mail-inbox">
            <section class="page-head" id="PageHeader" runat="server" style="padding: 5px 25px 3px 25px;">
                <h3>
                    <i class="fa fa-dashboard"></i>
                    <asp:Label ID="Label_Titre" runat="server" Text="FormulaireExercices" />
                    <small id="OL_SeeAllData" runat="server">
                        <asp:Label ID="Label_SousTitre" runat="server" />
                    </small>
                    <span class="pull-right box-tools">
                        <asp:LinkButton ID="LinkButtonPrecedent1" runat="server" ToolTip="Précédent" CssClass="text text-blue btn btn-info" data-placement="bottom" data-toggle="tooltip" data-original-title="Précédent">
                        <i class='fa  fa-arrow-circle-left fa-2x'></i>
                        </asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="LinkButtonSuivant1" runat="server" ToolTip="Suivant" CssClass="text text-blue btn btn-info" data-placement="bottom" data-toggle="tooltip" data-original-title="Suivant">
                            <i class='fa fa-arrow-circle-right'></i>
                        </asp:LinkButton>&nbsp;
                        
                        <div class="btn-group">
                            <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                                <i class='fa fa-print'></i>Exporter en PDF <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <asp:LinkButton ID="LinkButtonExportToPdf" runat="server">  
                                        <i class="fa fa-print"></i>
                                        Exporter Formulaire
                                    </asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LinkButton_PRINTIDCOREC" runat="server">  
                                        <i class='fa fa-print'></i> 
                                        Exporter Correctum
                                    </asp:LinkButton>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <asp:LinkButton ID="LinkButtonPrintPreviews" runat="server" ToolTip="Imprimer" CssClass="text text-blue btn btn-success" data-placement="bottom" data-toggle="tooltip" data-original-title="Imprimer">
                                        <i class='fa fa-print'></i> Exporter en Word, Excel
                                    </asp:LinkButton>&nbsp;
                                </li>
                            </ul>
                        </div>
                        &nbsp;
                        <asp:LinkButton ID="Btn_Annuler2" CausesValidation="false" runat="server" CssClass="btn btn-danger">
                            <i class="fa  fa-reply-all" ></i> Fermer
                        </asp:LinkButton>
                    </span>
                </h3>
                <ol class="breadcrumb">
                    <%--<li><a href="#"><i class="fa fa-dashboard"></i>Accueil</a></li>
                    <li class="active">FormulaireExercices</li>--%>
                </ol>
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

                <asp:Panel ID="Panel_First" runat="server" CssClass="panel2 panel-default2 panel-body2" Style="margin: 5px;">

                    <div id="DIV_Content_FormulaireExercice" runat="server">
                        <div id="DIV_Panel" class="panel panel-default panel-body">
                            <asp:Label ID="Label_IDExercice" runat="server" Visible="false" />
                            <asp:Label ID="Label_LibelleExercice" runat="server" />
                            <asp:Label ID="Label_Descriptions" runat="server" />
                            <asp:Label ID="Label_Instructions" runat="server" />
                            <asp:Label ID="Label_RappelExercice" runat="server" />
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <asp:Panel runat="server" ID="Panel1" Style="margin: 5px;">

                        <telerik:RadGrid ID="rdgQuestions" AllowPaging="True" AllowSorting="True" PageSize="100"
                            runat="server" AutoGenerateColumns="False" GridLines="None" AllowFilteringByColumn="false"
                            Culture="fr-FR" ShowGroupPanel="false"
                            EnableViewState="true" AllowMultiRowSelection="false" GroupingSettings-CaseSensitive="false">
                            <ExportSettings HideStructureColumns="true" />
                            <MasterTableView CommandItemDisplay="None" GridLines="None" DataKeyNames="ID" NoDetailRecordsText="Pas d'enregistrement"
                                NoMasterRecordsText="Pas d'enregistrement">
                                <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" ShowExportToExcelButton="false"
                                    ExportToExcelText="Exporter en excel" />
                                <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ID" UniqueName="ID" Display="false" />
                                    <telerik:GridTemplateColumn Visible="false" ShowFilterIcon="false" AllowFiltering="false" HeaderText="#" UniqueName="Compteur">
                                        <ItemTemplate>
                                            <asp:Label Visible="true" ID="lbOrder" runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Visible="false" ShowFilterIcon="false"
                                        AllowFiltering="false" HeaderText="Ordre" UniqueName="OrdreQuestion">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBox_CodeQuestion" Visible="false" runat="server" Text='<%#Bind("ID") %>' />
                                            <asp:TextBox ID="TextBox_OrdreQuestion" runat="server" Text='<%# Bind("OrdreQuestion") %>' CssClass="form-control" Width="50px"
                                                Style="text-align: center; font-size: 20px;" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Visible="true" ShowFilterIcon="false"
                                        AllowFiltering="false" HeaderText="Libelle Question" UniqueName="LibelleQuestion">
                                        <ItemTemplate>
                                            <asp:Label ID="LibelleQuestion" runat="server" Text='<%# Bind("LibelleQuestion") %>' />
                                            <asp:Label ID="ScoreTotal" runat="server" Text='<%# Bind("ScoreTotalStr") %>' Style='color: red; font-weight: bold;' />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Visible="true" ShowFilterIcon="false"
                                        AllowFiltering="false" HeaderText="Réponses" UniqueName="ReponsesListe">
                                        <ItemTemplate>
                                            <asp:Label ID="ReponsesListe" runat="server" Text='<%# Bind("ReponsesListe") %>' />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Visible="true" ShowFilterIcon="false"
                                        AllowFiltering="false" HeaderText="Justifications" UniqueName="JustificationReponseListe">
                                        <ItemTemplate>
                                            <asp:Label ID="JustificationReponseListe" runat="server" Text='<%# Bind("JustificationReponseListe") %>' />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                            </MasterTableView>
                            <GroupingSettings CaseSensitive="False" />
                            <ClientSettings AllowDragToGroup="false" AllowColumnsReorder="True">
                                <%--<ClientEvents OnRowContextMenu="RowContextMenu" OnRowDblClick="RowDblClick" />--%>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default" />
                            <PagerStyle PageSizeControlType="RadComboBox" />
                            <FilterMenu EnableImageSprites="False"></FilterMenu>
                        </telerik:RadGrid>
                    </asp:Panel>

                </asp:Panel>
                <!-- FORM LOGIN -->
                <BRAIN:CULogin2 runat="server" ID="LoginWUC" Visible="false" />
                <div class="md-overlay"></div>
                <asp:TextBox ID="txt_CodeFormulaireExercices_Hid" runat="server" Text="0" Visible="False" Width="1px"></asp:TextBox>
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
</asp:Content>

