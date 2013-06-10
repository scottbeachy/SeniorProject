<%@ Page Title="Update Client" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateClientInfo.aspx.cs" Inherits="UpdateClientInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <h3 class="updateClientHeader">To Make Updates to the Client, Please Click the "Edit" Button At The Bottom Of The Page.</h3>

    <asp:DetailsView ID="clientDetailsView" CssClass="updateTable" runat="server" Height="50px" AutoGenerateRows="False"  DataKeyNames="CustomerID" DataSourceID="UpdateClientDataSource" >
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />

<FieldHeaderStyle Width="80%"></FieldHeaderStyle>
        <Fields>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="CFname" HeaderText="CFname" SortExpression="CFname" />
            <asp:BoundField DataField="CLname" HeaderText="CLname" SortExpression="CLname" />
            <asp:BoundField DataField="CFirmName" HeaderText="CFirmName" SortExpression="CFirmName" />
            <asp:BoundField DataField="CPhone" HeaderText="CPhone" SortExpression="CPhone" />
            <asp:BoundField DataField="CFax" HeaderText="CFax" SortExpression="CFax" />
            <asp:BoundField DataField="CEmail" HeaderText="CEmail" SortExpression="CEmail" />
            <asp:BoundField DataField="CAddress" HeaderText="CAddress" SortExpression="CAddress" />
            <asp:BoundField DataField="CApt" HeaderText="CApt" SortExpression="CApt" />
            <asp:BoundField DataField="CCity" HeaderText="CCity" SortExpression="CCity" />
            <asp:BoundField DataField="CState" HeaderText="CState" SortExpression="CState" />
            <asp:BoundField DataField="CCounty" HeaderText="CCounty" SortExpression="CCounty" />
            <asp:BoundField DataField="CZip" HeaderText="CZip" SortExpression="CZip" />
            <asp:BoundField DataField="CUser" HeaderText="CUser" SortExpression="CUser" />
            <asp:BoundField DataField="CPass" HeaderText="CPass" SortExpression="CPass" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="UpdateClientDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customer]">
    </asp:SqlDataSource>
    
</asp:Content>

