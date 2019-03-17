<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="SocialMediaEditAdmin.aspx.cs" Inherits="MSFProperty.Admin.SocialMediaEditAdmin" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="SocialUpdate">
        <ProgressTemplate>
            <div id="overlay">
                <div class="modalprogress">
                    <div class="theprogress">
                        <asp:Image class="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="../ajax-loader.gif"/>
                        Please wait while loading ...
                    </div>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel runat="server" ID="SocialUpdate">
<Triggers>
    <asp:AsyncPostBackTrigger ControlID="saveSocial"/>
</Triggers>
      <ContentTemplate>
          <table>
              <tr>
                  <td>Enter facebook link</td>
                  <td>
                      <asp:TextBox runat="server" ID="facebook"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td>Enter twitter link</td>
                  <td>
                      <asp:TextBox runat="server" ID="twitter"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td>Enter google+ link</td>
                  <td>
                      <asp:TextBox runat="server" ID="google"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td>Enter pintrst link</td>
                  <td>
                      <asp:TextBox runat="server" ID="pintrst"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td>Enter linkin link</td>
                  <td>
                      <asp:TextBox runat="server" ID="linkin"></asp:TextBox>
                  </td>
              </tr>
          </table>
          <asp:Button ID="saveSocial" runat="server" Text="Save social links" OnClick="SaveSocial_OnClick"/>
          <asp:Label runat="server" ForeColor="Red" ID="SocialError" ></asp:Label>
      </ContentTemplate>
  </asp:UpdatePanel>
    
    
    
    
    

</asp:Content>
