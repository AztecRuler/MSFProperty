<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="properties.aspx.cs" Inherits="MSFProperty.properties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Property Details</title>
    <link rel="canonical" href=""/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="slidePageContainer">
        <div class="slideShowContainer ">
            <asp:Repeater ID="slideImages" runat="server">
                <ItemTemplate>
                    <div class="mySlides">
                        <div class="slideShowNumbertext"><%# Container.ItemIndex + 1 %> / <%= GetSlideCount() %></div>
                        <img class="bgimg lazy" src="/Images/<%# Container.DataItem %>">
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <a class="slideShowPrev" onclick="plusSlides(-1)">❮</a>
            <a class="slideShowNext" onclick="plusSlides(1)">❯</a>

            <div class="caption-container">
                <p id="slideShowCaption"></p>
            </div>

            <div class="slideShowRow">
                <asp:Repeater ID="slideShowColumnRepeater" runat="server">
                    <ItemTemplate>
                        <div class="slideShowColumn">
                            <img class="slideShowSelector slideShowCursor bgimg lazy" src="/Images/<%# Container.DataItem %>" style="width: 100%" onclick="currentSlide(<%# Container.ItemIndex + 1 %>)" alt="<%# Container.DataItem %>">
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            var timerSlides = setInterval(slide, 3000);

            function slide() {
                plusSlides(1);
            }

            function myStopFunction() {
                clearInterval(timerSlides);
            }

            function showSlides(n) {
                var i;
                const slides = document.getElementsByClassName("mySlides");
                const dots = document.getElementsByClassName("slideShowSelector");
                const captionText = document.getElementById("slideShowCaption");
                if (n > slides.length) {
                    slideIndex = 1;
                }
                if (n < 1) {
                    slideIndex = slides.length;
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" activeSlideShow", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " activeSlideShow";
                captionText.innerHTML = dots[slideIndex - 1].alt;
            }

            $(document).ready(function() {
                const getUrlParameter = function(sParam) {
                    const sPageUrl = window.location.search.substring(1);
                    const sUrlVariables = sPageUrl.split('&');
                    var sParameterName,
                        i;

                    for (i = 0; i < sUrlVariables.length; i++) {
                        sParameterName = sUrlVariables[i].split('=');

                        if (sParameterName[0] === sParam) {
                            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                        }
                    }
                    return "";
                };
                var blog = getUrlParameter('tab');
                if (blog === "") {
                    blog = 'Overview';
                }

                OpenTab("none", blog, 0);

            });

            function OpenTab(evt, tabName, tabId) {
                if (evt !== "none") {
                    evt.preventDefault();
                    evt.stopPropagation();
                }

                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(tabName).style.display = "table";
                if (evt !== "none") {
                    evt.currentTarget.className += " active";
                } else {
                    $(`#${tabName}`).addClass(" active");
                }
            }

        </script>
        <div class="container">
            <h1 class="titleSlideShow"><%= GetPropertyName() %></h1>
        </div>
        <div class="tab">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <button class="tablinks active" onclick="OpenTab(event, 'Overview', 1)">Overview</button>
                    <button class="tablinks" onclick="OpenTab(event, 'Amenities', 2)">Amenities</button>
                    <button class="tablinks" onclick="OpenTab(event, 'Pricing', 3)">Pricing &amp; Availability</button>
                    <button class="tablinks" onclick="OpenTab(event, 'Location', 4)">Location</button>

                </div>

                <div id="Overview" class="tabcontent">
                    <div class="tabView">
                        <img class="rightWrapper" src="~/../Images/<%= GetMainImage() %>"/>
                        <div class="leftWrapper">
                            <p><%= GetContents() %></p>
                        </div>
                    </div>
                </div>
                <div id="Amenities" class="tabcontent">
                    <ol>
                        <li>
                            <h1>Bedrooms : <%= GetBedrooms() %> </h1>
                        </li>
                        <li>
                            <h1>Bath facilities : <%= GetBathCount() %></h1>
                            <br/>
                            <asp:Repeater ID="bathRepeater" runat="server">
                                <ItemTemplate>
                                    <ul>
                                        <li class="pointlist"> <%# Container.DataItem %> </li>

                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>
                        </li>
                        <li>
                            <h1>Pets allowed :<%= GetPetsAllowed() %> </h1>
                        </li>
                        <li>
                            <h1>General : </h1>
                            <br/>
                            <asp:Repeater ID="amRepeater" runat="server">
                                <ItemTemplate>
                                    <ul>
                                        <li class="pointlist"><%# Container.DataItem %> </li>

                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>
                        </li>
                    </ol>
                </div>

                <div id="Pricing" class="tabcontent">
                    <ol>
                        <li class="pricePointList">
                            <h1>Available from :<%= GetAvaiable() %> </h1>
                        </li >
                        <li class="pricePointList">
                            <h1>Deposit :<%= GetDeposit() %> </h1>
                        </li>
                        <li class="pricePointList">
                            <h1>Monthly Rent :<%= GetRentPrice() %> </h1>
                        </li>
                    </ol>
                </div>

                <div id="Location" class="tabcontent">
                    <iframe src="" runat="server" frameborder="0" id="mapForPostcode" style="border: 0; height: 500px; width: 100%"></iframe>


                </div>


                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>


