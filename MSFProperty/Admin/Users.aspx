<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="MSFProperty.Admin.Users" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="UsersPanel" runat="server" GroupingText="Users">
        <div class="tab">
            <button class="tablinks active" id="createNewUser" onclick="OpenAdminTab(event, 'addUser', 1)">Add A New User</button>
            <button class="tablinks" id="editBlog" onclick="OpenAdminTab(event, 'editUser', 2)">Edit An Existing User</button>
        </div>

        <div id="addUser" class="tabcontent" style="display: table;">
            <asp:UpdatePanel ID="AddUserUpdatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>

                </Triggers>
                <ContentTemplate>
                    <div id="page-content-wrapper">
                        <div class="container-fluid">
                            <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                <tr>
                                    <td>
                                        <table cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2">Add User</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserNameTextBox">User Name:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserNameTextBox" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="PasswordTextBox">Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="PasswordRepeatLabel" runat="server" AssociatedControlID="PasswordRepeatTextBox">Confirm Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="PasswordRepeatTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PasswordRepeatTextBox" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="EmailTextBox">Email:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="EmailTextBox" runat="server" TextMode="Email"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Email is required." ToolTip="Email is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="ConfirmEmailLabel" runat="server" AssociatedControlID="ConfirmEmailTextBox">Confirm Email:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ConfirmEmailTextBox" runat="server" TextMode="Email"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ConfirmEmailTextBox" ErrorMessage="Email is required." ToolTip="Email is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: Red;">
                                                    <asp:Label ID="ErrorLabelMessage" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="CreateUserButton" runat="server" CommandName="Login" Text="Create User" ValidationGroup="LoginAdmin" OnClick="CreateUserButtonClick"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="editUser" class="tabcontent" style="display: table;">
            <asp:UpdatePanel ID="EditUserUpdatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>

                </Triggers>
                <ContentTemplate></ContentTemplate>
            </asp:UpdatePanel>
        </div>


    </asp:Panel>

</asp:Content>
