<%@ Page Title=" Questions" Language="VB" MasterPageFile="~/MasterPages/DashboardCZMasterPage.master"  AutoEventWireup="false" CodeFile="Frm_QuestionsADD.aspx.vb" Inherits="Frm_QuestionsADD"  MaintainScrollPositionOnPostback="true" %>
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
<section class="page-head" ID="PageHeader" runat="server" >
<h3>
    <i class="fa fa-dashboard"></i>
    <asp:Label ID="Label_Titre" runat="server" Text="Questions" /> 
    <small id="OL_SeeAllData" runat="server">
        <asp:Label ID="Label_SousTitre" runat="server" />
    </small>
</h3>
<!--<ol class="breadcrumb"> 
    <li><a href="#"><i class="fa fa-dashboard"></i>Accueil</a></li>
    <li class="active">Questions</li>
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

<asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="GPSave"  runat="server" CssClass="alert alert-danger alert-dismissable" ShowMessageBox="true" ShowSummary="true" />

<asp:Panel ID="Panel_First" runat="server" CssClass="panel panel-default panel-body" Style="margin: 5px;">
<div id="DIV_Panel" class="form-horizontal group-border-dashed1" style="border-radius: 0px;">
   <div class="form-group">
<label class="col-sm-3 control-label">Libelle Question
   <asp:RequiredFieldValidator  ID="RFV_LibelleQuestion" runat="server" ControlToValidate="txt_LibelleQuestion"  
       ErrorMessage="Libelle Question Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*" 
       ValidationGroup="GPSave" CssClass="text-danger" /> 
</label>
<div class="col-sm-6">
   <asp:TextBox ID="txt_LibelleQuestion" CssClass="form-control" Width="100%" runat="server" placeholder="Libelle Question..."></asp:TextBox>
</div>

 </div>
   <div class="form-group">
<label class="col-sm-3 control-label">Details Question
   <asp:RequiredFieldValidator  ID="RFV_DetailsQuestion" runat="server" ControlToValidate="txt_DetailsQuestion"  
       ErrorMessage="Details Question Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*" 
       ValidationGroup="GPSave" CssClass="text-danger" /> 
</label>
<div class="col-sm-6">
   <asp:TextBox ID="txt_DetailsQuestion" CssClass="form-control" Width="100%" runat="server" placeholder="Details Question..."></asp:TextBox>
</div>

 </div>
   <div class="form-group">
<label class="col-sm-3 control-label">Indications Question
   <asp:RequiredFieldValidator  ID="RFV_IndicationsQuestion" runat="server" ControlToValidate="txt_IndicationsQuestion"  
       ErrorMessage="Indications Question Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*" 
       ValidationGroup="GPSave" CssClass="text-danger" /> 
</label>
<div class="col-sm-6">
   <asp:TextBox ID="txt_IndicationsQuestion" CssClass="form-control" Width="100%" runat="server" placeholder="Indications Question..."></asp:TextBox>
</div>

 </div>
   <div class="form-group">
<label class="col-sm-3 control-label"> Avoir Justification Y N
</label>
<div class="col-sm-6">
   <label><asp:CheckBox ID="CB_AvoirJustificationYN" runat="server" text="AvoirJustificationYN" /></label>  
</div>

 </div>
   <div class="form-group">
<label class="col-sm-3 control-label">Type Question
   <asp:RequiredFieldValidator  ID="RFV_TypeQuestion" runat="server" ControlToValidate="txt_TypeQuestion"  
       ErrorMessage="Type Question Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*" 
       ValidationGroup="GPSave" CssClass="text-danger" /> 
</label>
<div class="col-sm-6">
   <asp:TextBox ID="txt_TypeQuestion" CssClass="form-control" Width="100%" runat="server" placeholder="Type Question..."></asp:TextBox>
</div>

 </div>
   <div class="form-group">
<label class="col-sm-3 control-label">Score Total
   <asp:RequiredFieldValidator  ID="RFV_ScoreTotal" runat="server" ControlToValidate="txt_ScoreTotal"  
       ErrorMessage="Score Total Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*" 
       ValidationGroup="GPSave" CssClass="text-danger" /> 
</label>
<div class="col-sm-6">
   <asp:TextBox ID="txt_ScoreTotal" CssClass="form-control" Width="100%" runat="server" placeholder="Score Total..."></asp:TextBox>
</div>

 </div>
   <div class="form-group">
<label class="col-sm-3 control-label">Commentaire
   <asp:RequiredFieldValidator  ID="RFV_Commentaire" runat="server" ControlToValidate="txt_Commentaire"  
       ErrorMessage="Commentaire Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*" 
       ValidationGroup="GPSave" CssClass="text-danger" /> 
</label>
<div class="col-sm-6">
   <asp:TextBox ID="txt_Commentaire" CssClass="form-control" Width="100%" runat="server" placeholder="Commentaire..."></asp:TextBox>
</div>

 </div>
   <div class="form-group">
<label class="col-sm-3 control-label">Caractere Accepte
   <asp:RequiredFieldValidator  ID="RFV_CaractereAccepte" runat="server" ControlToValidate="txt_CaractereAccepte"  
       ErrorMessage="Caractere Accepte Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*" 
       ValidationGroup="GPSave" CssClass="text-danger" /> 
</label>
<div class="col-sm-6">
   <asp:TextBox ID="txt_CaractereAccepte" CssClass="form-control" Width="100%" runat="server" placeholder="Caractere Accepte..."></asp:TextBox>
</div>

 </div>
   <div class="form-group">
<label class="col-sm-3 control-label">Nbre Valeur Minimal
   <asp:RequiredFieldValidator  ID="RFV_NbreValeurMinimal" runat="server" ControlToValidate="txt_NbreValeurMinimal"  
       ErrorMessage="Nbre Valeur Minimal Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*" 
       ValidationGroup="GPSave" CssClass="text-danger" /> 
</label>
<div class="col-sm-6">
   <asp:TextBox ID="txt_NbreValeurMinimal" CssClass="form-control" Width="100%" runat="server" placeholder="Nbre Valeur Minimal..."></asp:TextBox>
</div>

 </div>
   <div class="form-group">
<label class="col-sm-3 control-label">Nbre Caractere Maximal
   <asp:RequiredFieldValidator  ID="RFV_NbreCaractereMaximal" runat="server" ControlToValidate="txt_NbreCaractereMaximal"  
       ErrorMessage="Nbre Caractere Maximal Obligatoire !" SetFocusOnError="true" Display="Dynamic" Text="*" 
       ValidationGroup="GPSave" CssClass="text-danger" /> 
</label>
<div class="col-sm-6">
   <asp:TextBox ID="txt_NbreCaractereMaximal" CssClass="form-control" Width="100%" runat="server" placeholder="Nbre Caractere Maximal..."></asp:TextBox>
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
        <i class="fa  fa-reply-all" ></i> Annuler
    </asp:LinkButton>
</div>
 </div>
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
<input id="txtWindowPage" type="hidden" />
</asp:Content>

