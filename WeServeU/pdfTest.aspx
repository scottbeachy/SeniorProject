<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PdfTest.aspx.cs" Inherits="pdfTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
    &nbsp;
    <asp:Button ID="Button1" runat="server" Text="Create New PDF" OnClick="Button1_Click" />
&nbsp; 
    <asp:Button ID="Button2" runat="server" Text="Append to Existing PDF" OnClick="Button2_Click" />
</asp:Content>

