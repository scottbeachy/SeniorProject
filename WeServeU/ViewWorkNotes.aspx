<%@ Page Title="WeServeU -View Work Notes-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewWorkNotes.aspx.cs" Inherits="ViewWorkNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="welcomeBox">
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />        
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <asp:GridView ID="grdViewNotes" runat="server" Width="100%" CssClass="updateTable" AllowSorting="True" AlternatingRowStyle-BackColor="#CCCCCC" AutoGenerateColumns="False" DataKeyNames="WorkOrderID,WorkNoteID" DataSourceID="grdNotesDateSource" EmptyDataText="Notes have not been added to this work order yet">
<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
        <Columns>
            <asp:CommandField ShowEditButton="True" >
            <ItemStyle Width="65px" />
            </asp:CommandField>
            <asp:BoundField DataField="WorkOrderID" HeaderText="W Order ID" ReadOnly="True" SortExpression="WorkOrderID" >
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="EmpID" HeaderText="Server ID" SortExpression="EmpID" >
            <ItemStyle Width="85px" />
            </asp:BoundField>
            <asp:BoundField DataField="CustomerID" HeaderText="Cust ID" SortExpression="CustomerID" >
            <ItemStyle Width="75px" />
            </asp:BoundField>
            <asp:BoundField DataField="WNDate" HeaderText="Date" SortExpression="WNDate" DataFormatString="{0:dd/MM/yyyy}">
            <ItemStyle Width="75px" />
            </asp:BoundField>
            <asp:BoundField DataField="WNComments" HeaderText="WNComments" SortExpression="WNComments" />
        </Columns>
     </asp:GridView>

     <asp:SqlDataSource ID="grdNotesDateSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" DeleteCommand="DELETE FROM [WorkNotes] WHERE [WorkOrderID] = @WorkOrderID AND [WorkNoteID] = @WorkNoteID" InsertCommand="INSERT INTO [WorkNotes] ([WorkOrderID], [EmpID], [CustomerID], [WNDate], [WNComments]) VALUES (@WorkOrderID, @EmpID, @CustomerID, @WNDate, @WNComments)" SelectCommand="SELECT * FROM [WorkNotes] WHERE ([WorkOrderID] = @WorkOrderID) ORDER BY [WNDate]" UpdateCommand="UPDATE [WorkNotes] SET [EmpID] = @EmpID, [CustomerID] = @CustomerID, [WNDate] = @WNDate, [WNComments] = @WNComments WHERE [WorkOrderID] = @WorkOrderID AND [WorkNoteID] = @WorkNoteID">
         <DeleteParameters>
             <asp:Parameter Name="WorkOrderID" Type="Decimal" />
             <asp:Parameter Name="WorkNoteID" Type="Decimal" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="WorkOrderID" Type="Decimal" />
             <asp:Parameter Name="EmpID" Type="Decimal" />
             <asp:Parameter Name="CustomerID" Type="Decimal" />
             <asp:Parameter Name="WNDate" Type="DateTime" />
             <asp:Parameter Name="WNComments" Type="String" />
         </InsertParameters>
         <SelectParameters>
             <asp:SessionParameter Name="WorkOrderID" SessionField="WorkOrderID" Type="Decimal" />
         </SelectParameters>
         <UpdateParameters>
             <asp:Parameter Name="EmpID" Type="Decimal" />
             <asp:Parameter Name="CustomerID" Type="Decimal" />
             <asp:Parameter Name="WNDate" Type="DateTime" />
             <asp:Parameter Name="WNComments" Type="String" />
             <asp:Parameter Name="WorkOrderID" Type="Decimal" />
             <asp:Parameter Name="WorkNoteID" Type="Decimal" />
         </UpdateParameters>
     </asp:SqlDataSource>

</asp:Content>

