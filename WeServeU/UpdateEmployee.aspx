<%@ Page Title="Update a current employee" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateEmployee.aspx.cs" Inherits="UpdateEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <h3>Update Employee View. To Make Updates, Please Click the "Edit" Button At The Bottom Of The Page.</h3>
    <asp:DetailsView ID="dtvUpdateEmp" runat="server" Height="50px" CssClass="updateTable" AlternatingRowStyle-BackColor="#CCCCCC" AutoGenerateRows="False" DataKeyNames="EmpID" DataSourceID="UpdateEmp">
<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
        <Fields>
            <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID" />
            <asp:BoundField DataField="EmpFName" HeaderText="First Name" SortExpression="EmpFName" />
            <asp:BoundField DataField="EmpLName" HeaderText="Last Name" SortExpression="EmpLName" />
            <asp:BoundField DataField="EmpDOB" HeaderText="Date Of Birth  (MM/DD/YYYY)" SortExpression="EmpDOB" />
            <asp:BoundField DataField="EmpSSN" HeaderText="Social Security Number" SortExpression="EmpSSN" />
            <asp:BoundField DataField="EmpPhone" HeaderText="Phone Number" SortExpression="EmpPhone" />
            <asp:BoundField DataField="EmpEmail" HeaderText="Email Address" SortExpression="EmpEmail" />
            <asp:BoundField DataField="EmpAddress" HeaderText="Street Address" SortExpression="EmpAddress" />
            <asp:BoundField DataField="EmpApt" HeaderText="Apartment Number" SortExpression="EmpApt" />
            <asp:BoundField DataField="EmpCity" HeaderText="City" SortExpression="EmpCity" />
            <asp:BoundField DataField="EmpState" HeaderText="State" SortExpression="EmpState" />
            <asp:BoundField DataField="EmpZip" HeaderText="Zip" SortExpression="EmpZip" />
            <asp:BoundField DataField="EmpCounty" HeaderText="County" SortExpression="EmpCounty" />
            <asp:BoundField DataField="EmpLicNum" HeaderText="License Number" SortExpression="EmpLicNum" />
            <asp:BoundField DataField="EmpLicExp" HeaderText="License Expiration Date  (MM/DD/YYYY)" SortExpression="EmpLicExp" />
            <asp:BoundField DataField="EmpLicCnty" HeaderText="County Licensed In" SortExpression="EmpLicCnty" />
            <asp:BoundField DataField="EmpEmerCont" HeaderText="Emergency Contact Relationship" SortExpression="EmpEmerCont" />
            <asp:BoundField DataField="EmpECFName" HeaderText="First Name" SortExpression="EmpECFName" />
            <asp:BoundField DataField="EmpECLName" HeaderText="Last Name" SortExpression="EmpECLName" />
            <asp:BoundField DataField="EmpECPhone" HeaderText="Phone Number" SortExpression="EmpECPhone" />
            <asp:BoundField DataField="EmpECAddress" HeaderText="Complete Address" SortExpression="EmpECAddress" />
            <asp:BoundField DataField="EmpUser" HeaderText="Employee Username" SortExpression="EmpUser" />
            <asp:BoundField DataField="EmpPass" HeaderText="Password ( case sensitive )" SortExpression="EmpPass" />
            <asp:BoundField DataField="EmpPerm" HeaderText="Permission Level. ( &quot;A&quot; for Admin or &quot;E&quot; for employee )" SortExpression="EmpPerm" />
            <asp:BoundField DataField="EmpCont" HeaderText="Contract Agreement Date  (MM/DD/YYYY)" SortExpression="EmpCont" />
            <asp:BoundField DataField="EmpExp" HeaderText="Contract Expires (MM/DD/YYYY)" SortExpression="EmpExp" />
            <asp:BoundField DataField="EmpPay" HeaderText="Base Pay (enter .25 for 25% etc)" SortExpression="EmpPay" />
            <asp:BoundField DataField="EmpW9" HeaderText="W9 Filing Date  (MM/DD/YYYY)" SortExpression="EmpW9" />
            <asp:BoundField DataField="EmpStatus" HeaderText="Status (&quot;A&quot; for active and working or &quot;I&quot; for not working)" SortExpression="EmpStatus" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="UpdateEmp" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" DeleteCommand="DELETE FROM [Employee] WHERE [EmpID] = @EmpID" InsertCommand="INSERT INTO [Employee] ([EmpFName], [EmpLName], [EmpDOB], [EmpSSN], [EmpPhone], [EmpEmail], [EmpAddress], [EmpApt], [EmpCity], [EmpState], [EmpZip], [EmpCounty], [EmpLicNum], [EmpLicExp], [EmpLicCnty], [EmpEmerCont], [EmpECFName], [EmpECLName], [EmpECPhone], [EmpECAddress], [EmpUser], [EmpPass], [EmpPerm], [EmpCont], [EmpExp], [EmpPay], [EmpW9], [EmpStatus]) VALUES (@EmpFName, @EmpLName, @EmpDOB, @EmpSSN, @EmpPhone, @EmpEmail, @EmpAddress, @EmpApt, @EmpCity, @EmpState, @EmpZip, @EmpCounty, @EmpLicNum, @EmpLicExp, @EmpLicCnty, @EmpEmerCont, @EmpECFName, @EmpECLName, @EmpECPhone, @EmpECAddress, @EmpUser, @EmpPass, @EmpPerm, @EmpCont, @EmpExp, @EmpPay, @EmpW9, @EmpStatus)" SelectCommand="SELECT * FROM [Employee] WHERE ([EmpID] = @EmpID) ORDER BY [EmpID]" UpdateCommand="UPDATE [Employee] SET [EmpFName] = @EmpFName, [EmpLName] = @EmpLName, [EmpDOB] = @EmpDOB, [EmpSSN] = @EmpSSN, [EmpPhone] = @EmpPhone, [EmpEmail] = @EmpEmail, [EmpAddress] = @EmpAddress, [EmpApt] = @EmpApt, [EmpCity] = @EmpCity, [EmpState] = @EmpState, [EmpZip] = @EmpZip, [EmpCounty] = @EmpCounty, [EmpLicNum] = @EmpLicNum, [EmpLicExp] = @EmpLicExp, [EmpLicCnty] = @EmpLicCnty, [EmpEmerCont] = @EmpEmerCont, [EmpECFName] = @EmpECFName, [EmpECLName] = @EmpECLName, [EmpECPhone] = @EmpECPhone, [EmpECAddress] = @EmpECAddress, [EmpUser] = @EmpUser, [EmpPass] = @EmpPass, [EmpPerm] = @EmpPerm, [EmpCont] = @EmpCont, [EmpExp] = @EmpExp, [EmpPay] = @EmpPay, [EmpW9] = @EmpW9, [EmpStatus] = @EmpStatus WHERE [EmpID] = @EmpID">
        <DeleteParameters>
            <asp:Parameter Name="EmpID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmpFName" Type="String" />
            <asp:Parameter Name="EmpLName" Type="String" />
            <asp:Parameter Name="EmpDOB" Type="DateTime" />
            <asp:Parameter Name="EmpSSN" Type="String" />
            <asp:Parameter Name="EmpPhone" Type="String" />
            <asp:Parameter Name="EmpEmail" Type="String" />
            <asp:Parameter Name="EmpAddress" Type="String" />
            <asp:Parameter Name="EmpApt" Type="String" />
            <asp:Parameter Name="EmpCity" Type="String" />
            <asp:Parameter Name="EmpState" Type="String" />
            <asp:Parameter Name="EmpZip" Type="String" />
            <asp:Parameter Name="EmpCounty" Type="String" />
            <asp:Parameter Name="EmpLicNum" Type="String" />
            <asp:Parameter Name="EmpLicExp" Type="DateTime" />
            <asp:Parameter Name="EmpLicCnty" Type="String" />
            <asp:Parameter Name="EmpEmerCont" Type="String" />
            <asp:Parameter Name="EmpECFName" Type="String" />
            <asp:Parameter Name="EmpECLName" Type="String" />
            <asp:Parameter Name="EmpECPhone" Type="String" />
            <asp:Parameter Name="EmpECAddress" Type="String" />
            <asp:Parameter Name="EmpUser" Type="String" />
            <asp:Parameter Name="EmpPass" Type="String" />
            <asp:Parameter Name="EmpPerm" Type="String" />
            <asp:Parameter Name="EmpCont" Type="DateTime" />
            <asp:Parameter Name="EmpExp" Type="DateTime" />
            <asp:Parameter Name="EmpPay" Type="String" />
            <asp:Parameter Name="EmpW9" Type="DateTime" />
            <asp:Parameter Name="EmpStatus" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="EmpID" SessionField="EmployeeID" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmpFName" Type="String" />
            <asp:Parameter Name="EmpLName" Type="String" />
            <asp:Parameter Name="EmpDOB" Type="DateTime" />
            <asp:Parameter Name="EmpSSN" Type="String" />
            <asp:Parameter Name="EmpPhone" Type="String" />
            <asp:Parameter Name="EmpEmail" Type="String" />
            <asp:Parameter Name="EmpAddress" Type="String" />
            <asp:Parameter Name="EmpApt" Type="String" />
            <asp:Parameter Name="EmpCity" Type="String" />
            <asp:Parameter Name="EmpState" Type="String" />
            <asp:Parameter Name="EmpZip" Type="String" />
            <asp:Parameter Name="EmpCounty" Type="String" />
            <asp:Parameter Name="EmpLicNum" Type="String" />
            <asp:Parameter Name="EmpLicExp" Type="DateTime" />
            <asp:Parameter Name="EmpLicCnty" Type="String" />
            <asp:Parameter Name="EmpEmerCont" Type="String" />
            <asp:Parameter Name="EmpECFName" Type="String" />
            <asp:Parameter Name="EmpECLName" Type="String" />
            <asp:Parameter Name="EmpECPhone" Type="String" />
            <asp:Parameter Name="EmpECAddress" Type="String" />
            <asp:Parameter Name="EmpUser" Type="String" />
            <asp:Parameter Name="EmpPass" Type="String" />
            <asp:Parameter Name="EmpPerm" Type="String" />
            <asp:Parameter Name="EmpCont" Type="DateTime" />
            <asp:Parameter Name="EmpExp" Type="DateTime" />
            <asp:Parameter Name="EmpPay" Type="String" />
            <asp:Parameter Name="EmpW9" Type="DateTime" />
            <asp:Parameter Name="EmpStatus" Type="String" />
            <asp:Parameter Name="EmpID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

</asp:Content>

