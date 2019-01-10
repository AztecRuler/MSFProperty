<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="properties.aspx.cs" Inherits="MSFProperty.properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About-us</title>
     <link rel="canonical" href="" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

<div id="slideshow">
   <div style="background-image: URL('http://farm6.static.flickr.com/5230/5638093881_a791e4f819_m.jpg')" data-id="1">
   </div>
</div>
<script>
    $("#slideshow > div:gt(0)").hide();

setInterval(function() {
  $('#slideshow > div:first')
    .fadeOut(1000)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('#slideshow');
    }, 3000);
    </script>
    <style>#slideshow {
     position: relative;
    overflow: hidden;
    max-width: 1600px;
    margin: 0px auto;
    height: 500px;
    top: 92px;
}

#slideshow > div {
    position: absolute;
    top: 10px;
    left: 10px;
    right: 10px;
   
    bottom: 10px;
    background-repeat: no-repeat;
    background-size: 100% 100%;
}</style>
<%--<div class="msf-info-panel">
	<div class="container">
		<div class="span-table">
			<div class="span-table-cell vertical-align-middle text-align-left">
				<a class="msf-arrow-tringle" href="http://northernlights.websites.365villas.com/?back=1">Back</a>
			</div>
			<div class="span-table-cell vertical-align-middle text-align-right msf-breadcrumb">
				<a href="http://northernlights.websites.365villas.com">Home</a> / <a href="http://northernlights.websites.365villas.com/accommodation/">Properties</a> / <a href="#"> French Retreat</a>
			</div>
		</div>
		<hr class="msf-simple-border-bottom">
		
					<script>
			$(document).ready(function($)
			{
				$('.toggle-display-btn').on('click', function()
				{
					$($(this).data('toggle-el')).toggle();
				});
			});
			</script>
            
            <div class="social-media text-align-right">
				<div class="social-btns" style="display: none;">
					<a href="https://plus.google.com/share?url==http%3A%2F%2Fnorthernlights.websites.365villas.com%2Fproperties%2Fsunny-condo-2-9%2F">
						<div class="social-btn alignright msf-ico-googlep">

						</div>
					</a>
					<a href="https://twitter.com/share?http%3A%2F%2Fnorthernlights.websites.365villas.com%2Fproperties%2Fsunny-condo-2-9%2F&amp;text=French+Retreat&amp;" target="_blank">
						<div class="social-btn alignright msf-ico-twitter">

						</div>
					</a>
					<a href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fnorthernlights.websites.365villas.com%2Fproperties%2Fsunny-condo-2-9%2F" target="_blank">
						<div class="social-btn alignright msf-ico-facebook">

						</div>
					</a>
				</div>
				<div class="social-property toggle-display-btn" data-toggle-el=".social-btns">
					<div class="share-property alignright">
						Share Property					</div>
				</div>
				<div class="msf-nav-bar-black-book showBooknow" style="text-align: right">
					<a style="text-decoration: none" href="#">Book Now</a>

				</div>
			</div>
		
	</div>
</div>--%>

<!--
<div class="msf-smth-text msf-bg-white">

		<div class="container clear-both-fix contentOfHomePage">
		<h1>French Retreat</h1>
		<div class="homeBanerText">
		<p>Charming apartment in the heart of the ancient city, with magnificent altana where to dream and a fabulous terrace, both with an extraordinary view over the city.</p>
<p>Elegant apartment in the heart of the medieval city between Piazza Maggiore and the Two Towers. The accommodation is located on the fifth floor of a beautiful historic building, with the characteristic red color typical of Bologna. The apartment is completely renovated, it has two rooms, elegant and functional: a living area with kitchenette, table, sofa bed, bathroom with large shower and beautiful terrace. A sleeping area, composed of a wonderful panoramic roof terrace with French bed, with windows on all four sides, with breathtaking views of the city. To gain access to the roof-there is a wooden ladder with side loops (only entrance, see photo). The finishes are of high standard and include air conditioning, heating, and anti-noise windows. In addition, the house is complete with all the amenities: washing machine, industrially sanitized towels and sheets, dishwasher, microwave, Nespresso machine, 40-inch TV, air conditioning, electric shutters, led lights, wi-fi.</p>
		</div>
			<a style="z-index: 1; text-transform: uppercase; cursor:pointer;color: gray; font-size: 1.6rem; font-weight: bold;  position: relative; bottom: 1px; margin-top: 15px; display: inline-block; border-bottom: 1px solid gray; padding-bottom: 0; padding-top: 10px;" class="homeMore" >more</a>

	</div>
</div>
-->

<%--<div class="msf-tabs-simple msf-bg-white">
<div class="container">
<div class="span-table">
<div class="span-table-cell vertical-align-top msf-tabs-simple-col-one">
<div class="span-table">
	<div class="span-table-cell vertical-align-top span-17"><div class="msf-tabs-simple-pger"><a href="#">General</a><a href="#">Overview</a><a href="#">Amenities</a><a href="#">Reviews</a><a href="#">Location</a><a href="#" class="cycle-pager-active">Pricing &amp; Availability</a></div></div>
	<div class="span-table-cell vertical-align-top span-7 msf-right-header-tabs-outset"><div class="span-table msf-right-header-tabs"><h3></h3></div></div>
</div>--%>
<!--
<div class="cycle-slideshow msf-tabs-simple-main-content"
	data-cycle-fx="scrollHorz"
	data-cycle-timeout=0
	data-cycle-pager=".msf-tabs-simple-pger"
	data-cycle-auto-height="container"
	data-cycle-slides="> div"
>
-->
<%--<div class="msf-tabs-simple-main-content" style="position: relative; height: 1264px;">










<div data-cycle-hash="general" data-cycle-pager-template="<a href=#>General</a>" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 99; visibility: hidden;">
	<div class="msf-smth-text">
		<h1>French Retreat</h1>
		<p>Charming apartment in the heart of the ancient city, with magnificent altana where to dream and a fabulous terrace, both with an extraordinary view over the city.</p>
<p>Elegant apartment in the heart of the medieval city between Piazza Maggiore and the Two Towers. The accommodation is located on the fifth floor of a beautiful historic building, with the characteristic red color typical of Bologna. The apartment is completely renovated, it has two rooms, elegant and functional: a living area with kitchenette, table, sofa bed, bathroom with large shower and beautiful terrace. A sleeping area, composed of a wonderful panoramic roof terrace with French bed, with windows on all four sides, with breathtaking views of the city. To gain access to the roof-there is a wooden ladder with side loops (only entrance, see photo). The finishes are of high standard and include air conditioning, heating, and anti-noise windows. In addition, the house is complete with all the amenities: washing machine, industrially sanitized towels and sheets, dishwasher, microwave, Nespresso machine, 40-inch TV, air conditioning, electric shutters, led lights, wi-fi.</p>
	</div>
</div><div data-cycle-hash="overview" data-cycle-pager-template="<a href=#>Overview</a>" data-msf-right-header-tabs="Property Details" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 97; visibility: hidden;">
	<div class="span-table">
		<div class="span-table-cell vertical-align-top span-17 msf-tsmc-left">

			
			<div class="msf-content-1-col">
				<div>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies malesuada diam quis pretium. Pellentesque ac lorem id nunc accumsan pellentesque. Donec interdum, urna vel luctus consectetur, justo mi laoreet leo, a dictum nulla ante vel urna.</p>
<p><a href="http://themeone.websites.365villas.com/wp-content/uploads/sites/105/2015/07/Template1-BurgundyBanner10.jpg" rel="attachment wp-att-421"><img class="aligncenter size-large wp-image-421" src="http://themeone.websites.365villas.com/wp-content/uploads/sites/105/2015/07/Template1-BurgundyBanner10-1024x384.jpg" alt="Template1-BurgundyBanner10" width="1024" height="384"></a></p>
<p>Vestibulum porttitor dictum tincidunt. Nunc lobortis ante in mattis faucibus. Maecenas vel diam laoreet, cursus ex sollicitudin, pellentesque mauris. Etiam at vulputate velit, quis vehicula enim. Quisque convallis, diam ac hendrerit condimentum, est purus accumsan turpis, vitae vestibulum mauris nibh suscipit arcu. Suspendisse eleifend sem non arcu facilisis, vitae tempus nisl tristique.</p>
				</div>
			</div>
		</div>

		<div class="span-table-cell vertical-align-top span-7 msf-tsmc-right">
			<p>The apartment is completely renovated, it has two rooms, elegant and functional: a living area with kitchenette, table, sofa bed, bathroom with large shower and beautiful terrace.</p>
