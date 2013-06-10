<%@ Page Title="Client Work Order" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TrackWOClient.aspx.cs" Inherits="TrackWOClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="welcomeBox">
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="WorkOrderID" DataSourceID="WOClientDataSource" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="WorkOrderID" HeaderText="WorkOrderID" InsertVisible="False" ReadOnly="True" SortExpression="WorkOrderID" />
            <asp:BoundField DataField="WCaseNumber" HeaderText="WCaseNumber" SortExpression="WCaseNumber" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="WClientStatus" HeaderText="WClientStatus" SortExpression="WClientStatus" />
            <asp:BoundField DataField="WFName" HeaderText="WFName" SortExpression="WFName" />
            <asp:BoundField DataField="WLName" HeaderText="WLName" SortExpression="WLName" />
            <asp:BoundField DataField="WToBeServed" HeaderText="WToBeServed" SortExpression="WToBeServed" />
            <asp:BoundField DataField="WServDate" HeaderText="WServDate" SortExpression="WServDate" />
            <asp:BoundField DataField="WServTime" HeaderText="WServTime" SortExpression="WServTime" />
            <asp:BoundField DataField="WFiledBy" HeaderText="WFiledBy" SortExpression="WFiledBy" />
            <asp:BoundField DataField="WDateCreated" HeaderText="WDateCreated" SortExpression="WDateCreated" />
            <asp:BoundField DataField="WcertID" HeaderText="WcertID" SortExpression="WcertID" />
            <asp:BoundField DataField="WPaperTitle" HeaderText="WPaperTitle" SortExpression="WPaperTitle" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="WOClientDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID], [WCaseNumber], [CustomerID], [WClientStatus], [WFName], [WLName], [WToBeServed], [WServDate], [WServTime], [WFiledBy], [WDateCreated], [WcertID], [WPaperTitle] FROM [WorkOrder]"></asp:SqlDataSource>
</asp:Content>

