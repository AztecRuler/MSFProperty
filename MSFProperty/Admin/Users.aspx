<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="MSFProperty.Admin.Users" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="UsersPanel" runat="server" GroupingText="Users">
        <div class="tab">
            <button class="tablinks active" id="createNewUser" onclick="OpenAdminTab(event, 'addUser', 1)">Add A New User</button>
            <button class="tablinks" id="editBlog" onclick="OpenAdminTab(event, 'editUser', 2)">Edit An Existing User</button>
        </div>

        <div id="addUser" class="tabcontent" style="display: table;">
            <asp:UpdatePanel ID="AddUserUpdatePanel" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="CreateUserButton"/>

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

        <div id="editUser" class="tabcontent">
            <asp:UpdatePanel ID="EditUserUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="CancelEditUser"/>

                </Triggers>
                <ContentTemplate>
                    <asp:Repeater ID="UsersRepeater" runat="server">
                        <ItemTemplate>
                            <div  data-id="<%#Eval("UserId") %>" class="userViewContainer">

                                <div> <%# Eval("Username") %></div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:HiddenField runat="server" ID="editUserId"></asp:HiddenField>

               
                    <asp:Panel ID="passwordConfirmPanel" runat="server" GroupingText="Password Confirm" CssClass="hidden">
                        <asp:Label ID="userConfirmPasswordLabel" runat="server" Text="Enter Current Password For This User"></asp:Label>
                        <asp:TextBox ID="userConfirmPasswordTextBox" runat="server"></asp:TextBox>
                        <asp:Button ID="userConfirmPasswordCheck" runat="server" Text="Enter Password" OnClick="ConfirmPassword"/>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="EditUserDetailsPanel" GroupingText="Edit User Details" Visible="False">
                        <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2">Add User</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="EditUserDetails" runat="server" AssociatedControlID="EditUserDetailsTextBox">User Name:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="EditUserDetailsTextBox" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="EditUserDetailsTextBox" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="EditUserDetailsPasswordLabel" runat="server" AssociatedControlID="EditUserDetailsPasswordTextBox">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="EditUserDetailsPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="EditUserDetailsPasswordTextBox" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label3" runat="server" AssociatedControlID="PasswordRepeatTextBox">Confirm Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="EditUserDetailsPasswordRepeatTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="EditUserDetailsPasswordRepeatTextBox" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="EditUserDetailsEmailLabel" runat="server" AssociatedControlID="EditUserDetailsEmailTextBox">Email:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="EditUserDetailsEmailTextBox" runat="server" TextMode="Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="EditUserDetailsEmailTextBox" ErrorMessage="Email is required." ToolTip="Email is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="EditUserDetailsConfirmEmailLabel" runat="server" AssociatedControlID="EditUserDetailsConfirmEmailTextBox">Confirm Email:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="EditUserDetailsConfirmEmailTextBox" runat="server" TextMode="Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="EditUserDetailsConfirmEmailTextBox" ErrorMessage="Email is required." ToolTip="Email is required." ValidationGroup="LoginAdmin">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color: Red;">
                                                <asp:Label ID="EditUserDetailsErrorLabel" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="EditUserDetailsSave" runat="server" CommandName="Login" Text="Edit User" ValidationGroup="LoginAdmin" OnClick="EditUserDetailsSave_OnClickUserButtonClick"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </asp:Panel>
                        <asp:Label ID="editUserError" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Button ID="CancelEditUser" runat="server" Text="Cancel" CssClass="hidden"/>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel id="UserEditOptionUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                <ContentTemplate>
                <asp:Panel ID="editUserOptions" runat="server" GroupingText="edit User options" CssClass="hidden">
                    <asp:Button ID="DeleteUser" runat="server" Text="Delete User" OnClick="DeleteUser_OnClick"/>
                    <asp:Button ID="EditUserButton" runat="server" Text="Edit User"/>
                </asp:Panel>
            </ContentTemplate>

            </asp:UpdatePanel>
        </div>


    </asp:Panel>

</asp:Content>
