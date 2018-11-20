<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditPage.aspx.cs" Inherits="MSFProperty.Admin.EditPage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>
        </Scripts>
    </asp:ScriptManagerProxy>
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
        <Triggers>
            <asp:PostBackTrigger ControlID="ImageSave" />

        </Triggers>
        <ContentTemplate>
            <div class="rightWrapper" id="AdminPanel">
                <asp:Panel runat="server" ID="ImageChangePanel">
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="Label1">Image Preview</asp:Label>

                                </td>
                                <td>
                                    <asp:Image ID="imagePreview" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="Label2">File Upload</asp:Label>

                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="Label3">New Image Name</asp:Label>

                                </td>
                                <td>
                                    <asp:TextBox ID="imageNewName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <button ID="showUploadImages">Load existing image</button>
                                    <asp:Panel ID="useUploadedFile" runat="server">

                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <asp:ImageButton  CssClass="imageButtonUpload" runat="server" ImageUrl='<%# string.Format("../images/{0}",Eval("ImageUrl"))%>' />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                         <asp:TextBox ID="uploadedImageUrl" runat="server" ></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table id="imageprops">
                        <tbody>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="Label4">ImageID</asp:Label>

                                </td>
                                <td>
                                    <asp:TextBox ID="ImageID" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="Label6">ImageUrl</asp:Label>

                                </td>
                                <td>
                                    <asp:TextBox ID="ImageUrl" runat="server" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="Label7">PageName</asp:Label>

                                </td>
                                <td>
                                    <asp:TextBox ID="ImagePageName" runat="server" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="Label8">PageId</asp:Label>

                                </td>
                                <td>
                                    <asp:TextBox ID="ImagePageId" runat="server" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <asp:Button runat="server" ID="ImageSave" Text="Save" OnClick="Image_Save_Click" />

                </asp:Panel>

                <asp:Panel runat="server" ID="TextChangePanel">
                    <table>
                        <tbody>
                            <tr>

                                <td>
                                    <asp:TextBox runat="server" ID="pageName" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>

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
                                    <asp:TextBox runat="server" ID="elementNumber"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>

                                <td>
                                    <asp:TextBox runat="server" ID="elementType" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>

                                <td>
                                    <asp:TextBox runat="server" ID="elemenetLink" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <asp:Button runat="server" ID="textSave" Text="Save" OnClick="Save_Click" />

                </asp:Panel>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="Content">
    </div>

    <asp:HiddenField ID="UploadedTab" runat="server" />


</asp:Content>
