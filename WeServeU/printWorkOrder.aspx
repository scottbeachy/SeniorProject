<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="printWorkOrder.aspx.cs" Inherits="printWorkOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Work Order: "></asp:Label>
    <asp:TextBox ID="txtWorkOrder" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Date: "></asp:Label>
    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label3" runat="server" Text="Client : "></asp:Label>
    <asp:TextBox ID="txtClient" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label4" runat="server" Text="Street: "></asp:Label>
    <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label5" runat="server" Text="City: "></asp:Label>
    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label6" runat="server" Text="State: "></asp:Label>
    <asp:TextBox ID="txtState" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label7" runat="server" Text="Zip Code: "></asp:Label>
    <asp:TextBox ID="txtZip" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label8" runat="server" Text="Person Served: "></asp:Label>
    <asp:TextBox ID="txtPersonServed" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label9" runat="server" Text="Service Street: "></asp:Label>
    <asp:TextBox ID="txtServiceStreet" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label10" runat="server" Text="Service City: "></asp:Label>
    <asp:TextBox ID="txtServiceCity" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label11" runat="server" Text="Service County: "></asp:Label>
    <asp:TextBox ID="txtServiceCounty" runat="server"></asp:TextBox><br />
                <asp:Label ID="Label12" runat="server" Text="Service State: "></asp:Label>
    <asp:TextBox ID="txtServiceState" runat="server"></asp:TextBox><br />
                <asp:Label ID="Label13" runat="server" Text="Service Zip Code: "></asp:Label>
    <asp:TextBox ID="txtServiceZip" runat="server"></asp:TextBox><br />
    <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" />

&nbsp;
    <asp:Button ID="btnDB" runat="server" Text="Print from DB" OnClick="btnDB_Click" />

</asp:Content>

