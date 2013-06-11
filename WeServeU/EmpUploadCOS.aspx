<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpUploadCOS.aspx.cs" Inherits="EmpUploadCOS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
    </div>
    

    <div class="adminDashboard">
        <br />
        <h3>UPLOAD CERTIFICATE OF SERVICE</h3>
    
        <div class="empUploadCOS">
            Click Browse to find the Certificate Of Service to Upload, then click Upload:
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="empFileUpload" />
            <br />
            <br />
        </div>
            <asp:Button ID="Button2" runat="server" Text="Upload" CssClass="btnDash" />
        


    </div>

</asp:Content>

