<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MSFMaster.Master"  CodeFile="accommodation.aspx.cs" Inherits="MSFProperty.accommodation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Properties</title>
    <link href="CSS/Design1Css.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">>

<div class="wpg-main-bg-header bgimg editable" style="background-image: url('../Images/<%=GetImage(5)%>')" max-height: 871px;">
		<div class="span-table">
			<div class="span-table-cell vertical-align-middle text-align-center">
				<div class="container">
					<h2 class="editable"><%=GetText(25)%></h2>
					<p class="editable"><%=GetText(26)%></p>
				</div>
			</div>
		</div>
	</div><div style="position: relative;">
        
        <div class="foregroundDiv_dark">
            <p>View latest rental properties</p>

<div class="wpg-list-villas wpg-bg-white">
	<div class="container">
		<p class="text-align-right wpg-list-villas-pager">
			View	<strong>10</strong> 
			<a data-limit="20" href="#">20</a> 
			<a data-limit="30" href="#">30</a> 
			<a data-limit="99999" href="#">All</a>
		</p>
		<ul class="wpg-list-villas-inset clear-both-fix property_ul">
<li class="wpg-list-villas-inset-item clear-both-fix">
	<div class="wpg-lvi-box span-table">

		<div class="span-table-cell wpg-lvi-box-main" style="background-image: url(Images/rent-1.jpg);"><a href="properties.aspx/" style="position: absolute; top: 0;bottom: 0; left: 0; right: 0;"></a></div>
		<div class="span-table-cell vertical-align-middle text-align-center wpg-lvi-box-side">
			<ul class="clear-both-fix">
				<li class="wpg-ico-bed wpg-ico"><strong>Bed</strong> <span>2</span> <small>2<br>Bedrooms</small></li>
				<li class="wpg-ico-computer wpg-ico"><strong>Computer</strong><small style="padding-top: 10px;">Internet area is virgin</small></li>
				<li class="wpg-ico-bath wpg-ico"><strong>Bath</strong> <span>2</span><small>2<br>Bathroom<br>over bath shower</small></li>
				<li class="wpg-ico-location wpg-ico"><a href="properties.aspx/#location">Location</a><small style="padding-top: 20px;">Location</small></li>
				<li class="wpg-ico-pet wpg-ico"><strong>Pet</strong> <span>NO</span> <small style="padding-top: 10px;"><br>Pets</small></li>
				<li class="wpg-ico-email wpg-ico"><a href="properties.aspx/#pricing-availability">Pricing</a> <small style="padding-top: 20px;">Availability</small></li>
				<li class="wpg-ico-cost wpg-ico"><a style="text-indent: 5px; font-size: 14px; text-align: center;" href="properties.aspx/#pricing-availability"> £1300 per month </a><small><span>£1300 per month </span></small>  </li>
			</ul>
		</div>
	</div>
	<div class="wpg-lvi-sub-box">
		<h3><a href="properties.aspx/">House 1</a></h3>
		<p></p>
				<p>Charming apartment in the heart of the ancient city, both with an extraordinary view over the city.

Elegant apartment in the heart of the m...    <a style="z-index: 1;color: gray; font-weight: bold;  position: relative; bottom: 1px;" href="properties.aspx/">more</a></p>
		<a class="wpg-more-button" href="properties.aspx/">More Information</a>
	</div>

	<span class="property_line"></span>
</li>



<li class="wpg-list-villas-inset-item clear-both-fix">
	<div class="wpg-lvi-box span-table">

		<div class="span-table-cell wpg-lvi-box-main" style="background-image: url(Images/rent-2.jpg);"><a href="properties.aspx/" style="position: absolute; top: 0;bottom: 0; left: 0; right: 0;"></a></div>
		<div class="span-table-cell vertical-align-middle text-align-center wpg-lvi-box-side">
			<ul class="clear-both-fix">
				<li class="wpg-ico-bed wpg-ico"><strong>Bed</strong> <span>1</span> <small>1<br>Bedrooms</small></li>
				<li class="wpg-ico-computer wpg-ico"><strong>Computer</strong><small style="padding-top: 10px;">Internet area is BT and virggin </small></li>
				<li class="wpg-ico-bath wpg-ico"><strong>Bath</strong> <span>2</span><small>2<br>Bathroom<br>and Shower</small></li>
				<li class="wpg-ico-location wpg-ico"><a href="properties.aspx/#location">Location</a><small style="padding-top: 20px;">Location</small></li>
				<li class="wpg-ico-pet wpg-ico"><strong>Pet</strong> <span>NO</span> <small style="padding-top: 10px;"><br>Pets</small></li>
				<li class="wpg-ico-email wpg-ico"><a href="properties.aspx/#pricing-availability">Pricing</a> <small style="padding-top: 20px;">Availability</small></li>
				<li class="wpg-ico-cost wpg-ico"><a style="text-indent: 5px; font-size: 14px; text-align: center;" href="properties.aspx/#pricing-availability"> £1000 per month </a><small><span>£1000 per month </span></small>  </li>
			</ul>
		</div>
	</div>
	<div class="wpg-lvi-sub-box">
		<h3><a href="properties.aspx/">House 2 </a></h3>
		<p></p>
				<p>Luxury three bedroom the Country Club Villas complex in ....    <a style="z-index: 1;color: gray; font-weight: bold;  position: relative; bottom: 1px;" href="properties.aspx/">more</a></p>
		<a class="wpg-more-button" href="properties.aspx/">More Information</a>
	</div>

	<span class="property_line"></span>
