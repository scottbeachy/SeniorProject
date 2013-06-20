<%@ Page Title="WeServeU -Customer Dashboard-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerHome.aspx.cs" Inherits="CustomerHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
    </div>

    <div class="adminDashboard">
        <h2>Please select your task below</h2>
        <h3>CUSTOMER DASHBOARD</h3>


        <div class="btnMenuEmp">
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnCreateWorkOrder" runat="server" Text="Create Work Order" CssClass="btnDash2" OnClick="btnCreateWorkOrder_Click" />
                <asp:Label ID="Label1" runat="server" Text="Create a New Work Order to be Served" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnViewWorkOrder" runat="server" Text="View Work Order" CssClass="btnDash2" OnClick="btnViewWorkOrder_Click" />
                <asp:Label ID="Label2" runat="server" Text="View One Of Your Current Work Orders" CssClass="btnDash3"></asp:Label>
                <br /><br />
                <asp:Panel ID="pnlViewWO" runat="server" Visible="false" CssClass="pnlViewWO" Width="100%">
                    <asp:DropDownList ID="ddlCustWO" runat="server" Width="300px" DataSourceID="CustWODataSource" DataTextField="Parties" DataValueField="WorkOrderID"></asp:DropDownList>

                    <asp:SqlDataSource ID="CustWODataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT WorkOrderID, CAST([WorkOrderID] AS varchar(20)) + ' ' + WLName + ' VS ' + WOPLName AS Parties 
FROM WorkOrder
WHERE CustomerID = @CustomerID
ORDER BY WorkOrderID">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="10" Name="CustomerID" SessionField="CustID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="btnViewWO" runat="server" Text="View" CssClass="btnDash" OnClick="btnViewWO_Click" />
                </asp:Panel>
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnUpdateAccount" runat="server" Text="Update Account" CssClass="btnDash2" OnClick="btnUpdateAccount_Click" />
                <asp:Label ID="Label3" runat="server" Text="Update Your Customer Account Information" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnDownloadCOS" runat="server" Text="Download COS" CssClass="btnDash2" OnClick="btnDownloadCOS_Click" />

                <asp:Label ID="Label4" runat="server" Text="Download the Completed Certificate of Service" CssClass="btnDash3"></asp:Label>
                <br />
                <br />
                <asp:Panel ID="pnlDwnCos" runat="server" Visible="false" CssClass="pnlViewWO" Width="100%">
                    <asp:Label ID="lblChooseCos" runat="server" Text="First, choose a work order number"></asp:Label><br /><br />
                    <asp:DropDownList ID="ddlCustCos" runat="server" Width="300px" DataSourceID="CustWODataSource" DataTextField="Parties" DataValueField="WorkOrderID"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT WorkOrderID, CAST([WorkOrderID] AS varchar(20)) + ' ' + WLName + ' VS ' + WOPLName AS Parties 
FROM WorkOrder
WHERE CustomerID = @CustomerID
ORDER BY WorkOrderID">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="10" Name="CustomerID" SessionField="CustID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="btnDownLoad" runat="server" Text="Download Now" CssClass="btnDash" OnClick="btnDownLoad_Click"  />
                </asp:Panel>
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnGoToUpload" runat="server" Text="Upload Documents" CssClass="btnDash2" OnClick="btnGoToUpload_Click"/>
                <asp:Label ID="Label6" runat="server" Text="Upload Documents for a Work Order" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;</div>
            <br />
            <br />
            <br />
        </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    </div>



</asp:Content>

