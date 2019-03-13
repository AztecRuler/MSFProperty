<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminBlogPage.aspx.cs" Inherits="MSFProperty.Admin.AdminBlogPage" ValidateRequest="false" %>

<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="Blog">
        <div class="tab">
            <button class="tablinks active" id="createNewBlog" onclick="OpenAdminTab(event, 'createBlog', 1)">Create A New Blog</button>
            <button class="tablinks" id="editBlog" onclick="OpenAdminTab(event, 'existingBlog', 2)">Edit An Existing Blog</button>
            <button class="tablinks"  id="organizeBlog" onclick="OpenAdminTab(event, 'organiseExistingBlogs', 3)">Organise Existing Blogs</button>
        </div>

        <div id="createBlog" class="tabcontent" style="display: table;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="SaveButton" EventName="Click"/>

                </Triggers>
                <ContentTemplate>
                    <div class="adminPanel">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Enter the Name of the blog here </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox runat="server" ID="blogName"></asp:TextBox>
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    <asp:Label runat="server">Enter the title of the blog here </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox runat="server" ID="blogTitle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">chose an image for the blog</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="blogImagePreview" runat="server" />
                                    <asp:FileUpload class="uploaders" ID="blogImage"  runat="server" accept=".png,.jpg,.jpeg,.gif" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Is this a popular blog ? check yes empty no</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="popularCheck" runat="server" />
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
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="existingBlog" class="tabcontent">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
                    <asp:PostBackTrigger ControlID="SaveEditBlog" />

                </Triggers>
                <ContentTemplate>

                    <div class="blogEditSelect">
                        <h2>Select the Blog you wish to Edit</h2>
                        <asp:Repeater ID="EditBlogRepeaterItems" runat="server">

                            <ItemTemplate>
                                <asp:Panel runat="server">
                                    <div runat="server" class="blogCard" data-id='<%#Eval("ID") %>' data-name='<%#Eval("Name") %>' data-date='<%#Eval("Date") %>' data-title='<%#Eval("Title") %>' data-contents='<%#Eval("Contents") %>' data-image='<%#Eval("ImageUrl") %>' data-popular='<%#Eval("Popular") %>'>
                                        <span>
                                            <h1 class="blogTitle"><%# Eval("Title") %></h1>
                                            <span class="BlogNameAndDate"><%# Eval("Name") %> <%# Eval("Date") %></span>
                                            <div class="blogImg">
                                                <image src="../Images/<%# Eval("ImageUrl") %>"></image>
                                            </div>

                                        </span>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="blogEditPanel hidden">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Blog Name</asp:Label>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="blogEditTextBox1"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Blog Title</asp:Label>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="blogEditTextBox2"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Blog Image</asp:Label>
                                </td>

                                <td>
                                    <asp:Image ID="imagePreview" runat="server" />
                                        <asp:FileUpload class="uploaders" runat="server" ID="blogEditFileUpload1"></asp:FileUpload>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Popular</asp:Label>
                                </td>

                                <td>
                                    <asp:CheckBox ID="blogEditCheckBox1" runat="server" ReadOnly="true" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Previous Blog Contents</asp:Label>
                                </td>

                                <td>
                                    <div id="textBoxPrevious" runat="Server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Blog Contents</asp:Label>
                                </td>

                                <td>
                                    <FTB:FreeTextBox ID="blogEditFreeTextBox2" runat="Server" />
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="SaveEditBlog" runat="server" Text="Save" OnClick="EditBlogSaveButton_Click" />
                                </td>
                            </tr>
                            <tr class="hidden">
                                <td>
                                    <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <asp:HiddenField runat="server" ID="editBlogId"></asp:HiddenField>
                                </td>
                            </tr>
                        </table>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="organiseExistingBlogs" class="tabcontent">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
                    <asp:PostBackTrigger ControlID="SaveEditBlog" />

                </Triggers>
                <ContentTemplate>

                    <div class="blogEditSelect">
                        <h2>Select the Blog you wish to Delete</h2>
                        <asp:Repeater ID="Repeater1" runat="server">

                            <ItemTemplate>
                                <asp:Panel runat="server">
                                    <div runat="server" class="blogCardDelete" data-id='<%# Eval("ID") %>' data-name='<%#Eval("Name") %>' data-date='<%#Eval("Date") %>' data-title='<%#Eval("Title") %>' data-contents='<%#Eval("Contents") %>' data-image='<%#Eval("ImageUrl") %>' data-popular='<%#Eval("Popular") %>'>
                                        <span>
                                            <h1 class="blogTitle"><%# Eval("Title") %></h1>
                                            <span class="BlogNameAndDate"><%# Eval("Name") %> <%# Eval("Date") %></span>
                                            <div class="blogImg">
                                                <image src="../Images/<%# Eval("ImageUrl") %>"></image>
                                            </div>
                                            <asp:Button class="blogDeleteButton" runat="server" data-name='<%#Eval("Name") %>' Text="Delete"  OnClick="EditBlogDeleteButton_Click" />
                                        </span>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                                    <asp:HiddenField runat="server" ID="delteHiddenField1"></asp:HiddenField>
                       </ContentTemplate>
            </asp:UpdatePanel>
      
        </div>
    </asp:Panel>

</asp:Content>



