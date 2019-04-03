<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="FindUs.aspx.cs" Inherits="MSFProperty.FindUs" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
<asp:Repeater ID="ContactUsRepeater" runat="server">
<ItemTemplate>
    <ul class="findUsList">
        <li class="contactDetails footerAddress">Address :
            <%#Eval("AddressNumber") %> <%#Eval("AddressLineOne") %><br/><%#Eval("AddressLineTwo") %><br/><%#Eval("PostCode") %>
        </li>
        <li class="contactDetails">Email:<%#Eval("EmailAdress") %></li>

        <li class="contactDetails">LandLine:<%#Eval("TelephoneNumberLandLine") %></li>
        <li class="contactDetails footerMobile">Mobile:<%#Eval("TelephoneMobile") %></li>
        <li class="contactDetails">Letting Agent Registration Number:<%#Eval("RegNumber") %></li>

    </ul>
    </ItemTemplate>
</asp:Repeater>
    <iframe src="" runat="server" frameborder="0" id="mapForPostcode" style="border: 0; height: 500px; width: 100%"></iframe>

</asp:Content>

