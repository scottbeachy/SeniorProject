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
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SelectWODDL" DataTextField="WorkOrderID" DataValueField="WorkOrderID"></asp:DropDownList><br />
            <asp:SqlDataSource ID="SelectWODDL" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID], [WStatus], [WFName], [WLName] FROM [WorkOrder] WHERE ([WStatus] = @WStatus) ORDER BY [WorkOrderID]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="WStatus" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btnAssign" runat="server" Text="Assign Work" CssClass="btnDash" /><br />
            <asp:Label ID="lblAssignError" runat="server" Text=""  ForeColor="Red"  Visible="false"></asp:Label>
        </div>
        </div>
                      
                    <h3>To Update a Workorder, Please Select a Date Range Below:</h3>
                    <asp:Label ID="lblWrkDate" runat="server" Text="Begining Date:" CssClass="lblDash"></asp:Label>
                    <asp:TextBox ID="txtWrkDate1" runat="server"  ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valDate" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblWrkDate1" runat="server" Text="End Date:" CssClass="lblDash"></asp:Label>
                    <asp:TextBox ID="txtWrkDate2" runat="server"  ValidationGroup="wrkUpdate" CssClass="txtDate" ViewStateMode="Enabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valDate1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="wrkUpdate" ControlToValidate="txtWrkDate2"></asp:RequiredFieldValidator>
                    <asp:Button ID="btnUpdateWrk" runat="server" Text="Submit" CssClass="btnDash"  ValidationGroup="wrkUpdate" CausesValidation="true" OnClick="btnUpdateWrk_Click"/><br />
                    <asp:DropDownList ID="ddlUpdateWO" runat="server" Visible="false" CssClass="btnDash" ></asp:DropDownList><asp:Button ID="btnChoose" runat="server" Text="Update"                                        OnClick="btnChoose_Click"  CssClass="btnDash"/><br />
                    <asp:Label ID="lblUpdate" runat="server" Text=""  ForeColor="Red"  Visible="false"></asp:Label>
            

        
   
   
   
</div>
        
        
        

    
    
</asp:Content>

