<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alumno.aspx.cs" Inherits="WebApplication3.Alumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1 style="text-align:center">Consulta de alumnos</h1>
    <table style="width: 100%; height: 192px; margin-bottom: 2px;">
        <tr>
            <td style="width: 387px">
                <asp:GridView CssClass="table-dark table-hover" ID="gvAlumnos" runat="server" Height="157px" Width="585px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvAlumnos_SelectedIndexChanged" Font-Bold="True" Font-Italic="True" ForeColor="#FF3300">
                </asp:GridView>
            </td>
            <td class="modal-sm" style="width: 395px">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:" ForeColor="#FF3300"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" Height="23px" style="margin-left: 44px" Width="157px" Enabled="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblApellido" runat="server" Text="Apellido:" ForeColor="#FF3300"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server" Height="23px" style="margin-left: 43px" Width="161px" Enabled="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblFechaIngreso" runat="server" Text="Fecha ingreso:" ForeColor="#FF3300"></asp:Label>
                <asp:TextBox ID="txtFechaIngreso" runat="server" Height="22px" Width="162px" Enabled="False"></asp:TextBox>
               
                
                <br />
                <br />
                <asp:Label ID="lblActividad" runat="server" Text="Actividad:" ForeColor="#FF3300"></asp:Label>
                <asp:DropDownList ID="ddlActividad" runat="server" Height="23px" style="margin-left: 34px; margin-top: 0" Width="170px" Enabled="False">
                </asp:DropDownList>
            </td>
        </tr>
</table>
    <asp:Button ID="btnNuevo" runat="server" OnClick="btnNuevo_Click" Text="Nuevo" Width="83px" CssClass="btn btn-success" />
    <ajaxToolkit:ConfirmButtonExtender ID="btnNuevo_ConfirmButtonExtender" runat="server" TargetControlID="btnNuevo" />
&nbsp;
    <asp:Button ID="btnModificar" runat="server" OnClick="btnModificar_Click" Text="Modificar" Width="83px" CssClass="btn btn-warning" />
&nbsp;
    <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" Width="83px" CssClass="btn btn-danger" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnConfirmar" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar" Width="117px" CssClass="btn btn-primary" />
    <asp:Label ID="lblId" runat="server" ForeColor="White" Visible="False"></asp:Label>
    <asp:Label ID="lblOpcion" runat="server" ForeColor="White" Visible="False"></asp:Label>
    <br />
    <br />


</asp:Content>
