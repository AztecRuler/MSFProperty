﻿<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MSFMaster.Master" CodeFile="about-us.aspx.cs" Inherits="MSFProperty.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About-us</title>
    <link href="CSS/Design1Css.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

<div class="wpg-main-bg-header bgimg editable" style="background-image: url('../Images/<%=GetImage(6)%>')" >
		<div class="span-table">
		<div class="span-table">
			<div class="span-table-cell vertical-align-middle text-align-center">
				<div class="container">
					<h2 class="editable"><%=GetText(26)%></h2>
					<p class="editable"><%=GetText(27)%></p>
				</div>
			</div>
		</div>
	</div>
        <div class="foregroundDiv">
        <h3 style="text-align: center;" class="editable"><%=GetText(28)%></h3>

        <span class="top_front_div editable"><%=GetText(29)%> 
</span>

    </div>
        

</asp:Content>
