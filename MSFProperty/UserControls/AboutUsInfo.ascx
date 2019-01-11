<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AboutUsInfo.ascx.cs" Inherits="MSFProperty.UserControls.AboutUsInfo" %>
<div class="about-us-info-section">
    <div id="msf-about-us-Image">
        <img src="../<%=ImageUrl %>" alt="" width="253" height="253" id="msf-about-us-IMG_9">
    </div>

        <div id="msf-about-us-text">
        <h3 id="msf-about-us-title" ><%=Title%></h3>
        <p id="P1" class="msf-about-us-P " runat="server"><%=Quote%> </p>
        <p id="P2" class="msf-about-us-P " runat="server"><%=Chat%></p>

    </div>
</div>