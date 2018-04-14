<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPages/DashboardCZMasterPage.master" AutoEventWireup="false"
    CodeFile="Frm_QuestionDisponible.aspx.vb" Inherits="GestionQEvaluation_Frm_QuestionDisponible" %>

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
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Reload");
            }
            function refreshReponse() {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("refreshReponse");
            }
            function refreshListeJustification() {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("refreshJustificationReponse");
            }
            function closeWindow() {
                GetRadWindow().BrowserWindow.refreshMe();
                GetRadWindow().close();
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
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="Panel_First" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="PageHeader" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="LinkButton_ADDQuestionsToFormExo">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="Panel_First" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="PageHeader" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <input type='hidden' id='radGridClickedRowIndex' name='radGridClickedRowIndex' />
    <div class="container-fluid" id="pcont">
        <div class="mail-inbox">
            <section class="page-head" id="PageHeader" runat="server">
                <h3>
                    <i class="fa fa-dashboard"></i>
                    <asp:Label ID="Label_Titre" runat="server" Text=" Questions" />
                    <small id="OL_SeeAllData" runat="server">
                        <asp:Label ID="Label_SousTitre" runat="server" />
                    </small>
                </h3>
                <!--<ol class="breadcrumb"> 
                    <li><a href="#"><i class="fa fa-dashboard"></i>Accueil</a></li>
                    <li class="active"> Questions</li>
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

                <asp:Panel runat="server" ID="Panel_First" Style="margin: 5px;">
                    <div class="alert alert-info alert-white rounded">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <div class="icon"><i class="fa fa-info-circle"></i></div>
                        Sélectionner la ou les question(s) que vous souhaiteriez ajouter au:<br />
                        <strong>Formulaire:</strong>
                        <asp:Literal runat="server" ID="Literal_LibelleExercice" />
                    </div>
                    <asp:LinkButton ID="LinkButton_ADDQuestionsToFormExo" runat="server" CssClass="btn btn-primary"
                        CausesValidation="false">
                        <i class="fa fa-check-square-o" ></i> <asp:Literal  ID="Literal_CountQuestionSelected" runat="server" Text="Sélectionner Questions" />
                    </asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton_NewQuestions" runat="server" CssClass="btn btn-success"
                        CausesValidation="false">
                        <i class="fa fa-plus-circle" ></i>  Ajouter Nouvelle Question
                    </asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton_Fermer" runat="server" CssClass="btn btn-danger"
                        CausesValidation="false">
                        <i class="fa fa-times-circle" ></i>  Fermer
                    </asp:LinkButton>
                    <span class="pull-right box-tools">
                        <asp:LinkButton ID="rbtnClearFilters" runat="server" CssClass="btn btn-sm btn-default" CausesValidation="false"> 
                            <i class="fa fa-ban on fa-filter" ></i> Clear Filters
                        </asp:LinkButton>
                    </span>
                    <telerik:RadGrid ID="rdgQuestions" AllowPaging="True" AllowSorting="True" PageSize="20"
                        runat="server" AutoGenerateColumns="False" GridLines="None" AllowFilteringByColumn="true"
                        Culture="fr-FR" ShowGroupPanel="false"
                        EnableViewState="true" AllowMultiRowSelection="false" GroupingSettings-CaseSensitive="false">
                        <ExportSettings HideStructureColumns="true" />
                        <MasterTableView CommandItemDisplay="None" GridLines="None" DataKeyNames="ID" NoDetailRecordsText="Pas d'enregistrement"
                            NoMasterRecordsText="Pas d'enregistrement">
                            <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" ShowExportToExcelButton="true"
                                ExportToExcelText="Exporter en excel" />
                            <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                            <Columns>
                                <telerik:GridBoundColumn DataField="ID" UniqueName="ID" Display="false" />
                                <telerik:GridTemplateColumn Visible="true" ShowFilterIcon="false"
                                    AllowFiltering="false" HeaderText="Choix" UniqueName="CheckItems">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox_CheckItems" Visible="false" runat="server" />
                                        <asp:ImageButton ID="ImageButton_CHOIX_QUESTION" runat="server"
                                            CommandName="CHOIX_QUESTION" CommandArgument='<%# Bind("ID") %>' ImageUrl="~/images/cancel.png" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                    <ItemStyle HorizontalAlign="Center" Width="16px" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Visible="true" ShowFilterIcon="false"
                                    AllowFiltering="false" HeaderText="Ordre" UniqueName="OrdreQuestion">
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBox_CodeQuestion" Visible="false" runat="server" Text='<%#Bind("ID") %>' />
                                        <asp:TextBox ID="TextBox_OrdreQuestion" runat="server" CssClass="form-control" Width="50px"
                                            Style="text-align: center; font-size: 20px;" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="16px" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="LibelleQuestion" UniqueName="LibelleQuestion" HeaderText=" Libelle Question"
                                    FilterControlAltText="Filter LibelleQuestion column" FilterControlWidth="95%" ShowFilterIcon="false"
                                    AllowFiltering="true" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ScoreTotal" UniqueName="ScoreTotal" HeaderText=" Score Total"
                                    FilterControlAltText="Filter ScoreTotal column" FilterControlWidth="95%" ShowFilterIcon="false"
                                    AllowFiltering="true" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                    <HeaderStyle HorizontalAlign="Center" Width="16px" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Width="16px" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataField="AvoirJustificationYN" UniqueName="AvoirJustificationYN" HeaderText="Justification"
                                    FilterControlAltText="Filter AvoirJustificationYN column" FilterControlWidth="95%" ShowFilterIcon="false"
                                    AllowFiltering="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                    <ItemTemplate>
                                        <asp:Label ID="AvoirJustificationYN_OuiNon" runat="server" Text='<%#Bind("AvoirJustificationYN_OuiNon") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Width="16px" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Width="16px" />
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
                <!-- FORM LOGIN -->
                <BRAIN:CULogin2 runat="server" ID="LoginWUC" Visible="false" />
                <div class="md-overlay"></div>
                <asp:TextBox ID="txt_CodeFormulaireExercices_Hide" runat="server" Text="0"
                    Visible="False" Width="1px"></asp:TextBox>
                <asp:TextBox ID="txt_OrdreQuestion" runat="server" Text="0"
                    Visible="False" Width="1px"></asp:TextBox>
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

