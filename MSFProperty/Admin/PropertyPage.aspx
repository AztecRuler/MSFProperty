<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="PropertyPage.aspx.cs" Inherits="MSFProperty.Admin.PropertyPage" %>

<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>
        </Scripts>
    </asp:ScriptManagerProxy>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Property">
        <div class="tab">
            <button class="tablinks active" id="createNewBlog" onclick="OpenBlogTab(event, 'createBlog', 1)">Create A New Property Listing</button>
            <button class="tablinks" id="editBlog" onclick="OpenBlogTab(event, 'existingBlog', 2)">Edit An Existing Property Listing</button>
            <button class="tablinks" id="organizeBlog" onclick="OpenBlogTab(event, 'organiseExistingBlogs', 3)">Organise Existing Property Listing</button>
        </div>

        <div id="createBlog" class="tabcontent" style="display: table;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
                    <asp:PostBackTrigger ControlID="SaveButton" />
                    <asp:PostBackTrigger ControlID="PostCodeLookUp" />
                    <asp:PostBackTrigger ControlID="ClearTextBoxes" />


                </Triggers>
                <ContentTemplate>
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
                                        <asp:Button ID="PostCodeLookUp" runat="server" Text="Get Address From Postcode" OnClick="PostCodeLookUp_Click" />

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
                                        <asp:Button ID="ClearTextBoxes" runat="server" Text="Clear Boxes" OnClick="ClearTextBoxes_Click"  />
                                    </td>
                                </tr>
                            </table>
                            <iframe src="" width="1000" runat="server" frameborder="0" id="mapForPostcode" style="border: 0"></iframe>

                        </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server" GroupingText="Property Details">

                            <table>
                                <tr>
                                    <td>
                                        <asp:Label runat="server">Enter the Name of the property here </asp:Label>
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
                                        <asp:FileUpload runat="server" ID="propertyImage"></asp:FileUpload>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server">Is this a featured property ? check yes empty no</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="propertyPopularCheck" runat="server" />
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
                                        <asp:CheckBox ID="PetCheckBox" runat="server" />
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
                                        <input type="text" id="datepicker1" readonly>
                                        </p>
                                        <asp:HiddenField ID="datepicker1Value" runat="server" />
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
                                        <input type="text" id="datepicker2" readonly>
                                        </p>
                                        <asp:HiddenField ID="datepicker2Value" runat="server" />

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
                                        <asp:Label runat="server">Enter the Address of the property here </asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server">upload the property images here </asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:FileUpload ID="PropertyImages" runat="server" AllowMultiple="true" />
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label runat="server">Enter the property Blurb into the box and press save to save the property</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <FTB:FreeTextBox ID="PropertyBlurb" runat="Server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveNewProperty" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="errorText" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <%--        <div id="existingBlog" class="tabcontent">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
                    <asp:PostBackTrigger ControlID="SaveEditBlog" />

                </Triggers>
                <ContentTemplate>

                    <div class="blogEditSelect">
                        <h2>Select the Blog you wish to Edit</h2>
                        <asp:Repeater ID="EditBlogRepeaterItems" runat="server">

                            <ItemTemplate>
                                <asp:Panel runat="server">
                                    <div runat="server" class="blogCard" data-id='<%#Eval("ID") %>' data-name='<%#Eval("Name") %>' data-date='<%#Eval("Date") %>' data-title='<%#Eval("Title") %>' data-contents='<%#Eval("Contents") %>' data-image='<%#Eval("ImageUrl") %>' data-popular='<%#Eval("Popular") %>'>
                                        <span>
                                            <h1 class="blogTitle"><%# Eval("Title") %></h1>
                                            <span class="BlogNameAndDate"><%# Eval("Name") %> <%# Eval("Date") %></span>
                                            <div class="blogImg">
                                                <image src="../Images/<%# Eval("ImageUrl") %>"></image>
                                            </div>

                                        </span>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="blogEditPanel hidden">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Blog Name</asp:Label>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="blogEditTextBox1"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Blog Title</asp:Label>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="blogEditTextBox2"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Blog Image</asp:Label>
                                </td>

                                <td>
                                    <div id="imagePreview" style="background-image: url(&quot;http://localhost:41121/Images/MSF-edinburghView.jpg&quot;);">
                                        <asp:FileUpload runat="server" ID="blogEditFileUpload1"></asp:FileUpload>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Popular</asp:Label>
                                </td>

                                <td>
                                    <asp:CheckBox ID="blogEditCheckBox1" runat="server" ReadOnly="true" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Previous Blog Contents</asp:Label>
                                </td>

                                <td>
                                    <div id="textBoxPrevious" runat="Server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server">Blog Contents</asp:Label>
                                </td>

                                <td>
                                    <ftb:freetextbox id="blogEditFreeTextBox2" runat="Server" />
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="SaveEditBlog" runat="server" Text="Save" OnClick="EditBlogSaveButton_Click" />
                                </td>
                            </tr>
                            <tr class="hidden">
                                <td>
                                    <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <asp:HiddenField runat="server" ID="editBlogId"></asp:HiddenField>
                                </td>
                            </tr>
                        </table>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="organiseExistingBlogs" class="tabcontent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <Triggers>
                    <asp:PostBackTrigger ControlID="SaveEditBlog" />

                </Triggers>
                <ContentTemplate>

                    <div class="blogEditSelect">
                        <h2>Select the Blog you wish to Delete</h2>
                        <asp:Repeater ID="Repeater1" runat="server">

                            <ItemTemplate>
                                <asp:Panel runat="server">
                                    <div runat="server" class="blogCardDelete" data-id='<%# Eval("ID") %>' data-name='<%#Eval("Name") %>' data-date='<%#Eval("Date") %>' data-title='<%#Eval("Title") %>' data-contents='<%#Eval("Contents") %>' data-image='<%#Eval("ImageUrl") %>' data-popular='<%#Eval("Popular") %>'>
                                        <span>
                                            <h1 class="blogTitle"><%# Eval("Title") %></h1>
                                            <span class="BlogNameAndDate"><%# Eval("Name") %> <%# Eval("Date") %></span>
                                            <div class="blogImg">
                                                <image src="../Images/<%# Eval("ImageUrl") %>"></image>
                                            </div>
                                            <asp:Button class="blogDeleteButton" runat="server" data-name='<%#Eval("Name") %>' Text="Delete" OnClick="EditBlogDeleteButton_Click" />
                                        </span>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <asp:HiddenField runat="server" ID="delteHiddenField1"></asp:HiddenField>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>--%>
    </asp:Panel>

</asp:Content>

