<%@ Page Title="WeServeU -Download COS-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpDownloadCOS.aspx.cs" Inherits="EmpDownloadCOS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />

    </div>

    <div class="adminDashboard">
        <br />
        <h3>DOWNLOAD CERTIFICATE OF SERVICE</h3>
        
        <div class="cosRadio">
            <asp:RadioButtonList ID="rblDownloadCOS" runat="server" CausesValidation="True" CellPadding="10" CssClass="radioButtonCOS" TextAlign="Right" RepeatLayout="Table" RepeatColumns="1">
                <asp:ListItem Text="Superior Substitute" Value="superiorSub"></asp:ListItem>
                <asp:ListItem Text="Superior Personal" Value="superiorPersonal"></asp:ListItem>
                <asp:ListItem Text="Justice Substitute" Value="justiceSub"></asp:ListItem>
                <asp:ListItem Text="Justice Personal" Value="justicePersonal"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <br />
        <div>
            <asp:Button ID="btnEmpDownloadCOS" runat="server" Text="Download C.O.S."  class="btnDash" OnClick="btnEmpDownloadCOS_Click" />
        </div>
        <br />
        <br />



    </div>

</asp:Content>

