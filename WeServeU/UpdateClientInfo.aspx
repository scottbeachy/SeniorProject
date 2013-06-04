<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateClientInfo.aspx.cs" Inherits="UpdateClientInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Button ID="Button1" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <h3 class="updateClientHeader">To Make Updates to the Client, Please Click the "Edit" Button At The Bottom Of The Page.</h3>

    <asp:DetailsView ID="clientDetailsView" CssClass="updateClientDetails" FieldHeaderStyle-Width="80%" runat="server" Height="50px" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="CustomerID" DataSourceID="UpdateClientDataSource" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />

<FieldHeaderStyle Width="80%"></FieldHeaderStyle>
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
    <asp:SqlDataSource ID="UpdateClientDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" DeleteCommand="DELETE FROM [Customer] WHERE [CustomerID] = @original_CustomerID AND (([CFname] = @original_CFname) OR ([CFname] IS NULL AND @original_CFname IS NULL)) AND (([CLname] = @original_CLname) OR ([CLname] IS NULL AND @original_CLname IS NULL)) AND (([CFirmName] = @original_CFirmName) OR ([CFirmName] IS NULL AND @original_CFirmName IS NULL)) AND (([CPhone] = @original_CPhone) OR ([CPhone] IS NULL AND @original_CPhone IS NULL)) AND (([CFax] = @original_CFax) OR ([CFax] IS NULL AND @original_CFax IS NULL)) AND (([CEmail] = @original_CEmail) OR ([CEmail] IS NULL AND @original_CEmail IS NULL)) AND (([CAddress] = @original_CAddress) OR ([CAddress] IS NULL AND @original_CAddress IS NULL)) AND (([CApt] = @original_CApt) OR ([CApt] IS NULL AND @original_CApt IS NULL)) AND (([CCity] = @original_CCity) OR ([CCity] IS NULL AND @original_CCity IS NULL)) AND (([CState] = @original_CState) OR ([CState] IS NULL AND @original_CState IS NULL)) AND (([CCounty] = @original_CCounty) OR ([CCounty] IS NULL AND @original_CCounty IS NULL)) AND (([CZip] = @original_CZip) OR ([CZip] IS NULL AND @original_CZip IS NULL)) AND [CUser] = @original_CUser AND [CPass] = @original_CPass AND [CPerm] = @original_CPerm" InsertCommand="INSERT INTO [Customer] ([CFname], [CLname], [CFirmName], [CPhone], [CFax], [CEmail], [CAddress], [CApt], [CCity], [CState], [CCounty], [CZip], [CUser], [CPass], [CPerm]) VALUES (@CFname, @CLname, @CFirmName, @CPhone, @CFax, @CEmail, @CAddress, @CApt, @CCity, @CState, @CCounty, @CZip, @CUser, @CPass, @CPerm)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [CFname] = @CFname, [CLname] = @CLname, [CFirmName] = @CFirmName, [CPhone] = @CPhone, [CFax] = @CFax, [CEmail] = @CEmail, [CAddress] = @CAddress, [CApt] = @CApt, [CCity] = @CCity, [CState] = @CState, [CCounty] = @CCounty, [CZip] = @CZip, [CUser] = @CUser, [CPass] = @CPass, [CPerm] = @CPerm WHERE [CustomerID] = @original_CustomerID AND (([CFname] = @original_CFname) OR ([CFname] IS NULL AND @original_CFname IS NULL)) AND (([CLname] = @original_CLname) OR ([CLname] IS NULL AND @original_CLname IS NULL)) AND (([CFirmName] = @original_CFirmName) OR ([CFirmName] IS NULL AND @original_CFirmName IS NULL)) AND (([CPhone] = @original_CPhone) OR ([CPhone] IS NULL AND @original_CPhone IS NULL)) AND (([CFax] = @original_CFax) OR ([CFax] IS NULL AND @original_CFax IS NULL)) AND (([CEmail] = @original_CEmail) OR ([CEmail] IS NULL AND @original_CEmail IS NULL)) AND (([CAddress] = @original_CAddress) OR ([CAddress] IS NULL AND @original_CAddress IS NULL)) AND (([CApt] = @original_CApt) OR ([CApt] IS NULL AND @original_CApt IS NULL)) AND (([CCity] = @original_CCity) OR ([CCity] IS NULL AND @original_CCity IS NULL)) AND (([CState] = @original_CState) OR ([CState] IS NULL AND @original_CState IS NULL)) AND (([CCounty] = @original_CCounty) OR ([CCounty] IS NULL AND @original_CCounty IS NULL)) AND (([CZip] = @original_CZip) OR ([CZip] IS NULL AND @original_CZip IS NULL)) AND [CUser] = @original_CUser AND [CPass] = @original_CPass AND [CPerm] = @original_CPerm">
        <DeleteParameters>
            <asp:Parameter Name="original_CustomerID" Type="Decimal" />
            <asp:Parameter Name="original_CFname" Type="String" />
            <asp:Parameter Name="original_CLname" Type="String" />
            <asp:Parameter Name="original_CFirmName" Type="String" />
            <asp:Parameter Name="original_CPhone" Type="String" />
            <asp:Parameter Name="original_CFax" Type="String" />
            <asp:Parameter Name="original_CEmail" Type="String" />
            <asp:Parameter Name="original_CAddress" Type="String" />
            <asp:Parameter Name="original_CApt" Type="String" />
            <asp:Parameter Name="original_CCity" Type="String" />
            <asp:Parameter Name="original_CState" Type="String" />
            <asp:Parameter Name="original_CCounty" Type="String" />
            <asp:Parameter Name="original_CZip" Type="String" />
            <asp:Parameter Name="original_CUser" Type="String" />
            <asp:Parameter Name="original_CPass" Type="String" />
            <asp:Parameter Name="original_CPerm" Type="String" />
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
            <asp:Parameter Name="original_CustomerID" Type="Decimal" />
            <asp:Parameter Name="original_CFname" Type="String" />
            <asp:Parameter Name="original_CLname" Type="String" />
            <asp:Parameter Name="original_CFirmName" Type="String" />
            <asp:Parameter Name="original_CPhone" Type="String" />
            <asp:Parameter Name="original_CFax" Type="String" />
            <asp:Parameter Name="original_CEmail" Type="String" />
            <asp:Parameter Name="original_CAddress" Type="String" />
            <asp:Parameter Name="original_CApt" Type="String" />
            <asp:Parameter Name="original_CCity" Type="String" />
            <asp:Parameter Name="original_CState" Type="String" />
            <asp:Parameter Name="original_CCounty" Type="String" />
            <asp:Parameter Name="original_CZip" Type="String" />
            <asp:Parameter Name="original_CUser" Type="String" />
            <asp:Parameter Name="original_CPass" Type="String" />
            <asp:Parameter Name="original_CPerm" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
    <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
</asp:Content>