<p>&nbsp;</p>
<p>A sleeping area, composed of a wonderful panoramic roof terrace with French bed, with windows on all four sides, with breathtaking views of the city. To gain access to the roof-there is a wooden ladder with side loops (only entrance, see photo).</p>
<p>&nbsp;</p>
<p>The finishes are of high standard and include</p>
<p>air conditioning</p>
<p>heating</p>
<p>anti-noise windows</p>
<p>In addition, the house is complete with all the amenities: washing machine, industrially sanitized towels and sheets, dishwasher, microwave, Nespresso machine, 40-inch TV, air conditioning, electric shutters, led lights, wi-fi.</p>
		</div>
	</div>

</div><div data-cycle-hash="amenities" data-cycle-pager-template="<a href=#>Amenities</a>" data-msf-right-header-tabs="Property Details" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 96; visibility: hidden;">
	<div class="span-table">
		<div class="span-table-cell span-17 vertical-align-top msf-tsmc-left ammenity_left">

			<div class="msf-content-1-col">
				<div>
					
									</div>
			</div>
						<div class="span-table msf-tabs-box-inset-tabs">
				<div class="span-table-cell span-9 vertical-align-top span-table msf-tabs-box-inset-tabs-left">
					<div class="msf-tabs-box-inset-tabs-content-pager"><a href="#" onclick="$(window).trigger('resize');" class="cycle-pager-active"> General</a><a href="#" onclick="$(window).trigger('resize');">Bedrooms</a><a href="#" onclick="$(window).trigger('resize');">Bathrooms</a><a href="#" onclick="$(window).trigger('resize');">Kitchen</a><a href="#" onclick="$(window).trigger('resize');">Dining</a><a href="#" onclick="$(window).trigger('resize');">Living Area</a><a href="#" onclick="$(window).trigger('resize');">Miscellaneous</a><a href="#" onclick="$(window).trigger('resize');">Surrounding Area</a></div>
				</div>
				<div class="span-table-cell span-15 vertical-align-top span-table msf-tabs-box-inset-tabs-right">
					<div class="cycle-slideshow msf-tabs-box-inset-tabs-content" data-cycle-fx="scrollHorz" data-cycle-timeout="0" data-cycle-pager=".msf-tabs-box-inset-tabs-content-pager" data-cycle-auto-height="container" data-cycle-slides="> div" style="position: relative; height: 176px;">
						
																					
															
															
															
															
															
															
															
																		<div data-cycle-pager-template="<a href=# onclick=$(window).trigger('resize');> General</a>" class="cycle-slide cycle-slide-active" style="position: absolute; top: 0px; left: 0px; z-index: 100; opacity: 1; display: block; visibility: visible;">
									<ul class="msf-options-list-icons">
																														
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -0px"></span>Ocean View </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -120px"></span>Dedicated Parking Space x 3 </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -40px"></span>Child Friendly </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -160px"></span>Air Conditioned </li>
																																							</ul>
								</div><div data-cycle-pager-template="<a href=# onclick=$(window).trigger('resize');>Bedrooms</a>" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 99; visibility: hidden;">
									<ul class="msf-options-list-icons">
																														
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -640px"></span>En-suite </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -680px"></span>King </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -280px"></span>Linen inc. </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -3720px"></span>Double </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -3800px"></span>Single Bed </li>
																																							</ul>
								</div><div data-cycle-pager-template="<a href=# onclick=$(window).trigger('resize');>Bathrooms</a>" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 97; visibility: hidden;">
									<ul class="msf-options-list-icons">
																														
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -840px"></span>Bath/Shower </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -960px"></span>Towels inc. </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1000px"></span>Hair Dryer </li>
																																							</ul>
								</div><div data-cycle-pager-template="<a href=# onclick=$(window).trigger('resize');>Kitchen</a>" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 96; visibility: hidden;">
									<ul class="msf-options-list-icons">
																														
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1160px"></span>Refrigerator </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1200px"></span>Freezer </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1280px"></span>Oven </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1320px"></span>Microwave </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1360px"></span>Dishwasher </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1440px"></span>Dishes &amp; Utensils </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1480px"></span>Cooking Utensils </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1560px"></span>Full Modernized </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1400px"></span>Coffee Maker </li>
																																							</ul>
								</div><div data-cycle-pager-template="<a href=# onclick=$(window).trigger('resize');>Dining</a>" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 95; visibility: hidden;">
									<ul class="msf-options-list-icons">
																														
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1040px"></span>Seats </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1080px"></span>Seats indoors </li>
																																							</ul>
								</div><div data-cycle-pager-template="<a href=# onclick=$(window).trigger('resize');>Living Area</a>" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 94; visibility: hidden;">
									<ul class="msf-options-list-icons">
																														
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -80px"></span>Spacious </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1600px"></span>Sofa </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1640px"></span>Chair </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -3840px"></span>Balcony </li>
																																							</ul>
								</div><div data-cycle-pager-template="<a href=# onclick=$(window).trigger('resize');>Miscellaneous</a>" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 93; visibility: hidden;">
									<ul class="msf-options-list-icons">
																														
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1840px"></span>TV </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1880px"></span>Cable </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -1920px"></span>VCR </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -2080px"></span>Broadband </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -2120px"></span>Wi-Fi </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -2520px"></span>Washer </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -2560px"></span>Dryer </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -2640px"></span>Iron Board </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -2680px"></span>Books </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -2800px"></span>Radio </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -3680px"></span>Safe Box </li>
																																							</ul>
								</div><div data-cycle-pager-template="<a href=# onclick=$(window).trigger('resize');>Surrounding Area</a>" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 92; visibility: hidden;">
									<ul class="msf-options-list-icons">
																														
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -2280px"></span>Tennis </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -2960px"></span>Golf </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -3520px"></span>Post Office </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -3560px"></span>Cinema </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -3600px"></span>Mall </li>
																																
																							<li class="msf-ico-air-conditioned"><span class="icon" style="background-position: 0px -3640px"></span>Nature </li>
																																							</ul>
								</div></div>
				</div>
			</div>
					</div>
		<div class="span-table-cell span-7 vertical-align-top msf-tsmc-right">
			<div class="more_amenites" style="overflow: hidden;">
				<p>The apartment is completely renovated, it has two rooms, elegant and functional: a living area with kitchenette, table, sofa bed, bathroom with large shower and beautiful terrace.</p>
				<a href="#" class="more_button" style="display: none; position:absolute; margin:0; bottom:0">more</a>
				<a href="#" class="less_button" style="display: none; position:absolute; margin:0; bottom:0">less</a>
			</div>
		</div>
	</div>


</div><div data-cycle-hash="reviews" data-cycle-pager-template="<a href=#>Reviews</a>" data-msf-right-header-tabs="Property Details" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 95; visibility: hidden;">
	<div class="span-table" style="min-height: 100px;">
		<div class="span-table-cell vertical-align-top span-17 msf-tsmc-left">
			<div class="msf-rev">
				<a class="msf-button-review" href="#">Write a Review</a>
				
			</div>
		</div>
		<div class="span-table-cell vertical-align-top span-7 msf-tsmc-right">
			<div class="more">
				<p>The apartment is completely renovated, it has two rooms, elegant and functional: a living area with kitchenette, table, sofa bed, bathroom with large shower and beautiful terrace.</p>
