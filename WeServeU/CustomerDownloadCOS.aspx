<%@ Page Title="WeServeU -Download COS-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerDownloadCOS.aspx.cs" Inherits="CustomerDownloadCOS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
    </div>
    <div id="adminDashboard">
        <h2>You completed Certificate of Service will begin to download momentarily.</h2>
        <h2>You can choose to open and view the Certificate of Service or save it. </h2>


    </div>
</asp:Content>

