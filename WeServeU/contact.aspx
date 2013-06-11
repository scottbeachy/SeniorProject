<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    
        <h3>Please fill out the form below to have one of our business associates contact you:</h3>
    
        <div id="contactContainer">

            <div id="AddEmp">
        <asp:Label ID="lblAddSuccess" runat="server" Text="" Visible="false" ForeColor="Green"></asp:Label><br />

        <asp:Label ID="Label1" runat="server" Text="First Name:" CssClass="lblEmail" AssociatedControlID="txtFName" ></asp:Label>
        <asp:TextBox ID="txtFName" CssClass="txtEmail" runat="server" ToolTip="First Name"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="lblEmail" AssociatedControlID="txtLName"></asp:Label>
        <asp:TextBox ID="txtLName"  runat="server" CssClass="txtEmail" ToolTip="Last Name"></asp:TextBox><br />
        <asp:Label ID="Label3" runat="server" Text="E-mail Address:" CssClass="lblEmail" AssociatedControlID="txtEmail"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="txtEmail"  ToolTip="Date of Birth"></asp:TextBox><br />
        <asp:Label ID="Label5" runat="server" Text="Message:" CssClass="lblEmail" AssociatedControlID="txtMessage"></asp:Label>
        <asp:TextBox ID="txtMessage" runat="server" CssClass="txtEmail" ToolTip="Phone Number" Height="184px" Width="377px" TextMode="MultiLine"></asp:TextBox>
                <br />

                <div class="center">
                    <asp:Button ID="Button1" runat="server" Text="Send Message" CssClass="btnDash" OnClick="Button1_Click" />
                </div>

        

        </div>


</div>

    
    </div>  
</asp:Content>

