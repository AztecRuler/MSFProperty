<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="True" CodeBehind="EditPage.aspx.cs" Inherits="MSFProperty.Admin.EditPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    <Scripts>
        <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>

    </Scripts>
</asp:ScriptManagerProxy>
<script>
    function UploadComplete(sender, args) {
        const control = document.getElementById("<%= ImageSave.ClientID %>");
        control.style.display = "block";

    }
</script>




<div class="leftWrapper">
    <span>Select a page to edit it from the list below</span>
    <div id="accordion">

        <asp:Repeater ID="rpData" runat="server">
            <ItemTemplate>
                <div class="accordion iframeAccordion" data-id="<%# Eval("ID") %>"><%# Eval("PageName") %></div>
                <div class="panel">

                    <iframe id="iframe<%# Container.ItemIndex + 1 %>" src="../<%# Eval("URL") %>.aspx" width="100%" height="800px" frameborder="0" scrolling="yes"></iframe>
                </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>
</div>
    
<asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        <div id="overlay">
            <div class="modalprogress">
                <div class="theprogress">
                    <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif" />
                    Please wait...
                </div>
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress> 
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ImageSave"/>
    </Triggers>
    <ContentTemplate>
        <div class="rightWrapper" id="AdminPanel">


            <asp:Panel runat="server" ID="ImageChangePanel">
                <span>Select where you want to get your new image from </span>
                <div class="accordion imageAccordion">Upload a new image</div>
                <div class="panel">

                    <table>
                        <tbody>

                        <tr>
                            <td>
                                <asp:Label runat="server" ID="Label2">File Upload</asp:Label>

                            </td>
                            <td>
                                <asp:Label runat="server" ID="Label1">Image Preview</asp:Label>

                                <asp:Image ID="imagePreview" runat="server"/>
                                <ajaxToolkit:AsyncFileUpload OnUploadedComplete="AsyncFileUpload1_UploadedComplete" runat="server" ID="AsyncFileUpload1" accept=".png,.jpg,.jpeg,.gif" ThrobberID="myfuimage" OnClientUploadComplete="UploadComplete"/>
                                <asp:Image ID="myfuimage" runat="server" ImageUrl="../ajax-loader.gif"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="Label3">New Image Name</asp:Label>

                            </td>
                            <td>
                                <asp:TextBox ID="imageNewName" runat="server"></asp:TextBox>
                                <asp:Label ID="Error" runat="server" Text="" style="color: red"></asp:Label>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div class="accordion imageAccordion">Use an existing image</div>
                <div class="panel">
                    <table>
                        <tr>
                            <td>
                                <asp:Panel ID="useUploadedFile" runat="server">

                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <asp:ImageButton CssClass="imageButtonUpload" runat="server" ImageUrl='<%# string.Format("../images/{0}", Container.DataItem) %>' />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:TextBox ID="uploadedImageUrl" runat="server"></asp:TextBox>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </div>

                <table id="imageprops">
                    <tbody>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label4">ImageID</asp:Label>

                        </td>
                        <td>
                            <asp:TextBox ID="ImageID" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label6">ImageUrl</asp:Label>

                        </td>
                        <td>
                            <asp:TextBox ID="ImageUrl" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label7">PageName</asp:Label>

                        </td>
                        <td>
                            <asp:TextBox ID="ImagePageName" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label8">PageId</asp:Label>

                        </td>
                        <td>
                            <asp:TextBox ID="ImagePageId" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>

                    </tbody>
                </table>
                <asp:Button runat="server" ID="ImageSave" CssClass="hidden" Text="Save" OnClick="Image_Save_Click"/>

            </asp:Panel>

            <asp:Panel runat="server" ID="TextChangePanel">
                <table>
                    <tbody>
                    <tr>

                        <td>
                            <asp:TextBox runat="server" ID="pageName" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox runat="server" ID="pageId" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="elementTextLabel">Enter New Text Here</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" TextMode="multiline" style="margin: 0px; min-width: 388px; min-height: 334px;" ID="elementText"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label5">Please select text colour</asp:Label>

                            <input runat="server" type="color" ID="textColor" name="textColor" value="#ff0000">

                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox runat="server" ID="elementNumber"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox runat="server" ID="elementType" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox runat="server" ID="elemenetLink" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <asp:Button runat="server" ID="textSave" Text="Save" OnClick="Save_Click"/>

            </asp:Panel>

        </div>

    </ContentTemplate>
</asp:UpdatePanel>
<div id="Content">
</div>

<asp:HiddenField ID="UploadedTab" runat="server"/>
<asp:HiddenField ID="hdnfldVariable" runat="server"/>

</asp:Content>
