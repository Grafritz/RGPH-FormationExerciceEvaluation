<%@ Page Title=".:: Sécurité - User ::." Language="VB" MasterPageFile="~/MasterPages/MasterPage_Security.master"
    AutoEventWireup="false" CodeFile="Wfrm_User.aspx.vb" Inherits="Parametres_Administration_Wfrm_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
        <h1>
            <asp:Label ID="Label_Titre" runat="server" Text="UTILISATEURS " />
            <small> <asp:Label ID="LabelNumeroDeReference" runat="server" /></small>
                        <asp:LinkButton ID="LinkButton_AddNew" runat="server"  CausesValidation="false" 
                        CssClass="btn btn-info"><i class="fa fa-plus-square"></i> Nouveau</asp:LinkButton>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Accueil</a></li>
            <li class="active">Utilisateur</li>
        </ol>
     </section>
    <section class="content" style="padding-top: 0px;">
    <div id="Div_CorpsFille">
        <!-- DEBUT FORMAT TEXT AREA -->
        <script type="text/javascript" src="../../JavaScript/tiny_mce/tiny_mce.js"></script>
        <script language="javascript" type="text/javascript">
            // Tiny MCE Pour les textareas
            tinyMCE.init({
                mode: "textareas",
                theme: "advanced",
                //theme_advanced_buttons1: "BtnNameDest,|,bold,italic,underline,separator,strikethrough,|,forecolor,backcolor,|,justifyleft,justifycenter,justifyright, justifyfull,|,bullist,numlist,|,undo,redo,|,link,unlink",
                theme_advanced_buttons1: "BtnNameDest,|,bold,italic,underline,strikethrough,|,forecolor,backcolor,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect|,bullist,numlist,undo,redo,link,unlink,||,emotions,iespell,media,advhr",
                theme_advanced_buttons2: "",
                theme_advanced_buttons3: "",
                theme_advanced_toolbar_location: "top",
                theme_advanced_toolbar_align: "left",
                theme_advanced_statusbar_location: "bottom",
                plugins: 'inlinepopups',
                setup: function (ed) {
                    // Add a custom button
                    ed.addButton('BtnNameDest', {
                        title: 'Ajouter le Nom du destinataire',
                        image: '../Images/user_.png',
                        onclick: function () {
                            // Add you own code to execute something on click
                            ed.focus();
                            ed.selection.setContent('_NOMCOMPLET');
                        }
                    });
                }
            });
        </script>
        <%--<ajaxToolkit:ToolkitScriptManager runat="Server" AsyncPostBackTimeout="600" EnablePartialRendering="true"
            EnableScriptGlobalization="true" EnableScriptLocalization="true" ID="ScriptManager1" />--%>
        <%--<asp:UpdatePanel ID="UpdatePanel_First" runat="server">
            <ContentTemplate>
                    <div style="display: inline; float: left; padding-right: 10px;">
                        <asp:UpdateProgress ID="updProgHeader" runat="server" AssociatedUpdatePanelID="UpdatePanel_First">
                            <ProgressTemplate>
                                <div>
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/spinner.gif" AlternateText="Waiting..." />
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>--%>
                <Msg:msgBox ID="Dialogue" runat="server" />
                <asp:Panel runat="server" ID="Panel_Msg" Visible="false">
                    <div class="alert alert-warning">
                        <asp:Image ID="Image_Msg" runat="server" />
                        <asp:Label ID="Label_Msg" runat="server" Text=""></asp:Label>
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="Panel_First2">
                    <br style="clear: both;" />
                    <div id="Div_First">
                        <asp:Panel ID="Panel_First" runat="server">
                            <div runat="server" id="TABLEAU_ADD">
                                <fieldset class="_fieldset">                                   
                                    <table style="width: 100%;" align="center">
                                        <tr>
                                            <td style="text-align: center; vertical-align: top;" rowspan="12">
                                                <asp:Image ID="Image_participant" runat="server" ImageUrl="~/images/no-avatar.jpg"
                                                    CssClass="img-circle" Width="100px" />
                                                <br />
                                            </td>
                                            <tr runat="server" id="TR_EmailString">
                                                <td style="white-space: nowrap;" colspan="2">
                                                    <div class="alert alert-info alert-dismissable">
                                                        <i class="fa fa-info"></i>
                                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                                            &times;</button>
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td style="text-align: right">
                                                                    <asp:Label ID="Label5" runat="server" CssClass="ClassLabel" Text="Last login:" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelLastlogin" runat="server" CssClass="ClassLabel" Text="" />
                                                                </td>
                                                                <td style="text-align: right">
                                                                    <asp:Label ID="Labelq7" runat="server" CssClass="ClassLabel" Text="Last IP:" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelLastip" runat="server" CssClass="ClassLabel" Text="" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
                                                        ShowSummary="true" CssClass="alert alert-warning" />
                                                </td>
                                            </tr>
                                        </tr>
                                        <tr runat="server" visible="true" id="TRtxtEmailCompte" class="alert alert-info alert-dismissable">
                                            <td style="text-align: right">
                                                <asp:Label ID="Label7" runat="server" CssClass="ClassLabel" Text="Email/Compte" Style="font-weight: 700"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmailCompte"
                                                    Display="Dynamic" ErrorMessage="Email / Compte obligatoire !" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="REVtxtEmail" runat="server" ControlToValidate="txtEmailCompte"
                                                    ErrorMessage="Email incorrete - le format doit etre: monemail@nomdomaine.ext"
                                                    SetFocusOnError="True" Display="Dynamic" Text="*" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" />
                                            </td>
                                            <td>
                                                <telerik:RadTextBox ID="txtEmailCompte" runat="server" Width="95%" CssClass="form-control">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr runat="server" visible="true" id="TR_MotdePasse" class="alert alert-info alert-dismissable">
                                            <td class="TextAlignRight" style="text-align: right; vertical-align:text-top;">
                                                <asp:Label ID="Label2" runat="server" Text="Mot de passe" Style="font-weight: 700"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_ID" runat="server" Visible="false" Width="10px" />
                                                <telerik:RadTextBox ID="txt_MotdePasse" runat="server" TextMode="Password" CssClass="form-control"
                                                    Width="200px" style="float:left;" > </telerik:RadTextBox>&nbsp;
                                                <telerik:RadButton ID="Btn_Reset_MotdePasse" runat="server" 
                                                    Icon-PrimaryIconUrl="~/images/view-refresh.png" Text="Reset">
                                                </telerik:RadButton><br />
                                                <asp:CheckBox ID="CBXMustChangePassword" runat="server"  Text="Forcer à changer son mot de passe" /><br />
                                                <asp:CheckBox ID="CBXGenererLeMotDePasse" runat="server"  Text="Générer le mot de passe" />
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label8" runat="server" CssClass="ClassLabel" Text="Photo"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RFVFileUpload_Photo" runat="server" ControlToValidate="FileUpload1"
                                                    Display="Dynamic" ErrorMessage="Téléchargez le logo à partir de votre ordinateur.&lt;br /&gt;-La taille ne doit pas dépassée &lt;b&gt;50Kb&lt;/b&gt;.&lt;br /&gt;&lt;a href='#' class='LinkSite' target='_blank'&gt;&lt;i&gt;Technique pour compresser une Image&lt;/i&gt;&lt;/a&gt;."
                                                    SetFocusOnError="True" Style="color: #FF0000" Text="*" ValidationGroup="GPSavePH" />
                                              
                                            </td>
                                            <td>
                                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="ComboField" Style="float: left;" />
                                                <telerik:RadButton ID="Btn_ChargerPhoto" runat="server" Icon-PrimaryHoveredIconUrl="~/images/save2.png"
                                                    Icon-PrimaryIconUrl="~/images/photo.png" Text="..." ToolTip="Changer le photo du participant">
                                                </telerik:RadButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label9" runat="server" CssClass="ClassLabel" Text="Nom" ></asp:Label>
                                                <asp:RequiredFieldValidator ID="RFVtxtNom" runat="server" ControlToValidate="txtNom"
                                                    Display="Dynamic" ErrorMessage="Nom obligatoire !" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                             
                                            </td>
                                            <td>
                                                <telerik:RadTextBox ID="txtNom" runat="server" Width="95%" CssClass="form-control">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label11" runat="server" CssClass="ClassLabel" Text="Prénom"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RFVtxtPrenom" runat="server" ControlToValidate="txtPrenom"
                                                    ErrorMessage="Prénom obligatoire !" Display="Dynamic" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                              
                                            </td>
                                            <td>
                                                <telerik:RadTextBox ID="RadTextBox1" runat="server" Text="0" Visible="false" Width="0px">
                                                </telerik:RadTextBox>
                                                <telerik:RadTextBox ID="txtPrenom" runat="server" Width="95%" CssClass="form-control">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label13" runat="server" CssClass="ClassLabel" Text="Téléphone"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RFVtxtTelephone" runat="server" ControlToValidate="txtTelephone"
                                                    ErrorMessage="Téléphone obligatoire !" Display="Dynamic" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                             
                                            </td>
                                            <td>
                                                <telerik:RadTextBox ID="txtTelephone" runat="server" Width="280px" CssClass="form-control">
                                                </telerik:RadTextBox>
                                                <asp:CheckBox ID="CBXActifyn" runat="server" Checked="true" Text="Actif Y/N" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="" colspan="2">
                                                <hr style="margin:2px;" /> 
                                                <asp:CheckBox ID="CBX_SendAccountAndPassword" runat="server" style="font-size:12px;display:block; color:Red;"  Text=" Envoyer par email les informations du compte à l'utilisateur et une copie a moi." />
                                            </td>
                                        </tr>
                                        <tr runat="server" visible="true" id="TRGroupeUtilisateur">
                                            <td style="text-align: right">
                                                <asp:Label ID="Label15" runat="server" CssClass="ClassLabel" Text="Groupe"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDLGroupeUtilisateur"
                                                    InitialValue="0" Display="Dynamic" ErrorMessage="Groupe obligatoire" Text="*" />
                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server"
                                                    ControlToValidate="DDLGroupeUtilisateur" ErrorMessage="Groupe obligatoire" Text="*" />
                                            </td>
                                            <td>
                                                <telerik:RadComboBox ID="DDLGroupeUtilisateur" runat="server" Width="280px">
                                                    <Items>
                                                        <telerik:RadComboBoxItem runat="server" Text="Secretaire de réunion" Value="2" />
                                                        <telerik:RadComboBoxItem runat="server" Selected="True" Text="Participant" Value="3" />
                                                        <telerik:RadComboBoxItem runat="server" Text="President de réunion" Value="4" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                              
                                            </td>
                                            <td style="text-align: left">
                                                <telerik:RadButton ID="Btn_Save" runat="server" Icon-PrimaryHoveredIconUrl="~/images/save2.png"
                                                    Icon-PrimaryIconUrl="~/images/save.png" Text="Enregistrer">
                                                </telerik:RadButton>                                                
                                        &nbsp;
                                                <telerik:RadButton ID="Btn_Annuler" runat="server" 
                                                    Icon-PrimaryIconUrl="~/images/cancel.png" Text="Annuler" CausesValidation="false">
                                                </telerik:RadButton>
                                        
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </div>
                        </asp:Panel>
                    </div>
                    <!-- DEBUT Notification Send Email -->
                    <asp:Panel ID="Panel_NotificationSendEmail" Visible="false" runat="server" Style="border: 1px solid #6699FF;
                        background-color: #FFFFFF; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;">
                        <div id="HeaderModalPopUp" runat="server" class="accordionHeader" style="text-align: left;">
                            <asp:Label ID="LabelNotification_STR" runat="server" Text='Notification Utilisateur' /></b>
                            <asp:Button ID="ButtonCancel" Style="float: right;" CssClass="BtnCancel" runat="server"
                                Text="Fermer" />
                        </div>
                        <div style="background-color: #E1F0FF;">
                            <div style="text-align: left;">
                                <asp:Panel runat="server" ID="PanelMsg" Visible="false">
                                    <div class="Classe_Msg">
                                        <asp:Image ID="ImageMsg" runat="server" />
                                        <asp:Label ID="LabelMsg" runat="server" Text="" />
                                    </div>
                                </asp:Panel>
                                <table style="width: 100%; margin: 10px;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" Style="font-weight: 700">Votre Email(From) :</asp:Label><br />
                                            <asp:TextBox ID="Txt_VotreEmail" runat="server" CssClass="TextField" Width="95%" />
                                            <asp:RequiredFieldValidator ID="RFVTxt_VotreEmail" runat="server" ControlToValidate="Txt_VotreEmail"
                                                ErrorMessage="Votre Email est obligatoire" SetFocusOnError="True" Text="*" ValidationGroup="GPSendNotification"
                                                Style="color: #FF0000"></asp:RequiredFieldValidator><ajaxToolkit:ValidatorCalloutExtender
                                                    ID="ValidatorCalloutExtender15" runat="Server" HighlightCssClass="validatorCalloutHighlight"
                                                    TargetControlID="RFVTxt_VotreEmail" />
                                            <asp:RegularExpressionValidator ID="REVTxt_VotreEmail" runat="server" ControlToValidate="Txt_VotreEmail"
                                                ErrorMessage="Email incorrete - le format doit etre: monemail@nomdomaine.ext"
                                                SetFocusOnError="True" Text="*" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                                ValidationGroup="GPSendNotification"></asp:RegularExpressionValidator><ajaxToolkit:ValidatorCalloutExtender
                                                    ID="ValidatorCalloutExtender9" runat="Server" HighlightCssClass="validatorCalloutHighlight"
                                                    TargetControlID="REVTxt_VotreEmail" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Style="font-weight: 700" Text="Email destination(To):" />
                                            <asp:Label ID="Label_EmailDestination" runat="server" Style="font-weight: 700" Text="0" /><br />
                                            <asp:TextBox ID="txt_EmailTo" runat="server" CssClass="TextField" Width="95%" />
                                            <asp:RequiredFieldValidator ID="RFVtxt_EmailTo" runat="server" ControlToValidate="txt_EmailTo"
                                                ErrorMessage="Adresse email destination obligatoire" SetFocusOnError="True" Text="*"
                                                ValidationGroup="GPSendNotification" Style="color: #FF0000" />
                                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender13" runat="Server"
                                                HighlightCssClass="validatorCalloutHighlight" TargetControlID="RFVtxt_EmailTo" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Style="font-weight: 700">Notes(Optionel):</asp:Label><br />
                                            <asp:TextBox ID="txt_Notes" runat="server" TextMode="MultiLine" CssClass="TextField"
                                                Style="width: 95%; height: 200px;">
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                            <asp:Button ID="Btn_SendNotification" ValidationGroup="GPSendNotification" CssClass="BtnPartager"
                                                runat="server" Text="Notifier cette utilisateur" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </asp:Panel>
                    <!-- FIN -->
                    <div id="Div_List">
                        <asp:Panel ID="Panel_List" runat="server">
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <div style="float: left; width: 200px;">
                                            <%--<div style="display: inline; float: left; padding-right: 10px;">
                                                <asp:UpdateProgress ID="UpdateProgress31" runat="server" AssociatedUpdatePanelID="UpdatePanel_First">
                                                    <ProgressTemplate>
                                                        <div>
                                                            <asp:Image ID="Image13spinner" runat="server" ImageUrl="~/Images/spinner.gif" AlternateText="Waiting..." />
                                                        </div>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </div>--%>
                                        </div>
                                        <div style="float: right;">
                                            <asp:Panel ID="Panel_Search" runat="server">
                                                Recherche:
                                                <asp:TextBox ID="txt_Search" runat="server" CssClass="TextField" Width="200px" />
                                                <asp:Button ID="Btn_Search" runat="server" CausesValidation="false" CssClass="BtnControl_Search"
                                                    Text="RECHERCHER" /></asp:Panel>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView_List" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            CellPadding="4" CssClass="GridViewCss" DataKeyNames="ID" ForeColor="#333333"
                                            GridLines="None" PageSize="20" AllowSorting="True" Width="100%">
                                            <%-- <RowStyle CssClass="RowStyle" />
                                            <SelectedRowStyle CssClass="SelectedRowStyle" />
                                            <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                            <FooterStyle CssClass="FooterStyle" />
                                            <HeaderStyle CssClass="HeaderStyle" ForeColor="White" />
                                            <PagerStyle CssClass="PagerStyle" ForeColor="White" />
                                            <PagerStyle CssClass="DataPager" />--%>
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerSettings FirstPageImageUrl="~/Images/first.png" LastPageImageUrl="~/Images/Last.png"
                                                Position="TopAndBottom" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbOrder" runat="server"></asp:Label><asp:Label ID="lbID" runat="server"
                                                            Text='<%# Bind("ID") %>' Visible="false"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField ReadOnly="true" DataField="USERNAME" HeaderText="Nom utilisateur"
                                                    SortExpression="USERNAME" />
                                                <asp:BoundField ReadOnly="true" DataField="NOMCOMPLET" HeaderText="Nom Complet" SortExpression="NOMCOMPLET" />
                                                <asp:BoundField ReadOnly="true" DataField="GROUPE_STR" HeaderText="Groupe" SortExpression="GROUPE_STR" />
                                                <asp:ImageField DataImageUrlField="ACTIF_YN_IMAGE" SortExpression="ACTIF_YN" ControlStyle-Width="16px"
                                                    HeaderText="Stat" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                    ReadOnly="True">
                                                    <ControlStyle Width="16px" />
                                                    <HeaderStyle HorizontalAlign="Center" Width="16" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:ImageField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CBX_CONNECTED_YN" Visible="false" runat="server" Checked='<%# Bind("Connecteryn") %>' />
                                                        <asp:ImageButton ID="Btn_Disconnect" ToolTip="Deconnecter" runat="server" Width="15"
                                                            CommandName="DISCONNECT_USER" CommandArgument='<%# Bind("ID") %>' ImageUrl="~/images/Keys.png" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="MDP" Visible="true">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="Btn_ResetPassword" ToolTip="Reset Mot de passe" runat="server"
                                                            CommandName="RESET_PASSWORD" CommandArgument='<%# Bind("ID") %>' ImageUrl="~/images/view-refresh.png" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Email">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="Btn_SendEmail" runat="server" CommandName="SEND_EMAIL" CommandArgument='<%# Bind("ID") %>'
                                                            ToolTip="Envoyer email" ImageUrl="~/Images/email.png" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="Btn_Edit" runat="server" CommandName="Edit" ImageUrl="~/Images/_edit.png" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Del" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="Btn_Del" runat="server" CommandName="Delete" ImageUrl="~/Images/delete.png" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                        </asp:GridView>
                                        <asp:Label ID="Label_Result" runat="server" Text="Aucun Résultat..." Visible="false"
                                            EnableViewState="false" Style="font-weight: 700; font-size: large; color: #800000"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="TextAlignRight">
                                        <asp:Panel ID="PagingPane" runat="server" Width="100%">
                                            <asp:DropDownList ID="DDL_PageSize" runat="server" AutoPostBack="True" CssClass="ComboField">
                                                <asp:ListItem Value="10">10 lignes par page</asp:ListItem>
                                                <asp:ListItem Selected="True" Value="20">20 lignes par page</asp:ListItem>
                                                <asp:ListItem Value="40">40 lignes par page</asp:ListItem>
                                                <asp:ListItem Value="60">60 lignes par page</asp:ListItem>
                                                <asp:ListItem Value="100">100 lignes par page</asp:ListItem>
                                                <asp:ListItem Value="30000">Toutes</asp:ListItem>
                                            </asp:DropDownList>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>
                </asp:Panel>
    </div>
    </section>
</asp:Content>
