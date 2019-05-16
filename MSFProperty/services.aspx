<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MSFMaster.Master" CodeBehind="services.aspx.cs" Inherits="MSFProperty.services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>services</title>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <div class="msf-main-bg-header bgimg editable" style="background-image: url('../Images/<%=GetImage(4)%>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 style ="color: <%= GetColour(17) %>;" class="editable"><%=GetText(17)%></h2>
                    <span style ="color: <%= GetColour(18) %>;" class="editable"><%=GetText(18)%></span>
                </div>
            </div>
        </div>
    </div>
    <div class="msf-buttons-info msf-bg-grey">
        <div class="container clear-both-fix text-align-center">
            <ul>
                <li class="msf-button-info-book"><a href="ContactUs.aspx" style ="color: <%= GetColour(19) %>;" class="editable"><%=GetText(19)%></a></li>
                <li class="msf-button-info-phone"><a href="tel:<%= GetMobileNumber() %>" style ="color: <%= GetColour(20) %>;" ><%= GetMobileNumber() %></a></li>
                <li class="msf-button-info-contact"><a href="ContactUs.aspx" style ="color: <%= GetColour(21) %>;" class="editable"><%=GetText(21)%></a></li>
            </ul>
        </div>
    </div>
    <div class="foregroundDiv">
        <h3 style="text-align: center; color: <%= GetColour(22) %>;" class="editable"><%=GetText(22)%></h3>
        <p style ="color: <%= GetColour(23) %>;" class="editable srviveP"><%=GetText(23)%></p>

    </div>
    <hr class="type_4">
    <div class="foregroundDiv">
        <h3 style="text-align: center; color: <%= GetColour(24) %>;" class="editable"><%=GetText(24)%></h3>
        <p style ="color: <%= GetColour(39) %>;" class="editable srviveP"><%=GetText(39)%></p>

    </div>
    <hr class="type_4">
    <div class="foregroundDiv">
        <h3 style="text-align: center; color: <%= GetColour(40) %>;" class="editable"><%=GetText(40)%></h3>
        <p style ="color: <%= GetColour(48) %>;" class="editable srviveP"><%=GetText(48)%></p>

    </div>
</asp:Content>
