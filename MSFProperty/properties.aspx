<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="properties.aspx.cs" Inherits="MSFProperty.properties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Property Details</title>
    <link rel="canonical" href=""/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<div class="slideShowContainer ">
    <asp:Repeater ID="slideImages" runat="server">
        <ItemTemplate>
            <h2 style="text-align: center"><%= GetPropertyName() %></h2>
            <div class="mySlides">
                <div class="slideShowNumbertext"><%# Container.ItemIndex + 1 %> / <%= GetCount() %></div>
                <img class="bgimg lazy" src="~/../Images/<%# Container.DataItem %>">
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
                    <img class="slideShowSelector slideShowCursor bgimg lazy" src="~/../Images/<%# Container.DataItem %>" style="width: 100%" onclick="currentSlide(<%# Container.ItemIndex + 1 %>)" alt="<%# Container.DataItem %>">
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


    function showSlides(n) {
        var i;
        const slides = document.getElementsByClassName("mySlides");
        const dots = document.getElementsByClassName("slideShowSelector");
        const captionText = document.getElementById("slideShowCaption");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
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

    
    function OpenTab(evt, tabName, tabId) {
        evt.preventDefault();
        evt.stopPropagation();
        if (!$(".blogEditPanel").hasClass("hidden")) {
            $(".blogEditSelect, .blogEditPanel").toggleClass("hidden");
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
        evt.currentTarget.className += " active";
    }

</script>

<div class="tab">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <button class="tablinks active" onclick="OpenTab(event, 'Overview', 1)">Overview</button>
    <button class="tablinks" onclick="OpenTab(event, 'Amenities', 2)">Amenities</button>
    <button class="tablinks" onclick="OpenTab(event, 'Pricing', 3)">Pricing &amp; Availability</button>
    <button class="tablinks" onclick="OpenTab(event, 'Location', 4)">Location</button>
    <button class="tablinks" onclick="OpenTab(event, 'infoTwo', 5)">some other info</button>
    <button class="tablinks" onclick="OpenTab(event, 'infoThree', 6)">some other info</button>

</div>

<div class="container">
    <h1><%= GetPropertyName() %></h1>
</div>

    
        <div id="Overview" class="tabcontent" style="display: table;">

        </div>
        <div id="Amenities" class="tabcontent" style="display: table;">

        </div>

        <div id="Pricing" class="tabcontent" style="display: table;">

        </div>

        <div id="Location" class="tabcontent" style="display: table;">

        </div>

        <div id="infoTwo" class="tabcontent" style="display: table;">

        </div>

        <div id="infoThree" class="tabcontent" style="display: table;">

        </div>

        </ContentTemplate>
 </asp:UpdatePanel>
</div>
</asp:Content>


