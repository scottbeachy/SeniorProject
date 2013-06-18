<%@ Page Title="WeServeU -Upload Completed COS-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpUploadCOS.aspx.cs" Inherits="EmpUploadCOS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
    </div>
    

     <div id="custUpload">
    <h2>Please upload you court provided documents here.</h2>
    
    <h3>WeserveU requires documents to be uploaded in PDF format.</h3>
         <h3>The documents will be uploaded to the work order selected from the previous page. </h3>
         <p>If you need to select a different work order, please return to the Server Dashboard</p>

    
    <asp:FileUpload ID="cstFileUp" runat="server" CssClass="custFileUpload" /><br /><br /><br />
    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CssClass="btnDash" /><br />
    <asp:Label ID="lblUploadStatus" runat="server" Text=""></asp:Label>
        
        </div>

</asp:Content>

