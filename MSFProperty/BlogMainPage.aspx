﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="BlogMainPage.aspx.cs" Inherits="MSFProperty.BlogMainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog</title>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <div class="msf-main-bg-header bgimg  editable lazy" style="background-image: url('~/../Images/<%=GetImage(7)%>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 style ="color: <%= GetColour(31) %>;" class=" editable"><%=GetText(31)%></h2>
                    <p style ="color: <%= GetColour(32) %>;" class=" editable"><%=GetText(32)%> </p>
                </div>
            </div>
        </div>
    </div>
    <div class="msf-buttons-info msf-bg-grey">
        <div class="container clear-both-fix text-align-center">
            <ul>
                <li class="msf-button-info-book "><a style ="color: <%= GetColour(8) %>;" class=" editable" href="ContactUs.aspx"><%=GetText(8)%></a></li>
                <li class="msf-button-info-phone"><a href="tel:<%= GetMobileNumber() %>" style ="color: <%= GetColour(9) %>;" ><%= GetMobileNumber() %></a></li>

                <li class="msf-button-info-contact "><a style ="color: <%= GetColour(10) %>;" class=" editable" href="ContactUs.aspx"><%=GetText(10)%></a></li>
            </ul>
        </div>
    </div>
    <div class="foregroundDiv">
        <h3 style="text-align: center; color: <%= GetColour(33) %>;" class=" editable"><%=GetText(33)%></h3>


        <div class="blogRow">
            <div class="blogLeftcolumn">
                <asp:Repeater ID="BlogRepeaterItems" runat="server">

                    <ItemTemplate>
                       
                            <div class="blogCard">
                                <a href="BlogPageView.aspx?id=<%# Eval("ID") %>">
                                <h1 class="blogTitle"><%# Eval("Title") %></h1>
                                <span class="BlogNameAndDate"><%# Eval("Name") %> </span>
                                    <br/>
                                    <span class="BlogNameAndDate">Added :  <%# Eval("Date") %></span>
                                <div class="blogImg">
                                    <image src="~/../Images/<%# Eval("ImageUrl") %>"></image>
                                </div>
                                <div class="smallBlogBlurb">
                                    <%# GetContents(Convert.ToInt32(Eval("ID"))) %>
                                </div>
                                </a>
                            </div>
                      
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="blogRightcolumn">
                <div class="card">
                    <h3>Popular Posts<img src="star.png" width="40" height="40"/></h3>
                    <asp:Repeater ID="BlogRepeaterPopular" runat="server">
                        <ItemTemplate>
                            <div class='popularBlogposts  <%# GetPopularBlogs(Convert.ToInt32(Eval("ID"))) %>'><a href="BlogPageView.aspx?id=<%# Eval("ID") %> ">
                                <h2 class='blogTitle'><%# Eval("Title") %></h2>
                            </a></div>
                           
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
