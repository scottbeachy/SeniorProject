<%@ Page Title="WeServeU -Login Here-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="cstLoginPnl">
        <div class="loginHead">
            <h2>Customers Please Log in Here</h2>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Username:" CssClass="lblLogin"></asp:Label><asp:TextBox ID="txtCstUser" runat="server" CssClass="txtLogin" MaxLength="25"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Password:" CssClass="lblLogin"></asp:Label><asp:TextBox ID="txtCstPass" runat="server" TextMode="Password" CssClass="txtLogin"></asp:TextBox><br />
    </div>

    <div id="empLoginPnl">
        <div class="loginHead">
            <h2>Employees Please Log in Here</h2>
        </div>
        <asp:Label ID="Label3" runat="server" Text="Username:" CssClass="lblLogin"></asp:Label><asp:TextBox ID="txtEmpUser" runat="server" CssClass="txtLogin" MaxLength="25"></asp:TextBox><br />
        <asp:Label ID="Label4" runat="server" Text="Password:" CssClass="lblLogin"></asp:Label><asp:TextBox ID="txtEmpPass" runat="server" TextMode="Password" CssClass="txtLogin"></asp:TextBox><br />
    </div>






</asp:Content>

