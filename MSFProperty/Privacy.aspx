<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="Privacy.aspx.cs" Inherits="MSFProperty.Privacy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Privacy Policy</title>
    <link rel="canonical" href=""/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
    <div class="msf-main-bg-header bgimg  editable" style="background-image: url('../Images/<%= GetImage(9) %>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 style ="color: <%= GetColour(42) %>;" class=" editable"><%= GetText(42) %></h2>
                    <span style ="color: <%= GetColour(43) %>;" class=" editable"><%= GetText(43) %></span>
                </div>
            </div>
        </div>
    </div>
    <div class="foregroundDiv">
        <h3 style="text-align: center; color: <%= GetColour(44) %>;" class=" editable"><%= GetText(44) %></h3>
        <p style ="color: <%= GetColour(45) %>;" class=" editable"><%= GetText(45) %></p>

    </div>

</asp:Content>

