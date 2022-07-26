<%@ Page Title="" Language="VB" MasterPageFile="~/user_section/user_master.master" AutoEventWireup="false" CodeFile="view_herbs.aspx.vb" Inherits="user_section_view_herbs" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <center>
    <table style="text-align:left;">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="My added herbs" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#006600"></asp:Label></td>
            </tr>            
            <tr>
                <td>
                    <asp:GridView ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="false"
                        GridLines="None"
                        ShowHeader="False" Font-Names="Calibri" Font-Size="Medium" Style="margin-top: 0px" Width="600px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table style="border: 1px solid #0094ff;width:100%;">
                                        <tr>
                                            <td>
                                                <asp:Image ID="ImgHerbs"
                                                    ImageUrl='<%# "~/user_section/herb_images/" + Eval("herb_image")%>'
                                                    runat="server"
                                                    Width="250px"
                                                    Height="250px" />
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server"
                                                                Text="Herb Name"
                                                                Font-Names="Calibri"
                                                                Font-Size="Medium"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Lbl_Herb_Name" ForeColor="Navy"
                                                                runat="server" Text='<%# Eval("herb_name") %>'>
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label4" runat="server"
                                                                Text="Herb Rate"
                                                                Font-Names="Calibri"
                                                                Font-Size="Medium"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label5" ForeColor="Navy"
                                                                runat="server" Text='<%# "&#8377" & " " & Eval("herb_rate") & " " & Eval("unit") %>'>
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label8" runat="server"
                                                                Text="Useful in diseases"
                                                                Font-Names="Calibri"
                                                                Font-Size="Medium"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label9" ForeColor="Navy"
                                                                runat="server" Text='<%# Eval("diseases") %>'>
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label10" runat="server"
                                                                Text="Benefits"
                                                                Font-Names="Calibri"
                                                                Font-Size="Medium"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label11" ForeColor="Navy"
                                                                runat="server" Text='<%# Eval("benefits") %>'>
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    
                                                </table>
                                            </td>                                            
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <a href="delete_herb.aspx?srno=<%# Eval("srno") %>">Delete</a>
                                            </td>                                            
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        </center>
</asp:Content>

