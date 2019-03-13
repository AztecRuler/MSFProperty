<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminAboutUs.aspx.cs" Inherits="MSFProperty.Admin.AdminAboutUs" %>
<%@ Register TagPrefix="uc1" TagName="AboutUsInfo" Src="~/UserControls/AboutUsInfo.ascx" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="Panel1" runat="server" GroupingText="About_Us">
        <div class="tab">
            <button class="tablinks active" id="createNewAbout_Us" onclick="OpenAdminTab(event, 'createAbout_Us', 1)">Create A New About Us Section</button>
            <button class="tablinks" id="editAbout_Us" onclick="OpenAdminTab(event, 'existingAbout_Us', 2)">Edit An Existing About Us Section</button>
            <button class="tablinks" id="organizeAbout_Us" onclick="OpenAdminTab(event, 'organiseExistingAbout_Uss', 3)">Organize Existing About Us Section</button>
        </div>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel2">
        <ProgressTemplate>
            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif" />
                        Please wait while about us is created ...
                    </div>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress> 
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
                                    <asp:Image ID="aboutimagePreview" runat="server"/>
                                    <asp:FileUpload class="uploaders" ID="AboutImage" runat="server" accept=".png,.jpg,.jpeg,.gif"/>

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
    <asp:UpdateProgress ID="UpdateProgress2" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel3">
        <ProgressTemplate>
            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif" />
                        Please wait...
                    </div>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress> 
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
                                    <uc1:AboutUsInfo runat="server" ID="AboutUsInfo" class="aboutUsAdminEdit" TitleText=<%#Eval("TitleText") %> Quote=<%#Eval("Quote") %> ImageUrl=<%#Eval("ImageUrl") %> Chat=<%#Eval("Chat") %> DataId=<%#Eval("ID") %> DataDelete="False"/>
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
                                    <asp:Image ID="imagePreview" runat="server"/>
                                    <asp:FileUpload class="uploaders" ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif"/>
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    <asp:Button ID="SaveEditAbout_Us" runat="server" Text="Save" OnClick="EditAbout_UsSaveButton_Click"/>
                                    <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_OnClick"/>
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
    <asp:UpdateProgress ID="UpdateProgress3" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif" />
                        Please wait...
                    </div>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress> 
        <div id="organiseExistingAbout_Uss" class="tabcontent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="DeleteAbout_Us" EventName="Click"/>
                    <asp:AsyncPostBackTrigger ControlID="CancelDelete" EventName="Click"/>

                </Triggers>
                <ContentTemplate>

                    <div class="About_UsEditSelect">
                        <h2>Select the About Us you wish to Delete</h2>
                        <asp:Repeater ID="DeleteAboutUsRepeater" runat="server">
                            <ItemTemplate>
                                <uc1:AboutUsInfo runat="server" ID="AboutUsInfo" class="aboutUsAdminEdit" TitleText=<%#Eval("TitleText") %> Quote=<%#Eval("Quote") %> ImageUrl=<%#Eval("ImageUrl") %> Chat=<%#Eval("Chat") %> DataId=<%#Eval("ID") %> DataDelete="True"/>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div class="About_UsDeletePanel hidden">
                        <div>
                            <h1>Are you sure you want to delete this about us post?</h1>
                            <asp:Button ID="DeleteAbout_Us" runat="server" Text="Delete" OnClientClick="confirm('Are you sure you want to delete this listing? ');" OnClick="DeleteAbout_UsButton_Click"/>
                            <asp:Button ID="CancelDelete" runat="server" Text="Cancel" OnClick="Cancel_OnClick"/>

                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </asp:Panel>


</asp:Content>
