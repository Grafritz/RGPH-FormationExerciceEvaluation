<%@ Page Title=" Sécurité - activiés Utilisateur" Language="VB" MasterPageFile="~/MasterPages/MasterPage_Security.master"
    AutoEventWireup="false" CodeFile="Wfrm_ActiviteUtilisateur.aspx.vb" Inherits="Parametres_Administration_Wfrm_ActiviteUtilisateur" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="Msg" Namespace="BunnyBear" Assembly="msgBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
        <h1>
            <asp:Label ID="Label_Utilisateur" runat="server" Text="ACTIVITES UTILISATEURS " />
            <small> <asp:Label ID="LabelNumeroDeReference" runat="server" /></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Accueil</a></li>
            <li class="active">ACTIVITES UTILISATEURS</li>
        </ol>
     </section>
    <section class="content" style="">
    <div id="Div_CorpsFille">
        <%--<ajaxToolkit:ToolkitScriptManager runat="Server" AsyncPostBackTimeout="600" EnablePartialRendering="true"
            EnableScriptGlobalization="true" EnableScriptLocalization="true" ID="ScriptManager1" />--%>
        <asp:UpdatePanel ID="UpdatePanel_First" runat="server">
            <ContentTemplate>
                <Msg:msgBox ID="Dialogue" runat="server" />
                <asp:Panel runat="server" ID="Panel_Msg" Visible="false">
                    <div class="alert alert-warning">
                        <asp:Image ID="Image_Msg" runat="server" Style="vertical-align: middle;" />
                        <asp:Label ID="Label_Msg" runat="server" Text=""></asp:Label>
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="Panel_First2">
                    <div style="display: inline; float: left; padding-right: 10px;">
                        <asp:UpdateProgress ID="updProgHeader" runat="server" AssociatedUpdatePanelID="UpdatePanel_First">
                            <ProgressTemplate>
                                <div>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/spinner.gif" AlternateText="Waiting..." />
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                    <%-- <h2 class="art-postheader" style="margin-bottom: 5px;">
                        <asp:Label ID="Label_Utilisateur" runat="server" Text="ACTIVITES UTILISATEURS"></asp:Label>
                    </h2> --%>
                    <div id="Statistique" style="margin: 0px 5px;">
                        <fieldset class="_fieldset">
                            <legend class="_legend">Critères de recherche</legend>
                            <div style="float: left; margin-right: 10px;">
                                <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Utilisateur:"></asp:Label><br />
                                <asp:DropDownList ID="DDL_Utilisateur" CssClass="ComboField" runat="server" Width="280px"
                                    Style="text-transform: none">
                                </asp:DropDownList>
                            </div>
                            <div style="float: left; margin-right: 10px;">
                                <asp:Label ID="Label4" runat="server" Font-Bold="true" Text="Activités:"></asp:Label><br />
                                <asp:DropDownList ID="DDL_ActiviteUser" CssClass="ComboField" runat="server" Width="280px"
                                    Style="text-transform: none">
                                </asp:DropDownList>
                            </div>
                            <div style="float: left; margin-right: 10px;">
                                <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Début:"></asp:Label>
                                <telerik:RadDatePicker ID="txtDateDebut" Width="100%" runat="server" DateInput-DateFormat="dd/MM/yyyy" MinDate="1900-01-01" 
                                    ToolTip="Cliquer sur le bouton pour choisir une date">
                                </telerik:RadDatePicker>
                               <%-- <asp:TextBox runat="server" ID="txtDateDebut" CssClass="TextField" autocomplete="off"
                                    Width="100px" ToolTip="Mois/Jour/Année" />
                                <ajaxToolkit:CalendarExtender ID="defaultCalendarExtender" runat="server" TargetControlID="txtDateDebut" /> --%>
                            </div>
                            <div style="float: left; margin-right: 10px;">
                                <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Fin:"></asp:Label>
                                <telerik:RadDatePicker ID="txtDateFin" Width="100%" runat="server" DateInput-DateFormat="dd/MM/yyyy" MinDate="1900-01-01" 
                                    ToolTip="Cliquer sur le bouton pour choisir une date">
                                </telerik:RadDatePicker>
                               <%-- <asp:TextBox runat="server" ID="txtDateFin" CssClass="TextField" autocomplete="off"
                                    Width="100px" ToolTip="Mois/Jour/Année" />
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateFin" /> --%>
                            </div>
                            <div style="float: left; margin-right: 10px;">

                                <asp:LinkButton ID="Btn_Search" runat="server" CausesValidation="false" CssClass="btn btn-primary">
                                    <i class="fa fa-search" ></i> RECHERCHER
                                </asp:LinkButton>
                            </div>
                        </fieldset>
                    </div>
                    <br style="clear: both;" />
                    <!-- GRIDVIEW -->
                    <div id="Div_List">
                        <asp:Panel ID="Panel_List" runat="server">
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label_DetailSearch" runat="server" Text="ACTIVITES UTILISATEURS" Style="font-weight: 700;
                                            color: #800000"></asp:Label>
                                        <asp:GridView ID="GridView_List" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            CellPadding="4" CssClass="GridViewCss" DataKeyNames="ID" ForeColor="#333333"
                                            GridLines="None" PageSize="25" AllowSorting="True" Width="100%">
                                            <RowStyle CssClass="RowStyle" BackColor="#F7F6F3" ForeColor="#333333" />
                                            <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#E2DED6" 
                                                Font-Bold="True" ForeColor="#333333" />
                                            <AlternatingRowStyle CssClass="AlternatingRowStyle" BackColor="White" 
                                                ForeColor="#284775" />
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle CssClass="FooterStyle" BackColor="#5D7B9D" Font-Bold="True" 
                                                ForeColor="White" />
                                            <HeaderStyle CssClass="HeaderStyle" ForeColor="White" BackColor="#5D7B9D" 
                                                Font-Bold="True" />
                                            <PagerStyle CssClass="PagerStyle" ForeColor="White" BackColor="#284775" 
                                                HorizontalAlign="Center" />
                                            <PagerStyle CssClass="DataPager" />
                                            <PagerSettings FirstPageImageUrl="~/Images/first.png" 
                                                LastPageImageUrl="~/Images/Last.png" Position="TopAndBottom" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbOrder" runat="server"></asp:Label><asp:Label ID="lbID" runat="server"
                                                            Text='<%# Bind("ID") %>' Visible="false"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="USER_NAME" ReadOnly="true" HeaderText="Compte utilisateur"
                                                    SortExpression="USER_NAME" />
                                                <asp:BoundField DataField="TYPE_ACTIVITE" ReadOnly="true" HeaderText="Type Activité"
                                                    SortExpression="TYPE_ACTIVITE" />
                                                <asp:BoundField DataField="DESCRIPTION_ACTIVITE" ReadOnly="true" HeaderText="Descriptions Activité" />
                                                <asp:BoundField DataField="IP_USER" ReadOnly="true" HeaderText="Adresse IP" SortExpression="IP_USER" />
                                                <asp:BoundField DataField="DATE_ACTIVITE" ReadOnly="true" HeaderText="Date Activité"
                                                    SortExpression="DATE_ACTIVITE" />
                                                <%--<asp:TemplateField HeaderText="Deconnecter" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="Btn_Del" runat="server" Width="20" CommandName="edit" ImageUrl="~/Images/Logout.png" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>--%>
                                            </Columns>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
     </section>
</asp:Content>
