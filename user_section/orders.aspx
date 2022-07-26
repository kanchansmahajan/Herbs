<%@ Page Title="" Language="VB" MasterPageFile="~/user_section/user_master.master" AutoEventWireup="false" CodeFile="orders.aspx.vb" Inherits="user_section_orders" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <center>
    <table style="text-align:left;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Orders Received" Font-Bold="True" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#990033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Table ID="Table1" runat="server" CellPadding="10" CellSpacing="0" Font-Names="Calibri" Font-Size="Large" GridLines="Horizontal" Width="500px"></asp:Table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
        </tr>
    </table>
        </center>
</asp:Content>