</li>



<li class="wpg-list-villas-inset-item clear-both-fix">
	<div class="wpg-lvi-box span-table">

		<div class="span-table-cell wpg-lvi-box-main" style="background-image: url(Images/rent-3.jpg);"><a href="properties.aspx/" style="position: absolute; top: 0;bottom: 0; left: 0; right: 0;"></a></div>
		<div class="span-table-cell vertical-align-middle text-align-center wpg-lvi-box-side">
			<ul class="clear-both-fix">
				<li class="wpg-ico-bed wpg-ico"><strong>Bed</strong> <span>2</span> <small>2<br>Bedrooms</small></li>
				<li class="wpg-ico-computer wpg-ico"><strong>Computer</strong><small style="padding-top: 10px;">Internet area is virgin</small></li>
				<li class="wpg-ico-bath wpg-ico"><strong>Bath</strong> <span>2</span><small>2<br>Bathroom</small></li>
				<li class="wpg-ico-location wpg-ico"><a href="properties.aspx/#location">Location</a><small style="padding-top: 20px;">Location</small></li>
				<li class="wpg-ico-pet wpg-ico"><strong>Pet</strong> <span>NO</span> <small style="padding-top: 10px;"><br>Pets</small></li>
				<li class="wpg-ico-email wpg-ico"><a href="properties.aspx/#pricing-availability">Pricing</a> <small style="padding-top: 20px;">Availability</small></li>
				<li class="wpg-ico-cost wpg-ico"><a style="text-indent: 5px; font-size: 14px; text-align: center;" href="properties.aspx/#pricing-availability"> £700 per month </a><small><span>£700 per month </span></small>  </li>
			</ul>
		</div>
	</div>
	<div class="wpg-lvi-sub-box">
		<h3><a href="properties.aspx/"> House 3</a></h3>
		<p></p>
				<p>This old home is in the city center, very few cars drive through and the neighborhood is very quiet but lively because of the many osterie, wine bars, delicious local food shops, cultural venues and the ic...    <a style="z-index: 1;color: gray; font-weight: bold;  position: relative; bottom: 1px;" href="properties.aspx/">more</a></p>
		<a class="wpg-more-button" href="properties.aspx/">More Information</a>
	</div>

	<span class="property_line"></span>
</li>



<li class="wpg-list-villas-inset-item clear-both-fix">
	<div class="wpg-lvi-box span-table">

		<div class="span-table-cell wpg-lvi-box-main" style="background-image: url(Images/rent-4.jpg);"><a href="properties.aspx/" style="position: absolute; top: 0;bottom: 0; left: 0; right: 0;"></a></div>
		<div class="span-table-cell vertical-align-middle text-align-center wpg-lvi-box-side">
			<ul class="clear-both-fix">
				<li class="wpg-ico-bed wpg-ico"><strong>Bed</strong> <span>4</span> <small>4<br>Bedrooms</small></li>
				<li class="wpg-ico-computer wpg-ico"><strong>Computer</strong><small style="padding-top: 10px;">Internet area is BT</small></li>
				<li class="wpg-ico-bath wpg-ico"><strong>Bath</strong> <span>2</span><small>2<br>Bathroom<br>and shower</small></li>
				<li class="wpg-ico-location wpg-ico"><a href="properties.aspx/#location">Location</a><small style="padding-top: 20px;">Location</small></li>
				<li class="wpg-ico-pet wpg-ico"><strong>Pet</strong> <span>YES</span> <small style="padding-top: 10px;"><br>Pets Allowed</small></li>
				<li class="wpg-ico-email wpg-ico"><a href="properties.aspx/#pricing-availability">Pricing</a> <small style="padding-top: 20px;">Availability</small></li>
				<li class="wpg-ico-cost wpg-ico"><a style="text-indent: 5px; font-size: 14px; text-align: center;" href="properties.aspx/#pricing-availability"> £900 per month </a><small><span>£900 per month </span></small>  </li>
			</ul>
		</div>
	</div>
	<div class="wpg-lvi-sub-box">
		<h3><a href="properties.aspx/">House 4</a></h3>
		<p></p>
				<p>Charming apartment in the heart City  with magnificent views across much of Edinburgh.

Elegant apartment in the heart of the centre. The accommo...    <a style="z-index: 1;color: gray; font-weight: bold;  position: relative; bottom: 1px;" href="properties.aspx/">more</a></p>
		<a class="wpg-more-button" href="properties.aspx/">More Information</a>
	</div>

	<span class="property_line"></span>
</li>


</ul>
		<!-- <div class="wpg-list-villas-pager-box"> -->
			<!-- pager - look psd -->
		<!-- </div> -->
		<div class="wpg-list-villas-pager-box4" style="text-align: center; "><ul class="pager"><ul></ul></ul></div>
	</div>
</div>

        </div>
    </div>
        
</asp:Content>
