<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarProfesores.aspx.cs" Inherits="WebApplication3.Profesores" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="agregar">
    <h1 style="text-align:center">Ingresar profesor</h1>
    <br />

    <table class="table" style="width: 100%; height: 216px;">
        <tr>
            <td class="modal-sm" style="width: 222px; text-align: right; height: 39px;">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido :" ForeColor="#FF3300"></asp:Label>
            </td>
            <td style="width: 280px; height: 39px;">
                <asp:TextBox ID="txtApellido" runat="server" Width="254px" CssClass="form-control"></asp:TextBox>
            </td>
            <td style="height: 39px">
                </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 222px; height: 6px; text-align: right;">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre :" ForeColor="#FF3300"></asp:Label>
            </td>
            <td style="height: 6px; width: 280px">
                <asp:TextBox ID="txtNombre" runat="server" Width="254px" CssClass="form-control"></asp:TextBox>
            </td>
            <td style="height: 6px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 222px; text-align: right;">
                <asp:Label ID="FechaNacimiento" runat="server" Text="Fecha de contratación :" ForeColor="#FF3300"></asp:Label>
            </td>
            <td style="width: 280px">
                <asp:Calendar ID="FechaContratacion" runat="server" Height="200px" Width="220px" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 222px; text-align: right; height: 39px;">
                <asp:Label ID="lblNacionalidad" runat="server"  Text="Titulo :" ForeColor="#FF3300"></asp:Label>
            </td>
            <td style="width: 280px; height: 39px;">
                <asp:TextBox ID="txtTitulo" runat="server" Width="254px" CssClass="form-control"></asp:TextBox>
            </td>
            <td style="height: 39px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 222px; text-align: right; height: 37px;">
                <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="Actividad principal:"></asp:Label>
            </td>
            <td style="width: 280px; height: 37px;">
                <asp:DropDownList ID="ddlActividad" runat="server" Width="261px">
                </asp:DropDownList>
            </td>
            <td style="height: 37px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 222px; text-align: right; height: 37px;">
                <asp:Button CssClass="btn btn-primary" ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click"  />
            </td>
            <td style="width: 280px; height: 37px;">
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            </td>
            <td style="height: 37px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 222px; text-align: right; height: 37px;">
                &nbsp;</td>
            <td style="width: 280px; height: 37px;">
                &nbsp;</td>
            <td style="height: 37px">&nbsp;</td>
        </tr>
    </table>
    <div>


    
    </div>
        </section>
</asp:Content>
