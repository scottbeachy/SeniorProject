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
                <p>Select a Work Order From Below To View:</p>
                
                <asp:DropDownList ID="ddlWOList" runat="server" DataSourceID="SelectWODDL" DataTextField="Parties"  DataValueField="WorkOrderID" OnSelectedIndexChanged="ddlWOList_SelectedIndexChanged" AutoPostBack="true">                
                </asp:DropDownList><br />
                <asp:SqlDataSource ID="SelectWODDL" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID],  [WLName] + ' VS ' + [WOPLName] AS Parties FROM [WorkOrder] WHERE ([WStatus] = @WStatus) AND ([EmpID] = @EmpID) ORDER BY [WorkOrderID]">
                    <SelectParameters>
                        <asp:SessionParameter Name="EmpID" SessionField="EmpID" Type="Decimal" />
                        <asp:Parameter DefaultValue="A" Name="WStatus" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblWONum" runat="server" Text="Work Order #" Visible="false"></asp:Label><br />
                
                <asp:Button ID="btnAssign" runat="server" Text="View Work Order" CssClass="btnDash" OnClick="btnAssign_Click" /><br />
                <asp:Label ID="lblAssignError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            </div>
        </div>
        
        <h3>To Update a Workorder, Please Select a Date Range Below:</h3>
        <asp:Label ID="lblWrkDate" runat="server" Text="Begining Date:" CssClass="lblDash"></asp:Label>
        <asp:TextBox ID="txtWrkDate1" runat="server" ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valDate" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate1"></asp:RequiredFieldValidator>
        <asp:Label ID="lblWrkDate1" runat="server" Text="End Date:" CssClass="lblDash"></asp:Label>
        <asp:TextBox ID="txtWrkDate2" runat="server" ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valDate1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate2"></asp:RequiredFieldValidator>
        <asp:Button ID="btnUpdateWrk" runat="server" Text="Submit" CssClass="btnDash" ValidationGroup="wrkUpdate" CausesValidation="true" OnClick="btnUpdateWrk_Click" /><br />
        <asp:DropDownList ID="ddlUpdateWO" runat="server" Visible="false" CssClass="btnDash"></asp:DropDownList><asp:Button ID="btnChoose" runat="server" Text="Update" OnClick="btnChoose_Click"  CssClass="btnDash" /><br />
        <asp:Label ID="lblUpdate" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>

        <br />
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="btnDash" OnClick="btnLogout_Click" />

    </div>
</asp:Content>

