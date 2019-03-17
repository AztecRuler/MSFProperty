<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="BlogPageView.aspx.cs" Inherits="MSFProperty.BlogPageView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog Main Article</title>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
    <div class="msf-main-bg-header bgimg lazy" style="background-image: url('../Images/<%=GetImage()%>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 ><%= GetTitle() %></h2>
                    <p ><%=GetDate() %> </p>
                </div>
            </div>
        </div>
    </div>
    <div class="msf-buttons-info msf-bg-grey">
        <div class="container clear-both-fix text-align-center">
           
             <div class="foregroundDiv_light"><p><%=GetName() %> </p></div>
 
        </div>
    </div>
    <div class="foregroundDiv">
<div class="mainBlogContents"><%= GetContent() %></div>
    </div>
    
    <div class="container blogLink"> <a href="BlogMainPage.aspx">Return to blogs ></a> </div>
</asp:Content>

