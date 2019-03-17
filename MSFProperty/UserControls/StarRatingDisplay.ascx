<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StarRatingDisplay.ascx.cs" Inherits="MSFProperty.UserControls.StarRatingDisplay" %>
<div class="starRatingContainer">
<h2>Star Rating</h2>
    <div class="newreviewStar"> <img src="../star.png" class="<%= GetNewClass() %>" width="40" height="40">New Review</div>
<asp:Repeater runat="server" ID="starRating">
    <ItemTemplate>
    <span class="<%# Eval("StarClass") %>"></span>
    </ItemTemplate>
</asp:Repeater>
</div>