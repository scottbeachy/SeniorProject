<%@ Page Title="Server Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpHome.aspx.cs" Inherits="EmpHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            $(".txtDate").datepicker();
        });
    </script>

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>


    <div class="adminDashboard">
        <h2>Please select your task below</h2>
        <h3>WORK ORDERS</h3>
        <div id="empSelect">
            
            <div id="woSelect">
                <p>Select a Work Order From Below:</p>
                
                <asp:DropDownList ID="ddlWOList" runat="server" DataSourceID="SelectWODDL" DataTextField="Parties"  DataValueField="WorkOrderID" OnSelectedIndexChanged="ddlWOList_SelectedIndexChanged" AutoPostBack="true">                
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
            <asp:Button ID="btnAssign" runat="server" Text="View Work Order" CssClass="btnDash2" OnClick="btnAssign_Click" /><span class="firstLine">View the current work order selected from above</span>
            <br />
            <br />
            <br />
            <asp:Button ID="btnPrintWO" runat="server" Text="Print Work Order Sheet" CssClass="btnDash2"/>Print out the Work Order Sheet to start your work order
            <br />
            <br />
            <br />
            <asp:Button ID="btnDownloadCOS" runat="server" Text="Download C.O.S." CssClass="btnDash2"/>Download the Certificate Of Service
            <br />
            <br />
            <br />
            <asp:Button ID="btnUploadCOS" runat="server" Text="Upload C.O.S." CssClass="btnDash2"/>Upload the Stamped Certificate of Service
            <br />
            <br />
            <br />
            <asp:Button ID="btnCompleteCOS" runat="server" Text="Update Account" CssClass="btnDash2"/>Update Your Account Information
            <br />
            <br />
            <br />
            <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="btnDash2" OnClick="btnLogout_Click" />Log Out of Your Account
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>

