<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="True" CodeBehind="PropertyPage.aspx.cs" Inherits="MSFProperty.Admin.PropertyPage" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    <Scripts>
        <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>
    </Scripts>
</asp:ScriptManagerProxy>
<script type="text/javascript">
    // ReSharper disable once UnusedParameter
    function preview(sender, e) {
        $("#imagePreview").css("background-image", `url(../Images/${sender.newFileName})`);

    }

    function ShowItems(event, panel, num) {
        const UpdatePanel1 = '<%= GetAdressUpdatePanel.ClientID %>';
        const UpdatePanel2 = '<%= PropertyDetailsUpdatePanel.ClientID %>';
        const UpdatePanel3 = '<%= EditPropertyListingUpdatePanel.ClientID %>';
        const UpdatePanel4 = '<%= DeleteUpdatePanel.ClientID %>';

        if (panel === "createProperty") {
            $('#ClearAllBoxes').click();
        }
        if (UpdatePanel1 != null) {
            __doPostBack(UpdatePanel1, '');
        }

        if (UpdatePanel2 != null) {
            __doPostBack(UpdatePanel2, '');
        }

        if (UpdatePanel3 != null) {
            __doPostBack(UpdatePanel3, '');
        }
        if (UpdatePanel4 != null) {
            __doPostBack(UpdatePanel4, '');
        }
        canEditProperty = true; 
        canDeleteProperty = true;

        OpenAdminTab(event, panel, num);

    }
</script>
<asp:Panel ID="Panel1" runat="server" GroupingText="Property">
<div class="tab">
    <button class="tablinks active" id="createNewProperty" onclick="ShowItems(event,'createProperty', 1)">Create A New Property Listing</button>
    <button class="tablinks" id="editProperty" onclick="ShowItems(event, 'existingProperty', 2)">Edit An Existing Property Listing</button>
    <button class="tablinks" id="organizeProperty" onclick="ShowItems(event, 'organiseExistingPropertys', 3)">Organise Existing Property Listing</button>
</div>

<div id="createProperty" class="tabcontent" style="display: table;">
<asp:UpdateProgress ID="GetAdressUpdateProgress" runat="server" AssociatedUpdatePanelID="GetAdressUpdatePanel" DynamicLayout="True">
    <ProgressTemplate>
        <div id="overlay">
            <div class="modalprogress">
                <div class="theprogress">
                    <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif"/>
                    Please Wait while loading ....

                </div>
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="GetAdressUpdatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
    <Triggers>

        <asp:AsyncPostBackTrigger ControlID="PostCodeLookUp"/>
        <asp:AsyncPostBackTrigger ControlID="ClearTextBoxes"/>
        <asp:AsyncPostBackTrigger ControlID="ClearAllBoxes"/>
    </Triggers>
    <ContentTemplate>
        <asp:Label runat="server" ID="propSaved" ForeColor="Red"></asp:Label>

        <div class="propertyPanel">
            <asp:Panel ID="Panel2" runat="server" GroupingText="Address">
                <table id="streetTable">
                    <tr>
                        <td>
                            <asp:Label runat="server">Number</asp:Label>
                            <asp:TextBox runat="server" ID="PropertyHouseNumber"></asp:TextBox>
                        </td>


                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Street</asp:Label>
                            <asp:TextBox runat="server" ID="PropertyStreet"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Street2</asp:Label>
                            <asp:TextBox runat="server" ID="PropertyStreet2"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">County</asp:Label>
                            <asp:TextBox runat="server" ID="PropertyCounty"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Country</asp:Label>
                            <asp:TextBox runat="server" ID="PropertyCountry"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">PostCode</asp:Label>
                            <asp:TextBox runat="server" ID="PropertyPostCode"></asp:TextBox>
                            <asp:Button ID="PostCodeLookUp" runat="server" Text="Get Address From Postcode" OnClick="PostCodeLookUp_Click"/>
                            <asp:Label runat="server" ID="ErrorAddress" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Enter the Location of the property here </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="PropertyLocation"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Enter the LocationX of the property here </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="PropertyLocationX"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Enter the LocationY of the property here </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="PropertyY"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="ClearTextBoxes" runat="server" Text="Clear Boxes" OnClick="ClearTextBoxes_Click"/>
                        </td>
                    </tr>
                </table>
                <iframe src="" width="1000" runat="server" frameborder="0" id="mapForPostcode" style="border: 0"> </iframe>
            </asp:Panel>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdatePanel ID="PropertyDetailsUpdatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
