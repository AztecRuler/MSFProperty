<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminAboutUs.aspx.cs" Inherits="MSFProperty.Admin.AdminAboutUs" %>
<%@ Register TagPrefix="uc1" TagName="AboutUsInfo" Src="~/UserControls/AboutUsInfo.ascx" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <asp:Panel ID="Panel1" runat="server" GroupingText="About_Us">
        <div class="tab">
            <button class="tablinks active" id="createNewAbout_Us" onclick="OpenAdminTab(event, 'createAbout_Us', 1)">Create A New About Us Section</button>
            <button class="tablinks" id="editAbout_Us" onclick="OpenAdminTab(event, 'existingAbout_Us', 2)">Edit An Existing About Us Section</button>
            <button class="tablinks"  id="organizeAbout_Us" onclick="OpenAdminTab(event, 'organiseExistingAbout_Uss', 3)">Organize Existing About Us Section</button>
        </div>

        <div id="createAbout_Us" class="tabcontent" style="display: table;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
                    <asp:PostBackTrigger ControlID="SaveButton" />

                </Triggers>
                <ContentTemplate>
                    <div class="adminPanel">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Enter Title here </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox runat="server" ID="About_Title"></asp:TextBox>
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    <asp:Label runat="server">Enter the 1st paragraph here</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox runat="server" ID="AboutParaOne"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Enter the 2nd paragraph here</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox runat="server" ID="AboutParaTwo"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:Label runat="server">chose an image</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="aboutimagePreview" runat="server" />
                                    <asp:FileUpload class="uploaders" ID="AboutImage"  runat="server" accept=".png,.jpg,.jpeg,.gif" />

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

        <div id="existingAbout_Us" class="tabcontent">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
                    <asp:PostBackTrigger ControlID="SaveEditAbout_Us" />

                </Triggers>
                <ContentTemplate>

                    <div class="About_UsEditSelect">
                        <h2>Select the About Us content you wish to Edit</h2>
                        
                                    <div class="container ">
                                        <asp:Repeater ID="EditAbout_UsRepeaterItems" runat="server">
                                            <ItemTemplate>
                                                <uc1:AboutUsInfo runat="server" ID="AboutUsInfo" class="aboutUsAdminEdit" TitleText=<%#Eval("TitleText") %> Quote=<%#Eval("Quote") %> ImageUrl=<%#Eval("ImageUrl") %> Chat=<%#Eval("Chat") %> DataId=<%#Eval("ID") %>/>
                                                </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                    </div>
                    <div class="About_UsEditPanel hidden">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Title</asp:Label>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="About_UsEditTextBox1"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Paragraph one</asp:Label>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="About_UsEditTextBox2"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Paragraph two</asp:Label>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="About_UsEditTextBox3"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Image</asp:Label>
                                </td>

                                <td>
                                    <asp:Image ID="imagePreview" runat="server" />
                                    <asp:FileUpload class="uploaders" ID="FileUpload1"  runat="server" accept=".png,.jpg,.jpeg,.gif" />
                                </td>

                            </tr>
                          
                            <tr>
                                <td>
                                    <asp:Button ID="SaveEditAbout_Us" runat="server" Text="Save" OnClick="EditAbout_UsSaveButton_Click" />

                                </td>
                            </tr>
                            <tr class="hidden">
                                <td>
                                    <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <asp:HiddenField runat="server" ID="editAbout_UsId"></asp:HiddenField>
                                </td>
                            </tr>
                        </table>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="organiseExistingAbout_Uss" class="tabcontent">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
<%--                    <asp:PostBackTrigger ControlID="SaveEditAbout_Us" />--%>

                </Triggers>
                <ContentTemplate>

                    <div class="About_UsEditSelect">
                        <h2>Select the About_Us you wish to Delete</h2>
           <%--             <asp:Repeater ID="Repeater1" runat="server">

                            <ItemTemplate>
                                <asp:Panel runat="server">
                                    <div runat="server" class="About_UsCardDelete" data-id='<%# Eval("ID") %>' data-name='<%#Eval("Name") %>' data-date='<%#Eval("Date") %>' data-title='<%#Eval("Title") %>' data-contents='<%#Eval("Contents") %>' data-image='<%#Eval("ImageUrl") %>' data-popular='<%#Eval("Popular") %>'>
                                        <span>
                                            <h1 class="About_UsTitle"><%# Eval("Title") %></h1>
                                            <span class="About_UsNameAndDate"><%# Eval("Name") %> <%# Eval("Date") %></span>
                                            <div class="About_UsImg">
                                                <image src="../Images/<%# Eval("ImageUrl") %>"></image>
                                            </div>
                                            <asp:Button class="About_UsDeleteButton" runat="server" data-name='<%#Eval("Name") %>' Text="Delete"  OnClick="EditAbout_UsDeleteButton_Click" />
                                        </span>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>--%>
                    </div>
                                    <asp:HiddenField runat="server" ID="delteHiddenField1"></asp:HiddenField>
                       </ContentTemplate>
            </asp:UpdatePanel>
      
        </div>
    </asp:Panel>


</asp:Content>
