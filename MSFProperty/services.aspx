﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MSFMaster.Master" CodeFile="services.aspx.cs" Inherits="MSFProperty.services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>services</title>
    <link rel="canonical" href="" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <div class="msf-main-bg-header bgimg editable" style="background-image: url('../Images/<%=GetImage(4)%>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 class="editable"><%=GetText(17)%></h2>
                    <span class="editable"><%=GetText(18)%></span>
                </div>
            </div>
        </div>
    </div>
    <div class="msf-buttons-info msf-bg-grey">
        <div class="container clear-both-fix text-align-center">
            <ul>
                <li class="msf-button-info-book"><a href="Default.aspx" class="editable"><%=GetText(19)%></a></li>
                <li class="msf-button-info-phone"><a href="tel:07709 649 292 " class="editable"><%=GetText(20)%></a></li>
                <li class="msf-button-info-contact"><a href="contact-us.aspx" class="editable"><%=GetText(21)%></a></li>
            </ul>
        </div>
    </div>
    <div class="foregroundDiv">
        <h3 style="text-align: center;" class="editable"><%=GetText(22)%></h3>
        <p class="editable"><%=GetText(23)%></p>

<%--     TODO:add blog 
    <span style="text-align: center; margin: 0 auto;" class="top_front_div editable"><%=GetText(24)%></span>--%>

    </div>

        <div class="foregroundDiv">
        <h3 style="text-align: center;" class="editable"><%=GetText(22)%></h3>
        <p class="editable"><%=GetText(39)%></p>

        <span style="text-align: center; margin: 0 auto;" class="top_front_div editable"><%=GetText(24)%></span>

    </div>
        <div class="foregroundDiv">
        <h3 style="text-align: center;" class="editable"><%=GetText(22)%></h3>
        <p class="editable"><%=GetText(40)%></p>

     <%--   <span style="text-align: center; margin: 0 auto;" class="top_front_div editable"><%=GetText(24)%></span>--%>

    </div>
</asp:Content>
