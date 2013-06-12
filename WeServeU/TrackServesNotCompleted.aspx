<%@ Page Title="WeServeU -Not Completed Serves-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TrackServesNotCompleted.aspx.cs" Inherits="ServesNotCompleted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="welcomeBox">
        <asp:Button ID="Button1" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>

    <asp:DetailsView ID="NotCompleteDetailsView" runat="server" CssClass="updateTable" Height="50px" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="WorkOrderID" DataSourceID="ServesNotCompletedDataSource" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
  <Fields>
            <asp:BoundField DataField="WorkOrderID" HeaderText="WorkOrder ID" InsertVisible="False" ReadOnly="True" SortExpression="WorkOrderID" />
            <asp:BoundField DataField="WCaseNumber" HeaderText="Case Number" SortExpression="WCaseNumber" />
            <asp:BoundField DataField="EmpID" HeaderText="Employee ID" ReadOnly="True" SortExpression="EmpID" />
            <asp:BoundField DataField="WFName" HeaderText="Service Requested By: First Name" SortExpression="WFName" />
            <asp:BoundField DataField="WLName" HeaderText="Service Requested By: Last Name" SortExpression="WLName" />
            <asp:BoundField DataField="WStatus" HeaderText="Work order status (C=complete, I=incomplete, U=unable to complete)" SortExpression="WStatus" />
            <asp:BoundField DataField="WFiledBy" HeaderText="Paperwork filed by (A=admin, S=Server)" SortExpression="WFiledBy" />
            <asp:BoundField DataField="WDateCreated" HeaderText="Date the workorder was created" SortExpression="WDateCreated" />
            <asp:BoundField DataField="WEmpBPay" HeaderText="Employee Pay" SortExpression="WEmpBPay" />
            <asp:BoundField DataField="WcertID" HeaderText="WorkOrder cert ID" SortExpression="WcertID" />
            <asp:BoundField DataField="WPaperTitle" HeaderText="Document Title" SortExpression="WPaperTitle" />
            <asp:BoundField DataField="WServeCharge" HeaderText="WorkOrder Serve Charge" SortExpression="WServeCharge" />
        </Fields>
                <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="ServesNotCompletedDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT * FROM [WorkOrder] WHERE ([WorkOrderID] = @WorkOrderID) ORDER BY [WorkOrderID]">
        <SelectParameters>
            <asp:SessionParameter Name="WorkOrderID" SessionField="WorkOrderID" Type="Decimal" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>

