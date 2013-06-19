<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Payroll.aspx.cs" Inherits="Payroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmpID" DataSourceID="PayDataSource">
        <Columns>
            <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID" />
            <asp:BoundField DataField="EmpFName" HeaderText="EmpFName" SortExpression="EmpFName" />
            <asp:BoundField DataField="EmpLName" HeaderText="EmpLName" SortExpression="EmpLName" />
            <asp:BoundField DataField="EmpPay" HeaderText="EmpPay" SortExpression="EmpPay" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="PayDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" DeleteCommand="DELETE FROM [Employee] WHERE [EmpID] = @EmpID" InsertCommand="INSERT INTO [Employee] ([EmpFName], [EmpLName], [EmpPay]) VALUES (@EmpFName, @EmpLName, @EmpPay)" SelectCommand="SELECT [EmpID], [EmpFName], [EmpLName], [EmpPay] FROM [Employee] WHERE ([EmpID] = @EmpID) ORDER BY [EmpID]" UpdateCommand="UPDATE [Employee] SET [EmpFName] = @EmpFName, [EmpLName] = @EmpLName, [EmpPay] = @EmpPay WHERE [EmpID] = @EmpID">
        <DeleteParameters>
            <asp:Parameter Name="EmpID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmpFName" Type="String" />
            <asp:Parameter Name="EmpLName" Type="String" />
            <asp:Parameter Name="EmpPay" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="EmpID" SessionField="EmpID" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmpFName" Type="String" />
            <asp:Parameter Name="EmpLName" Type="String" />
            <asp:Parameter Name="EmpPay" Type="String" />
            <asp:Parameter Name="EmpID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ListBox ID="ListBox1" runat="server" Width="800px"></asp:ListBox>
</asp:Content>