<Triggers>
    <asp:PostBackTrigger ControlID="SaveButton"/>
</Triggers>
<ContentTemplate>
<asp:Panel ID="Panel3" runat="server" GroupingText="Property Details">

    <table>
        <tr>
            <td>
                <asp:Label runat="server">Enter the Title for the property here </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox runat="server" ID="propertyName"></asp:TextBox>
            </td>

        </tr>

        <tr>
            <td>
                <asp:Label runat="server">Enter the Bedrooms for the property here </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="propertyBedrooms" runat="server">
                    <asp:ListItem Selected="True">1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server">chose an image for the property</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="imagePreview" runat="server"/>

                <ajaxToolkit:AsyncFileUpload OnUploadedComplete="MainImage_UploadedComplete" CssClass="imageasyncButtonUpload" runat="server" ID="MainFileUploader" accept=".png,.jpg,.jpeg,.gif" ThrobberID="spinImg" OnClientUploadComplete="preview"/>
                <asp:Image ID="spinImg" runat="server" ImageUrl="../ajax-loader.gif"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server">Is this a featured property ? check yes empty no</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="propertyPopularCheck" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server">Enter the Amenities of the property here seperated by commas (example: virgin media area, Sky tv, local Tesco) </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox runat="server" ID="PropertyAmenities"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label runat="server">Enter the property BathType here </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBoxList ID="BathTypeCheckBox" runat="server">
                    <asp:ListItem>Bath</asp:ListItem>
                    <asp:ListItem>Shower</asp:ListItem>
                    <asp:ListItem>En Suite</asp:ListItem>
                    <asp:ListItem>Shower above bath</asp:ListItem>
                    <asp:ListItem>Multiple baths</asp:ListItem>
                    <asp:ListItem>Multiple Showers</asp:ListItem>
                    <asp:ListItem>None</asp:ListItem>
                </asp:CheckBoxList>
            </td>

        </tr>

        <tr>
            <td>
                <asp:Label runat="server">Check if pets are allowed or not</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="PetCheckBox" runat="server"/>
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label runat="server">Enter the Available from date</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    Date:
                    <input type="text" id="datepicker1" runat="server">
                </p>
                <asp:HiddenField ID="datepicker1Value" runat="server"/>
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label runat="server">Enter the avaiable to date or leave blank for indefinate</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    Date:
                    <input type="text" id="datepicker2" runat="server">
                </p>
                <asp:HiddenField ID="datepicker2Value" runat="server"/>

            </td>

        </tr>
        <tr>
            <td>
                <asp:Label runat="server">Enter the Rent Price here</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox runat="server" ID="PropertyRentPrice"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label runat="server">Enter the Deposit amount of the property here </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox runat="server" ID="PropertyDeposit"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label runat="server">upload the property images here </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FileUpload ID="PropertyImages" runat="server" AllowMultiple="true"/>
            </td>

        </tr>

        <tr>
            <td>
                <asp:Label runat="server">Enter the property Blurb into the box and press save to save the property</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox runat="server" TextMode="multiline" style="margin: 0px; min-width: 388px; min-height: 334px;" ID="PropertyBlurb"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveNewProperty"/>
                <asp:HiddenField ID="isEdit" runat="server" ClientIDMode="Static"/>
                <asp:Button ID="ClearAllBoxes" runat="server" Text="Clear Boxes" OnClick="ClearFront"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="errorText" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="PropertyDetailsUpdateProgress" runat="server" AssociatedUpdatePanelID="PropertyDetailsUpdatePanel" DynamicLayout="True">
    <ProgressTemplate>

        <div id="overlay">
            <div class="modalprogress">
                <div class="theprogress">
                    <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif"/>
                    Please wait loading data...
                </div>
            </div>
        </div>

    </ProgressTemplate>
