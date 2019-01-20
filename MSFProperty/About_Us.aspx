<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="About_Us.aspx.cs" Inherits="MSFProperty.About_Us" %>
<%@ Register Src="~/UserControls/AboutUsInfo.ascx" TagPrefix="uc1" TagName="AboutUsInfo" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About-us</title>
    <link rel="canonical" href="" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <div class="msf-main-bg-header bgimg editable" style="background-image: url('../Images/<%=GetImage(6)%>')">
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
    
    <hr class="fancyBreak container">

    <div class="container ">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <uc1:AboutUsInfo runat="server" ID="AboutUsInfo" TitleText=<%# Eval("TitleText") %> Quote=<%#Eval("Quote") %> ImageUrl=<%#Eval("ImageUrl") %> Chat=<%#Eval("Chat") %> DataId=<%#Eval("ID") %>/>
        </ItemTemplate>
    </asp:Repeater>
    </div>
</asp:Content>
