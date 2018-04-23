<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PrintExerciceHTML.aspx.vb" Inherits="_Print_PrintExerciceHTML" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <%--<link href="../AdminLTE-master/css/AdminLTE.css" rel="stylesheet" />--%>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />
    <!-- bootstrap 3.0.2 -->
    <link href="../AdminLTE-master/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="../AdminLTE-master/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="../AdminLTE-master/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../AdminLTE-master/css/AdminLTE.css" rel="stylesheet" type="text/css" />
</head>
<body style="background: #FFF;">
    <form id="form1" runat="server">

        <Msg:msgBox ID="Dialogue" runat="server" />
        <asp:Panel runat="server" ID="Panel_Msg" Visible="false">
            <div id="DIV_Msg" runat="server" class="alert alert-warning alert-dismissable">
                <i id="Icon_Msg" runat="server" class="fa fa-warning"></i>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <asp:Image ID="Image_Msg" runat="server" />
                <asp:Label ID="Label_Msg" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>
        <div style=" padding: 20px; margin: 40px">

            <div id="DIV_Panel" class="panel1 panel-default1 panel-body1">
                <asp:Label ID="Label_IDExercice" runat="server" />
                <asp:Label ID="Label_LibelleExercice" runat="server" />
                <asp:Label ID="Label_Descriptions" runat="server" />
                <asp:Label ID="Label_Instructions" runat="server" />
                <asp:Label ID="Label_RappelExercice" runat="server" />
                <asp:TextBox ID="txt_CodeFormulaireExercices_Hid" runat="server" Text="0" Visible="False" Width="1px"></asp:TextBox>
                <asp:TextBox ID="txt_IsCorectum_Hide" runat="server" Text="0" Visible="False" Width="1px"></asp:TextBox>
            </div>
            <table style="width: 100%;" border="1">
                <thead>
                    <tr>
                        <th style="width: 50%;">Questions</th>
                        <th>Reponses</th>
                        <th>Justification</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Literal ID="literal_QuestionReponseJustification" runat="server" />
                </tbody>
            </table>
        </div>
    </form>
    <style type="text/css">
        html {
            background: #FFF;
        }

        * {
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, Arial, Helvetica, sans-serif;
        }

        .auto-style1 {
            width: 100px;
            height: 22px;
        }

        .auto-style2 {
            height: 22px;
        }

        table thead tr th {
            background-color: #2494F2;
            color: White;
            padding: 10px;
        }

        table tbody tr td {
            padding: 10px;
        }
        label {
           color:#2494F2;
        }
    </style>
</body>
</html>
