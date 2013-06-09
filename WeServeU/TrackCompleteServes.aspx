<%@ Page Title="Completed Serves" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TrackCompleteServes.aspx.cs" Inherits="TrackCompleteServes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Button ID="Button1" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <asp:DetailsView ID="completeServes" CssClass="completeServesDetails" runat="server" Height="50px" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="CompletedServesSqlDataSource" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />

        <Fields>
            <asp:BoundField DataField="WorkOrderID" HeaderText="WorkOrderID" InsertVisible="False" ReadOnly="True" SortExpression="WorkOrderID" />
            <asp:BoundField DataField="WCaseNumber" HeaderText="WCaseNumber" SortExpression="WCaseNumber" />
            <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" />
            <asp:BoundField DataField="WStatus" HeaderText="WStatus" SortExpression="WStatus" />
            <asp:BoundField DataField="WFiledBy" HeaderText="WFiledBy" SortExpression="WFiledBy" />
            <asp:BoundField DataField="WEmpBPay" HeaderText="WEmpBPay" SortExpression="WEmpBPay" />
            <asp:BoundField DataField="WcertID" HeaderText="WcertID" SortExpression="WcertID" />
            <asp:BoundField DataField="WPaperTitle" HeaderText="WPaperTitle" SortExpression="WPaperTitle" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="CompletedServesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID], [WCaseNumber], [EmpID], [WStatus], [WFiledBy], [WEmpBPay], [WcertID], [WPaperTitle] FROM [WorkOrder]"></asp:SqlDataSource>
</asp:Content>

