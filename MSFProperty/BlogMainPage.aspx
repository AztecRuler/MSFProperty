<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="BlogMainPage.aspx.cs" Inherits="MSFProperty.BlogMainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog</title>
    <link href="CSS/Design1Css.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <div class="wpg-main-bg-header bgimg editable" style="background-image: url('../Images/<%=GetImage(7)%>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 class="editable"><%=GetText(31)%></h2>
                    <p class="editable"><%=GetText(32)%> </p>
                </div>
            </div>
        </div>
    </div>
    <div class="wpg-buttons-info wpg-bg-grey">
        <div class="container clear-both-fix text-align-center">
            <ul>
                <li class="wpg-button-info-book "><a class="editable" href="#"><%=GetText(8)%></a></li>
                <li class="wpg-button-info-phone "><a class="editable" href="tel:07709 649 292 7"><%=GetText(9)%> </a></li>
                <li class="wpg-button-info-contact "><a class="editable" href="../contact-us/"><%=GetText(10)%></a></li>
            </ul>
        </div>
    </div>
    <div class="foregroundDiv">
        <h3 style="text-align: center;" class="editable"><%=GetText(33)%></h3>


        <div class="blogRow">
            <div class="blogLeftcolumn">

                <span style="text-align: center; margin: 0 auto;" class="top_front_div">
                    <asp:Repeater ID="BlogRepeaterItems" runat="server">
                        <ItemTemplate>
                            <div class="blogCard">
                                <h2><%# Eval("Title") %></h2>
                                <h5><%# Eval("Name") %> <%# Eval("Date") %></h5>
                                <div class="blogImg" style="height: 200px;"><image src="../Images/<%# Eval("ImageUrl") %>"></image> </div>
                              <%# Eval("Contents") %>

                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </span>
            </div>

            <div class="blogRightcolumn">
                <div class="card">
                    <h3>Popular Post</h3>
                    <asp:Repeater ID="BlogRepeaterPopular" runat="server">
                        <ItemTemplate>
                            <div class="blogImg" ><image src="../Images/<%# Eval("ImageUrl") %>"></image></div>
                            <br>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
