<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditImages.aspx.cs" Inherits="MSFProperty.Admin.EditImages" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Javascript/adminJavaScript.js"></asp:ScriptReference>
        </Scripts>
    </asp:ScriptManagerProxy>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="ImageSave" />
            <asp:AsyncPostBackTrigger ControlID="DeleteImage" />
        </Triggers>
        <ContentTemplate>

            <div class="btn-group">
           <asp:Panel runat="server" ID="mainImageChangePanel">

                    <div class="accordion imageAccordion leftWrapper">Upload a new image</div>
                    <div class="panel leftWrapper">

                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="Label1">Image Preview</asp:Label>

                                    </td>
                                    <td>
                                        <asp:Image ID="imagePreview" class="editImagePreview" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="Label2">File Upload</asp:Label>

                                    </td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="Label3">New Image Name</asp:Label>

                                    </td>
                                    <td>
                                        <asp:TextBox ID="imageNewName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                                            <asp:Button runat="server" ID="ImageSave" Text="Save" OnClick="Image_Save_Click" />

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

                </asp:Panel>

     <asp:Panel ID="deleteImages" runat="server">
                            <div class="accordion imageAccordion leftWrapper">Delete an existing image</div>
                    <div class="panel leftWrapper"">
                        <table>
                            <tr>
                                <td>
                                    <asp:Panel ID="useUploadedFile" runat="server">

                                        <asp:Repeater ID="ImageRepeater" runat="server">
                                            <ItemTemplate>
                                                <asp:ImageButton CssClass="imageButtonUpload" runat="server" ImageUrl='<%# string.Format("../images/{0}", Container.DataItem.ToString() )%>' />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:TextBox ID="uploadedImageUrl" runat="server"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        <asp:Button runat="server" ID="DeleteImage" Text="Delete Image" OnClick="Image_Delete" />

                    </div>

            </asp:Panel>

</div>
      
       
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="Content">
    </div>

    <asp:HiddenField ID="UploadedTab" runat="server" />
    <asp:HiddenField ID="hdnfldVariable" runat="server" />


</asp:Content>
