<%@ Page Title="Server Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpHome.aspx.cs" Inherits="EmpHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
    </div>


    <div class="adminDashboard">
        <h2>Please select your task below</h2>
        <h3>WORK ORDERS</h3>
        <div id="empSelect">
            
            <div id="woSelect">
                <p>Select a Work Order From Below:</p>
                
                <asp:DropDownList ID="ddlWOList" runat="server" DataSourceID="SelectWODDL" DataTextField="Parties"  DataValueField="WorkOrderID"  AutoPostBack="true">                
                </asp:DropDownList><br />
                <asp:SqlDataSource ID="SelectWODDL" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID],  [WLName] + ' VS ' + [WOPLName] AS Parties FROM [WorkOrder] WHERE ([WStatus] = @WStatus) AND ([EmpID] = @EmpID) ORDER BY [WorkOrderID]">
                    <SelectParameters>
                        <asp:SessionParameter Name="EmpID" SessionField="EmpID" Type="Decimal" />
                        <asp:Parameter DefaultValue="A" Name="WStatus" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblWONum" runat="server" Text="Work Order #" Visible="false"></asp:Label>
                <br />
                
                <%--<asp:Label ID="lblAssignError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>--%>
            </div>
        </div>
        <div class="btnMenuEmp">
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnEmpUpdate" runat="server" Text="View Work Order" CssClass="btnDash2" OnClick="btnEmpUpdate_Click" />
                <asp:Label ID="Label1" runat="server" Text="View the current work order selected from above" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnAddNotes" runat="server" Text="Add Notes" CssClass="btnDash2" OnClick="btnAddNotes_Click"/>
                <asp:Label ID="Label7" runat="server" Text="Add Notes to the Work Order Selected" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnPrintWO" runat="server" Text="Print Work Order Sheet" CssClass="btnDash2" OnClick="btnPrintWO_Click" />
                <asp:Label ID="Label2" runat="server" Text="Print out the Work Order Sheet to start your work order" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnDownloadCOS" runat="server" Text="Download C.O.S." CssClass="btnDash2" OnClick="btnDownloadCOS_Click" />
                <asp:Label ID="Label3" runat="server" Text="Download the Certificate Of Service" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;</div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnUploadCOS" runat="server" Text="Upload C.O.S." CssClass="btnDash2" OnClick="btnUploadCOS_Click" />
                <asp:Label ID="Label4" runat="server" Text="Upload the Stamped Certificate of Service" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;<br />
            </div>
            <br />
            <div class="btnMenuEmpItem">
                <asp:Button ID="btnCompleteCOS" runat="server" Text="Update Account" CssClass="btnDash2" />
                <asp:Label ID="Label5" runat="server" Text="Update Your Account Information" CssClass="btnDash3"></asp:Label>
                <br />
                &nbsp;</div>
            <br />
            
            
            <br />
        </div>
    </div>
</asp:Content>

