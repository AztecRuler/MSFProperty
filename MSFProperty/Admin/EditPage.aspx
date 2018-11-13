<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditPage.aspx.cs" Inherits="MSFProperty.Admin.EditPage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>
        </Scripts>
    </asp:ScriptManagerProxy>--%>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
                        <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>

        </Scripts>
    </asp:ScriptManager>
    <script type="text/javascript">
    function clientValidate() {
        alert("execute before");
        return true;
    }

    function executeAfter() {
        alert("execute after");
    }
</script>
    <asp:Button ID="btnLogin" runat="server" Text="Login" CausesValidation="true" OnClientClick="clientValidate()" onclick="btnLogin_Click"/>

    <div class="leftWrapper">
        <span>Select a page to edit it from the list below</span>
        <div id="accordion">

            <asp:Repeater ID="rpData" runat="server">
                <ItemTemplate>
                    <div class="accordion"><%# Eval("PageName") %></div>
                    <div class="panel">

                        <iframe id="iframe<%# Container.ItemIndex + 1 %>" src="../<%# Eval("URL")  %>.aspx" width="100%" height="800px" frameborder="0" scrolling="yes"></iframe>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="rightWrapper" id="AdminPanel">
                <asp:Panel runat="server" ID="ImageChangePanel" Visible="False">
                    <asp:Image ID="Image1" runat="server" />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Button" Height="25px" />
                </asp:Panel>

                <asp:Panel runat="server" ID="TextChangePanel">
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="pageNameLabel">Name Of Page</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="pageName" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="pageIdLabel">Page Id</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="pageId" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="elementTextLabel">Enter New Text Here</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="elementText"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="elementNumberLabel">Element Number</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="elementNumber"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="elementTypeLabel">TypeOfElement</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="elementType" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="elemenetLinkLabel">Element Link</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="elemenetLink" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </asp:Panel>

                <asp:Button runat="server" ID="save" Text="Save" OnClick="Save_Click" />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="Content">
    </div>


</asp:Content>
