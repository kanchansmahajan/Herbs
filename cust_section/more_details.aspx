<%@ Page Title="" Language="VB" MasterPageFile="~/cust_section/cust_master.master" AutoEventWireup="false" CodeFile="more_details.aspx.vb" Inherits="cust_section_more_details" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table cellspacing="0" cellpadding="5">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" BorderStyle="Solid" BorderWidth="1px" Height="200px" />
            </td>
            <td>
                <table cellspacing="0" cellpadding="5">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label5" runat="server" Text="Herb Specifications:" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#990099"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Herb Name" Font-Bold="False" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                        <td>
                            <asp:Label ID="LblHerbName" runat="server" Font-Italic="True" Font-Names="Calibri" Font-Size="Large" ForeColor="#990033"></asp:Label></td>                        
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Herb Rate (&#8377;)" Font-Bold="False" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                        <td>
                            <asp:Label ID="LblHerbRate" runat="server" Font-Italic="True" Font-Names="Calibri" Font-Size="Large" ForeColor="#990033"></asp:Label></td>                        
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Useful in diseases" Font-Bold="False" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                        <td>
                            <asp:Label ID="LblUsefulInDiseases" runat="server" Font-Italic="True" Font-Names="Calibri" Font-Size="Large" ForeColor="#990033"></asp:Label></td>                        
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Benefits" Font-Bold="False" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                        <td>
                            <asp:Label ID="LblBenefits" runat="server" Font-Italic="True" Font-Names="Calibri" Font-Size="Large" ForeColor="#990033"></asp:Label></td>                        
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="BtnAddToCart" runat="server" ImageUrl="~/images/add_to_cart.jpg" Width="200px" /></td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" Font-Size="Large" ImageHeight="70px" ImageUrl="~/images/view_cart.jpeg" ImageWidth="100px" NavigateUrl="~/cust_section/view_cart.aspx" ToolTip="View Cart">View Cart</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                    </tr>
                </table>               
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label6" runat="server" Text="Contact Specifications:" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#990099"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Firm Name" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
            <td>
                <asp:Label ID="LblFirmName" runat="server" Font-Names="Calibri" Font-Size="Large" Font-Italic="True" ForeColor="#990033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Firm Address" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
            <td>
                <asp:Label ID="LblFirmAddress" runat="server" Font-Names="Calibri" Font-Size="Large" Font-Italic="True" ForeColor="#990033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Owner Name" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
            <td>
                <asp:Label ID="LblOwnerName" runat="server" Font-Names="Calibri" Font-Size="Large" Font-Italic="True" ForeColor="#990033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Mobile Number" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
            <td>
                <asp:Label ID="LblMobileNo" runat="server" Font-Names="Calibri" Font-Size="Large" Font-Italic="True" ForeColor="#990033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Email-Id" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
            <td>
                <asp:Label ID="LblEmailId" runat="server" Font-Names="Calibri" Font-Size="Large" Font-Italic="True" ForeColor="#990033"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

