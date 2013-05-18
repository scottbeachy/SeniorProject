<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PdfTest.aspx.cs" Inherits="pdfTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCourtFiled" runat="server" Text="Court Filed: "></asp:Label>
    <asp:TextBox ID="txtCourt" runat="server"></asp:TextBox> <br />

    <asp:Label ID="lblCountyFiled" runat="server" Text="County Filed: "></asp:Label>
    <asp:TextBox ID="txtCounty" runat="server"></asp:TextBox> <br />

    <asp:Button ID="btnCreatePdf" runat="server" Text="Create PDF" OnClick="btnCreatePdf_Click" />
</asp:Content>

