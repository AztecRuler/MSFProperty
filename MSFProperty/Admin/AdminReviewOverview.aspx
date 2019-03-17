<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminReviewOverview.aspx.cs" Inherits="MSFProperty.Admin.AdminReviewOverview" %>

<%@ Register Src="~/UserControls/StarRatingDisplay.ascx" TagPrefix="uc1" TagName="StarRatingDisplay" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body { font-family: Arial; }

        /* Style the adminReviewTab */

        .adminReviewTab {
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            overflow: hidden;
        }

        /* Style the buttons inside the adminReviewTab */

        .adminReviewTab button {
            background-color: inherit;
            border: none;
            cursor: pointer;
            float: left;
            font-size: 17px;
            outline: none;
            padding: 14px 16px;
            transition: 0.3s;
        }

        /* Change background color of buttons on hover */

        .adminReviewTab button:hover { background-color: #ddd; }

        /* Create an active/current adminReviewTablink class */

        .adminReviewTab button.active { background-color: #ccc; }

        /* Style the adminReviewTab content */

        .adminReviewTabcontent {
            -webkit-animation: fadeEffect 1s;
            animation: fadeEffect 1s;
            display: none;
            padding: 6px 12px;
        }

        /* Fade in adminReviewTabs */

        @-webkit-keyframes fadeEffect {
            from { opacity: 0; }

            to { opacity: 1; }
        }

        @keyframes fadeEffect {
            from { opacity: 0; }

            to { opacity: 1; }
        }
    </style>


            <asp:Panel runat="server" GroupingText="Admin Reviews Section">

                <div class="adminReviewTab">
                    <button class="adminReviewTablinks" id="defaultOpen" onclick="openTabs(event, 'AllReviews')">Reviews</button>

                </div>

                <div id="AllReviews" class="adminReviewTabcontent">
                <asp:UpdateProgress ID="ReviewsAdminUpdateProgress" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="ReviewsAdminUpdatePanel">
                    <ProgressTemplate>
                        <div id="overlay">
                            <div class="modalprogress">
                                <div class="theprogress">
                                    <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif"/>
                                    Please wait while loading ...
                                </div>
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel ID="ReviewsAdminUpdatePanel" class="updater" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="isFeatured" EventName="CheckedChanged"/>
                    <asp:AsyncPostBackTrigger ControlID="IsAllowed" EventName="CheckedChanged"/>
                    <asp:AsyncPostBackTrigger ControlID="DeleteReview" />
                </Triggers>
                <ContentTemplate>
                    <asp:Panel runat="server" GroupingText="All Reviews">
                        <asp:Repeater runat="server" ID="AllReviewsRepeater">
                            <ItemTemplate>
                                <asp:Panel runat="server">
                                    <div runat="server" class="reviewCard" data-id='<%#Eval("ID") %>' >
                                        <span>
                                            <h1 class="reviewUserTitle"><%# Eval("UserName") %></h1>
                                            <uc1:StarRatingDisplay runat="server" EnableViewState="True" id="StarRatingDisplay"  class="reviewRating" IsHoverable="false" Rating=<%# Eval("Rating") %> IsNew=<%# Eval("New") %> />
                                            <span class="reviewDate"> <%# Eval("Date", "{0:d}") %></span>
                                            <span class="ReviewComment"> <%# Eval("ReviewLeft") %></span>

                                        </span>

                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>
                        <span class="editReviewControls hidden">
                            <asp:CheckBox ID="isFeatured" runat="server" onClick="if (!confirm('Are you sure ?')) return false;" OnCheckedChanged="IsFeatured_OnCheckedChanged" Text="Is a Featured Review"  EnableViewState="True" AutoPostBack="True"/>
                            <asp:CheckBox ID="IsAllowed" runat="server" onClick="if (!confirm('Are you sure ?')) return false;" OnCheckedChanged="IsAllowed_OnCheckedChanged" Text="Is a review that is allowed to be shown" EnableViewState="True" AutoPostBack="True"/>
                            <asp:Button ID="DeleteReview" runat="server" OnClick="DeleteReview_OnClick" Text="Delete" />
                            <asp:HiddenField ID="reviewNumber" runat="server" />
                            <asp:Button ID="Cancel" runat="server" Text="Cancel" />
                        </span>
                    </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </div>
                

            </asp:Panel>

    <script>
        document.getElementById("defaultOpen").click();
        function openTabs(evt, cityName) {
            evt.preventDefault();
            evt.stopPropagation();
            var i, adminReviewTabcontent, adminReviewTablinks;
            adminReviewTabcontent = document.getElementsByClassName("adminReviewTabcontent");
            for (i = 0; i < adminReviewTabcontent.length; i++) {
                adminReviewTabcontent[i].style.display = "none";
            }
            adminReviewTablinks = document.getElementsByClassName("adminReviewTablinks");
            for (i = 0; i < adminReviewTablinks.length; i++) {
                adminReviewTablinks[i].className = adminReviewTablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

        $('#checkbox1').change(function() {
            if (this.checked) {
                var returnVal = confirm("Are you sure?");
                $(this).prop("checked", returnVal);
            }
        });
    </script>

</asp:Content>

