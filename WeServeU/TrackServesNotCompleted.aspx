<%@ Page Title="WeServeU -Not Completed Serves-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TrackServesNotCompleted.aspx.cs" Inherits="ServesNotCompleted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="welcomeBox">
        <asp:Button ID="Button1" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>

    <asp:DetailsView ID="NotCompleteDetailsView" runat="server" CssClass="updateTable" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="WorkOrderID" DataSourceID="ServesNotCompletedDataSource" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
 <Fields>
            <asp:BoundField DataField="WorkOrderID" HeaderText="Work Order ID" InsertVisible="False" ReadOnly="True" SortExpression="WorkOrderID" />
            <asp:BoundField DataField="WCaseNumber" HeaderText="Case Number" SortExpression="WCaseNumber" />
            <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="EmpID" HeaderText="Employee ID" ReadOnly="True" SortExpression="EmpID" />
            <asp:BoundField DataField="WClientStatus" HeaderText="Client Status" SortExpression="WClientStatus" />
            <asp:BoundField DataField="WFName" HeaderText="Service Requested By: First Name" SortExpression="WFName" />
            <asp:BoundField DataField="WLName" HeaderText="Service Requested By: Last Name" SortExpression="WLName" />
            <asp:BoundField DataField="WOPFName" HeaderText="Opposing Party: First Name" SortExpression="WOPFName" />
            <asp:BoundField DataField="WOPLName" HeaderText="Opposing Party: Last Name" SortExpression="WOPLName" />
            <asp:BoundField DataField="WPaperTitle" HeaderText="Document Title" SortExpression="WPaperTitle" />
            <asp:BoundField DataField="WToBeServed" HeaderText="Who to serve" SortExpression="WToBeServed" />
            <asp:BoundField DataField="WServAdd" HeaderText="Service  Street Address" SortExpression="WServAdd" />
            <asp:BoundField DataField="WServApt" HeaderText="Apartment/Suite Number" SortExpression="WServApt" />
            <asp:BoundField DataField="WServCounty" HeaderText="County" SortExpression="WServCounty" />
            <asp:BoundField DataField="WServCity" HeaderText="City" SortExpression="WServCity" />
            <asp:BoundField DataField="WServState" HeaderText="State" SortExpression="WServState" />
            <asp:BoundField DataField="WServZip" HeaderText="Zip" SortExpression="WServZip" />
            <asp:BoundField DataField="WServedFName" HeaderText="First name of person actually served if different" SortExpression="WServedFName" />
            <asp:BoundField DataField="WServedLName" HeaderText="Last name of person actually served if different" SortExpression="WServedLName" />
            <asp:BoundField DataField="WServedRel" HeaderText="Relationship to party served" SortExpression="WServedRel" />
            <asp:BoundField DataField="WCountyFiled" HeaderText="County where paperwork is filed" SortExpression="WCountyFiled" />
            <asp:BoundField DataField="WCourtFiled" HeaderText="Court where paperwork is filed" SortExpression="WCourtFiled" />
            <asp:BoundField DataField="WServedHeight" HeaderText="Person served height" SortExpression="WServedHeight" />
            <asp:BoundField DataField="WServedWeight" HeaderText="Person served weight" SortExpression="WServedWeight" />
            <asp:BoundField DataField="WServedHair" HeaderText="Person served hair color" SortExpression="WServedHair" />
            <asp:BoundField DataField="WServedEye" HeaderText="Person served eye color" SortExpression="WServedEye" />
            <asp:BoundField DataField="WServedSex" HeaderText="Sex of person served" SortExpression="WServedSex" />
            <asp:BoundField DataField="WServedAge" HeaderText="Age of person served" SortExpression="WServedAge" />
            <asp:BoundField DataField="WServDate" HeaderText="Date of Service" SortExpression="WServDate" />
            <asp:BoundField DataField="WServTime" HeaderText="Time of Service" SortExpression="WServTime" />
            <asp:BoundField DataField="WStatus" HeaderText="Work order status (C=complete, I=incomplete, U=unable to complete)" SortExpression="WStatus" />
            <asp:BoundField DataField="WFiledBy" HeaderText="Paperwork filed by (A=admin, S=Server" SortExpression="WFiledBy" />
            <asp:BoundField DataField="WDateCreated" HeaderText="Date the workorder was created" SortExpression="WDateCreated" />
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