<p>&nbsp;</p>
<p>A sleeping area, composed of a wonderful panoramic roof terrace with French bed, with windows on all four sides, with breathtaking views of the city. To gain access to the roof-there is a wooden ladder with side loops (only entrance, see photo).</p>
<p>&nbsp;</p>
<p>The finishes are of high standard and include</p>
<p>air conditioning</p>
<p>heating</p>
<p>anti-noise windows</p>
<p>In addition, the house is complete with all the amenities: washing machine, industrially sanitized towels and sheets, dishwasher, microwave, Nespresso machine, 40-inch TV, air conditioning, electric shutters, led lights, wi-fi.</p>
				<a href="#" class="more_button" style="display: none; position:absolute; margin:0; bottom:0">more</a>
				<a href="#" class="less_button" style="display: none; position:absolute; margin:0; bottom:0">less</a>
			</div>
		</div>
	</div>
</div><div data-cycle-hash="location" data-cycle-pager-template="<a href=#>Location</a>" class="cycle-slide" style="position: absolute; top: 0px; left: 0px; z-index: 94; visibility: hidden;">
	<div class="span-table">
		<div class="span-table-cell vertical-align-top span-17 msf-tsmc-left">
			<div class="msf-tabs-simple-google-maps">
				<div class="msf-tabs-simple-google-maps-inset clear-both-fix">
											<span id="codeaddress" data-action="true"></span>
						<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&callback=initMap"></script> -->
						<span id="location_address" style="display:none">FR, Bologna, Route d'Agen, 24100, </span>
						<div id="property_location_map" style="height: 480px; position: relative; overflow: hidden;"><div style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);"><div class="gm-style" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px;"><div tabindex="0" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: pan-x pan-y;"><div style="z-index: 1; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);"><div style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; z-index: 988; transform: matrix(1, 0, 0, 1, -173, -38);"><div style="position: absolute; left: 256px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 512px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 512px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 512px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 256px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 0px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div style="position: absolute; z-index: 988; transform: matrix(1, 0, 0, 1, -173, -38);"><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: -256px;"></div></div></div><div style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: -14px; top: -43px; z-index: 0;"><img alt="" src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; z-index: 988; transform: matrix(1, 0, 0, 1, -173, -38);"><div style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2052!3i1475!4i256!2m3!1e0!2sm!3i449156542!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=57435" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 256px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2054!3i1477!4i256!2m3!1e0!2sm!3i449154238!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=85358" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 0px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2053!3i1477!4i256!2m3!1e0!2sm!3i449154238!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=80688" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 512px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2055!3i1477!4i256!2m3!1e0!2sm!3i449156518!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=118719" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2052!3i1477!4i256!2m3!1e0!2sm!3i449156494!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=119172" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2052!3i1476!4i256!2m3!1e0!2sm!3i449156542!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=79659" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2054!3i1475!4i256!2m3!1e0!2sm!3i449156626!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=58569" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 512px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2055!3i1475!4i256!2m3!1e0!2sm!3i449156626!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=63239" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 256px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2054!3i1476!4i256!2m3!1e0!2sm!3i449156626!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=80793" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2053!3i1475!4i256!2m3!1e0!2sm!3i449156626!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=53899" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 512px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2055!3i1476!4i256!2m3!1e0!2sm!3i449156626!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=85463" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i2053!3i1476!4i256!2m3!1e0!2sm!3i449156626!3m9!2sen-GB!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;token=76123" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div></div><div class="gm-style-pbc" style="z-index: 2; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; opacity: 0;"><p class="gm-style-pbt"></p></div><div style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; touch-action: pan-x pan-y;"><div style="z-index: 4; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);"><div style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"><div style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0; left: -14px; top: -43px; z-index: 0;"><img alt="" src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png" draggable="false" usemap="#gmimap0" style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"><map name="gmimap0" id="gmimap0"><area log="miw" coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75" shape="poly" title="" style="cursor: pointer; touch-action: none;"></map></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"></div></div></div></div><iframe aria-hidden="true" frameborder="0" style="z-index: -1; position: absolute; width: 100%; height: 100%; top: 0px; left: 0px; border: none;" src="about:blank"></iframe><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a target="_blank" rel="noopener" href="https://maps.google.com/maps?ll=44.831002,0.49883&amp;z=12&amp;t=m&amp;hl=en-GB&amp;gl=US&amp;mapclient=apiv3" title="Open this area in Google Maps (opens a new window)" style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 66px; height: 26px; cursor: pointer;"><img alt="" src="https://maps.gstatic.com/mapfiles/api-3/images/google4.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 66px; height: 26px; user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></a></div><div style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); box-sizing: border-box; box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 300px; height: 180px; position: absolute; left: 253px; top: 150px;"><div style="padding: 0px 0px 10px; font-size: 16px;">Map Data</div><div style="font-size: 13px;">Map data ©2019 Google</div><button draggable="false" title="Close" aria-label="Close" type="button" class="gm-ui-hover-effect" style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: absolute; cursor: pointer; user-select: none; top: 0px; right: 0px; width: 37px; height: 37px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22%23000000%22%3E%0A%20%20%20%20%3Cpath%20d%3D%22M19%206.41L17.59%205%2012%2010.59%206.41%205%205%206.41%2010.59%2012%205%2017.59%206.41%2019%2012%2013.41%2017.59%2019%2019%2017.59%2013.41%2012z%22%2F%3E%0A%20%20%20%20%3Cpath%20d%3D%22M0%200h24v24H0z%22%20fill%3D%22none%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="pointer-events: none; display: block; width: 13px; height: 13px; margin: 12px;"></button></div><div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 166px; bottom: 0px; width: 121px;"><div draggable="false" class="gm-style-cc" style="user-select: none; height: 14px; line-height: 14px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a style="text-decoration: none; cursor: pointer; display: none;">Map Data</a><span>Map data ©2019 Google</span></div></div></div><div class="gmnoscreen" style="position: absolute; right: 0px; bottom: 0px;"><div style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Map data ©2019 Google</div></div><div class="gmnoprint gm-style-cc" draggable="false" style="z-index: 1000001; user-select: none; height: 14px; line-height: 14px; position: absolute; right: 95px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a href="https://www.google.com/intl/en-GB_US/help/terms_maps.html" target="_blank" rel="noopener" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Terms of Use</a></div></div><button draggable="false" title="Toggle fullscreen view" aria-label="Toggle fullscreen view" type="button" class="gm-control-active gm-fullscreen-control" style="background: none rgb(255, 255, 255); border: 0px; margin: 10px; padding: 0px; position: absolute; cursor: pointer; user-select: none; border-radius: 2px; height: 40px; width: 40px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; overflow: hidden; top: 0px; right: 0px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%20018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"></button><div draggable="false" class="gm-style-cc" style="user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a target="_blank" rel="noopener" title="Report errors in the road map or imagery to Google" href="https://www.google.com/maps/@44.831002,0.49883,12z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3" style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">Report a map error</a></div></div><div class="gmnoprint gm-bundled-control gm-bundled-control-on-bottom" draggable="false" controlwidth="40" controlheight="153" style="margin: 10px; user-select: none; position: absolute; bottom: 167px; right: 40px;"><div class="gmnoprint" controlwidth="40" controlheight="81" style="position: absolute; left: 0px; top: 72px;"><div draggable="false" style="user-select: none; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; cursor: pointer; background-color: rgb(255, 255, 255); width: 40px; height: 81px;"><button draggable="false" title="Zoom in" aria-label="Zoom in" type="button" class="gm-control-active" style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; overflow: hidden; width: 40px; height: 40px; top: 0px; left: 0px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpolygon%20fill%3D%22%23666%22%20points%3D%2218%2C7%2011%2C7%2011%2C0%207%2C0%207%2C7%200%2C7%200%2C11%207%2C11%207%2C18%2011%2C18%2011%2C11%2018%2C11%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpolygon%20fill%3D%22%23333%22%20points%3D%2218%2C7%2011%2C7%2011%2C0%207%2C0%207%2C7%200%2C7%200%2C11%207%2C11%207%2C18%2011%2C18%2011%2C11%2018%2C11%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpolygon%20fill%3D%22%23111%22%20points%3D%2218%2C7%2011%2C7%2011%2C0%207%2C0%207%2C7%200%2C7%200%2C11%207%2C11%207%2C18%2011%2C18%2011%2C11%2018%2C11%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"></button><div style="position: relative; overflow: hidden; width: 30px; height: 1px; margin: 0px 5px; background-color: rgb(230, 230, 230); top: 0px;"></div><button draggable="false" title="Zoom out" aria-label="Zoom out" type="button" class="gm-control-active" style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; overflow: hidden; width: 40px; height: 40px; top: 0px; left: 0px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%2C7h18v4H0V7z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%2C7h18v4H0V7z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%2C7h18v4H0V7z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"></button></div></div><div class="gm-svpc" dir="ltr" title="Drag Pegman onto the map to open Street View" controlwidth="40" controlheight="40" style="background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; width: 40px; height: 40px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: none; position: absolute; left: 0px; top: 0px;"><div style="position: absolute; left: 50%; top: 50%;"></div><div style="position: absolute; left: 50%; top: 50%;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2223%22%20height%3D%2238%22%20viewBox%3D%220%200%2023%2038%22%3E%0A%3Cpath%20d%3D%22M16.6%2C38.1h-5.5l-0.2-2.9-0.2%2C2.9h-5.5L5%2C25.3l-0.8%2C2a1.53%2C1.53%2C0%2C0%2C1-1.9.9l-1.2-.4a1.58%2C1.58%2C0%2C0%2C1-1-1.9v-0.1c0.3-.9%2C3.1-11.2%2C3.1-11.2a2.66%2C2.66%2C0%2C0%2C1%2C2.3-2l0.6-.5a6.93%2C6.93%2C0%2C0%2C1%2C4.7-12%2C6.8%2C6.8%2C0%2C0%2C1%2C4.9%2C2%2C7%2C7%2C0%2C0%2C1%2C2%2C4.9%2C6.65%2C6.65%2C0%2C0%2C1-2.2%2C5l0.7%2C0.5a2.78%2C2.78%2C0%2C0%2C1%2C2.4%2C2s2.9%2C11.2%2C2.9%2C11.3a1.53%2C1.53%2C0%2C0%2C1-.9%2C1.9l-1.3.4a1.63%2C1.63%2C0%2C0%2C1-1.9-.9l-0.7-1.8-0.1%2C12.7h0Zm-3.6-2h1.7L14.9%2C20.3l1.9-.3%2C2.4%2C6.3%2C0.3-.1c-0.2-.8-0.8-3.2-2.8-10.9a0.63%2C0.63%2C0%2C0%2C0-.6-0.5h-0.6l-1.1-.9h-1.9l-0.3-2a4.83%2C4.83%2C0%2C0%2C0%2C3.5-4.7A4.78%2C4.78%200%200%2C0%2011%202.3H10.8a4.9%2C4.9%2C0%2C0%2C0-1.4%2C9.6l-0.3%2C2h-1.9l-1%2C.9h-0.6a0.74%2C0.74%2C0%2C0%2C0-.6.5c-2%2C7.5-2.7%2C10-3%2C10.9l0.3%2C0.1%2C2.5-6.3%2C1.9%2C0.3%2C0.2%2C15.8h1.6l0.6-8.4a1.52%2C1.52%2C0%2C0%2C1%2C1.5-1.4%2C1.5%2C1.5%2C0%2C0%2C1%2C1.5%2C1.4l0.9%2C8.4h0Zm-10.9-9.6h0Zm17.5-.1h0Z%22%20style%3D%22fill%3A%23333%3Bopacity%3A0.7%3Bisolation%3Aisolate%22%2F%3E%0A%3Cpath%20d%3D%22M5.9%2C13.6l1.1-.9h7.8l1.2%2C0.9%22%20style%3D%22fill%3A%23ce592c%22%2F%3E%0A%3Cellipse%20cx%3D%2210.9%22%20cy%3D%2213.1%22%20rx%3D%222.7%22%20ry%3D%220.3%22%20style%3D%22fill%3A%23ce592c%3Bopacity%3A0.5%3Bisolation%3Aisolate%22%2F%3E%0A%3Cpath%20d%3D%22M20.6%2C26.1l-2.9-11.3a1.71%2C1.71%2C0%2C0%2C0-1.6-1.2H5.7a1.69%2C1.69%2C0%2C0%2C0-1.5%2C1.3l-3.1%2C11.3a0.61%2C0.61%2C0%2C0%2C0%2C.3.7l1.1%2C0.4a0.61%2C0.61%2C0%2C0%2C0%2C.7-0.3l2.7-6.7%2C0.2%2C16.8h3.6l0.6-9.3a0.47%2C0.47%2C0%2C0%2C1%2C.44-0.5h0.06c0.4%2C0%2C.4.2%2C0.5%2C0.5l0.6%2C9.3h3.6L15.7%2C20.3l2.5%2C6.6a0.52%2C0.52%2C0%2C0%2C0%2C.66.31h0l1.2-.4a0.57%2C0.57%2C0%2C0%2C0%2C.5-0.7h0Z%22%20style%3D%22fill%3A%23fdbf2d%22%2F%3E%0A%3Cpath%20d%3D%22M7%2C13.6l3.9%2C6.7%2C3.9-6.7%22%20style%3D%22fill%3A%23cf572e%3Bopacity%3A0.6%3Bisolation%3Aisolate%22%2F%3E%0A%3Ccircle%20cx%3D%2210.9%22%20cy%3D%227%22%20r%3D%225.9%22%20style%3D%22fill%3A%23fdbf2d%22%2F%3E%0A%3C%2Fsvg%3E%0A" aria-label="Street View Pegman Control" style="height: 30px; width: 30px; position: absolute; transform: translate(-50%, -50%); pointer-events: none;"><img src="data:image/svg+xml,%3Csvg%20width%3D%2224px%22%20height%3D%2238px%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20viewBox%3D%220%200%2024%2038%22%3E%0A%3Cpath%20d%3D%22M22%2C26.6l-2.9-11.3a2.78%2C2.78%2C0%2C0%2C0-2.4-2l-0.7-.5a6.82%2C6.82%2C0%2C0%2C0%2C2.2-5%2C6.9%2C6.9%2C0%2C0%2C0-13.8%2C0%2C7%2C7%2C0%2C0%2C0%2C2.2%2C5.1l-0.6.5a2.55%2C2.55%2C0%2C0%2C0-2.3%2C2s-3%2C11.1-3%2C11.2v0.1a1.58%2C1.58%2C0%2C0%2C0%2C1%2C1.9l1.2%2C0.4a1.63%2C1.63%2C0%2C0%2C0%2C1.9-.9l0.8-2%2C0.2%2C12.8h11.3l0.2-12.6%2C0.7%2C1.8a1.54%2C1.54%2C0%2C0%2C0%2C1.5%2C1%2C1.09%2C1.09%2C0%2C0%2C0%2C.5-0.1l1.3-.4a1.85%2C1.85%2C0%2C0%2C0%2C.7-2h0Zm-1.2.9-1.2.4a0.61%2C0.61%2C0%2C0%2C1-.7-0.3l-2.5-6.6-0.2%2C16.8h-9.4L6.6%2C21l-2.7%2C6.7a0.52%2C0.52%2C0%2C0%2C1-.66.31h0l-1.1-.4a0.52%2C0.52%2C0%2C0%2C1-.31-0.66v0l3.1-11.3a1.69%2C1.69%2C0%2C0%2C1%2C1.5-1.3h0.2l1-.9h2.3a5.9%2C5.9%2C0%2C1%2C1%2C3.2%2C0h2.3l1.1%2C0.9h0.2a1.71%2C1.71%2C0%2C0%2C1%2C1.6%2C1.2l2.9%2C11.3a0.84%2C0.84%2C0%2C0%2C1-.4.7h0Z%22%20style%3D%22fill%3A%23333%3Bfill-opacity%3A0.2%22%2F%3E%22%0A%3C%2Fsvg%3E%0A%0A" aria-label="Pegman is on top of the Map" style="display: none; height: 30px; width: 30px; position: absolute; transform: translate(-50%, -50%); pointer-events: none;"><img src="data:image/svg+xml,%3Csvg%20width%3D%2240px%22%20height%3D%2250px%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20viewBox%3D%220%200%2040%2050%22%3E%0A%3Cpath%20d%3D%22M34.00%2C-30.40l-2.9-11.3a2.78%2C2.78%2C0%2C0%2C0-2.4-2l-0.7-.5a6.82%2C6.82%2C0%2C0%2C0%2C2.2-5%2C6.9%2C6.9%2C0%2C0%2C0-13.8%2C0%2C7%2C7%2C0%2C0%2C0%2C2.2%2C5.1l-0.6.5a2.55%2C2.55%2C0%2C0%2C0-2.3%2C2s-3%2C11.1-3%2C11.2v0.1a1.58%2C1.58%2C0%2C0%2C0%2C1%2C1.9l1.2%2C0.4a1.63%2C1.63%2C0%2C0%2C0%2C1.9-.9l0.8-2%2C0.2%2C12.8h11.3l0.2-12.6%2C0.7%2C1.8a1.54%2C1.54%2C0%2C0%2C0%2C1.5%2C1%2C1.09%2C1.09%2C0%2C0%2C0%2C.5-0.1l1.3-.4a1.85%2C1.85%2C0%2C0%2C0%2C.7-2h0Zm-1.2.9-1.2.4a0.61%2C0.61%2C0%2C0%2C1-.7-0.3l-2.5-6.6-0.2%2C16.8h-9.4L18.60%2C-36.00l-2.7%2C6.7a0.52%2C0.52%2C0%2C0%2C1-.66.31h0l-1.1-.4a0.52%2C0.52%2C0%2C0%2C1-.31-0.66v0l3.1-11.3a1.69%2C1.69%2C0%2C0%2C1%2C1.5-1.3h0.2l1-.9h2.3a5.9%2C5.9%2C0%2C1%2C1%2C3.2%2C0h2.3l1.1%2C0.9h0.2a1.71%2C1.71%2C0%2C0%2C1%2C1.6%2C1.2l2.9%2C11.3a0.84%2C0.84%2C0%2C0%2C1-.4.7h0Zm1.2%2C59.1-2.9-11.3a2.78%2C2.78%2C0%2C0%2C0-2.4-2l-0.7-.5a6.82%2C6.82%2C0%2C0%2C0%2C2.2-5%2C6.9%2C6.9%2C0%2C0%2C0-13.8%2C0%2C7%2C7%2C0%2C0%2C0%2C2.2%2C5.1l-0.6.5a2.55%2C2.55%2C0%2C0%2C0-2.3%2C2s-3%2C11.1-3%2C11.2v0.1a1.58%2C1.58%2C0%2C0%2C0%2C1%2C1.9l1.2%2C0.4a1.63%2C1.63%2C0%2C0%2C0%2C1.9-.9l0.8-2%2C0.2%2C12.8h11.3l0.2-12.6%2C0.7%2C1.8a1.54%2C1.54%2C0%2C0%2C0%2C1.5%2C1%2C1.09%2C1.09%2C0%2C0%2C0%2C.5-0.1l1.3-.4a1.85%2C1.85%2C0%2C0%2C0%2C.7-2h0Zm-1.2.9-1.2.4a0.61%2C0.61%2C0%2C0%2C1-.7-0.3l-2.5-6.6-0.2%2C16.8h-9.4L18.60%2C24.00l-2.7%2C6.7a0.52%2C0.52%2C0%2C0%2C1-.66.31h0l-1.1-.4a0.52%2C0.52%2C0%2C0%2C1-.31-0.66v0l3.1-11.3a1.69%2C1.69%2C0%2C0%2C1%2C1.5-1.3h0.2l1-.9h2.3a5.9%2C5.9%2C0%2C1%2C1%2C3.2%2C0h2.3l1.1%2C0.9h0.2a1.71%2C1.71%2C0%2C0%2C1%2C1.6%2C1.2l2.9%2C11.3a0.84%2C0.84%2C0%2C0%2C1-.4.7h0Z%22%20style%3D%22fill%3A%23333%3Bfill-opacity%3A0.2%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M15.40%2C38.80h-4a1.64%2C1.64%2C0%2C0%2C1-1.4-1.1l-3.1-8a0.9%2C0.9%2C0%2C0%2C1-.5.1l-1.4.1a1.62%2C1.62%2C0%2C0%2C1-1.6-1.4l-1.1-13.1%2C1.6-1.3a6.87%2C6.87%2C0%2C0%2C1-3-4.6A7.14%2C7.14%200%200%2C1%202%204a7.6%2C7.6%2C0%2C0%2C1%2C4.7-3.1%2C7.14%2C7.14%2C0%2C0%2C1%2C5.5%2C1.1%2C7.28%2C7.28%2C0%2C0%2C1%2C2.3%2C9.6l2.1-.1%2C0.1%2C1c0%2C0.2.1%2C0.5%2C0.1%2C0.8a2.41%2C2.41%2C0%2C0%2C1%2C1%2C1s1.9%2C3.2%2C2.8%2C4.9c0.7%2C1.2%2C2.1%2C4.2%2C2.8%2C5.9a2.1%2C2.1%2C0%2C0%2C1-.8%2C2.6l-0.6.4a1.63%2C1.63%2C0%2C0%2C1-1.5.2l-0.6-.3a8.93%2C8.93%2C0%2C0%2C0%2C.5%2C1.3%2C7.91%2C7.91%2C0%2C0%2C0%2C1.8%2C2.6l0.6%2C0.3v4.6l-4.5-.1a7.32%2C7.32%2C0%2C0%2C1-2.5-1.5l-0.4%2C3.6h0Zm-10-19.2%2C3.5%2C9.8%2C2.9%2C7.5h1.6V35l-1.9-9.4%2C3.1%2C5.4a8.24%2C8.24%2C0%2C0%2C0%2C3.8%2C3.8h2.1v-1.4a14%2C14%2C0%2C0%2C1-2.2-3.1%2C44.55%2C44.55%2C0%2C0%2C1-2.2-8l-1.3-6.3%2C3.2%2C5.6c0.6%2C1.1%2C2.1%2C3.6%2C2.8%2C4.9l0.6-.4c-0.8-1.6-2.1-4.6-2.8-5.8-0.9-1.7-2.8-4.9-2.8-4.9a0.54%2C0.54%2C0%2C0%2C0-.4-0.3l-0.7-.1-0.1-.7a4.33%2C4.33%2C0%2C0%2C0-.1-0.5l-5.3.3%2C2.2-1.9a4.3%2C4.3%2C0%2C0%2C0%2C.9-1%2C5.17%2C5.17%2C0%2C0%2C0%2C.8-4%2C5.67%2C5.67%2C0%2C0%2C0-2.2-3.4%2C5.09%2C5.09%2C0%2C0%2C0-4-.8%2C5.67%2C5.67%2C0%2C0%2C0-3.4%2C2.2%2C5.17%2C5.17%2C0%2C0%2C0-.8%2C4%2C5.67%2C5.67%2C0%2C0%2C0%2C2.2%2C3.4%2C3.13%2C3.13%2C0%2C0%2C0%2C1%2C.5l1.6%2C0.6-3.2%2C2.6%2C1%2C11.5h0.4l-0.3-8.2h0Z%22%20style%3D%22fill%3A%23333%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M3.35%2C15.90l1.1%2C12.5a0.39%2C0.39%2C0%2C0%2C0%2C.36.42l0.14%2C0%2C1.4-.1a0.66%2C0.66%2C0%2C0%2C0%2C.5-0.4l-0.2-3.8-3.3-8.6h0Z%22%20style%3D%22fill%3A%23fdbf2d%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M5.20%2C28.80l1.1-.1a0.66%2C0.66%2C0%2C0%2C0%2C.5-0.4l-0.2-3.8-1.2-3.1Z%22%20style%3D%22fill%3A%23ce592b%3Bfill-opacity%3A0.25%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M21.40%2C35.70l-3.8-1.2-2.7-7.8L12.00%2C15.5l3.4-2.9c0.2%2C2.4%2C2.2%2C14.1%2C3.7%2C17.1%2C0%2C0%2C1.3%2C2.6%2C2.3%2C3.1v2.9m-8.4-8.1-2-.3%2C2.5%2C10.1%2C0.9%2C0.4v-2.9%22%20style%3D%22fill%3A%23e5892b%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M17.80%2C25.40c-0.4-1.5-.7-3.1-1.1-4.8-0.1-.4-0.1-0.7-0.2-1.1l-1.1-2-1.7-1.6s0.9%2C5%2C2.4%2C7.1a19.12%2C19.12%2C0%2C0%2C0%2C1.7%2C2.4h0Z%22%20style%3D%22fill%3A%23cf572e%3Bopacity%3A0.6%3Bisolation%3Aisolate%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M14.40%2C37.80h-3a0.43%2C0.43%2C0%2C0%2C1-.4-0.4l-3-7.8-1.7-4.8-3-9%2C8.9-.4s2.9%2C11.3%2C4.3%2C14.4c1.9%2C4.1%2C3.1%2C4.7%2C5%2C5.8h-3.2s-4.1-1.2-5.9-7.7a0.59%2C0.59%2C0%2C0%2C0-.6-0.4%2C0.62%2C0.62%2C0%2C0%2C0-.3.7s0.5%2C2.4.9%2C3.6a34.87%2C34.87%2C0%2C0%2C0%2C2%2C6h0Z%22%20style%3D%22fill%3A%23fdbf2d%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M15.40%2C12.70l-3.3%2C2.9-8.9.4%2C3.3-2.7%22%20style%3D%22fill%3A%23ce592b%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M9.10%2C21.10l1.4-6.2-5.9.5%22%20style%3D%22fill%3A%23cf572e%3Bopacity%3A0.6%3Bisolation%3Aisolate%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M12.00%2C13.5a4.75%2C4.75%2C0%2C0%2C1-2.6%2C1.1c-1.5.3-2.9%2C0.2-2.9%2C0s1.1-.6%2C2.7-1%22%20style%3D%22fill%3A%23bb3d19%22%3E%3C%2Fpath%3E%0A%3Ccircle%20cx%3D%227.92%22%20cy%3D%228.19%22%20r%3D%226.3%22%20style%3D%22fill%3A%23fdbf2d%22%3E%3C%2Fcircle%3E%0A%3Cpath%20d%3D%22M4.70%2C13.60a6.21%2C6.21%2C0%2C0%2C0%2C8.4-1.9v-0.1a8.89%2C8.89%2C0%2C0%2C1-8.4%2C2h0Z%22%20style%3D%22fill%3A%23ce592b%3Bfill-opacity%3A0.25%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M21.20%2C27.20l0.6-.4a1.09%2C1.09%2C0%2C0%2C0%2C.4-1.3c-0.7-1.5-2.1-4.6-2.8-5.8-0.9-1.7-2.8-4.9-2.8-4.9a1.6%2C1.6%2C0%2C0%2C0-2.17-.65l-0.23.15a1.68%2C1.68%2C0%2C0%2C0-.4%2C2.1s2.3%2C3.9%2C3.1%2C5.3c0.6%2C1%2C2.1%2C3.7%2C2.9%2C5.1a0.94%2C0.94%2C0%2C0%2C0%2C1.24.49l0.16-.09h0Z%22%20style%3D%22fill%3A%23fdbf2d%22%3E%3C%2Fpath%3E%0A%3Cpath%20d%3D%22M19.40%2C19.80c-0.9-1.7-2.8-4.9-2.8-4.9a1.6%2C1.6%2C0%2C0%2C0-2.17-.65l-0.23.15-0.3.3c1.1%2C1.5%2C2.9%2C3.8%2C3.9%2C5.4%2C1.1%2C1.8%2C2.9%2C5%2C3.8%2C6.7l0.1-.1a1.09%2C1.09%2C0%2C0%2C0%2C.4-1.3%2C57.67%2C57.67%2C0%2C0%2C0-2.7-5.6h0Z%22%20style%3D%22fill%3A%23ce592b%3Bfill-opacity%3A0.25%22%3E%3C%2Fpath%3E%0A%3C%2Fsvg%3E%0A" aria-label="Street View Pegman Control" style="display: none; height: 40px; width: 40px; position: absolute; transform: translate(-60%, -45%); pointer-events: none;"></div></div><div class="gmnoprint" controlwidth="40" controlheight="40" style="display: none; position: absolute;"><div style="width: 40px; height: 40px;"><button draggable="false" title="Rotate map 90 degrees" aria-label="Rotate map 90 degrees" type="button" class="gm-control-active" style="background: none rgb(255, 255, 255); display: none; border: 0px; margin: 0px 0px 32px; padding: 0px; position: relative; cursor: pointer; user-select: none; width: 40px; height: 40px; top: 0px; left: 0px; overflow: hidden; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2222%22%20viewBox%3D%220%200%2024%2022%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20fill-rule%3D%22evenodd%22%20d%3D%22M20%2010c0-5.52-4.48-10-10-10s-10%204.48-10%2010v5h5v-5c0-2.76%202.24-5%205-5s5%202.24%205%205v5h-4l6.5%207%206.5-7h-4v-5z%22%20clip-rule%3D%22evenodd%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2222%22%20viewBox%3D%220%200%2024%2022%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20fill-rule%3D%22evenodd%22%20d%3D%22M20%2010c0-5.52-4.48-10-10-10s-10%204.48-10%2010v5h5v-5c0-2.76%202.24-5%205-5s5%202.24%205%205v5h-4l6.5%207%206.5-7h-4v-5z%22%20clip-rule%3D%22evenodd%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2222%22%20viewBox%3D%220%200%2024%2022%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20fill-rule%3D%22evenodd%22%20d%3D%22M20%2010c0-5.52-4.48-10-10-10s-10%204.48-10%2010v5h5v-5c0-2.76%202.24-5%205-5s5%202.24%205%205v5h-4l6.5%207%206.5-7h-4v-5z%22%20clip-rule%3D%22evenodd%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"></button><button draggable="false" title="Tilt map" aria-label="Tilt map" type="button" class="gm-tilt gm-control-active" style="background: none rgb(255, 255, 255); display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; width: 40px; height: 40px; top: 0px; left: 0px; overflow: hidden; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218px%22%20height%3D%2216px%22%20viewBox%3D%220%200%2018%2016%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%2C16h8V9H0V16z%20M10%2C16h8V9h-8V16z%20M0%2C7h8V0H0V7z%20M10%2C0v7h8V0H10z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218px%22%20height%3D%2216px%22%20viewBox%3D%220%200%2018%2016%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%2C16h8V9H0V16z%20M10%2C16h8V9h-8V16z%20M0%2C7h8V0H0V7z%20M10%2C0v7h8V0H10z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218px%22%20height%3D%2216px%22%20viewBox%3D%220%200%2018%2016%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%2C16h8V9H0V16z%20M10%2C16h8V9h-8V16z%20M0%2C7h8V0H0V7z%20M10%2C0v7h8V0H10z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="width: 18px;"></button></div></div></div><div class="gmnoprint" style="margin: 10px; z-index: 0; position: absolute; cursor: pointer; left: 0px; top: 0px;"><div class="gm-style-mtc" style="float: left; position: relative;"><div role="button" tabindex="0" title="Show street map" aria-label="Show street map" aria-pressed="true" draggable="false" style="direction: ltr; overflow: hidden; text-align: center; height: 40px; display: table-cell; vertical-align: middle; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 18px; background-color: rgb(255, 255, 255); padding: 0px 17px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; min-width: 36px; font-weight: 500;">Map</div><div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; left: 0px; top: 40px; text-align: left; display: none;"><div draggable="false" title="Show street map with terrain" style="color: black; font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 18px; background-color: rgb(255, 255, 255); padding: 5px 8px 5px 5px; direction: ltr; text-align: left; white-space: nowrap;"><span role="checkbox" style="vertical-align: middle;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22%23000000%22%3E%0A%20%20%20%20%3Cpath%20d%3D%22M0%200h24v24H0z%22%20fill%3D%22none%22%2F%3E%0A%20%20%20%20%3Cpath%20d%3D%22M19%203H5c-1.11%200-2%20.9-2%202v14c0%201.1.89%202%202%202h14c1.11%200%202-.9%202-2V5c0-1.1-.89-2-2-2zm-9%2014l-5-5%201.41-1.41L10%2014.17l7.59-7.59L19%208l-9%209z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 1em; width: 1em; transform: translateY(0.15em); display: none;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22%23000000%22%3E%0A%20%20%20%20%3Cpath%20d%3D%22M19%205v14H5V5h14m0-2H5c-1.1%200-2%20.9-2%202v14c0%201.1.9%202%202%202h14c1.1%200%202-.9%202-2V5c0-1.1-.9-2-2-2z%22%2F%3E%0A%20%20%20%20%3Cpath%20d%3D%22M0%200h24v24H0z%22%20fill%3D%22none%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 1em; width: 1em; transform: translateY(0.15em);"></span><label style="vertical-align: middle; cursor: pointer;">Terrain</label></div></div></div><div class="gm-style-mtc" style="float: left; position: relative;"><div role="button" tabindex="0" title="Show satellite imagery" aria-label="Show satellite imagery" aria-pressed="false" draggable="false" style="direction: ltr; overflow: hidden; text-align: center; height: 40px; display: table-cell; vertical-align: middle; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 18px; background-color: rgb(255, 255, 255); padding: 0px 17px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; min-width: 65px; border-left: 0px;">Satellite</div><div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; right: 0px; top: 40px; text-align: left; display: none;"><div draggable="false" title="Show imagery with street names" style="color: black; font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 18px; background-color: rgb(255, 255, 255); padding: 5px 8px 5px 5px; direction: ltr; text-align: left; white-space: nowrap;"><span role="checkbox" style="vertical-align: middle;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22%23000000%22%3E%0A%20%20%20%20%3Cpath%20d%3D%22M0%200h24v24H0z%22%20fill%3D%22none%22%2F%3E%0A%20%20%20%20%3Cpath%20d%3D%22M19%203H5c-1.11%200-2%20.9-2%202v14c0%201.1.89%202%202%202h14c1.11%200%202-.9%202-2V5c0-1.1-.89-2-2-2zm-9%2014l-5-5%201.41-1.41L10%2014.17l7.59-7.59L19%208l-9%209z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 1em; width: 1em; transform: translateY(0.15em);"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22%23000000%22%3E%0A%20%20%20%20%3Cpath%20d%3D%22M19%205v14H5V5h14m0-2H5c-1.1%200-2%20.9-2%202v14c0%201.1.9%202%202%202h14c1.1%200%202-.9%202-2V5c0-1.1-.9-2-2-2z%22%2F%3E%0A%20%20%20%20%3Cpath%20d%3D%22M0%200h24v24H0z%22%20fill%3D%22none%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 1em; width: 1em; transform: translateY(0.15em); display: none;"></span><label style="vertical-align: middle; cursor: pointer;">Labels</label></div></div></div></div></div></div></div>
						<!-- <script>
							var geocoder;
							var map;
							function codeAddress() {
								geocoder = new google.maps.Geocoder();
								var lat='';
								var lng=''
								var address = document.getElementById("location_address").innerHTML;
								//var street_address = document.getElementById("street_address").innerHTML;
								var address = address;
								geocoder.geocode( { 'address': address}, function(results, status) {
									if (status == google.maps.GeocoderStatus.OK) {
										lat = results[0].geometry.location.lat(); //getting the lat
										lng = results[0].geometry.location.lng(); //getting the lng
										console.log(lat);
										map.setCenter(results[0].geometry.location);
										var marker = new google.maps.Marker({
											map: map,
											position: results[0].geometry.location
										});
									} else {

									}
								});
								var latlng = new google.maps.LatLng(lat, lng);
								var myOptions = {
									zoom: 8,
									center: latlng,
									mapTypeId: google.maps.MapTypeId.ROADMAP,
									width: '100%',
										height: '480px'
								}
								map = new google.maps.Map(document.getElementById("property_location_map"), myOptions);
							}


							window.onload = function(){
								//codeAddress();
							}
						</script> -->
						<!-- ngadt fix single property google map -->
						<script type="text/javascript">     
						    function initMap() {            

						              
						          var latitude = parseFloat(44.831002);
						          var longitude = parseFloat(0.498830);
								  if (latitude == 0 && longitude == 0) {
									var address = document.getElementById("location_address").innerHTML;
									var geocoder = new google.maps.Geocoder();
									geocoder.geocode({ 'address': address}, function(results, status) {
									  if (status == google.maps.GeocoderStatus.OK) {
										latitude = results[0].geometry.location.lat(); //getting the lat
										longitude = results[0].geometry.location.lng(); //getting the lng
										
										var myLatLng = {lat: latitude, lng: longitude};					          
						         
										var map = new google.maps.Map(document.getElementById('property_location_map'), {
											zoom: 12,
											center: myLatLng,
											clickableIcons: true
										});
										var marker = new google.maps.Marker({
											position: myLatLng,
											map: map,
											//title: propertyName
										});
									  }
									});
								  } else {
									  var myLatLng = {lat: latitude, lng: longitude};					          
						         
									  var map = new google.maps.Map(document.getElementById('property_location_map'), {
										zoom: 12,
										center: myLatLng,
										clickableIcons: true
									  });
									  var marker = new google.maps.Marker({
										position: myLatLng,
										map: map,
										//title: propertyName
									  });
								  }						          
						      }
						 

						</script>
						<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDO50OJOXC8__QCdgydTRxEux3Y2kb44ys&amp;callback=initMap"></script>
						<!-- end ngadt -->
						
									</div>
				<!-- <p>*Please note that the location of the property is approximate to protect the owners privacy</p> -->
			</div>
		</div>
		<div class="span-table-cell vertical-align-top span-7 msf-tsmc-right">
			
		</div>
	</div>
