﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPages/DashboardCZMasterPage.master" AutoEventWireup="false" CodeFile="Frm_QuestionsADD.aspx.vb" Inherits="GestionQEvaluation_Frm_QuestionsADD" %>

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
            function CloseAndRefresh_ListeQuestionDisponible() {
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
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="PanelChoixReponse" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="Btn_SaveInfo">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="PanelChoixReponse" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <div class="container-fluid" id="pcont">
        <div class="mail-inbox">
            <section class="page-head" id="PageHeader" runat="server">
                <h3>
                    <i class="fa fa-dashboard"></i>
                    <asp:Label ID="Label_Titre" runat="server" Text="Questions" />
                    <small id="OL_SeeAllData" runat="server">
                        <asp:Label ID="Label_SousTitre" runat="server" />
                    </small>
                    <span class="pull-right box-tools">
                        <asp:LinkButton ID="Btn_Annuler2" CausesValidation="false" runat="server" CssClass="btn btn-danger">
                            <i class="fa  fa-reply-all" ></i> Fermer
                        </asp:LinkButton>
                    </span>
                </h3>
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

                <asp:Panel ID="Panel_First" runat="server" CssClass="panel1 panel-default1 panel-body1" Style="margin: 5px;">
                    <div id="DIV_InfoFormExercice" runat="server" visible="false" class="alert alert-info">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <label>
                            Libelle Exercice
                        </label>
                        <br />
                        <asp:Literal ID="Literal_LibelleExercice" runat="server" />
                        <asp:TextBox ID="txt_IDFormulaire_Hide" runat="server" Text="0" Visible="False" Width="1px"></asp:TextBox>
                    </div>
                    <asp:Panel runat="server" ID="PanelChoixReponse">
                        <div class="tab-container">
                            <ul class="nav nav-tabs">
                                <li class="active" id="li_Question" runat="server">
                                    <asp:LinkButton ID="LinkButton_Question" runat="server">
                                        <i id="i_Question" runat="server" class="fa fa-tasks"></i>
                                        Questions
                                    </asp:LinkButton>
                                </li>
                                <li class="active" id="li_Reponse" runat="server">
                                    <asp:LinkButton ID="LinkButton_Reponse" runat="server">
                                        <i id="i_Reponse" runat="server" class="fa fa-tasks"></i>
                                        Réponses
                                        <asp:Label runat="server" ID="LabelReponseTitre" />
                                    </asp:LinkButton>
                                </li>
                                <li id="li_JustificationReponse" runat="server">
                                    <asp:LinkButton ID="LinkButton_JustificationReponse" runat="server">
                                        <i id="i_JustificationReponse" runat="server" class="fa fa-tasks"></i>
                                        Justifications
                                        <asp:Literal runat="server" ID="Literal_Justifications" />
                                    </asp:LinkButton>
                                </li>
                                <li id="li_Fermer" runat="server"></li>
                            </ul>
                            <div class="tab-content">
                                <div id="DIV_Content_Question" runat="server" class="tab-pane cont active">
                                    <div id="DIV_Panel" class="form-horizontalq group-border-dashed1q" style="border-radius: 0px;">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <label>
                                                    Libelle Question
                                                    <asp:RequiredFieldValidator ID="RFV_LibelleQuestion" runat="server" ControlToValidate="txt_LibelleQuestion"
                                                        ErrorMessage="Libelle Question Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                                        ValidationGroup="GPSave" CssClass="text-danger" />
                                                </label>
                                                <asp:TextBox ID="txt_LibelleQuestion" TextMode="MultiLine" Height="100px" CssClass="form-control" Width="100%" runat="server" placeholder="Libelle Question..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-3">
                                                <label>
                                                    Score Total
                                                   <asp:RequiredFieldValidator ID="RFV_ScoreTotal" runat="server" ControlToValidate="txt_ScoreTotal"
                                                       ErrorMessage="Score Total Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                                       ValidationGroup="GPSave" CssClass="text-danger" />
                                                </label>
                                                <telerik:RadNumericTextBox ID="txt_ScoreTotal" runat="server" Skin="MetroTouch" Culture="en-US" NumberFormat-DecimalDigits="2"
                                                    ShowSpinButtons="false" Value="10" Width="100%" EmptyMessage="0.00" DataType="System.Decimal"
                                                    MinValue="0.00">
                                                </telerik:RadNumericTextBox>
                                            </div>
                                            <div class="col-sm-8">
                                                <br />
                                                <br />
                                                <label>
                                                    <asp:CheckBox ID="CB_AvoirJustificationYN" runat="server" Text="Cette question doit être justifié" /></label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <div id="DIV_SaveInfo" runat="server" style="margin: 5px 0px; text-align: left;">
                                                    <span id="span_SaveInfo" runat="server">
                                                        <asp:LinkButton ID="Btn_SaveInfo" runat="server" CssClass="btn btn-primary" ValidationGroup="GPSave">
                                                            <i class="fa fa-save" ></i> Enregistrer
                                                        </asp:LinkButton>
                                                    </span>
                                                    &nbsp;
                                                    <asp:LinkButton ID="Btn_Annuler" CausesValidation="false" runat="server" CssClass="btn btn-danger">
                                                        <i class="fa  fa-reply-all" ></i> Fermer
                                                    </asp:LinkButton>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div id="DIV_Content_Reponse" runat="server" class="tab-pane">
                                    <div runat="server" id="divLiteralMsg" visible="false" class="alert alert-warning alert-white rounded">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <div class="icon"><i class="fa fa-info-circle"></i></div>
                                        <asp:Literal ID="LiteralMsg" runat="server"></asp:Literal>
                                    </div>
                                    <asp:Panel ID="PanelListePossibiliteReponse" runat="server">
                                        <asp:LinkButton ID="LinkButton_NewReponse" runat="server" CssClass="btn btn-info" Style="margin-bottom: 5px;">
                                            <i class="fa fa-plus-square-o"></i> Ajouter élément de Réponse </asp:LinkButton>
                                        <telerik:RadGrid ID="rdgQuestions_Reponses" AllowPaging="True" AllowSorting="True" PageSize="20"
                                            runat="server" AutoGenerateColumns="False" GridLines="None" AllowFilteringByColumn="true"
                                            Culture="fr-FR" ShowGroupPanel="True"
                                            EnableViewState="true" AllowMultiRowSelection="false" GroupingSettings-CaseSensitive="false">
                                            <ExportSettings HideStructureColumns="true" />
                                            <MasterTableView CommandItemDisplay="None" GridLines="None" DataKeyNames="ID" NoDetailRecordsText="Pas d'enregistrement"
                                                NoMasterRecordsText="Pas d'enregistrement">
                                                <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" ShowExportToExcelButton="true"
                                                    ExportToExcelText="Exporter en excel" />
                                                <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="ID" UniqueName="ID" Display="false" />
                                                    <telerik:GridTemplateColumn Visible="true" ShowFilterIcon="false" AllowFiltering="false" HeaderText="#" UniqueName="Compteur">
                                                        <ItemTemplate>
                                                            <asp:Label Visible="true" ID="lbOrder" runat="server" />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="LibelleReponse" UniqueName="LibelleReponse" HeaderText=" Libelle Reponse"
                                                        FilterControlAltText="Filter LibelleReponse column" FilterControlWidth="95%" ShowFilterIcon="false"
                                                        AllowFiltering="true" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="Iscorrect" UniqueName="Iscorrect" HeaderText="Is Correct"
                                                        FilterControlAltText="Filter Iscorrect column" FilterControlWidth="95%" ShowFilterIcon="false"
                                                        AllowFiltering="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                                        <ItemTemplate>
                                                            <asp:Image ID="EstSautReponse_Image" runat="server" ImageUrl='<%#Bind("Iscorrect_Image") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandArgument="ID" CommandName="editer"
                                                        DataTextField="ID" ImageUrl="~/images/_edit.png"
                                                        HeaderText="" UniqueName="editer">
                                                        <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                                    </telerik:GridButtonColumn>
                                                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="delete" DataTextField="ID"
                                                        ImageUrl="~/images/delete.png"
                                                        UniqueName="delete" HeaderText="" ConfirmDialogType="RadWindow" ConfirmText="Voulez-vous vraiment supprimer cette information ?"
                                                        ConfirmTitle="Attention!">
                                                        <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                                    </telerik:GridButtonColumn>
                                                </Columns>
                                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>
                                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                                            </MasterTableView>
                                            <GroupingSettings CaseSensitive="False" />
                                            <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True">
                                                <%--<ClientEvents OnRowContextMenu="RowContextMenu" OnRowDblClick="RowDblClick" />--%>
                                                <Selecting AllowRowSelect="true" />
                                            </ClientSettings>
                                            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default" />
                                            <PagerStyle PageSizeControlType="RadComboBox" />
                                            <FilterMenu EnableImageSprites="False"></FilterMenu>
                                        </telerik:RadGrid>
                                    </asp:Panel>
                                </div>
                                <div id="DIV_Content_JustificationReponse" runat="server" class="tab-pane">
                                    <asp:Panel ID="PanelListeJustifications" runat="server">
                                        <asp:LinkButton ID="LinkButton_NewJustifications" runat="server" CssClass="btn btn-warning" Style="margin-bottom: 5px;">
                                            <i class="fa fa-plus-square-o"></i> Ajouter Justification </asp:LinkButton>
                                        <telerik:RadGrid ID="RadGrid_Justifications" AllowPaging="True" AllowSorting="True" PageSize="20"
                                            runat="server" AutoGenerateColumns="False" GridLines="None" AllowFilteringByColumn="true"
                                            Culture="fr-FR" ShowGroupPanel="True"
                                            EnableViewState="true" AllowMultiRowSelection="false" GroupingSettings-CaseSensitive="false">
                                            <ExportSettings HideStructureColumns="true" />
                                            <MasterTableView CommandItemDisplay="None" GridLines="None" DataKeyNames="ID" NoDetailRecordsText="Pas d'enregistrement"
                                                NoMasterRecordsText="Pas d'enregistrement">
                                                <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" ShowExportToExcelButton="true"
                                                    ExportToExcelText="Exporter en excel" />
                                                <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="ID" UniqueName="ID" Display="false" />
                                                    <telerik:GridTemplateColumn Visible="true" ShowFilterIcon="false" AllowFiltering="false" HeaderText="#" UniqueName="Compteur">
                                                        <ItemTemplate>
                                                            <asp:Label Visible="true" ID="lbOrder" runat="server" />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="LibelleJustification" UniqueName="LibelleJustification" HeaderText="Libelle Justification"
                                                        FilterControlAltText="Filter LibelleJustification column" FilterControlWidth="95%" ShowFilterIcon="false"
                                                        AllowFiltering="true" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn DataField="Iscorrect" UniqueName="Iscorrect" HeaderText="Is Correct"
                                                        FilterControlAltText="Filter Iscorrect column" FilterControlWidth="95%" ShowFilterIcon="false"
                                                        AllowFiltering="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                                        <ItemTemplate>
                                                            <asp:Image ID="EstSautReponse_Image" runat="server" ImageUrl='<%#Bind("Iscorrect_Image") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandArgument="ID" CommandName="editer"
                                                        DataTextField="ID" ImageUrl="~/images/_edit.png"
                                                        HeaderText="" UniqueName="editer">
                                                        <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                                    </telerik:GridButtonColumn>
                                                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="delete" DataTextField="ID"
                                                        ImageUrl="~/images/delete.png"
                                                        UniqueName="delete" HeaderText="" ConfirmDialogType="RadWindow" ConfirmText="Voulez-vous vraiment supprimer cette information ?"
                                                        ConfirmTitle="Attention!">
                                                        <HeaderStyle HorizontalAlign="Center" Width="16px" />
                                                        <ItemStyle HorizontalAlign="Center" Width="16px" />
                                                    </telerik:GridButtonColumn>
                                                </Columns>
                                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>
                                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                                            </MasterTableView>
                                            <GroupingSettings CaseSensitive="False" />
                                            <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True">
                                                <%--<ClientEvents OnRowContextMenu="RowContextMenu" OnRowDblClick="RowDblClick" />--%>
                                                <Selecting AllowRowSelect="true" />
                                            </ClientSettings>
                                            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default" />
                                            <PagerStyle PageSizeControlType="RadComboBox" />
                                            <FilterMenu EnableImageSprites="False"></FilterMenu>
                                        </telerik:RadGrid>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </asp:Panel>
                <!-- FORM LOGIN -->
                <BRAIN:CULogin2 runat="server" ID="LoginWUC" Visible="false" />
                <div class="md-overlay"></div>
                <asp:TextBox ID="txt_CodeQuestions_Hid" runat="server" Text="0" Visible="False" Width="1px"></asp:TextBox>
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

    <telerik:RadContextMenu ID="ContextMenu" runat="server" OnClientItemClicked="MenuItemClicked" EnableRoundedCorners="true" EnableShadows="true">
        <Items>
            <telerik:RadMenuItem Visible="true" Value="Editer" Text="Visualiser / Modifier" ImageUrl="~/images/_edit.png" HoveredImageUrl="~/images/_edit.png" />
            <%--<telerik:RadMenuItem Visible="false" Value="Delete" Text="Supprimer" ImageUrl="~/images/delete.png" HoveredImageUrl="~/images/delete.png" />--%>
        </Items>
    </telerik:RadContextMenu>
    <input id="txtWindowPage" type="hidden" />
</asp:Content>

