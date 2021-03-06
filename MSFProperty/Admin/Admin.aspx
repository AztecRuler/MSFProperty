﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="MSFProperty.Admin.Admin" %>


<asp:Content ID="Content4" runat="server" contentplaceholderid="AdminPanel">

    <ul id="navBar">
        <li style="float: right">
            <a href="../Default.aspx">View Live Web Site</a>
        </li>
    </ul>
    <asp:UpdateProgress ID="logInUpdateProgress" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="logInUpdate">
        <ProgressTemplate>
            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif"/>
                        Checking log in details now ......
                    </div>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div class="loginPage">
        <asp:Panel ID="loginPanel" runat="server" GroupingText="Login Page">
            <asp:UpdatePanel ID="logInUpdate" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ResetpassButton"/>
                    <asp:AsyncPostBackTrigger ControlID="LoginButton"/>

                </Triggers>
                <ContentTemplate>
                    <asp:Panel runat="server" GroupingText="Login Section">
                        <div id="page-content-wrapper">
                            <div class="container-fluid">
                                <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                    <tr>
                                        <td>
                                            <table cellpadding="0">
                                                <tr>
                                                    <td align="center" colspan="2">Log In</td>
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
                                                    <td colspan="2">
                                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time."/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="color: Red;">
                                                        <asp:Label ID="LabelMessage" runat="server" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" colspan="2">
                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginAdmin" OnClick="LoginButton_Click1"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                    </asp:Panel>
                    <asp:Panel runat="server" GroupingText="Reset Password">
                        <div id="RecoverPasswordPanel">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="ResetpassLabel" runat="server" Text="Enter username To Reset Password"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="ResetpassTextBox" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="ResetpassButton" runat="server" Text="Button" OnClick="ResetpassButtonClick"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="ResetPassResponse" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

    </div>
</asp:Content>

