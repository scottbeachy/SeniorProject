<%@ Page Title="WeServeU -Admin Dashboard-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            $(".txtDate").datepicker();
        });

        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

            function EndRequestHandler(sender, args) {
                $(".txtDate").datepicker();
            }
        });

    </script>

    <asp:ScriptManager ID="ScriptManagerAdminHome" runat="server"></asp:ScriptManager>

    <div class="welcomeBox">        
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
    </div>
    <div class="adminDashboard">
        <h2>Please select your task below</h2>
        <h3>Assign Work to a Server</h3>
        <div id="empSelect">
            <p>First Select an Employee:</p>
            <asp:DropDownList ID="ddlEmpList" runat="server" DataSourceID="EmpDDLSource" DataTextField="Employee" DataValueField="EmpID"></asp:DropDownList>
            <asp:SqlDataSource ID="EmpDDLSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT EmpID, EmpFName + ' ' + EmpLName AS Employee FROM Employee WHERE EmpStatus = 'A';"></asp:SqlDataSource>
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
        <asp:UpdatePanel ID="UpdateWorkOrderPanel" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblWrkDate" runat="server" Text="Begining Date:" CssClass="lblDash"></asp:Label>
                <asp:TextBox ID="txtWrkDate1" runat="server" ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valDate" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate1"></asp:RequiredFieldValidator>
                <asp:Label ID="lblWrkDate1" runat="server" Text="End Date:" CssClass="lblDash"></asp:Label>
                <asp:TextBox ID="txtWrkDate2" runat="server" ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valDate1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate2"></asp:RequiredFieldValidator>
                <asp:Button ID="btnUpdateWrk" runat="server" Text="Submit" CssClass="btnDash" ValidationGroup="wrkUpdate" CausesValidation="true" OnClick="btnUpdateWrk_Click" /><br />
                <asp:DropDownList ID="ddlUpdateWO" runat="server" Visible="false" CssClass="btnDash"></asp:DropDownList><asp:Button ID="btnChoose" runat="server" Text="Update" OnClick="btnChoose_Click" CssClass="btnDash" /><br />
                <asp:Label ID="lblUpdate" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>

        <h3>Add a new Employee</h3>
        <asp:Button ID="btnAddEmp" runat="server" Text="Add Employee"  CssClass="btnDash" OnClick="btnAddEmp_Click" />

        <h3>Update a Current Employee</h3>
        <p>First Select an Employee</p>
        <asp:DropDownList ID="ddlUpdateEmp" runat="server" DataSourceID="updateEmpDDL" DataTextField="Employee" DataValueField="EmpID"></asp:DropDownList>
        <asp:SqlDataSource ID="updateEmpDDL" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT EmpID, EmpFName + ' ' + EmpLName AS Employee FROM dbo.Employee ORDER BY EmpLName"></asp:SqlDataSource>
        <p>Then click this button</p>
        <asp:Button ID="btnUpdateEmp" runat="server" Text="Update Employee" CssClass="btnDash" OnClick="btnUpdateEmp_Click"/>


        <h3>Update Client Information:</h3>
        <asp:UpdatePanel ID="UpdateClientPanel" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="First Name:" CssClass="lblFirstName"></asp:Label>
                <asp:TextBox ID="txtClientFirstName" runat="server" ValidationGroup="wrkClient" CssClass="txtFirstName" ViewStateMode="Enabled"></asp:TextBox><br />
                <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="lblFirstName"></asp:Label>
                <asp:TextBox ID="txtClientLastName" runat="server" CssClass="txtFirstName" ValidationGroup="wrkClient" ViewStateMode="Enabled"></asp:TextBox><br />
                <asp:Label ID="Label4" runat="server" Text="Firm Name:" CssClass="lblFirstName"></asp:Label>
                <asp:TextBox ID="txtFirmName" runat="server" CssClass="txtFirstName" ValidationGroup="wrkClient" ViewStateMode="Enabled"></asp:TextBox><br />
                <asp:Button ID="btnUpdateClient" runat="server" Text="Submit" CssClass="btnUpdateClient" ValidationGroup="wrkClient" CausesValidation="true" OnClick="btnUpdateClient_Click" /><br />
                <asp:DropDownList ID="ddUpdateClient" runat="server" Visible="false" CssClass="btnDash"></asp:DropDownList><asp:Button ID="btnSelectClient" runat="server" Text="Select Client" CssClass="btnDash" OnClick="btnSelectClient_Click" /><br />
                <asp:Label ID="lblCLientUpdate" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>

        <h3>To Generate a Report Please Enter Dates Below:</h3>
        <asp:UpdatePanel ID="UpdateGenReportPanel" runat="server">
            <ContentTemplate>
                <asp:RadioButtonList ID="RadioButtonReport" CssClass="RadioButtonReport" runat="server" RepeatDirection="Horizontal" CellPadding="5">
<%--                    <asp:ListItem>Completed</asp:ListItem>
                    <asp:ListItem>Not Completed</asp:ListItem>--%>
                    <asp:ListItem>Client</asp:ListItem>
                    <asp:ListItem>Plaintiff/Respondent</asp:ListItem>
                </asp:RadioButtonList>

                <%--                <asp:CheckBox ID="chkGenCompleted" runat="server" Text="Completed" CssClass="chkGenReport" />
                <asp:CheckBox ID="chkGenNotCompleted" runat="server" Text="Not Completed" CssClass="chkGenReport" />
                <asp:CheckBox ID="chkGenClientName" runat="server" Text="Client" CssClass="chkGenReport" />
                <asp:CheckBox ID="chkGenRespondent" runat="server" Text="Plaintiff/Respondent" CssClass="chkGenReport" /><br />--%>
                <br />
                <asp:Label ID="lblGenStatus" runat="server" CssClass="lblGenReportStatus" Text="Status:"></asp:Label>
                <asp:TextBox ID="txtGenStatus" CssClass="txtFirstName" runat="server" ValidationGroup="wrkGenReport"></asp:TextBox>

                <asp:Label ID="lblGenFName" runat="server" Text="First Name:" CssClass="lblFirstName"></asp:Label>
                <asp:TextBox ID="txtGenFName" runat="server" ValidationGroup="wrkGenReport" CssClass="txtFirstName" ViewStateMode="Enabled"></asp:TextBox>
                <asp:Label ID="lblGenLName" runat="server" Text="Last Name:" CssClass="lblFirstName"></asp:Label>
                <asp:TextBox ID="txtGenLName" runat="server" CssClass="txtFirstName" ValidationGroup="wrkGenReport" ViewStateMode="Enabled"></asp:TextBox><br />

                <asp:Label ID="lblGenStartDate" runat="server" Text="Start Date:" CssClass="lblGenStartDate"></asp:Label>
                <asp:TextBox ID="txtStartDateRep" runat="server" ValidationGroup="wrkGenReport" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>

                <asp:Label ID="lblGenEndDate" runat="server" Text="End Date:" CssClass="lblGenEndDate"></asp:Label>
                <asp:TextBox ID="txtEndDateRep" runat="server" ValidationGroup="wrkGenReport" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>

                <asp:Button ID="btnSubmitRep" runat="server" Text="Submit" CssClass="btnSubmitRep" ValidationGroup="wrkGenReport" CausesValidation="true" OnClick="btnSubmitRep_Click" /><br />
                <asp:DropDownList ID="ddGenReport" runat="server" Visible="false" CssClass="btnDash"></asp:DropDownList><asp:Button ID="btnGenReportSubmit" runat="server" Text="Select Client" CssClass="btnDash" OnClick="btnGenReportSubmit_Click" /><br />
                <asp:Label ID="lblGenReport" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
