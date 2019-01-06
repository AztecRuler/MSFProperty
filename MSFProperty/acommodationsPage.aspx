<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="acommodationsPage.aspx.cs" Inherits="MSFProperty.acommodationsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Properties</title>
    <link href="CSS/Design1Css.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="wpg-main-bg-header bgimg editable" style="background-image: url('../Images/<%=GetImage(5)%>')" max-height: 871px;">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 class="editable"><%=GetText(25)%></h2>
                    <p class="editable"><%=GetText(26)%></p>
                </div>
            </div>
        </div>
    </div>
    <div style="position: relative;">

        <div class="foregroundDiv_dark">
            <p>View latest rental properties</p>

            <div class="wpg-list-villas wpg-bg-white">
                <div class="container">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <p class="text-align-right wpg-list-villas-pager">
                                View
                        <asp:DropDownList ID="PagerProp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RefreshCount">
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem Value="9999">All</asp:ListItem>
                        </asp:DropDownList>
                            </p>
                            <ul class="wpg-list-villas-inset clear-both-fix property_ul">

                                <asp:Repeater ID="PropertyRepeater" runat="server">

                                    <ItemTemplate>
                                        <li class="wpg-list-villas-inset-item clear-both-fix">
                                            <div class="wpg-lvi-box span-table">

                                                <div class="span-table-cell wpg-lvi-box-main" style="background-image: url(Images/<%# Eval("MainImage") %>);">
                                                    <a href="properties.aspx/" style="position: absolute; top: 0; bottom: 0; left: 0; right: 0;"></a>

                                                </div>
                                                <div class="span-table-cell vertical-align-middle text-align-center wpg-lvi-box-side">
                                                    <ul class="clear-both-fix">
                                                        <li class="wpg-ico-bed wpg-ico"><strong>Bed</strong> <span><%# Eval("Bedrooms") %></span> <small><%# Eval("Bedrooms") %><br>
                                                            Bedrooms</small></li>
                                                        <li class="wpg-ico-computer wpg-ico"><strong>Computer</strong><small style="padding-top: 10px;"><%# Eval("Amenities") %></small></li>
                                                        <li class="wpg-ico-bath wpg-ico"><strong>Washing Facilities</strong><small><%# Eval("BathType") %></small></li>
                                                        <li class="wpg-ico-location wpg-ico"><a href="properties.aspx/#location">Location</a><small style="padding-top: 20px;">Location</small></li>
                                                        <li class="wpg-ico-pet wpg-ico"><strong>Pet</strong> <span><%# Eval("Pets").ToString().Replace("True"," Yes").Replace("False", " No") %></span> <small style="padding-top: 10px;">
                                                            <br>
                                                            Pets</small></li>
                                                        <li class="wpg-ico-email wpg-ico"><a href="properties.aspx/#pricing-availability">Pricing</a> <small style="padding-top: 20px;">Availability</small></li>
                                                        <li class="wpg-ico-cost wpg-ico"><a style="text-indent: 5px; font-size: 14px; text-align: center;" href="properties.aspx/#pricing-availability"><%# Eval("RentPrice") %></a><small><span><%# Eval("RentPrice") %> per month </span></small></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="wpg-lvi-sub-box">
                                                <h3><a href="properties.aspx/"><%# Eval("PropertyName") %></a></h3>
                                                <p></p>
                                                <p style="width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%# getContents(Convert.ToInt32(Eval("ID"))) %> </p>
                                                <a style="z-index: 1; color: gray; font-weight: bold; position: relative; bottom: 1px;" href="properties.aspx/">more</a>

                                                <a class="wpg-more-button" href="properties.aspx/">More Information</a>
                                            </div>

                                            <span class="property_line"></span>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>

                            <div class="wpg-list-villas-pager-box4" style="text-align: center;">
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

