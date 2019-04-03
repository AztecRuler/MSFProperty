<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="MSFProperty.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ContactUs</title>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <div class="msf-main-bg-header bgimg  editable lazy" style="background-image: url('~/../Images/<%= GetImage(8) %>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 style ="color: <%= GetColour(35) %>;" class=" editable"><%= GetText(35) %></h2>
                    <p style ="color: <%= GetColour(36) %>;" class=" editable"><%= GetText(36) %> </p>
                </div>
            </div>
        </div>
    </div>
    <div class="msf-buttons-info msf-bg-grey">
        <div class="container clear-both-fix text-align-center">
            <ul>
                <li class="msf-button-info-book ">
                    <a style ="color: <%= GetColour(8) %>;" class=" editable" href="#"><%= GetText(8) %></a>
                </li>
                <li class="msf-button-info-phone ">
                    <a style ="color: <%= GetColour(9) %>;" class=" editable" href="tel:<%= GetText(9) %>"><%= GetText(9) %> </a>
                </li>
                <li class="msf-button-info-contact ">
                    <a style ="color: <%= GetColour(10) %>;" class=" editable" href="../ContactUs/"><%= GetText(10) %></a>
                </li>
            </ul>
        </div>
    </div>



    <div class="Cu">
        <h2 style="text-align: center;">
            <span style="font-size: 20px;" style ="color: <%= GetColour(37) %>;" class=" editable">
                <strong><%= GetText(37) %> </strong>
            </span>
        </h2>
        <p style="text-align: center; color: <%= GetColour(38) %>;" class=" editable"><%= GetText(38) %></p>
        <div id="cuDIV_8">
            <span id="cuSPAN_9">
                <input type="text" name="msf-subject" size="40" placeholder="Subject" id="cuINPUT_10" />
            </span>
        </div>
        <div id="cumainSearchContainer1">
            <span id="cuSPAN_12">
                <input type="text" name="msf-name" size="40" placeholder="Name" id="cuINPUT_13" />
            </span>
        </div>
        <div id="cumainSearchContainer4">
            <span id="cuSPAN_15">
                <input type="email" name="msf-email" size="40" placeholder="Confirm Email Address" id="cuINPUT_16" />
            </span>
        </div>
        <div id="cumainSearchContainer7">
            <span id="cuSPAN_18">
                <input type="text" name="msf-phone" size="40" placeholder="Telephone Number" id="cuINPUT_19" />
            </span>
        </div>
        <div id="cusmallSearchContainer0">
            <span id="cuSPAN_21"></span>
            <textarea name="msf-inquiry" cols="40" rows="10" placeholder="Inquiry" id="cuTEXTAREA_22">
		</textarea>
        </div>
        <div id="cusmallSearchContainer3">
            <span id="cuSPAN_24">
                <input type="checkbox" name="privacy-consent" value="1" id="privacyCheck" />
            </span><span id="cuSPAN_26">I've read and accept the <a href="/Privacy.aspx" id="cuA_27">Privacy Policy</a>.</span>
        </div>
        <div id="cusmallSearchContainer8">
            <input type="submit" value="Submit" disabled="disabled" id="sendMessage" /><img  src="ajax-loader.gif" alt="Sending ..." id="cuIMG_30" />
        </div>
        <div id="cuDIV_31">
        </div>
    </div>

</asp:Content>