</div><div data-cycle-hash="pricing-availability" data-cycle-pager-template="<a href=#>Pricing &amp; Availability</a>" class="cycle-slide cycle-slide-active" style="position: absolute; top: 0px; left: 0px; z-index: 100; opacity: 1; display: block; visibility: visible;">
	<div class="msf-pricing-availability">

		<div class="msf-three-steps clear-both-fix">
			<div class="msf-1-step msf-step-active">
				<p><strong><span>1</span></strong></p>
				<h4>Availabilty</h4>
			</div>
			<div class="msf-2-step">
				<p><strong><span>2</span></strong></p>
				<h4>Pricing &amp; Reserve</h4>
			</div>
			<div class="msf-3-step">
				<p><strong><span>3</span></strong></p>
				<h4>Confirm</h4>
			</div>
		</div>

		<div class="msf-three-steps-main">
			<div class="msf-nav-bar-black-book booknow" style="text-align: right">
												<a href="#" class="bok bok2"> Book Now </a>

			</div>
			<div class="msf-nav-bar-black-book booknow" style="text-align: right">

			</div>
			<div class="calendar" style="display: block">
												<iframe class="calendar" style="height: 1050px !important" data-src="https://secure.365villas.com/vros/api/websitecontent/owner_token/b3d1b8365bf29941f823b47d21cb3a98dac20b08/property_id/2?opt_calendar=1&amp;opt_olb=0&amp;opt_rates=1&amp;opt_services=0&amp;opt_policies=0&amp;opt_payments=0&amp;opt_rules=0&amp;lang=en" src="https://secure.365villas.com/vros/api/websitecontent/owner_token/b3d1b8365bf29941f823b47d21cb3a98dac20b08/property_id/2?opt_calendar=1&amp;opt_olb=0&amp;opt_rates=1&amp;opt_services=0&amp;opt_policies=0&amp;opt_payments=0&amp;opt_rules=0&amp;lang=en"></iframe>
			</div>


			<div class="msf-nav-bar-black-book booknow" style="text-align: left;">
				<a href="#" class="bok_back bok" style="display: none"> Back </a>
			</div>

			<div class="pricing pricing_iframe" style="display: none;">
				<script>_365_owner='themeone';
						_365_property_id = '2';
					
										_365_manual_control = 1;					
					$(window).trigger('resize');

				</script>

				 <script id="boking" src="https://secure.365villas.com/widget/general-olb.js"></script>
				 <script>
					 if (window.addEventListener){
						 window.addEventListener( "message", function( event ){
							 if( event.origin == Widget365VillasIframeCombine.ifrm_365villas_olb ) {
								 $(window).trigger('resize');

							 }
						 }, false );
					 } else {
						 window.attachEvent( "onmessage", function( event ){
							 if( event.origin == Widget365VillasIframeCombine.ifrm_365villas_olb ) {
								 $(window).trigger('resize');
							 }
						 } );
					 }

				 </script>
			</div>

		</div>

	</div>
