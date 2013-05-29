<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpUpdateWorkOrder.aspx.cs" Inherits="EmpUpdateWorkOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>

    <asp:DetailsView ID="dtvEmploy" runat="server" Height="50px" CssClass="updateTable" AlternatingRowStyle-BackColor="#CCCCCC" AutoGenerateRows="False" DataKeyNames="WorkOrderID,CustomerID,EmpID" DataSourceID="dsEmpView" >
<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
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
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="dsEmpView" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" DeleteCommand="DELETE FROM [WorkOrder] WHERE [WorkOrderID] = @WorkOrderID AND [CustomerID] = @CustomerID AND [EmpID] = @EmpID" InsertCommand="INSERT INTO [WorkOrder] ([WCaseNumber], [CustomerID], [EmpID], [WClientStatus], [WFName], [WLName], [WOPFName], [WOPLName], [WToBeServed], [WServAdd], [WServApt], [WServCounty], [WServCity], [WServState], [WServZip], [WServedFName], [WServedLName], [WServedRel], [WCountyFiled], [WCourtFiled], [WServedHeight], [WServedWeight], [WServedHair], [WServedEye], [WServedSex], [WServedAge], [WServDate], [WServTime], [WStatus], [WFiledBy], [WDateCreated], [WEmpBPay], [WcertID], [WPaperTitle]) VALUES (@WCaseNumber, @CustomerID, @EmpID, @WClientStatus, @WFName, @WLName, @WOPFName, @WOPLName, @WToBeServed, @WServAdd, @WServApt, @WServCounty, @WServCity, @WServState, @WServZip, @WServedFName, @WServedLName, @WServedRel, @WCountyFiled, @WCourtFiled, @WServedHeight, @WServedWeight, @WServedHair, @WServedEye, @WServedSex, @WServedAge, @WServDate, @WServTime, @WStatus, @WFiledBy, @WDateCreated, @WEmpBPay, @WcertID, @WPaperTitle)" SelectCommand="SELECT * FROM [WorkOrder] WHERE (([EmpID] = @EmpID) AND ([WorkOrderID] = @WorkOrderID)) ORDER BY [WorkOrderID]" UpdateCommand="UPDATE [WorkOrder] SET [WCaseNumber] = @WCaseNumber, [WClientStatus] = @WClientStatus, [WFName] = @WFName, [WLName] = @WLName, [WOPFName] = @WOPFName, [WOPLName] = @WOPLName, [WToBeServed] = @WToBeServed, [WServAdd] = @WServAdd, [WServApt] = @WServApt, [WServCounty] = @WServCounty, [WServCity] = @WServCity, [WServState] = @WServState, [WServZip] = @WServZip, [WServedFName] = @WServedFName, [WServedLName] = @WServedLName, [WServedRel] = @WServedRel, [WCountyFiled] = @WCountyFiled, [WCourtFiled] = @WCourtFiled, [WServedHeight] = @WServedHeight, [WServedWeight] = @WServedWeight, [WServedHair] = @WServedHair, [WServedEye] = @WServedEye, [WServedSex] = @WServedSex, [WServedAge] = @WServedAge, [WServDate] = @WServDate, [WServTime] = @WServTime, [WStatus] = @WStatus, [WFiledBy] = @WFiledBy, [WDateCreated] = @WDateCreated, [WEmpBPay] = @WEmpBPay, [WcertID] = @WcertID, [WPaperTitle] = @WPaperTitle WHERE [WorkOrderID] = @WorkOrderID AND [CustomerID] = @CustomerID AND [EmpID] = @EmpID">
        <DeleteParameters>
            <asp:Parameter Name="WorkOrderID" Type="Decimal" />
            <asp:Parameter Name="CustomerID" Type="Decimal" />
            <asp:Parameter Name="EmpID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="WCaseNumber" Type="String" />
            <asp:Parameter Name="CustomerID" Type="Decimal" />
            <asp:Parameter Name="EmpID" Type="Decimal" />
            <asp:Parameter Name="WClientStatus" Type="String" />
            <asp:Parameter Name="WFName" Type="String" />
            <asp:Parameter Name="WLName" Type="String" />
            <asp:Parameter Name="WOPFName" Type="String" />
            <asp:Parameter Name="WOPLName" Type="String" />
            <asp:Parameter Name="WToBeServed" Type="String" />
            <asp:Parameter Name="WServAdd" Type="String" />
            <asp:Parameter Name="WServApt" Type="String" />
            <asp:Parameter Name="WServCounty" Type="String" />
            <asp:Parameter Name="WServCity" Type="String" />
            <asp:Parameter Name="WServState" Type="String" />
            <asp:Parameter Name="WServZip" Type="String" />
            <asp:Parameter Name="WServedFName" Type="String" />
            <asp:Parameter Name="WServedLName" Type="String" />
            <asp:Parameter Name="WServedRel" Type="String" />
            <asp:Parameter Name="WCountyFiled" Type="String" />
            <asp:Parameter Name="WCourtFiled" Type="String" />
            <asp:Parameter Name="WServedHeight" Type="String" />
            <asp:Parameter Name="WServedWeight" Type="String" />
            <asp:Parameter Name="WServedHair" Type="String" />
            <asp:Parameter Name="WServedEye" Type="String" />
            <asp:Parameter Name="WServedSex" Type="String" />
            <asp:Parameter Name="WServedAge" Type="String" />
            <asp:Parameter Name="WServDate" Type="DateTime" />
            <asp:Parameter Name="WServTime" Type="String" />
            <asp:Parameter Name="WStatus" Type="String" />
            <asp:Parameter Name="WFiledBy" Type="String" />
            <asp:Parameter Name="WDateCreated" Type="DateTime" />
            <asp:Parameter Name="WEmpBPay" Type="String" />
            <asp:Parameter Name="WcertID" Type="Decimal" />
            <asp:Parameter Name="WPaperTitle" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="EmpID" SessionField="EmpID" Type="Decimal" />
            <asp:SessionParameter Name="WorkOrderID" SessionField="workOrderID" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="WCaseNumber" Type="String" />
            <asp:Parameter Name="WClientStatus" Type="String" />
            <asp:Parameter Name="WFName" Type="String" />
            <asp:Parameter Name="WLName" Type="String" />
            <asp:Parameter Name="WOPFName" Type="String" />
            <asp:Parameter Name="WOPLName" Type="String" />
            <asp:Parameter Name="WToBeServed" Type="String" />
            <asp:Parameter Name="WServAdd" Type="String" />
            <asp:Parameter Name="WServApt" Type="String" />
            <asp:Parameter Name="WServCounty" Type="String" />
            <asp:Parameter Name="WServCity" Type="String" />
            <asp:Parameter Name="WServState" Type="String" />
            <asp:Parameter Name="WServZip" Type="String" />
            <asp:Parameter Name="WServedFName" Type="String" />
            <asp:Parameter Name="WServedLName" Type="String" />
            <asp:Parameter Name="WServedRel" Type="String" />
            <asp:Parameter Name="WCountyFiled" Type="String" />
            <asp:Parameter Name="WCourtFiled" Type="String" />
            <asp:Parameter Name="WServedHeight" Type="String" />
            <asp:Parameter Name="WServedWeight" Type="String" />
            <asp:Parameter Name="WServedHair" Type="String" />
            <asp:Parameter Name="WServedEye" Type="String" />
            <asp:Parameter Name="WServedSex" Type="String" />
            <asp:Parameter Name="WServedAge" Type="String" />
            <asp:Parameter Name="WServDate" Type="DateTime" />
            <asp:Parameter Name="WServTime" Type="String" />
            <asp:Parameter Name="WStatus" Type="String" />
            <asp:Parameter Name="WFiledBy" Type="String" />
            <asp:Parameter Name="WDateCreated" Type="DateTime" />
            <asp:Parameter Name="WEmpBPay" Type="String" />
            <asp:Parameter Name="WcertID" Type="Decimal" />
            <asp:Parameter Name="WPaperTitle" Type="String" />
            <asp:Parameter Name="WorkOrderID" Type="Decimal" />
            <asp:Parameter Name="CustomerID" Type="Decimal" />
            <asp:Parameter Name="EmpID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
