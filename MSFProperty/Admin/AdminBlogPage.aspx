<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminBlogPage.aspx.cs" Inherits="MSFProperty.Admin.AdminBlogPage" ValidateRequest="false"  %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>
        </Scripts>
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="tab">
                <button class="tablinks active" onclick="OpenBlogTab(event, 'createBlog')">Create A New Blog</button>
                <button class="tablinks" onclick="OpenBlogTab(event, 'existingBlog')">Edit An Existing Blog</button>
                <button class="tablinks" onclick="OpenBlogTab(event, 'organiseExistingBlogs')">Organise Existing Blogs</button>
            </div>

            <div id="createBlog" class="tabcontent" style="display: table;">
                <div class="blogPanel">
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server">Enter the Name of the blog here or it will be called blog and whatever number blogs are up to</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="blogName"></asp:TextBox>
                            </td>

                        </tr>

                        <tr>
                            <td>
                                <asp:Label runat="server">Enter the title of the blog here or it will be called blog-title and whatever number blogs are up to</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="blogTitle"></asp:TextBox>
                            </td>
                        </tr>
                            <tr>
                            <td>
                                <asp:Label runat="server">Enter the blog contents into the box and press save to save the blog</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <FTB:FreeTextBox ID="FreeTextBox1" runat="Server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click1" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                               <asp:Label runat="server" ID="errorText" Visible="false"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="existingBlog" class="tabcontent">
            </div>

            <div id="organiseExistingBlogs" class="tabcontent">
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>