</div></div>
</div>

</div>
</div>
</div>--%>

<div style="display: none;" class="msf-popup-bg">
	<form class="add_property_comments">
		<div class="msf-popup msf-popup-x21 msf-smth-text-inset">
			<a class="msf-popup-close" href="#">×</a>
			<h3>Write a Review</h3>
				<span class="review-inset">
					<input type="hidden" value="384 " name="property_id">
					<input type="hidden" id="name_ajax_review" name="name_ajax_review" value="7b53ff45dc"><input type="hidden" name="_wp_http_referer" value="/properties/sunny-condo-2-9/">					<div class="msf-input-default"><input type="text" name="msf-name" placeholder="Name"></div>
					<div class="msf-input-default"><input type="text" name="msf-review-title" placeholder="Review Title"></div>
					<div class="msf-input-default"><textarea name="msf-your-review" placeholder="Your Review..."></textarea></div>

					<p>Choose your star rating</p>
					<!--<div class="msf-stars" style="background-image: url(http://northernlights.websites.365villas.com/wp-content/themes/villas/img/stars-empty-grey.png);"><div class="msf-stars-inset" style="width: 0;"></div></div>-->
					<div style="text-align:  center; margin-bottom: 10px;">        <div class="rateit" data-rateit-backingfld=".rating-field"><button id="rateit-reset-2" class="rateit-reset" aria-label="reset rating" aria-controls="rateit-range-2"></button><div id="rateit-range-2" class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="5" aria-valuenow="" aria-readonly="false" style="width: 80px; height: 16px;"><div class="rateit-selected" style="height: 16px; width: 0px;"></div><div class="rateit-hover" style="height:16px"></div></div></div>
        <input type="hidden" name="rating" class="rating-field" style="display: none;">
      </div>
					<div><input type="submit" name="msf-submit" value="Submit Review"></div>
					<img class="ajax-loader-review" src="http://northernlights.websites.365villas.com/wp-content/themes/villas/ajax-loader.gif" alt="Sending ..." style="display: none">
				</span>
		</div>
	</form>
