<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MSFMaster.Master" CodeFile="about-us.aspx.cs" Inherits="MSFProperty.about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About-us</title>
     <link rel="canonical" href="" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

<div class="msf-main-bg-header bgimg editable" style="background-image: url('../Images/<%=GetImage(6)%>')" >	
    <div class="span-table">
			<div class="span-table-cell vertical-align-middle text-align-center">
				<div class="container">
					<h2 class="editable"><%=GetText(27)%></h2>
					<p class="editable"><%=GetText(28)%></p>
				</div>
			</div>
		</div>
	</div>
        <div class="foregroundDiv">
        <h3 style="text-align: center;" class="editable"><%=GetText(29)%></h3>

        <span class="top_front_div editable"><%=GetText(30)%> 
</span>

    </div>

</asp:Content>
