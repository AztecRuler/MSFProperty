<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="BlogPageView.aspx.cs" Inherits="MSFProperty.BlogPageView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog Main Article</title>
    <link href="CSS/Design1Css.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
    <div class="wpg-main-bg-header" style="background-image: url('../Images/<%=GetImage()%>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 ><%= GetTitle() %></h2>
                    <p ><%=GetDate() %> </p>
                </div>
            </div>
        </div>
    </div>
    <div class="wpg-buttons-info wpg-bg-grey">
        <div class="container clear-both-fix text-align-center">
           
             <div><%=GetName() %> </div>
 
        </div>
    </div>
    <div class="foregroundDiv">
<div class="mainBlogContents"><%= GetContent() %></div>
    </div>
</asp:Content>

