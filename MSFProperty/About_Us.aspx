<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="About_Us.aspx.cs" Inherits="MSFProperty.About_Us" %>
<%@ Register Src="~/UserControls/AboutUsInfo.ascx" TagPrefix="uc1" TagName="AboutUsInfo" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About-us</title>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <div class="msf-main-bg-header bgimg  editable lazy" style="background-image: url('../Images/<%=GetImage(6)%>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 style ="color: <%= GetColour(27) %>;" class=" editable"><%=GetText(27)%></h2>
                    <p style ="color: <%= GetColour(28) %>;" class=" editable"><%=GetText(28)%></p>
                </div>
            </div>
        </div>
    </div>
    <div class="foregroundDiv">
        <h3 style="text-align: center; color: <%= GetColour(29) %>;" class=" editable"><%=GetText(29)%></h3>

        <span  style ="color: <%= GetColour(30) %>;"  class="top_front_div  editable"><%=GetText(30)%> 
        </span>

    </div>
    
    <div class="fancyBreak container">
        <span style ="color: <%= GetColour(41) %>;" class=" editable">
            <%=GetText(41)%>
        </span>
    </div>
    

    <div class="container ">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <uc1:AboutUsInfo runat="server" ID="AboutUsInfo" TitleText=<%# Eval("TitleText") %> Quote=<%#Eval("Quote") %> ImageUrl=<%#Eval("ImageUrl") %> Chat=<%#Eval("Chat") %> DataId=<%#Eval("ID") %>/>
        </ItemTemplate>
    </asp:Repeater>
    </div>
</asp:Content>
