<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".txtDate").datepicker();
             $("#accordion").accordion({ collapsible: true, active: false, autoheight: true });
         });
        
     </script>
   
    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <div class="adminDashboard">
        <h2>Please select your task below</h2>
    </div>
    <div id="accordion">
        <h3>Assign Work to a Server</h3>
        <div>
            <p>Select an Employee:</p>
            <asp:DropDownList ID="ddlEmpList" runat="server" DataSourceID="EmpDDLSource" DataTextField="EmpFName" DataValueField="EmpID"></asp:DropDownList>
            <asp:SqlDataSource ID="EmpDDLSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [EmpID], [EmpFName], [EmpLName], [EmpStatus] FROM [Employee] WHERE ([EmpStatus] = @EmpStatus) ORDER BY [EmpID]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="EmpStatus" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <h3>Update a Work Order</h3>
        <div>
            <div class="adminDashboard">
                <h2>-Update a Workorder-</h2>
                    <h3>To Update a Workorder, Please Select a Date Range Below:</h3>
                    <asp:Label ID="lblWrkDate" runat="server" Text="Begining Date:" CssClass="lblDash"></asp:Label>
                    <asp:TextBox ID="txtWrkDate1" runat="server"  ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valDate" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblWrkDate1" runat="server" Text="End Date:" CssClass="lblDash"></asp:Label>
                    <asp:TextBox ID="txtWrkDate2" runat="server"  ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valDate1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate2"></asp:RequiredFieldValidator>
                    <asp:Button ID="btnUpdateWrk" runat="server" Text="Submit" CssClass="btnDash"  ValidationGroup="wrkUpdate" CausesValidation="true" OnClick="btnUpdateWrk_Click"/><br />
                    <asp:DropDownList ID="ddlUpdateWO" runat="server" Visible="false" CssClass="btnDash" ></asp:DropDownList><asp:Button ID="btnChoose" runat="server" Text="Update"                                        OnClick="btnChoose_Click" /><br />
                    <asp:Label ID="lblUpdate" runat="server" Text=""  ForeColor="Red"  Visible="false"></asp:Label>
            </div>
        </div>
        <h3>Update Client</h3>
        <div>
            <div class="cstUpdate">
                <h4>Update Client Information:</h4>
                <asp:Label ID="Label1" runat="server" Text="First Name:" CssClass="lblFirstName"></asp:Label>
                <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="wrkUpdate" CssClass="txtFirstName" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="wrkUpdate" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator><br />
                <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="lblFirstName"></asp:Label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="txtFirstName" ValidationGroup="wrkUpdate" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="wrkUpdate" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtLastName"></asp:RequiredFieldValidator><br />
                <asp:Label ID="Label4" runat="server" Text="Firm Name:" CssClass="lblFirstName"></asp:Label>
                <asp:TextBox ID="txtFirmName" runat="server" CssClass="txtFirstName" ValidationGroup="wrkUpdate" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="wrkUpdate" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFirmName"></asp:RequiredFieldValidator><br />
                <asp:Button ID="btnUpdate" runat="server" Text="Submit" CssClass="btnDash" ValidationGroup="wrkUpdate" CausesValidation="true" OnClick="btnUpdateWrk_Click" /><br />
                <asp:Label ID="Label3" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            </div>
        </div>
        <h3>Generate Report</h3>
        <div>
            <div class="cstGenReport">
                <h4>To Generate a Report Please Enter Dates Below:</h4>
                <asp:Label ID="Label5" runat="server" Text="Begining Date:" CssClass="lblDash"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate1"></asp:RequiredFieldValidator>
                <asp:Label ID="Label6" runat="server" Text="End Date:" CssClass="lblDash"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate2"></asp:RequiredFieldValidator>
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btnDash" ValidationGroup="wrkUpdate" CausesValidation="true" OnClick="btnUpdateWrk_Click" /><br />
                <asp:Label ID="Label7" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            </div>
        </div>
       </div>
</asp:Content>

