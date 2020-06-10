<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaLimpieza.aspx.cs" Inherits="WebApplication3.ConsultaLimpieza" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <h1 style="text-align:center">Listado de empleados de limpieza</h1>
    <p>
        <asp:GridView CssClass="table-dark table-hover" ID="gvLimpieza" runat="server" Width="897px" Height="116px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvProfesores_SelectedIndexChanged" Font-Bold="True" ForeColor="#FF3300" Font-Italic="True" >
        </asp:GridView>
        <asp:Label ID="lblID" runat="server" ForeColor="Black" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnBorrar" runat="server" OnClick="btnBorrar_Click" Text="Borrar" Width="79px" CssClass="btn btn-danger" />
    </p>
</asp:Content>
