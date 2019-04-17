<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="MSFProperty._404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Page not found 404</title>
    <style>
        .spacer404 {
            padding-top: 20%;
            padding-bottom: 20%;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">

    <div class="spacer404">
        <h1>Sorry we don't seem to be able to find the page you are looking for please click <a href="Default.aspx">here</a> to return to the home page </h1>

    </div>

</asp:Content>

