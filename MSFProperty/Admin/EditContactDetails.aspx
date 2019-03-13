<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditContactDetails.aspx.cs" Inherits="MSFProperty.Admin.EditContactDetails" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdateProgress ID="GetAdressUpdateProgress" runat="server" AssociatedUpdatePanelID="contactUsUpdatePanel" DynamicLayout="True">
        <ProgressTemplate>
            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif"/>
                        Please Wait while working ....

                    </div>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="contactUsUpdatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="SaveContactDetails"/>
        </Triggers>
        <ContentTemplate>
            <table>
                <tr>
                    <td>Enter Address Number</td>
                    <td>
                        <asp:TextBox ID="AddressNumber" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Enter Address Line One</td>
                    <td>
                        <asp:TextBox ID="AddressLineOne" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Enter Address Line Two</td>
                    <td>
                        <asp:TextBox ID="AddressLineTwo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Enter City</td>
                    <td>
                        <asp:TextBox ID="city" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Enter PostCode</td>
                    <td>
                        <asp:TextBox ID="PostCode" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Enter Telephone Number LandLine</td>
                    <td>
                        <asp:TextBox ID="TelephoneNumberLandLine" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Enter Telephone Mobile</td>
                    <td>
                        <asp:TextBox ID="TelephoneMobile" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Enter Landlord Reg Number</td>
                    <td>
                        <asp:TextBox ID="RegNumber" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Enter Email Address</td>
                    <td>
                        <asp:TextBox ID="EmailAddress" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="SaveContactDetails" runat="server" Text="Save Details" OnClick="SaveContactDetails_OnClick"/>
                        <asp:Label runat="server" ID="ErrorReporter" ForeColor="red"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