</div>

<%--<div class="msf-footer msf-bg-grey" id="msf-footer">
	<div class="container clear-both-fix">
		<div class="span-table msf-footer-inset">
			<div class="span-table-cell vertical-align-top">
				<ul id="menu-first-menu-on-footer" class="msf-footer-normal-links"><li id="menu-item-84" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-84"><a href="/accommodation">Our Properties</a></li>
<li id="menu-item-86" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-86"><a href="#">Amenities</a></li>
<li id="menu-item-87" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-87"><a href="#">Location</a></li>
</ul>							</div>
			<div class="span-table-cell vertical-align-top">
				<ul id="menu-second-menu-on-footer" class="msf-footer-normal-links"><li id="menu-item-88" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-88"><a href="#">Availability</a></li>
<li id="menu-item-89" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-89"><a href="#">Book Now</a></li>
<li id="menu-item-90" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-90"><a href="#">Reviews</a></li>
</ul>				                                <ul class="msf-footer-normal-links">
                                    <li><a href="/login/">Owner Login</a></li>
				</ul>
                                			</div>
			<div class="span-table-cell vertical-align-top">
				<ul id="menu-third-menu-on-footer" class="msf-footer-normal-links"><li id="menu-item-93" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-93"><a href="http://northernlights.websites.365villas.com/about-us/">About us</a></li>
