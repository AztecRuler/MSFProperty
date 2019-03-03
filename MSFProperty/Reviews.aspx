<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="MSFProperty.Reviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="msf-main-bg-header bgimg editable lazy" style="background-image: url('../Images/<%= GetImage(8) %>')" max-height: "871px;">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 class="editable"><%= GetText(46) %></h2>
                    <p class="editable"><%= GetText(47) %></p>
                </div>
            </div>
        </div>
    </div>
    <div style="position: relative;">

        <div class="foregroundDiv_dark">
            <p>View Our Reviews Or Leave Your Own</p>

            <div class="msf-bg-white">
                <div class="container">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="revieContainerRepeater">
                            <asp:Repeater ID="reviewsRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="reviewContainer">
                                        <H3 class="reviewTitle"><%# Eval("UserName") %></H3>
                                        <p class="reviewDate"><%# Eval("Date") %></p>
                                        <p class="reviewGiven"><%# Eval("ReviewLeft") %></p>
                                        <p class="reviewRating">Rating : <%# Eval("Rating") %> / 5</p>

                                    </div>
                                </ItemTemplate>

                            </asp:Repeater>
                            </div>
                            <div class="reviewContainer addcoment">
                                <div class="reviewDivs">
                                    <asp:Label ID="replyDiv" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="reviewDivs">
                                    <asp:Label ID="Label1" runat="server" Text="Write Your Review Here"></asp:Label>

                                    <asp:TextBox ID="TextBoxReview" TextMode="MultiLine" runat="server" MaxLength="200"></asp:TextBox>
                                </div>
                                <div class="reviewDivs">


                                    <asp:Label ID="Label3" runat="server" Text="Please Enter A UserName"></asp:Label>

                                    <asp:TextBox ID="TextBoxUserName" runat="server" MaxLength="80"></asp:TextBox>
                                </div>
                                <div class="reviewDivs">
                                    <asp:Label ID="Label2" runat="server" Text="Pick your Rating"></asp:Label>

                                    <asp:RadioButtonList ID="Rating" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem style="display: none;" Enabled="False">0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem Selected="True">3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            <div class="reviewDivs">
                                <asp:Button ID="SaveReview" runat="server" OnClick="SaveReview_OnClick_" Text="Press To Save Your Review" />
                            </div>

                            </div>
                         
                        </ContentTemplate>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>


