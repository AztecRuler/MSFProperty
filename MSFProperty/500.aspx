<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="500.aspx.cs" Inherits="MSFProperty._500" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title >500 Error Page </title>
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
        <h1>Unfortunately an error has occured this error has been noted please click <a href="Default.aspx">here</a> to return to the home page </h1>

    </div>


</asp:Content>

