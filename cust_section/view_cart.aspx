<%@ Page Title="" Language="VB" MasterPageFile="~/cust_section/cust_master.master" AutoEventWireup="false" CodeFile="view_cart.aspx.vb" Inherits="cust_section_view_cart" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Cart: Items Selected" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#660033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" Font-Names="Calibri" Font-Size="Large" ForeColor="Black" GridLines="Vertical" Width="500px">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Total Bill (&#8377;): " Font-Bold="True" Font-Names="Calibri" Font-Size="20px"></asp:Label>
                &nbsp;
                <asp:Label ID="LblTotalBill" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="20px" ForeColor="#006600"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Total Number of items: " Font-Bold="True" Font-Names="Calibri" Font-Size="20px"></asp:Label>
            &nbsp;
                <asp:Label ID="LblTotalNumberOfItems" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="20px" ForeColor="#006600"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnPayBill" runat="server" Text="Pay Bill" Font-Names="Calibri" Font-Size="Large" />
            </td>            
        </tr>
    </table>    
</asp:Content>

