<%@ Page Title="" Language="VB" MasterPageFile="~/cust_section/cust_master.master" AutoEventWireup="false" CodeFile="pay_bill.aspx.vb" Inherits="cust_section_pay_bill" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Pay your bill" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#660033"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Payment Mode:" Font-Bold="True" Font-Names="Calibri" Font-Size="20px"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:RadioButton ID="RbCashOnDelivery" runat="server" Font-Names="Calibri" Font-Size="Large" GroupName="PayBill" Text="Cash on delivery" AutoPostBack="True" /></td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel2" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="BtnPlaceOrder" runat="server" Text="Place Order" Font-Names="Calibri" Font-Size="Large" /></td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="LblResult" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButton ID="RbCard" runat="server" Font-Names="Calibri" Font-Size="Large" GroupName="PayBill" Text="Debit Card" AutoPostBack="True" /></td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Card Holder Name" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtCardHolderName" runat="server" Font-Names="Calibri" Font-Size="Large" ValidationGroup="CardPayment"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Card holder name is required" ControlToValidate="TxtCardHolderName" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="CardPayment"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Card Number" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtCardNumber" runat="server" Font-Names="Calibri" Font-Size="Large" ValidationGroup="CardPayment"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Card number is required" ControlToValidate="TxtCardNumber" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="CardPayment"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Expires" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="DdlMonth" runat="server" Font-Names="Calibri" Font-Size="Large" ValidationGroup="CardPayment" Width="100px">
                                    <asp:ListItem Value="-1">Month</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem Value="11">11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="DdlYear" runat="server" Font-Names="Calibri" Font-Size="Large" ValidationGroup="CardPayment" Width="100px">
                                    <asp:ListItem Value="-1">Year</asp:ListItem>
                                    <asp:ListItem>2021</asp:ListItem>
                                    <asp:ListItem>2022</asp:ListItem>
                                    <asp:ListItem>2023</asp:ListItem>
                                    <asp:ListItem>2024</asp:ListItem>
                                    <asp:ListItem>2025</asp:ListItem>
                                    <asp:ListItem>2026</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Month is required" ControlToValidate="DdlMonth" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" InitialValue="-1" SetFocusOnError="True" ValidationGroup="CardPayment"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Year is required" ControlToValidate="DdlYear" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" InitialValue="-1" SetFocusOnError="True" ValidationGroup="CardPayment"></asp:RequiredFieldValidator>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="CVV" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtCvv" runat="server" Font-Names="Calibri" Font-Size="Large" ValidationGroup="CardPayment"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Card verification value is required" ControlToValidate="TxtCvv" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="CardPayment"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="OTP / Pin Number" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtPin" runat="server" Font-Names="Calibri" Font-Size="Large" ValidationGroup="CardPayment" TextMode="Password"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="OTP/Pin is required" ControlToValidate="TxtPin" Display="Dynamic" Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" SetFocusOnError="True" ValidationGroup="CardPayment"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" Font-Names="Calibri" Font-Size="Large" ValidationGroup="CardPayment" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="LblMsg" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="LblEmail" runat="server" Font-Names="Calibri" Font-Size="Large"></asp:Label></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

