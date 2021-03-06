﻿<%@ Page Title="WeServeU -Update Work Order-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateWorkOrder.aspx.cs" Inherits="UpdateWorkOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />        
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <h3>Update Work Order View. To Make Updates, Please Click the "Edit" Button At The Bottom Of The Page.</h3>
    
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" DataSourceID="UpdateWODataSource" AutoGenerateRows="False" DataKeyNames="WorkOrderID,CustomerID,EmpID" CssClass="updateTable" AlternatingRowStyle-BackColor="#CCCCCC" >
<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
        <Fields>
            <asp:BoundField DataField="WorkOrderID" HeaderText="Work Order ID" InsertVisible="False" ReadOnly="True" SortExpression="WorkOrderID" ConvertEmptyStringToNull="false" />
            <asp:BoundField DataField="WCaseNumber" HeaderText="Case Number" SortExpression="WCaseNumber" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" ReadOnly="True" SortExpression="CustomerID" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="EmpID" HeaderText="Employee ID" ReadOnly="True" SortExpression="EmpID" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WClientStatus" HeaderText="Client Status (PL = Plaintiff, DE = Defendent, PE = Petitioner, RE = Respondent)" SortExpression="WClientStatus" ConvertEmptyStringToNull="false" />
            <asp:BoundField DataField="WFName" HeaderText="Service Requested By: First Name" SortExpression="WFName"  ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WLName" HeaderText="Service Requested By: Last Name" SortExpression="WLName" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WOPFName" HeaderText="Opposing Party: First Name" SortExpression="WOPFName" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WOPLName" HeaderText="Opposing Party: Last Name" SortExpression="WOPLName" ConvertEmptyStringToNull="false" />
            <asp:BoundField DataField="WPaperTitle" HeaderText="Document Title" SortExpression="WPaperTitle" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WToBeServed" HeaderText="Who to serve" SortExpression="WToBeServed" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServAdd" HeaderText="Service  Street Address" SortExpression="WServAdd" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServApt" HeaderText="Apartment/Suite Number" SortExpression="WServApt" ConvertEmptyStringToNull="false" />
            <asp:BoundField DataField="WServCounty" HeaderText="County" SortExpression="WServCounty" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServCity" HeaderText="City" SortExpression="WServCity" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServState" HeaderText="State" SortExpression="WServState" ConvertEmptyStringToNull="false" />
            <asp:BoundField DataField="WServZip" HeaderText="Zip" SortExpression="WServZip" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServedFName" HeaderText="First name of person actually served if different" SortExpression="WServedFName" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServedLName" HeaderText="Last name of person actually served if different" SortExpression="WServedLName" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServedRel" HeaderText="Relationship to party served" SortExpression="WServedRel" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WCountyFiled" HeaderText="County where paperwork is filed" SortExpression="WCountyFiled" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WCourtFiled" HeaderText="Court where paperwork is filed" SortExpression="WCourtFiled" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServedHeight" HeaderText="Person served height" SortExpression="WServedHeight" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServedWeight" HeaderText="Person served weight" SortExpression="WServedWeight" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServedHair" HeaderText="Person served hair color" SortExpression="WServedHair" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServedEye" HeaderText="Person served eye color" SortExpression="WServedEye" ConvertEmptyStringToNull="false" />
            <asp:BoundField DataField="WServedSex" HeaderText="Sex of person served (M for male and F for female)" SortExpression="WServedSex" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServedAge" HeaderText="Age of person served" SortExpression="WServedAge" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WServDate" HeaderText="Date of Service" SortExpression="WServDate"  DataFormatString="{0:d}" ConvertEmptyStringToNull="true"/>
            <asp:BoundField DataField="WServTime" HeaderText="Time of Service" SortExpression="WServTime" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WStatus" HeaderText="Work order status (C=complete, I=incomplete, U=unable to complete, A=active)" SortExpression="WStatus" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WFiledBy" HeaderText="Paperwork filed by (A=admin, S=Server)" SortExpression="WFiledBy" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WDateCreated" HeaderText="Date the workorder was created" SortExpression="WDateCreated" ConvertEmptyStringToNull="true" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="WServeCharge" HeaderText="Price of the serve" SortExpression="WServeCharge" ConvertEmptyStringToNull="false"/>
            <asp:BoundField DataField="WEmpBPay" HeaderText="Employee Bonus Pay" SortExpression="WEmpBPay" ConvertEmptyStringToNull="false" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>      
    <asp:SqlDataSource ID="UpdateWODataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT * FROM [WorkOrder] WHERE ([WorkOrderID] = @WorkOrderID) ORDER BY [WorkOrderID]" DeleteCommand="DELETE FROM [WorkOrder] WHERE [WorkOrderID] = @WorkOrderID" InsertCommand="INSERT INTO [WorkOrder] ([WCaseNumber], [CustomerID], [EmpID], [WClientStatus], [WFName], [WLName], [WOPFName], [WOPLName], [WToBeServed], [WServAdd], [WServApt], [WServCounty], [WServCity], [WServState], [WServZip], [WServedFName], [WServedLName], [WServedRel], [WCountyFiled], [WCourtFiled], [WServedHeight], [WServedWeight], [WServedHair], [WServedEye], [WServedSex], [WServedAge], [WServDate], [WServTime], [WStatus], [WFiledBy], [WDateCreated], [WEmpBPay], [WcertID], [WPaperTitle], [WServeCharge]) VALUES (@WCaseNumber, @CustomerID, @EmpID, @WClientStatus, @WFName, @WLName, @WOPFName, @WOPLName, @WToBeServed, @WServAdd, @WServApt, @WServCounty, @WServCity, @WServState, @WServZip, @WServedFName, @WServedLName, @WServedRel, @WCountyFiled, @WCourtFiled, @WServedHeight, @WServedWeight, @WServedHair, @WServedEye, @WServedSex, @WServedAge, @WServDate, @WServTime, @WStatus, @WFiledBy, @WDateCreated, @WEmpBPay, @WcertID, @WPaperTitle, @WServeCharge)" UpdateCommand="UPDATE [WorkOrder] SET [WCaseNumber] = @WCaseNumber, [CustomerID] = @CustomerID, [EmpID] = @EmpID, [WClientStatus] = @WClientStatus, [WFName] = @WFName, [WLName] = @WLName, [WOPFName] = @WOPFName, [WOPLName] = @WOPLName, [WToBeServed] = @WToBeServed, [WServAdd] = @WServAdd, [WServApt] = @WServApt, [WServCounty] = @WServCounty, [WServCity] = @WServCity, [WServState] = @WServState, [WServZip] = @WServZip, [WServedFName] = @WServedFName, [WServedLName] = @WServedLName, [WServedRel] = @WServedRel, [WCountyFiled] = @WCountyFiled, [WCourtFiled] = @WCourtFiled, [WServedHeight] = @WServedHeight, [WServedWeight] = @WServedWeight, [WServedHair] = @WServedHair, [WServedEye] = @WServedEye, [WServedSex] = @WServedSex, [WServedAge] = @WServedAge, [WServDate] = @WServDate, [WServTime] = @WServTime, [WStatus] = @WStatus, [WFiledBy] = @WFiledBy, [WDateCreated] = @WDateCreated, [WEmpBPay] = @WEmpBPay, [WcertID] = @WcertID, [WPaperTitle] = @WPaperTitle, [WServeCharge] = @WServeCharge WHERE [WorkOrderID] = @WorkOrderID">
        <DeleteParameters>
            <asp:Parameter Name="WorkOrderID" Type="Decimal" />
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
            <asp:Parameter Name="WServeCharge" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="WorkOrderID" SessionField="WorkOrderID" Type="Decimal" DefaultValue="10" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="WCaseNumber" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="CustomerID" Type="Decimal" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="EmpID" Type="Decimal" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WClientStatus" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WFName" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WLName" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="WOPFName" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WOPLName" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WToBeServed" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServAdd" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServApt" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServCounty" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServCity" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServState" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServZip" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServedFName" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServedLName" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="WServedRel" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="WCountyFiled" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WCourtFiled" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServedHeight" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="WServedWeight" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="WServedHair" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServedEye" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServedSex" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServedAge" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServDate" Type="DateTime" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServTime" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WStatus" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WFiledBy" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="WDateCreated" Type="DateTime" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WEmpBPay" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WcertID" Type="Decimal" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WPaperTitle" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WServeCharge" Type="Decimal" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="WorkOrderID" Type="Decimal" ConvertEmptyStringToNull="false"/>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

