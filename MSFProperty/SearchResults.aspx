<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="MSFProperty.SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
    <div class="msf-main-bg-header bgimg  editable lazy" style="background-image: url('~/../Images/<%=GetImage(7)%>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2>Search Results</h2>
                </div>
            </div>
        </div>
        <div id="mainSearchContainer">
            <div id="smallSearchContainer">
       
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
                <div id="mainSearchContainer30">
                    <h4 id="H4_131" style ="color: <%= GetColour(4) %>;" class=" editable">
                        <%=GetText(4)%>
                    </h4>
                    <input type="checkbox" id="flexDates" name="msf-checkbox-flexible">
                    <label for="msf-checkbox-flexible" id="LABEL_133" style ="color: <%= GetColour(5) %>;" class=" editable">
                        <%=GetText(5)%>
                    </label>
                    <input type="checkbox" id="smokingSearch" name="msf-checkbox-smoking">
                    <label for="msf-checkbox-smoking" id="LABEL_135" style ="color: <%= GetColour(6) %>;" class=" editable">
                        <%=GetText(6)%>
                    </label>
                    <input type="checkbox" id="petSearch" name="msf-checkbox-pet">
                    <label for="msf-checkbox-pet" id="LABEL_137" style ="color: <%= GetColour(7) %>;" class=" editable">
                        <%=GetText(7)%>
                    </label>
                </div>


            </div>
            <!-- .container -->

        </div>
    </div>
    
    <div class="foregroundDiv">
        <h3 style="text-align: center; color: <%= GetColour(33) %>;" class=" editable"><%=GetText(33)%></h3>


        <div class="blogRow">

            <h1>Search results containing your keywords </h1>
            <h2>Properties</h2>
            <asp:Panel ID="SearchPanel" runat="server" BorderStyle="Solid" GroupingText="Search results in properties">

           
                <asp:Repeater ID="PropertySearchRepeater" runat="server">

                    <ItemTemplate>
                       
                        <div class="blogCard">
                          
                            <a href="properties.aspx?id=<%# Eval("ID") %>">

                                <h1 class="blogTitle"><%# Eval("Location") %></h1>
                                <div class="blogImg">
                                    <image src="~/../Images/<%# Eval("MainImage") %>"></image>
                                </div>
                                <div class="smallBlogBlurb">
                                    <%# GetContents(Convert.ToInt32(Eval("ID"))) %>
                                </div>
                            </a>
                        </div>
                      
                    </ItemTemplate>
                </asp:Repeater>
        </asp:Panel>
           <br/>
            <h2>Blogs</h2>
            <asp:Panel ID="BlogSearchPanel" runat="server" BorderStyle="Solid" GroupingText="Search results in blogs">

           
                <asp:Repeater ID="BlogSearchRepeater" runat="server">

                    <ItemTemplate>
                       
                        <div class="blogCard">
                            <a href="BlogPageView.aspx?id=<%# Eval("ID") %>">
                                <h1 class="blogTitle"><%# Eval("Title") %></h1>
                                <span class="BlogNameAndDate"><%# Eval("Name") %> <%# Eval("Date") %></span>
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
            </asp:Panel>
            
            <br/>
            <h2>Pages</h2>
            <asp:Panel ID="PageSearchPanel" runat="server" BorderStyle="Solid" GroupingText="Search results in pages">

           
                <asp:Repeater ID="PageSearchRepeater" runat="server">

                    <ItemTemplate>
                       
                        <div class="blogCard">
                            <a href="<%# Eval("URL") %>.aspx">
                                <h1 class="blogTitle"><%# Eval("PageName") %> page</h1>
                          </a>
                        </div>
                      
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>

            </div>
    </div>
</asp:Content>

