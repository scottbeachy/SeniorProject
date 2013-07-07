<%@ Page Title="WeServeU -View WO by Status-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewWOByStatus.aspx.cs" Inherits="ViewWOByStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="welcomeBox">
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />        
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <h3 style="text-align:center">Below is a list of Work Orders that matched the criteria specified</h3>
    <p style="text-align:center">You can click on the work order ID to update the work order</p>

    <asp:GridView ID="grdViewWOByStatus" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="WorkOrderID" DataSourceID="WoByStatusDataSource" EmptyDataText="There are no work orders that meet the selection criteria. Please try again." CssClass="updateTable" AlternatingRowStyle-BackColor="#CCCCCC" >
<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnViewWo" runat="server" Text="View/Edit" CausesValidation="false" CommandArgument='<%#Eval("WorkOrderID")%>' CommandName="View" OnCommand="btnViewWo_Command" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="WorkOrderID" HeaderText="Work Order ID" InsertVisible="False" ReadOnly="True" SortExpression="WorkOrderID" />
            <asp:BoundField DataField="WCaseNumber" HeaderText="Case Number" SortExpression="WCaseNumber" />
            <asp:BoundField DataField="WLName" HeaderText="Last Name" SortExpression="WLName" />
            <asp:BoundField DataField="WOPLName" HeaderText="OP Last Name" SortExpression="WOPLName" />
            
            <asp:BoundField DataField="WStatus" HeaderText="WO Status" SortExpression="WStatus" />
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="WoByStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID], [WCaseNumber], [WLName], [WOPLName], [WStatus] FROM [WorkOrder] WHERE WDateCreated BETWEEN @date1 AND @date2 AND WStatus = @WStatus">
        <SelectParameters>
            <asp:SessionParameter Name="date1" SessionField="date1" />
            <asp:SessionParameter  Name="date2" SessionField="date2" />
            <asp:SessionParameter  Name="WStatus" SessionField="wostatus" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

