<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MSFProperty.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>MSF Property Management</title>
    <link href="CSS/Design1Css.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="bgimg-1" class="bgimg-1 editable" style="background-image: url('../Images/<%=GetImage(1)%>')">
        <div class="caption">
            <div class="container" style="margin-top: -300px;">
                <h2 class="editable"><%=GetText(1)%></h2>
                <p class="editable"><%=GetText(2)%></p>
            </div>

            <span class="border editable"><%=GetText(3)%></span>
        </div>
        <div id="DIV_1">
            <div id="DIV_2">
                <h3 id="H3_3">Property Search
                </h3>


                <form method="get" action="#/accommodation/" id="FORM_4">
                    <ul id="UL_5">
                        <li id="LI_6">
                            <div id="DIV_7">
                                <label for="wpg-date-search-text-main" id="LABEL_8">
                                    <input type="text" id="INPUT_9" name="wpg-date-search-text-main" placeholder="Enter search term here">
                                </label>
                            </div>
                        </li>
                        <li id="LI_128">
                            <input type="submit" value="Search" id="INPUT_129">
                        </li>
                    </ul>
                    <div id="DIV_130">
                        <h4 id="H4_131" class="editable">
                            <%=GetText(4)%>
                        </h4>
                        <input type="checkbox" id="INPUT_132" name="wpg-checkbox-flexible">
                        <label for="wpg-checkbox-flexible" id="LABEL_133" class="editable">
                            <%=GetText(5)%>
                        </label>
                        <input type="checkbox" id="INPUT_134" name="wpg-checkbox-smoking">
                        <label for="wpg-checkbox-smoking" id="LABEL_135" class="editable">
                            <%=GetText(6)%>
                        </label>
                        <input type="checkbox" id="INPUT_136" name="wpg-checkbox-pet">
                        <label for="wpg-checkbox-pet" id="LABEL_137" class="editable">
                            <%=GetText(7)%>
                        </label>
                    </div>
                </form>


            </div>
            <!-- .container -->

        </div>
        <div class="wpg-buttons-info wpg-bg-grey">
            <div class="container clear-both-fix text-align-center">
                <ul>
                    <li class="wpg-button-info-book "><a class="editable" href="#">  <%=GetText(8)%></a></li>
                    <li class="wpg-button-info-phone "><a class="editable" href="tel:07709 649 292 7"> <%=GetText(9)%> </a></li>
                    <li class="wpg-button-info-contact "><a class="editable" href="../contact-us/"> <%=GetText(10)%></a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="foregroundDiv">
        <h3 class="editable"  style="text-align: center;"> <%=GetText(11)%> </h3>

        <span class="editable top_front_div"> <%=GetText(12)%> </span> </div>

    <div class="bgimg-2 editable"  style="background-image: url('../Images/<%=GetImage(2)%>')">
        <div class="caption">
            <span class="border"><a href="acommodationsPage.aspx" class="border editable"><%=GetText(13)%></a></span>
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
                        <asp:DropDownList ID="PagerPropHome" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RefreshCount">
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem Value="9999">All</asp:ListItem>
                        </asp:DropDownList>
                            </p>
                            <ul class="wpg-list-villas-inset clear-both-fix property_ul">

                                <asp:Repeater ID="PropertyRepeaterHome" runat="server">

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

    <div class="bgimg-3 editable"  style="background-image: url('../Images/<%=GetImage(3)%>')">
        <div class="caption">
            <span class="border editable"><%=GetText(14)%></span>
        </div>
    </div>

    <div style="position: relative;">
      
    </div>
</asp:Content>


