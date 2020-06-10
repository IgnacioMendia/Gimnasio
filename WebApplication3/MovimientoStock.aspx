<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovimientoStock.aspx.cs" Inherits="WebApplication3.MovimientoStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />  
    <h1 style="text-align:center">Movimientos de stock</h1>
    <br />
    <table style="width: 100%; height: 295px;">
        <tr>
            <td style="height: 20px; width: 69px">
                <asp:GridView CssClass="table-dark table-hover" ID="gvMovimiento" runat="server" AutoGenerateSelectButton="True" Height="210px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-top: 0px" Width="502px" Font-Bold="True" ForeColor="#FF3300" Font-Italic="True">
                </asp:GridView>
            </td>
            <td style="height: 20px; width: 311px">
                <asp:Label ID="Label3" runat="server" Text="Stock:" ForeColor="#FF3300"></asp:Label>
                <asp:TextBox ID="txtStock" runat="server" Enabled="False" style="margin-left: 70px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Cantidad:" ForeColor="#FF3300"></asp:Label>
                <asp:TextBox ID="txtCantidad" runat="server" Enabled="False" style="margin-left: 50px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Precio unitario:" ForeColor="#FF3300"></asp:Label>
                <asp:TextBox ID="txtPrecioUnitario" runat="server" style="margin-left: 16px" Enabled="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblPrecioFinal" runat="server" Text="Precio final:" ForeColor="#FF3300"></asp:Label>
                <asp:TextBox ID="txtPrecioFinal" runat="server" Enabled="False" style="margin-left: 36px; margin-top: 0"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblCliente" runat="server" Text="Cliente:                              " ForeColor="#FF3300"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtCliente" runat="server" Enabled="False" style="margin-left: 8px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblPago" runat="server" Text="Forma de pago:" ForeColor="#FF3300"></asp:Label>
                <asp:TextBox ID="txtFormaPago" runat="server" Enabled="False" style="margin-left: 6px"></asp:TextBox>
                <br />
            </td>
        </tr>
    </table>
    <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" Width="76px" CssClass="btn btn-success" />
&nbsp;<asp:Button ID="btnRetirar" runat="server" OnClick="btnRetirar_Click" Text="Retirar" Width="76px" CssClass="btn btn-danger" ViewStateMode="Enabled" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblId" runat="server" ForeColor="White" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblOpcion" runat="server" ForeColor="White" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnConfirmar" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar" CssClass="btn btn-primary" Enabled="False" />
    <br />




</asp:Content>
