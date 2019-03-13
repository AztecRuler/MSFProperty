<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditImages.aspx.cs" Inherits="MSFProperty.Admin.EditImages" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=18.1.1.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>

        </Scripts>
    </asp:ScriptManagerProxy>
    <script>
        function preview(sender, e) {
            $("#imagePreview").css("background-image", `url(../Images/${sender.newFileName})`);
 
        }
        function UploadComplete() {}
    </script>
    <asp:UpdateProgress ID="UploadImageUpdateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DynamicLayout="True">
        <ProgressTemplate>
            <div id="overlay" >
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif" />
                        Please Wait loading ....           

                    </div>
                </div>
            </div>     

        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DeleteImage"/>
            <asp:AsyncPostBackTrigger ControlID="AsyncFileUpload1"/>
        </Triggers>
        <ContentTemplate>

            <div class="btn-group">
                <asp:Panel runat="server" ID="mainImageChangePanel" GroupingText="Upload Images">

                    <div class="leftWrapper">

                        <table>
                            <tbody>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="Label5">Image Preview</asp:Label>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="imagePreview" runat="server"/>
                              
                                    <ajaxToolkit:AsyncFileUpload OnUploadedComplete="AsyncFileUpload1_UploadedComplete" CssClass="imageasyncButtonUpload" runat="server" ID="AsyncFileUpload1" accept=".png,.jpg,.jpeg,.gif" ThrobberID="spinImg" OnClientUploadComplete="preview"/>
                                    <asp:Image ID="spinImg" runat="server" ImageUrl="../ajax-loader.gif"/>
                                    <asp:Label runat="server" ID="ErrorLabelImages" ForeColor="Red"></asp:Label>

                                </td>
                            </tr>
                       
                            </tbody>
                        </table>
                        <asp:Button runat="server" ID="Button1" Text="Load to folder" OnClick="refreshImages"/>

                    </div>

                </asp:Panel>

                <asp:Panel ID="deleteImages" runat="server" GroupingText="Images In folder">
                    <div class="leftWrapper">
                        <h2>click on a file to delete it from the folder</h2>
                        <table>
                            <tr>
                                <td>
                                    <asp:Repeater ID="ImageRepeater" runat="server">
                                            <ItemTemplate>
                                                <div class="ImageEditContainer">
                                                <asp:ImageButton CssClass="imageButtonUpload" runat="server" ImageUrl='<%# string.Format("../images/{0}", Container.DataItem) %>'/>
                                                <div class="ImageSizeDiv">file size : <%# GetImageSize(Convert.ToInt32(Container.ItemIndex)) %> kb</div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    <asp:TextBox ID="uploadedImageUrl" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                        </table>
                        <asp:Button runat="server" ID="DeleteImage" Text="Delete Image" OnClick="Image_Delete" OnClientClick="confirm('Are you sure you want to delete this image ? '); "/>

                    </div>

                </asp:Panel>

            </div>

            <asp:Label runat="server" ID="DeleteImageLabel" ForeColor="Red"></asp:Label>

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