<li id="menu-item-92" class="menu-item menu-item-type-post_type menu-item-object-page current_page_parent menu-item-92"><a href="http://northernlights.websites.365villas.com/blog/">Journal</a></li>
<li id="menu-item-417" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-417"><a href="http://northernlights.websites.365villas.com/contact-us/">Contact Us</a></li>
</ul>							</div>
			<div class="span-table-cell vertical-align-middle">

				<ul class="msf-footer-social-icons-horizonatl clear-both-fix">
					
											<li class="msf-ico-twitter"><a target="_blank" href="#"><span>Twitter</span></a></li>
																					<li class="msf-ico-googlep"><a target="_blank" href="#"><span>Google Plus</span></a></li>
																<li class="msf-ico-printerest" style="line-height: 80%;"><a target="_blank" href="#"><span>Printerest</span></a></li>
																<li class="msf-ico-linkedin" style="line-height: 80%;"><a target="_blank" href="#"><span>Linkedin</span></a></li>
																			</ul>

				<p class="msf-copy"><a href="https://365villas.com">Powered by 365villas</a></p>
			</div>
		</div>
	</div>
</div>
<div class="footer-link-bar">
<a href="/terms-conditions/">Terms &amp; Conditions</a> 
| <a href="/privacy-policy/">Privacy Policy</a></div>

