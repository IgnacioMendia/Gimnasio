<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaActividad.aspx.cs" Inherits="WebApplication3.ConsultaActividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <br />
    <h1 style="text-align:center">Consulta de actividades</h1>
    <table  style="width: 97%; height: 221px;">
        <tr>
            <td style="width: 33px">
                <asp:GridView CssClass="table-dark table-hover" ID="gvActividades" runat="server" AutoGenerateSelectButton="True" Height="211px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="478px" Font-Bold="True" ForeColor="#FF3300" Font-Italic="True">
                </asp:GridView>
            </td>
            <td style="width: 208px">
                <asp:Label ID="lblNombre" runat="server" Text="Actividad:" ForeColor="#FF3300"></asp:Label>
                <asp:TextBox ID="txtActividad" runat="server" style="margin-left: 4px; margin-right: 0" Enabled="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblPrecio" runat="server" Text="Precio:" ForeColor="#FF3300"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPrecio" runat="server" style="margin-left: 0px;" Enabled="False"></asp:TextBox>
                &nbsp;<br />
                <br />
                <asp:Label ID="lblId" runat="server" ForeColor="White"></asp:Label>
                <asp:Label ID="lblOpcion" runat="server" ForeColor="White"></asp:Label>
            </td>
            <td style="width: 112px">&nbsp;</td>
        </tr>
    </table>
    <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-success" OnClick="btnAgregar_Click" Text="Agregar" />
&nbsp;
    <asp:Button ID="btnModificar" runat="server" CssClass="btn btn-warning" OnClick="btnModificar_Click" Text="Modificar" />
&nbsp;
    <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-danger" OnClick="btnEliminar_Click" Text="Eliminar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnConfirmar" runat="server" CssClass="btn btn-primary" OnClick="btnConfirmar_Click" Text="Confirmar" />
    <br />


</asp:Content>