</asp:UpdateProgress>
</div>

<div id="existingProperty" class="tabcontent">
    <asp:UpdateProgress ID="EditPropertyListingUpdateProgress" runat="server" AssociatedUpdatePanelID="EditPropertyListingUpdatePanel" DynamicLayout="True">
        <ProgressTemplate>

            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif"/>
                        Please Wait while property is being loaded ....
                    </div>
                </div>
            </div>

        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="EditPropertyListingUpdatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="PropertyEditButton"/>
        </Triggers>
        <ContentTemplate>
            <asp:Panel runat="server" groupingText="Edit Property">

                <div class="PropertyEditSelect">
                    <h2>Select the Property listing you wish to Edit</h2>
                    <asp:Repeater ID="EditPropertyRepeaterItems" runat="server">
                        <ItemTemplate>
                            <asp:Panel runat="server">
                                <div runat="server" class="blogCard editProperty" data-id='<%# Eval("ID") %>'>
                                    <span>
                                        <h1 class="blogTitle"><%# Eval("PropertyName") %></h1>
                                        <div class="blogImg">
                                            <image src="../Images/<%# Eval("MainImage") %>"></image>
                                        </div>
                                        <p class="eclipseLines"><%# GetContents(Convert.ToInt32(Eval("ID"))) %> </p>

                                    </span>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:Repeater>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="PropertyEditButton" runat="server" CssClass="hidden" OnClick="EditProperties" Text="Edit property" OnClientClick="checkEditProperty();"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="PropertyEditCancel" runat="server" CssClass="hidden" Text="Cancel" OnClientClick="canEditProperty = true; "/>
                            </td>
                        </tr>

                    </table>

                </div>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>

<div id="organiseExistingPropertys" class="tabcontent">
    <asp:UpdateProgress ID="DeleteUpdateProgress" runat="server" AssociatedUpdatePanelID="DeleteUpdatePanel" DynamicLayout="True">
        <ProgressTemplate>
            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif"/>
                        Please Wait while the property is updated ....

                    </div>
                </div>
            </div>

        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="DeleteUpdatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DeletePropertyBtn"/>
            <asp:AsyncPostBackTrigger ControlID="CheckedOrNot"/>
        </Triggers>
        <ContentTemplate>
            <div class="PropertyEditSelect">
                <h2>Select the Property you wish to Delete</h2>
                <asp:Repeater ID="DeletePropertyRepeater" runat="server">
                    <ItemTemplate>
                        <asp:Panel runat="server">
                            <div runat="server" class="blogCard PropertyDelete" data-id='<%# Eval("ID") %>'>
                                <span>
                                    <h1 class="blogTitle"><%# Eval("PropertyName") %></h1>
                                    <div class="blogImg">
                                        <image src="../Images/<%# Eval("MainImage") %>"></image>
                                    </div>
                                    <p class="eclipseLines"><%# GetContents(Convert.ToInt32(Eval("ID"))) %> </p>

                                </span>
                            </div>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:Repeater>

                <table>
                    <tr>
                        <td>
                            <asp:Button ID="DeletePropertyBtn" runat="server" CssClass="hidden" OnClick="DeletePropertyClick" Text="Delete" OnClientClick="checkDeleteProperty();"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="CancelDelete" runat="server" CssClass="hidden" Text="Cancel"  OnClientClick="canDeleteProperty = true; "/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="hidden" id="FeaturedChangedHolder">
                                <asp:CheckBox runat="server" ID="CheckedOrNot" OnCheckedChanged="FeaturedChangedOnProperty" CausesValidation="True" EnableViewState="True" AutoPostBack="True" Text="Is this a featured property ? check yes empty no"/>

                            </div>

                        </td>
                    </tr>
                </table>
            </div>
            <asp:HiddenField runat="server" ID="deletePropertyHiddenField1"></asp:HiddenField>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>
</asp:Panel>

</asp:Content>