<script type="text/javascript" src="http://northernlights.websites.365villas.com/wp-content/plugins/comment-rating-stars/resources/frontend/jquery.rateit.min.js?ver=1.0.0-RC1"></script>
<script type="text/javascript" src="http://northernlights.websites.365villas.com/wp-content/plugins/comment-rating-stars/resources/frontend/comment-review-stars.js?ver=1.0.0-RC1"></script>
<script type="text/javascript" src="http://northernlights.websites.365villas.com/wp-content/plugins/contact-form-7/includes/js/jquery.form.min.js?ver=3.51.0-2014.06.20"></script>
<script type="text/javascript">
/* <![CDATA[ */
var _wpcf7 = {"loaderUrl":"http:\/\/northernlights.websites.365villas.com\/wp-content\/plugins\/contact-form-7\/images\/ajax-loader.gif","recaptchaEmpty":"Please verify that you are not a robot.","sending":"Sending ..."};
/* ]]> */
</script>
<script type="text/javascript" src="http://northernlights.websites.365villas.com/wp-content/plugins/contact-form-7/includes/js/scripts.js?ver=4.3.1"></script>
<script type="text/javascript" src="http://northernlights.websites.365villas.com/wp-content/themes/villas/js/jquery.cycle2.swipe.min.js?ver=4.4.17"></script>
<script type="text/javascript" src="http://northernlights.websites.365villas.com/wp-content/themes/villas/js/functions.js?ver=1.0.1"></script>
<script type="text/javascript" src="http://northernlights.websites.365villas.com/wp-content/themes/villas/js/ac-googlemaps.js?ver=1.0"></script>
<script type="text/javascript" src="http://northernlights.websites.365villas.com/wp-includes/js/wp-embed.min.js?ver=4.4.17"></script>
<script type="text/javascript">
/* <![CDATA[ */
var icl_vars = {"current_language":"en","icl_home":"http:\/\/northernlights.websites.365villas.com\/","ajax_url":"http:\/\/northernlights.websites.365villas.com\/wp-admin\/admin-ajax.php","url_type":"1"};
/* ]]> */
</script>
<script type="text/javascript" src="http://northernlights.websites.365villas.com/wp-content/plugins/sitepress-multilingual-cms/res/js/sitepress.js?ver=4.4.17"></script>--%>

</asp:Content>

