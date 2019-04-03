<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminBlogPage.aspx.cs" Inherits="MSFProperty.Admin.AdminBlogPage" ValidateRequest="false" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script>
    $(document).ready(function() {
/* initial load of editor */
        LoadTinyMCE();
    });

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler_Page);

/* fire this event to remove the existing editor and re-initialize it*/
    function EndRequestHandler_Page(sender, args) {
//1. Remove the existing TinyMCE instance of TinyMCE
        tinymce.remove("#<%= BlogBlurb.ClientID %>, #<%= blogEditFreeTextBox2.ClientID %>");
//2. Re-init the TinyMCE editor
        LoadTinyMCE();
    }

    function SaveTextBoxBeforePostBack() {
        tinymce.triggerSave();
    }

    function LoadTinyMCE() {

/* initialize the TinyMCE editor */
        tinymce.init({
            selector: "#<%= BlogBlurb.ClientID %>, #<%= blogEditFreeTextBox2.ClientID %>",
            plugins: [
                'advlist autolink lists link image charmap print preview hr anchor pagebreak',
                'searchreplace wordcount visualblocks visualchars code fullscreen',
                'insertdatetime media nonbreaking save table contextmenu directionality',
                'emoticons template paste textcolor colorpicker textpattern imagetools'
            ],
            toolbar1:
                'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
            toolbar2: 'print preview media | forecolor backcolor emoticons',
            image_advtab: true,
            templates: [
                { title: 'Test template 1', content: 'Test 1' },
                { title: 'Test template 2', content: 'Test 2' }
            ],
            height: 400,
            width: 650,
            content_css: [
                '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
                '//www.tinymce.com/css/codepen.min.css'
            ]
        });
    }
</script>
<asp:Panel ID="Panel1" runat="server" GroupingText="Blog">
<div class="tab">
    <button class="tablinks active" id="createNewBlog" onclick="OpenAdminTab(event, 'createBlog', 1)">Create A New Blog</button>
    <button class="tablinks" id="editBlog" onclick="OpenAdminTab(event, 'existingBlog', 2)">Edit An Existing Blog</button>
    <button class="tablinks" id="organizeBlog" onclick="OpenAdminTab(event, 'organiseExistingBlogs', 3)">Organise Existing Blogs</button>
</div>

<div id="createBlog" class="tabcontent" style="display: table;">
    <asp:UpdateProgress ID="CreateBlogUpdateProgress" runat="server" AssociatedUpdatePanelID="CreateBlogUpdatePanel" DynamicLayout="True">
        <ProgressTemplate>
            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif"/>
                        Please Wait while loading ....

                    </div>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="CreateBlogUpdatePanel" runat="server">
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
                            <asp:Image ID="blogImagePreview" runat="server"/>
                            <asp:FileUpload class="uploaders" ID="blogImage" runat="server" accept=".png,.jpg,.jpeg,.gif"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Is this a popular blog ? check yes empty no</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="popularCheck" runat="server"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label runat="server">Enter the blog contents into the box and press save to save the blog</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" TextMode="multiline" style="margin: 0px; min-width: 388px; min-height: 334px;" ID="BlogBlurb"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click1"/>
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
            <asp:PostBackTrigger ControlID="SaveEditBlog"/>

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
                            <asp:Image ID="imagePreview" runat="server"/>
                            <asp:FileUpload class="uploaders" runat="server" ID="blogEditFileUpload1"></asp:FileUpload>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Popular</asp:Label>
                        </td>

                        <td>
                            <asp:CheckBox ID="blogEditCheckBox1" runat="server" ReadOnly="true"/>
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
                            <asp:TextBox runat="server" TextMode="multiline" style="margin: 0px; min-width: 388px; min-height: 334px;" ID="blogEditFreeTextBox2"></asp:TextBox>

                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="SaveEditBlog" runat="server" Text="Save" OnClick="EditBlogSaveButton_Click"/>
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
            <asp:PostBackTrigger ControlID="SaveEditBlog"/>

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
                                    <asp:Button class="blogDeleteButton" runat="server" data-name='<%#Eval("Name") %>' Text="Delete" OnClick="EditBlogDeleteButton_Click"/>
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



