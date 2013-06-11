<%@ Page Title="WeServeU -Update Client-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateClientInfo.aspx.cs" Inherits="UpdateClientInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <h3 class="updateClientHeader">To Make Updates to the Client, Please Click the "Edit" Button At The Bottom Of The Page.</h3>

    <asp:DetailsView ID="UpdateClientDetailsView" runat="server" CssClass="updateTable" Height="50px" AutoGenerateRows="False" DataKeyNames="CustomerID" DataSourceID="UpdateClientDataSource">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="CFname" HeaderText="CFname" SortExpression="CFname" />
            <asp:BoundField DataField="CLname" HeaderText="CLname" SortExpression="CLname" />
            <asp:BoundField DataField="CFirmName" HeaderText="CFirmName" SortExpression="CFirmName" />
            <asp:BoundField DataField="CPhone" HeaderText="CPhone" SortExpression="CPhone" />
            <asp:BoundField DataField="CFax" HeaderText="CFax" SortExpression="CFax" />
            <asp:BoundField DataField="CEmail" HeaderText="CEmail" SortExpression="CEmail" />
            <asp:BoundField DataField="CAddress" HeaderText="CAddress" SortExpression="CAddress" />
            <asp:BoundField DataField="CApt" HeaderText="CApt" SortExpression="CApt" />
            <asp:BoundField DataField="CCity" HeaderText="CCity" SortExpression="CCity" />
            <asp:BoundField DataField="CState" HeaderText="CState" SortExpression="CState" />
            <asp:BoundField DataField="CCounty" HeaderText="CCounty" SortExpression="CCounty" />
            <asp:BoundField DataField="CZip" HeaderText="CZip" SortExpression="CZip" />
            <asp:BoundField DataField="CUser" HeaderText="CUser" SortExpression="CUser" />
            <asp:BoundField DataField="CPass" HeaderText="CPass" SortExpression="CPass" />
            <asp:BoundField DataField="CPerm" HeaderText="CPerm" SortExpression="CPerm" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="UpdateClientDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" DeleteCommand="DELETE FROM [Customer] WHERE [CustomerID] = @CustomerID" InsertCommand="INSERT INTO [Customer] ([CFname], [CLname], [CFirmName], [CPhone], [CFax], [CEmail], [CAddress], [CApt], [CCity], [CState], [CCounty], [CZip], [CUser], [CPass], [CPerm]) VALUES (@CFname, @CLname, @CFirmName, @CPhone, @CFax, @CEmail, @CAddress, @CApt, @CCity, @CState, @CCounty, @CZip, @CUser, @CPass, @CPerm)" SelectCommand="SELECT * FROM [Customer] WHERE ([CustomerID] = @CustomerID) ORDER BY [CustomerID]" UpdateCommand="UPDATE [Customer] SET [CFname] = @CFname, [CLname] = @CLname, [CFirmName] = @CFirmName, [CPhone] = @CPhone, [CFax] = @CFax, [CEmail] = @CEmail, [CAddress] = @CAddress, [CApt] = @CApt, [CCity] = @CCity, [CState] = @CState, [CCounty] = @CCounty, [CZip] = @CZip, [CUser] = @CUser, [CPass] = @CPass, [CPerm] = @CPerm WHERE [CustomerID] = @CustomerID">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CFname" Type="String" />
            <asp:Parameter Name="CLname" Type="String" />
            <asp:Parameter Name="CFirmName" Type="String" />
            <asp:Parameter Name="CPhone" Type="String" />
            <asp:Parameter Name="CFax" Type="String" />
            <asp:Parameter Name="CEmail" Type="String" />
            <asp:Parameter Name="CAddress" Type="String" />
            <asp:Parameter Name="CApt" Type="String" />
            <asp:Parameter Name="CCity" Type="String" />
            <asp:Parameter Name="CState" Type="String" />
            <asp:Parameter Name="CCounty" Type="String" />
            <asp:Parameter Name="CZip" Type="String" />
            <asp:Parameter Name="CUser" Type="String" />
            <asp:Parameter Name="CPass" Type="String" />
            <asp:Parameter Name="CPerm" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CFname" Type="String" />
            <asp:Parameter Name="CLname" Type="String" />
            <asp:Parameter Name="CFirmName" Type="String" />
            <asp:Parameter Name="CPhone" Type="String" />
            <asp:Parameter Name="CFax" Type="String" />
            <asp:Parameter Name="CEmail" Type="String" />
            <asp:Parameter Name="CAddress" Type="String" />
            <asp:Parameter Name="CApt" Type="String" />
            <asp:Parameter Name="CCity" Type="String" />
            <asp:Parameter Name="CState" Type="String" />
            <asp:Parameter Name="CCounty" Type="String" />
            <asp:Parameter Name="CZip" Type="String" />
            <asp:Parameter Name="CUser" Type="String" />
            <asp:Parameter Name="CPass" Type="String" />
            <asp:Parameter Name="CPerm" Type="String" />
            <asp:Parameter Name="CustomerID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

