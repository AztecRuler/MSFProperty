<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Analytics.aspx.cs" Inherits="MSFProperty.Admin.Analytics" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" GroupingText="GoDaddy">
    <a href="https://searchenginevisibility.godaddy.com/v2/site/2109994/dashboard">click here to use your Go daddy page optimizer </a>
    </asp:Panel>
    <asp:Panel runat="server" GroupingText="MetaData">
       <h3>Meta data is used by search engines to help rate your page, the description is a way to describe your site and what your company does. (example MSFProperty rent houses in edinburgh ....) keywords are a comma separated list of words that relate to what your site is promoting (example : rentals, Edinburgh, MSF, property, etc ..)   </h3>
        <asp:UpdateProgress ID="analyticsUpdateProgress" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="analyticsUpdate">
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
        
        <asp:UpdatePanel runat="server" ID="analyticsUpdate">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DesciptionAnalyticsButton"/>
                <asp:AsyncPostBackTrigger ControlID="keywordsButton"/>
            </Triggers>
            <ContentTemplate>
                <asp:Label runat="server" ForeColor="Red" ID="Error"></asp:Label>
            <table >
                <tr>
                    <td>
                        <asp:Label ID="DesciptionAnalyticsLabel" runat="server" Text="Please enter your description in here for the meta data"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="DesciptionAnalyticsTexBox" runat="server"  TextMode="MultiLine" CssClass="textBoxSize" ></asp:TextBox></td>
                    <td>
                        <asp:Button ID="DesciptionAnalyticsButton" runat="server" Text="Save" OnClick="UpdateDescription" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="keywordsLabel" runat="server" Text="Please enter your meta keywords in here (separated with comas)"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="keywordsTextBox" runat="server" TextMode="MultiLine" CssClass="textBoxSize" ></asp:TextBox></td>
                    <td>
                        <asp:Button ID="keywordsButton" runat="server" Text="Save" OnClick="UpdateKeywords"/></td>
                </tr>
            </table>
            </ContentTemplate>
    </asp:UpdatePanel>
        
        </asp:Panel>
    <asp:Panel runat="server" GroupingText="Google Analytic">
        <asp:UpdateProgress ID="AnalyticUpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="AnalyticUpdatePanel">
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
        <asp:UpdatePanel runat="server" ID="AnalyticUpdatePanel">
            <Triggers></Triggers>
            <ContentTemplate>
                <script>
                    (function(w,d,s,g,js,fs){
                        g=w.gapi||(w.gapi={});g.analytics={q:[],ready:function(f){this.q.push(f);}};
                        js=d.createElement(s);fs=d.getElementsByTagName(s)[0];
                        js.src='https://apis.google.com/js/platform.js';
                        fs.parentNode.insertBefore(js,fs);js.onload=function(){g.load('analytics');};
                    }(window,document,'script'));
                </script>
                <div id="embed-api-auth-container"></div>
                <div id="chart-container"></div>
                <div id="view-selector-container"></div>
                <script>

                    gapi.analytics.ready(function() {

                        /**
                         * Authorize the user immediately if the user has already granted access.
                         * If no access has been created, render an authorize button inside the
                         * element with the ID "embed-api-auth-container".
                         */
                        gapi.analytics.auth.authorize({
                            container: 'embed-api-auth-container',
                            clientid: 'AIzaSyB_wRjC0RpWytwqF1UOVgb0RFix_PBXZFM'
                        });


                        /**
                         * Create a new ViewSelector instance to be rendered inside of an
                         * element with the id "view-selector-container".
                         */
                        var viewSelector = new gapi.analytics.ViewSelector({
                            container: 'view-selector-container'
                        });

                        // Render the view selector to the page.
                        viewSelector.execute();


                        /**
                         * Create a new DataChart instance with the given query parameters
                         * and Google chart options. It will be rendered inside an element
                         * with the id "chart-container".
                         */
                        var dataChart = new gapi.analytics.googleCharts.DataChart({
                            query: {
                                metrics: 'ga:sessions',
                                dimensions: 'ga:date',
                                'start-date': '30daysAgo',
                                'end-date': 'yesterday'
                            },
                            chart: {
                                container: 'chart-container',
                                type: 'LINE',
                                options: {
                                    width: '100%'
                                }
                            }
                        });


                        /**
                         * Render the dataChart on the page whenever a new view is selected.
                         */
                        viewSelector.on('change', function(ids) {
                            dataChart.set({query: {ids: ids}}).execute();
                        });

                    });
                </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
