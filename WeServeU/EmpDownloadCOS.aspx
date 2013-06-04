<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpDownloadCOS.aspx.cs" Inherits="EmpDownloadCOS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
    </div>

    <div class="adminDashboard">
        <br />
        <h3>DOWNLOAD CERTIFICATE OF SERVICE</h3>
        <br />

        <div class="cosRadio">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server"></asp:RadioButtonList>
        </div>



    </div>

</asp:Content>

