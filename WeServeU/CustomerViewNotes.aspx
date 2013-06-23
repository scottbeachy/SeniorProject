<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerViewNotes.aspx.cs" Inherits="CustomerViewNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
    </div>

    <asp:GridView ID="grdCstViewNotes" runat="server" CssClass="updateTable" AutoGenerateColumns="False" DataSourceID="sqlCustViewNotes" AlternatingRowStyle-BackColor="#CCCCCC"  EmptyDataText="Notes have not been added to this work order yet.">
<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="WNDate" HeaderText="Date" SortExpression="WNDate" DataFormatString="{0:dd/MM/yyyy}" NullDisplayText="NA" >
            </asp:BoundField>
            <asp:BoundField DataField="WNComments" HeaderText="Server's Notes" SortExpression="WNComments" NullDisplayText="Notes have not been entered for this work order yet." >
            <ItemStyle Width="10%" />
                <ItemStyle Width="90%" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqlCustViewNotes" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID], [WNDate], [WNComments] FROM [WorkNotes] WHERE ([WorkOrderID] = @WorkOrderID) ORDER BY [WNDate]">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="WorkOrderID" SessionField="WorkOrderID" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

