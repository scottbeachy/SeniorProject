<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

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
        <h3>Assign Work to a Server</h3>
        <div id="empSelect">
            <p>First Select an Employee:</p>
            <asp:DropDownList ID="ddlEmpList" runat="server" DataSourceID="EmpDDLSource" DataTextField="EmpFName" DataValueField="EmpID"></asp:DropDownList>
            <asp:SqlDataSource ID="EmpDDLSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [EmpID], [EmpLName], [EmpFName], [EmpStatus] FROM [Employee] WHERE ([EmpStatus] = @EmpStatus) ORDER BY [EmpID]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="EmpStatus" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div id="woSelect">
                <p>Select a Work Order to Assign and Click Assign Work Below:</p>
                
                <asp:DropDownList ID="ddlWOList" runat="server" DataSourceID="SelectWODDL" DataTextField="Parties"  DataValueField="WorkOrderID" OnSelectedIndexChanged="ddlWOList_SelectedIndexChanged" AutoPostBack="true">                
                </asp:DropDownList><br />
                <asp:SqlDataSource ID="SelectWODDL" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID],  [WLName] + ' VS ' + [WOPLName] AS Parties FROM [WorkOrder] WHERE ([WStatus] = @WStatus) ORDER BY [WorkOrderID]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="A" Name="WStatus" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblWONum" runat="server" Text="Work Order #" Visible="false"></asp:Label><br />
                
                <asp:Button ID="btnAssign" runat="server" Text="Assign Work" CssClass="btnDash" OnClick="btnAssign_Click" /><br />
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




        <h3>Update Client Information:</h3>
        <asp:Label ID="lblClientID" runat="server" CssClass="lblUpdateClientID" Text="ID:"></asp:Label>
        <asp:TextBox ID="txtClientID" CssClass="txtFirstName" runat="server" ValidationGroup="wrkClient"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="wrkClient" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtClientID"></asp:RequiredFieldValidator><br />
        <asp:Label ID="Label1" runat="server" Text="First Name:" CssClass="lblFirstName"></asp:Label>
        <asp:TextBox ID="txtClientFirstName" runat="server" ValidationGroup="wrkClient" CssClass="txtFirstName" ViewStateMode="Enabled"></asp:TextBox><br />
<%--        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="wrkClient" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtClientFirstName"></asp:RequiredFieldValidator><br />--%>
        <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="lblFirstName"></asp:Label>
        <asp:TextBox ID="txtClientLastName" runat="server" CssClass="txtFirstName" ValidationGroup="wrkClient" ViewStateMode="Enabled"></asp:TextBox><br />
<%--        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="wrkClient" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtClientLastName"></asp:RequiredFieldValidator><br />--%>
        <asp:Label ID="Label4" runat="server" Text="Firm Name:" CssClass="lblFirstName"></asp:Label>
        <asp:TextBox ID="txtFirmName" runat="server" CssClass="txtFirstName" ValidationGroup="wrkClient" ViewStateMode="Enabled"></asp:TextBox><br />
<%--        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="wrkClient" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFirmName"></asp:RequiredFieldValidator><br />--%>
        <asp:Button ID="btnUpdateClient" runat="server" Text="Submit" CssClass="btnUpdateClient" ValidationGroup="wrkClient" CausesValidation="true" OnClick="btnUpdateClient_Click" /><br />
        <asp:DropDownList ID="ddUpdateClient" runat="server" Visible="false" CssClass="btnDash"></asp:DropDownList><asp:Button ID="btnSelectClient" runat="server" Text="Select Client" CssClass="btnDash" OnClick="btnSelectClient_Click" /><br />
        <asp:Label ID="lblCLientUpdate" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>

        <h3>To Generate a Report Please Enter Dates Below:</h3>
        <asp:Label ID="Label5" runat="server" Text="Begining Date:" CssClass="lblDash"></asp:Label>
        <asp:TextBox ID="txtStartDateRep" runat="server" ValidationGroup="wrkReport" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkReport" ControlToValidate="txtStartDateRep"></asp:RequiredFieldValidator>
        <asp:Label ID="Label6" runat="server" Text="End Date:" CssClass="lblDash"></asp:Label>
        <asp:TextBox ID="txtEndDateRep" runat="server" ValidationGroup="wrkReport" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkReport" ControlToValidate="txtEndDateRep"></asp:RequiredFieldValidator>
        <asp:Button ID="btnSubmitRep" runat="server" Text="Submit" CssClass="btnDash" ValidationGroup="wrkReport" CausesValidation="true" /><br />
        <asp:Label ID="lblGenReport" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>

    </div>
</asp:Content>
