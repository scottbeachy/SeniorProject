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
                <br />
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnUpdateAccount" runat="server" Text="Update Account" CssClass="btnDash2" OnClick="btnUpdateAccount_Click" />
                <asp:Label ID="Label3" runat="server" Text="Update Your Customer Account Information" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnDownloadCOS" runat="server" Text="Download C.O.S." CssClass="btnDash2" OnClick="btnDownloadCOS_Click" />
                <asp:Label ID="Label4" runat="server" Text="Download the Completed Certificate of Service" CssClass="btnDash3"></asp:Label>
                <br />
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

