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
        <asp:Label ID="Label3" runat="server" Text="E-mail Address:" CssClass="lblEmail" AssociatedControlID="txtDOB"></asp:Label>
        <asp:TextBox ID="txtDOB" runat="server" CssClass="txtEmail"  ToolTip="Date of Birth"></asp:TextBox><br />
        <asp:Label ID="Label4" runat="server" Text="Subject:" CssClass="lblEmail" AssociatedControlID="txtSSN"></asp:Label>
        <asp:TextBox ID="txtSSN" runat="server" CssClass="txtEmail" ToolTip="Social Security Number"></asp:TextBox><br />
        <asp:Label ID="Label5" runat="server" Text="Message:" CssClass="lblEmail" AssociatedControlID="txtPhone"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="txtEmail" ToolTip="Phone Number" Height="184px" Width="377px" TextMode="MultiLine"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Button" />
                <br />
                <br />
                </div>
           <%-- <td  colspan="2" class="cell">
            <asp:Label ID="Label1" runat="server" Text="First Name:" CssClass="lblEmail"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="txtEmail"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="lblEmail"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="txtEmail"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="E-Mail Address:" CssClass="lblEmail"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="txtEmail"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Subject:" CssClass="lblEmail"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="txtEmail"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Write A Message Below"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox5" runat="server" Height="141px" Width="390px"></asp:TextBox>
            </td>--%>

        </div>



    <%--<div id="createAcctLblPnl">
            <asp:Label ID="Label1" runat="server" Text="First Name:" CssClass="createAcctLbl"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="createAcctLbl"></asp:Label>
            <br />
            <asp:Label ID="Label15" runat="server" Text="E-Mail Address:" CssClass="createAcctLbl"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Subject:" CssClass="createAcctLbl"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Message:" CssClass="createAcctLbl"></asp:Label>
            <br />            
            
        </div>

        <div id="createAcctTxtPnl">
            <asp:TextBox ID="txtFName" runat="server" CssClass="createAcctTxt"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtLName" runat="server" CssClass="createAcctTxt"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtEMail" runat="server" CssClass="createAcctTxt"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtSubject" runat="server" CssClass="createAcctTxt"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtMessage" runat="server" CssClass="createAcctTxt"></asp:TextBox>
            <br />           
            
        </div>
--%>


    
    </div>  
</asp:Content>

