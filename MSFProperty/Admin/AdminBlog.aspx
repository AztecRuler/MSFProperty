<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminBlog.aspx.cs" Inherits="MSFProperty.Admin.Blog"  ValidateRequest="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>
        </Scripts>
    </asp:ScriptManagerProxy>
        <FTB:FreeTextBox id="FreeTextBox1" runat="Server" />
    <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click1" />
</asp:Content>


