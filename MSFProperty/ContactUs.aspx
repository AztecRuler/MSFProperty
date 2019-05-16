<%@ Page Title="" Language="C#" MasterPageFile="~/MSFMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="MSFProperty.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ContactUs</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="msf-main-bg-header bgimg  editable lazy" style="background-image: url('~/../Images/<%= GetImage(8) %>')">
        <div class="span-table">
            <div class="span-table-cell vertical-align-middle text-align-center">
                <div class="container">
                    <h2 style="color: <%= GetColour(35) %>;" class=" editable"><%= GetText(35) %></h2>
                    <p style="color: <%= GetColour(36) %>;" class=" editable"><%= GetText(36) %> </p>
                </div>
            </div>
        </div>
    </div>
    <div class="msf-buttons-info msf-bg-grey">
        <div class="container clear-both-fix text-align-center">
            <ul>
                <li class="msf-button-info-book ">
                    <a style="color: <%= GetColour(8) %>;" class=" editable" href="#"><%= GetText(8) %></a>
                </li>
                <li class="msf-button-info-phone ">
                    <a style="color: <%= GetColour(9) %>;" class=" editable" href="tel:<%= GetText(9) %>"><%= GetText(9) %> </a>
                </li>
                <li class="msf-button-info-contact ">
                    <a style="color: <%= GetColour(10) %>;" class=" editable" href="../ContactUs/"><%= GetText(10) %></a>
                </li>
            </ul>
        </div>
    </div>


    <asp:UpdateProgress ID="ContactUsUpdateProgress" runat="server" AssociatedUpdatePanelID="ContactUsUpdatePanel" DynamicLayout="True">
        <ProgressTemplate>
            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="ajax-loader.gif" />
                        Please Wait while loading ....

                    </div>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="ContactUsUpdatePanel" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="sendMessage" />

        </Triggers>
        <ContentTemplate>
            <div class="Cu">
                <h2 style="text-align: center;">
                    <span style="font-size: 20px;" style="color: <%= GetColour(37) %>;" class=" editable">
                        <strong><%= GetText(37) %> </strong>
                    </span>
                </h2>
                <p style="text-align: center; color: <%= GetColour(38) %>;" class=" editable"><%= GetText(38) %></p>
                <div id="cuDIV_8">
                    <span id="cuSPAN_9">
                        <asp:TextBox ID="C_U_Subject" runat="server" name="msf-subject" size="40" placeholder="Subject"></asp:TextBox>
                        <asp:Label ID="C_U_Subject_Error" CssClass="cuError" runat="server" Text="" ForeColor="Red" Font-Size="18px"></asp:Label>
                    </span>
                </div>
                <div id="cumainSearchContainer1">
                    <span id="cuSPAN_12">
                        <asp:TextBox name="msf-name" size="40" placeholder="Name" ID="C_U_Name" runat="server"></asp:TextBox>
                        <asp:Label ID="C_U_Name_Error" CssClass="cuError" runat="server" Text="" ForeColor="Red" Font-Size="18px"></asp:Label>

                    </span>
                </div>
                <div id="cumainSearchContainer4">
                    <span id="cuSPAN_15">
                        <asp:TextBox name="msf-email" size="40" placeholder="Confirm Email Address" ID="C_U_Email" runat="server"></asp:TextBox>
                        <asp:Label ID="C_U_Email_Error" CssClass="cuError" runat="server" Text="" ForeColor="Red" Font-Size="18px"></asp:Label>

                    </span>
                </div>
                <div id="cumainSearchContainer7">
                    <span id="cuSPAN_18">
                        <asp:TextBox name="msf-phone" size="40" placeholder="Telephone Number" ID="C_U_Phone" runat="server"></asp:TextBox>

                    </span>
                </div>
                <div id="cusmallSearchContainer0">
                    <span id="cuSPAN_21">
                    <asp:TextBox name="msf-inquiry" cols="40" Rows="10" TextMode="MultiLine" ID="C_U_Enquiry" runat="server"></asp:TextBox>
                        <asp:Label ID="C_U_Enquiry_Error" CssClass="cuError" runat="server" Text="" ForeColor="Red" Font-Size="18px"></asp:Label>

                    </span>
                </div>
                <div id="cusmallSearchContainer3">
                    <span id="cuSPAN_24">
                        <asp:RadioButton  runat="server"  name="privacy-consent" value="1" ID="privacyCheck"/>
                    </span><span id="C_U_PrivayAccept">I've read and accept the <a href="/Privacy.aspx" id="cuA_27">Privacy Policy</a>.</span>
                    <asp:Label ID="C_U_PrivayAccept_Error" CssClass="cuError" runat="server" Text="" ForeColor="Red" Font-Size="18px"></asp:Label>

                </div>
                <div id="cusmallSearchContainer8">
                    <asp:Button runat="server" Text="Button" value="Submit" disabled="disabled" ID="sendMessage" OnClick="sendMessage_OnClick" />
                </div>
                <asp:Label ID="error" runat="server" Font-Size="38px" ForeColor="red"></asp:Label>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
