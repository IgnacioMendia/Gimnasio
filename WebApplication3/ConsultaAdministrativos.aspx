<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaAdministrativos.aspx.cs" Inherits="WebApplication3.ConsultaAdministrativos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <br />
        <h1 style="text-align:center">Consulta administrativos</h1>
    <asp:GridView CssClass="table-dark table-hover" ID="gvAdministrativos" runat="server" Width="742px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvAdministrativos_SelectedIndexChanged" Font-Bold="True" ForeColor="#FF3300" Font-Italic="True">
    </asp:GridView>
</p>
    <p>
        <asp:Label ID="lblId" runat="server" Text="Id" Visible="False"></asp:Label>
</p>
<p>
    <asp:Button ID="btnBorrar" runat="server" Text="Borrar" OnClick="btnBorrar_Click" CssClass="btn btn-danger"/>
</p>

</asp:Content>
