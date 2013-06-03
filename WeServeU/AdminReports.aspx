<%@ Page Title="Reports" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminReports.aspx.cs" Inherits="AdminReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <h1>This is the Admin Reports Page -Elmer-</h1>
<%--    <div class="cstGenReport">
                <h4>To Generate a Report Please Enter Dates Below:</h4>
                <asp:Label ID="Label5" runat="server" Text="Begining Date:" CssClass="lblDash"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate1"></asp:RequiredFieldValidator>
                <asp:Label ID="Label6" runat="server" Text="End Date:" CssClass="lblDash"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate2"></asp:RequiredFieldValidator>
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btnDash" ValidationGroup="wrkUpdate" CausesValidation="true" OnClick="btnUpdateWrk_Click" /><br />
                <asp:Label ID="Label7" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            </div>--%>
</asp:Content>

