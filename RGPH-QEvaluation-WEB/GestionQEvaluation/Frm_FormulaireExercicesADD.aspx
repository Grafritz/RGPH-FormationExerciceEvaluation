<%@ Page Title=" Formulaire Exercices" Language="VB" MasterPageFile="~/MasterPages/DashboardCZMasterPage.master" AutoEventWireup="false" CodeFile="Frm_FormulaireExercicesADD.aspx.vb" Inherits="Frm_FormulaireExercicesADD" MaintainScrollPositionOnPostback="true" %>

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
    <%--<telerik:RadScriptManager ID="RadScriptManager1"  runat="server"></telerik:RadScriptManager>--%>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="Panel_First" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="PageHeader" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="Btn_SaveInfo">
           <UpdatedControls>
               <telerik:AjaxUpdatedControl ControlID="Panel_Msg" LoadingPanelID="RadAjaxLoadingPanel1" />
               <telerik:AjaxUpdatedControl ControlID="Panel_First" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                    <asp:Label ID="Label_Titre" runat="server" Text="FormulaireExercices" />
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
                    <li class="active">FormulaireExercices</li>
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

                <asp:Panel ID="Panel_First" runat="server" CssClass="panel2 panel-default2 panel-body2" Style="margin: 5px;">

                    <div class="tab-container">
                        <ul class="nav nav-tabs">
                            <li class="active" id="li_FormulaireExercice" runat="server">
                                <asp:LinkButton ID="LinkButton_FormulaireExercice" runat="server">
                                    <i id="i_FormulaireExercice" runat="server" class="fa fa-tasks"></i>
                                    Details Formulaire
                                </asp:LinkButton>
                            </li>
                            <li class="active" id="li_Question" runat="server">
                                <asp:LinkButton ID="LinkButton_Question" runat="server">
                                    <i id="i_Question" runat="server" class="fa fa-tasks"></i>
                                    Questions
                                    <asp:Literal ID="Literal_Question" runat="server" />
                                </asp:LinkButton>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="DIV_Content_FormulaireExercice" runat="server" class="tab-pane cont active">
                                <div id="DIV_Panel">
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label>
                                                Libelle Exercice
                               <asp:RequiredFieldValidator ID="RFV_LibelleExercice" runat="server" ControlToValidate="txt_LibelleExercice"
                                   ErrorMessage="Libelle Exercice Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                   ValidationGroup="GPSave" CssClass="text-danger" />
                                            </label>
                                            <asp:TextBox ID="txt_LibelleExercice" TextMode="MultiLine" Height="100px" CssClass="form-control" Width="100%" runat="server" placeholder="Libelle Exercice..."></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label>
                                                Descriptions
                               <%--<asp:RequiredFieldValidator ID="RFV_Descriptions" runat="server" ControlToValidate="txt_Descriptions"
                                   ErrorMessage="Descriptions Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                   ValidationGroup="GPSave" CssClass="text-danger" />--%>
                                            </label>
                                            <asp:TextBox ID="txt_Descriptions" TextMode="MultiLine" Height="100px" CssClass="form-control" Width="100%" runat="server" placeholder="Descriptions..."></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label>
                                                Instructions
                                            </label>
                                            <asp:TextBox ID="txt_Instructions" TextMode="MultiLine" Height="100px" CssClass="form-control" Width="100%" runat="server" placeholder="Instructions..."></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label>
                                                Rappel Exercice
                                            </label>
                                            <asp:TextBox ID="txt_RappelExercice" TextMode="MultiLine" Height="100px" CssClass="form-control" Width="100%" runat="server" placeholder="Rappel Exercice..."></asp:TextBox>
                                        </div>

                                    </div>
                                    <div class="form-group" runat="server" visible="false" id="DIV_TypeEvaluation">
                                        <label class="col-sm-3 control-label">
                                            Type Evaluation
                                        </label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txt_TypeEvaluation" CssClass="form-control" Width="100%" runat="server" placeholder="Type Evaluation..."></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group" runat="server" visible="false" id="qwerRFV_Statut">
                                        <div class="col-sm-6">
                                            <label>
                                                Statut
                               <asp:RequiredFieldValidator ID="RFV_Statut" runat="server" ControlToValidate="txt_Statut"
                                   ErrorMessage="Statut Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                   ValidationGroup="GPSave" CssClass="text-danger" />
                                            </label>
                                            <asp:TextBox ID="txt_Statut" CssClass="form-control" Width="100%" runat="server" placeholder="Statut..."></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group" runat="server" visible="false" id="DIV_RFV_DureeEnSeconde">
                                        <div class="col-sm-4">
                                            <label>
                                                Duree En Seconde
                               <asp:RequiredFieldValidator ID="RFV_DureeEnSeconde" runat="server" ControlToValidate="txt_DureeEnSeconde"
                                   ErrorMessage="Duree En Seconde Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*"
                                   ValidationGroup="GPSave" CssClass="text-danger" />
                                            </label>
                                            <telerik:RadNumericTextBox ID="txt_DureeEnSeconde" runat="server" Skin="MetroTouch" Culture="en-US"
                                                NumberFormat-DecimalDigits="1" ShowSpinButtons="false" Value="3600" Width="100%" EmptyMessage="0.00" DataType="System.Interger"
                                                MinValue="0.00">
                                            </telerik:RadNumericTextBox>
                                        </div>
                                    </div>
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
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                            <div id="DIV_Content_Question" runat="server" class="tab-pane">
                                <asp:Panel runat="server" ID="Panel1" Style="margin: 5px;">
                                    <asp:LinkButton ID="Btn_ADD_Questions" runat="server" CssClass="btn btn-primary" CausesValidation="false">
                        <i class="fa fa-plus-circle" ></i>  Ajouter  Questions
                                    </asp:LinkButton>
                                    <span class="pull-right box-tools">
                                        <asp:LinkButton ID="rbtnClearFilters" runat="server" CssClass="btn btn-sm btn-default" CausesValidation="false"> 
                            <i class="fa fa-ban on fa-filter" ></i> Clear Filters
                                        </asp:LinkButton>
                                    </span>
                                    <telerik:RadGrid ID="rdgQuestions" AllowPaging="True" AllowSorting="True" PageSize="50"
                                        runat="server" AutoGenerateColumns="False" GridLines="None" AllowFilteringByColumn="false"
                                        Culture="fr-FR" ShowGroupPanel="false"
                                        EnableViewState="true" AllowMultiRowSelection="false" GroupingSettings-CaseSensitive="false">
                                        <ExportSettings HideStructureColumns="true" />
                                        <MasterTableView CommandItemDisplay="Top" GridLines="None" DataKeyNames="ID" NoDetailRecordsText="Pas d'enregistrement"
                                            NoMasterRecordsText="Pas d'enregistrement">
                                            <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="true" ShowExportToExcelButton="false"
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
                                                <telerik:GridTemplateColumn Visible="true" ShowFilterIcon="false"
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
                                                        <%--<asp:Label ID="ScoreTotal" runat="server" Text='<%# Bind("ScoreTotal") %>' Style="color: red; font-weight: bold;" />--%>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="ScoreTotal" UniqueName="ScoreTotal" HeaderText="Score"
                                                    FilterControlAltText="Filter ScoreTotal column" FilterControlWidth="95%" ShowFilterIcon="false"
                                                    AllowFiltering="true" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                                    <HeaderStyle HorizontalAlign="Center" Width="16px" Wrap="false" />
                                                    <ItemStyle HorizontalAlign="Center" Width="16px" />
                                                </telerik:GridBoundColumn>
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
                                        <ClientSettings AllowDragToGroup="false" AllowColumnsReorder="True">
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

