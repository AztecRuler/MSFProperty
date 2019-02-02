<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MSFProperty.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>MSF Property Management</title>
    <link rel="canonical" href="" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div id="bgimg-1" class="bgimg-1 editable lazy" style="background-image: url('../Images/<%=GetImage(1)%>')">
        <div class="caption">
            <div class="container" style="margin-top: -300px;">
                <h2 class="editable"><%=GetText(1)%></h2>
                <p class="editable"><%=GetText(2)%></p>
            </div>
            <div id="DIV_1">
                <div id="DIV_2">
                    <h3 id="H3_3">Property Search
                    </h3>


                    <ul id="UL_5">
                        <li id="LI_6">
                            <div id="DIV_7">
                                <label for="msf-date-search-text-main" id="LABEL_8">
                                    <input type="text" id="searchInput" name="msf-date-search-text-main" placeholder="Enter search term here">
                                </label>
                            </div>
                        </li>
                        <li id="LI_128">
                            <input type="submit" value="Search" id="searchSubmitButton">
                        </li>
                    </ul>
                    <div id="DIV_130">
                        <h4 id="H4_131" class="editable">
                            <%=GetText(4)%>
                        </h4>
                        <input type="checkbox" id="flexDates" name="msf-checkbox-flexible">
                        <label for="msf-checkbox-flexible" id="LABEL_133" class="editable">
                            <%=GetText(5)%>
                        </label>
                        <input type="checkbox" id="smokingSearch" name="msf-checkbox-smoking">
                        <label for="msf-checkbox-smoking" id="LABEL_135" class="editable">
                            <%=GetText(6)%>
                        </label>
                        <input type="checkbox" id="petSearch" name="msf-checkbox-pet">
                        <label for="msf-checkbox-pet" id="LABEL_137" class="editable">
                            <%=GetText(7)%>
                        </label>
                    </div>


                </div>
                <!-- .container -->

            </div>



        </div>
        <div class="caption">
            <a href="#check1"><span id="spinner1" class="spinner_fade"></span><span id="spinner2" class="spinner_fade"></span><span id="spinner3" class="spinner_fade"></span>
                <span class="border editable"><%=GetText(3)%></span></a>

        </div>

        <div class="msf-buttons-info msf-bg-grey">
            <div class="container clear-both-fix text-align-center">
                <ul>
                    <li class="msf-button-info-book "><a class="editable" href="../contact-us.aspx"><%=GetText(8)%></a></li>
                    <li class="msf-button-info-phone "><a class="editable" href="tel:<%=GetText(9)%>"><%=GetText(9)%> </a></li>
                    <li class="msf-button-info-contact "><a class="editable" href="../contact-us.aspx"><%=GetText(10)%></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="check1"></div>
    <div class="foregroundDiv">
        <h3 class="editable" style="text-align: center;"><%=GetText(11)%> </h3>

        <span class="editable top_front_div"><%=GetText(12)%> </span>
    </div>

    <div class="bgimg-2 editable lazy" style="background-image: url('../Images/<%=GetImage(2)%>')">
        <div class="caption">
            <span class="border"><a href="AcommodationsPage.aspx" class="border editable"><%=GetText(13)%></a></span>

            <a href="#check2" id="followFadeAnchor"><span class="followFade"></span><span class="followFade"></span><span class="followFade"></span></a>

        </div>
    </div>
    <div id="check2"></div>

    <div style="position: relative;">
        <div class="foregroundDiv_dark">
            <p>View latest rental properties</p>

            <div class="msf-list-villas msf-bg-white">
                <div class="container">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <p class="text-align-right msf-list-villas-pager">
                                View
                        <asp:DropDownList ID="PagerPropHome" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RefreshCount">
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem Value="9999">All</asp:ListItem>
                        </asp:DropDownList>
                            </p>
                            <ul class="msf-list-villas-inset clear-both-fix property_ul">

                                <asp:Repeater ID="PropertyRepeaterHome" runat="server">

                                    <ItemTemplate>
                                        <li class="msf-list-villas-inset-item clear-both-fix">
                                            <div class="msf-lvi-box span-table">

                                                <div class="span-table-cell msf-lvi-box-main lazy" style="background-image: url(Images/<%# Eval("MainImage") %>);">
                                                    <a href="properties.aspx/" style="position: absolute; top: 0; bottom: 0; left: 0; right: 0;"></a>

                                                </div>
                                                <div class="span-table-cell vertical-align-middle text-align-center msf-lvi-box-side">
                                                    <ul class="clear-both-fix">
                                                        <li class="msf-ico-bed msf-ico"><strong>Bed</strong> <span><%# Eval("Bedrooms") %></span> <small><%# Eval("Bedrooms") %><br>
                                                            Bedrooms</small></li>
                                                        <li class="msf-ico-computer msf-ico"><strong>Computer</strong><small style="padding-top: 10px;"><%# Eval("Amenities") %></small></li>
                                                        <li class="msf-ico-bath msf-ico"><strong>Washing Facilities</strong><small><%# Eval("BathType") %></small></li>
                                                        <li class="msf-ico-location msf-ico"><a href="properties.aspx/#location">Location</a><small style="padding-top: 20px;">Location</small></li>
                                                        <li class="msf-ico-pet msf-ico"><strong>Pet</strong> <span><%# Eval("Pets").ToString().Replace("True"," Yes").Replace("False", " No") %></span> <small style="padding-top: 10px;">
                                                            <br>
                                                            Pets</small></li>
                                                        <li class="msf-ico-email msf-ico"><a href="properties.aspx/#pricing-availability">Pricing</a> <small style="padding-top: 20px;">Availability</small></li>
                                                        <li class="msf-ico-cost msf-ico"><a style="text-indent: 5px; font-size: 14px; text-align: center;" href="properties.aspx/#pricing-availability"><%# Eval("RentPrice") %></a><small><span><%# Eval("RentPrice") %> per month </span></small></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="msf-lvi-sub-box">
                                                <h3><a href="properties.aspx/"><%# Eval("PropertyName") %></a></h3>
                                                <p></p>
                                                <p style="width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%# GetTextContents(Convert.ToInt32(Eval("ID"))) %> </p>
                                                <a style="z-index: 1; color: gray; font-weight: bold; position: relative; bottom: 1px;" href="properties.aspx/">more</a>

                                                <a class="msf-more-button" href="properties.aspx/">More Information</a>
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
                                             <a href="javascript:__doPostBack('pagination','<%# Container.ItemIndex + 1 %>')" class="paginationNumber" id="pagination_<%# Container.ItemIndex + 1%>"><%# Container.DataItem  %></a>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <a href="javascript:__doPostBack('pagination','pagerForwards')" id="pagerForwards">&raquo;</a>
                                </div>
                                <asp:HiddenField ID="pagerNumber" runat="server" Value="1" />
                            </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

        </div>
    </div>

    <div class="bgimg-3 editable lazy" style="background-image: url('../Images/<%=GetImage(3)%>')">
        <div class="caption">
            <a href="#"><span class="border editable"><%=GetText(14)%></span></a>
        </div>
    </div>

    <div style="position: relative;">
    </div>
</asp:Content>


