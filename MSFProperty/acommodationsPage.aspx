<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="AcommodationsPage.aspx.cs" Inherits="MSFProperty.AcommodationsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Properties</title>
    <link rel="canonical" href=""/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="msf-main-bg-header bgimg editable lazy" style="background-image: url('../Images/<%= GetImage(5) %>')" max-height: 871px;">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 class="editable"><%= GetText(25) %></h2>
                    <p class="editable"><%= GetText(26) %></p>
                </div>
            </div>
        </div>
    </div>
    <div style="position: relative;">

        <div class="foregroundDiv_dark">
            <p>View latest rental properties</p>

            <div class="msf-bg-white">
                <div class="container">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <p class="text-align-right msf-list-villas-pager">
                                Select Amount Of Properties To Display
                                <asp:DropDownList ID="PagerProp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RefreshCount">
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem Value="9999">All</asp:ListItem>
                                </asp:DropDownList>
                            </p>
                            <ul class="msf-list-villas-inset clear-both-fix property_ul">

                                <asp:Repeater ID="PropertyRepeater" runat="server">

                                    <ItemTemplate>
                                        <li class="msf-list-villas-inset-item clear-both-fix">
                                            <div class="span-table">

                                                <div class="span-table-cell msf-lvi-box-main lazy" style="background-image: url(Images/<%# Eval("MainImage") %>);">
                                                    <a href="properties.aspx?id=<%# Eval("ID") %>" style="position: absolute; top: 0; bottom: 0; left: 0; right: 0;"></a>

                                                </div>
                                                <div class="span-table-cell  msf-lvi-box-side">
                                                    <ul class="clear-both-fix">
                                                        <li class="msf-ico-bed msf-ico">
                                                            <strong>Bed</strong> <span><%# Eval("Bedrooms") %></span>
                                                            <small>
                                                                <%# Eval("Bedrooms") %><br>
                                                                Bedrooms
                                                            </small>
                                                        </li>
                                                        <li class="msf-ico-computer msf-ico">
                                                            <strong>Computer</strong><small style="padding-top: 10px;"><%# Eval("Amenities") %></small>
                                                        </li>
                                                        <li class="msf-ico-bath msf-ico">
                                                            <strong>Washing Facilities</strong><small><%# Eval("BathType") %></small>
                                                        </li>
                                                        <li class="msf-ico-location msf-ico">
                                                            <a href="properties.aspx?id=<%# Eval("ID") %>#location">Location</a><small style="padding-top: 20px;">Location</small>
                                                        </li>
                                                        <li class="msf-ico-pet msf-ico">
                                                            <strong>Pet</strong> <span><%# Eval("Pets").ToString().Replace("True", " Yes").Replace("False", " No") %></span>
                                                            <small style="padding-top: 10px;">
                                                                <br>
                                                                Pets
                                                            </small>
                                                        </li>
                                                        <li class="msf-ico-email msf-ico">
                                                            <a href="properties.aspx?id=<%# Eval("ID") %>#pricing-availability">Pricing</a> <small style="padding-top: 20px;">Availability</small>
                                                        </li>
                                                        <li class="msf-ico-cost msf-ico">
                                                            <a style="text-indent: 5px; font-size: 14px; text-align: center;" href="properties.aspx?id=<%# Eval("ID") %>#pricing-availability"><%# Eval("RentPrice") %></a>
                                                            <small>
                                                                <span><%# Eval("RentPrice") %> per month </span>
                                                            </small>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="msf-lvi-sub-box">
                                                <h3>
                                                    <a href="properties.aspx?id=<%# Eval("ID") %>"><%# Eval("PropertyName") %></a>
                                                </h3>
                                                <p></p>
                                                <p style="width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%# GetContents(Convert.ToInt32(Eval("ID"))) %> </p>
                                                <a style="z-index: 1; color: gray; font-weight: bold; position: relative; bottom: 1px;" href="properties.aspx?id=<%# Eval("ID") %>">more</a>

                                                <a class="msf-more-button" href="properties.aspx?id=<%# Eval("ID") %>">More Information</a>
                                            </div>

                                            <span class="property_line"></span>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                            <div class="center">
                                <div class="pagination">
                                    <a href="javascript:__doPostBack('pagination','pagerBack')" id="pagerBack">&laquo;</a>

                                    <asp:Repeater ID="pagerRepeater" runat="server">
                                        <ItemTemplate>
                                            <a href="javascript:__doPostBack('pagination','<%# Container.ItemIndex + 1 %>')" class="paginationNumber" id="pagination_<%# Container.ItemIndex + 1 %>"><%# Container.DataItem %></a>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <a href="javascript:__doPostBack('pagination','pagerForwards')" id="pagerForwards">&raquo;</a>
                                </div>
                                <asp:HiddenField ID="pagerNumber" runat="server" Value="1"/>
                            </div>
                            <div class="msf-list-villas-pager-box4" style="text-align: center;">
                                <ul class="pager">
                                    <ul></ul>
                                </ul>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>

        </div>
    </div>

</asp:Content>

