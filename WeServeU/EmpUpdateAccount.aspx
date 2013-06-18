<%@ Page Title="WeServeU -Update My Information-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpUpdateAccount.aspx.cs" Inherits="EmpUpdateAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
    </div>
    

    
        
        <h3>UPDATE ACCOUNT INFORMATION</h3>

        

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" CssClass="updateTable" AlternatingRowStyle-BackColor="#CCCCCC" AutoGenerateRows="False" DataKeyNames="EmpID" DataSourceID="UpdateEmp">
<AlternatingRowStyle BackColor="#CCCCCC" BorderColor="#FFF"></AlternatingRowStyle>
        <Fields>
            <asp:BoundField DataField="EmpFName" HeaderText="First Name" SortExpression="EmpFName" />
            <asp:BoundField DataField="EmpLName" HeaderText="Last Name" SortExpression="EmpLName" />
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
            <asp:SessionParameter Name="EmpID" SessionField="EmpID" Type="Decimal" DefaultValue="" />
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
            
    
    

</asp:Content>

