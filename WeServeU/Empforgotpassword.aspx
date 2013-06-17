<%@ Page Title="WeServeU -Password Retrieval-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Empforgotpassword.aspx.cs" Inherits="Empforgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="forgotpassword">
        <p>Please provide the information below and your password will be emailed to the email address that is associated with your account.</p>
        <p>If you do not know the information please contact the administrator using the <a href="contact.aspx">Contact</a> page.  </p>

        <asp:Label ID="lblFName" runat="server" Text="First Name: " CssClass="lblForgot"></asp:Label>
        <asp:TextBox ID="txtFName" runat="server" CssClass="txtForgot"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valFName" runat="server" ErrorMessage="*Required*" ControlToValidate="txtFName" ValidationGroup="forgot" ForeColor="Red"></asp:RequiredFieldValidator><br />

         <asp:Label ID="lblLName" runat="server" Text="Last Name: " CssClass="lblForgot"></asp:Label>
        <asp:TextBox ID="txtLName" runat="server" CssClass="txtForgot"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valLName" runat="server" ErrorMessage="*Required*" ControlToValidate="txtLName" ValidationGroup="forgot" ForeColor="Red"></asp:RequiredFieldValidator><br />
        
         <asp:Label ID="lblUser" runat="server" Text="User Name: " CssClass="lblForgot"></asp:Label>
        <asp:TextBox ID="txtUser" runat="server" CssClass="txtForgot"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valUser" runat="server" ErrorMessage="*Required*" ControlToValidate="txtUser" ValidationGroup="forgot" ForeColor="Red"></asp:RequiredFieldValidator><br />

        <asp:Button ID="btnRetrieve" runat="server" Text="Get Password" ValidationGroup="forgot" CssClass="btnDash" OnClick="btnRetrieve_Click" /><br />
        <asp:Label ID="lblSucc" runat="server" Text="" ForeColor="Green" Visible="false"></asp:Label>
    </div>

</asp:Content>

