<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AboutUsInfo.ascx.cs" Inherits="MSFProperty.UserControls.AboutUsInfo" %>
<div class="About_Us-info-section">
    <div id="msf-About_Us-Image">
        <img src="<%=ImageUrl %>" alt="" width="253" height="253" id="msf-About_Us-IMG_9">
    </div>

        <div id="msf-About_Us-text">
        <h3 id="msf-About_Us-title" ><%=Title%></h3>
        <p id="P1" class="msf-About_Us-P " runat="server"><%=Quote%> </p>
        <p id="P2" class="msf-About_Us-P " runat="server"><%=Chat%></p>

    </div>
</div>