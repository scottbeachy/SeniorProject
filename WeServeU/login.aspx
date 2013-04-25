<%@ Page Title="WeServeU -Login Here-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="cstLoginPnl">
        <div class="loginHead">
            <h2>Customers Please Log in Here</h2>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Username:" CssClass="lblLogin"></asp:Label><asp:TextBox ID="txtCstUser" runat="server" CssClass="txtLogin" MaxLength="25"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valCstUser" runat="server" ErrorMessage="*" ControlToValidate="txtCstUser"  ForeColor="Red" ValidationGroup="cstLogintxt"></asp:RequiredFieldValidator><br />
        <asp:Label ID="Label2" runat="server" Text="Password:" CssClass="lblLogin"></asp:Label><asp:TextBox ID="txtCstPass" runat="server" TextMode="Password" CssClass="txtLogin"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valCstPass" runat="server" ErrorMessage="*" ControlToValidate="txtCstPass" ForeColor="Red" ValidationGroup="cstLogintxt"></asp:RequiredFieldValidator><br /><br />
        <asp:Button ID="btnCstLogin" runat="server" Text="Login" CssClass="btnLogin" CausesValidation="true" ValidationGroup="cstLogintxt" OnClick="btnCstLogin_Click"/>
    </div>

    <div id="empLoginPnl">
        <div class="loginHead">
            <h2>Employees Please Log in Here</h2>
        </div>
        <asp:Label ID="Label3" runat="server" Text="Username:" CssClass="lblLogin"></asp:Label><asp:TextBox ID="txtEmpUser" runat="server" CssClass="txtLogin" MaxLength="25"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valEmpUser" runat="server" ErrorMessage="*" ControlToValidate="txtEmpUser" ForeColor="Red" ValidationGroup="empLogintxt"></asp:RequiredFieldValidator><br />
        <asp:Label ID="Label4" runat="server" Text="Password:" CssClass="lblLogin"></asp:Label><asp:TextBox ID="txtEmpPass" runat="server" TextMode="Password" CssClass="txtLogin"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valEmpPass" runat="server" ErrorMessage="*" ControlToValidate="txtEmpPass" ForeColor="Red" ValidationGroup="empLogintxt"></asp:RequiredFieldValidator><br />
        <br />
        <asp:Button ID="btnEmpLogin" runat="server" Text="Login" CssClass="btnLogin" CausesValidation="true" ValidationGroup="empLogintxt"/>
    </div>
    <div id="testDiv" runat="server"></div>





</asp:Content>

