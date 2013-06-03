<%@ Page Title="Update a current employee" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateEmployee.aspx.cs" Inherits="UpdateEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

