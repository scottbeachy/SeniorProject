<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>

        <h3>Please fill out the form below to have one of our business associates contact you:</h3>

        <div id="contactContainer">

            <div id="AddEmp">
                <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Green">Your Email Has Been Sent</asp:Label><br />

                <asp:Label ID="fname" runat="server" Text="First Name:" CssClass="lblEmail" AssociatedControlID="txtFName"></asp:Label>
                <asp:TextBox ID="txtFName" CssClass="txtEmail" runat="server" ToolTip="First Name"></asp:TextBox><br />
                <asp:Label ID="lname" runat="server" Text="Last Name:" CssClass="lblEmail" AssociatedControlID="txtLName"></asp:Label>
                <asp:TextBox ID="txtLName" runat="server" CssClass="txtEmail" ToolTip="Last Name"></asp:TextBox><br />
                <asp:Label ID="email" runat="server" Text="E-mail Address:" CssClass="lblEmail" AssociatedControlID="txtEmail"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="txtEmail" ToolTip="Date of Birth"></asp:TextBox><br />
                <asp:Label ID="message" runat="server" Text="Message:" CssClass="lblEmail" AssociatedControlID="txtMessage"></asp:Label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="txtEmail" ToolTip="Phone Number" Height="184px" Width="377px" TextMode="MultiLine"></asp:TextBox>
                <br />
                <div class="center">
                    <asp:Button ID="Button1" runat="server" Text="Send Message" CssClass="btnDash4" />
                </div>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

