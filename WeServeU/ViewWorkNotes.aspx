<%@ Page Title="WeServeU -View Work Notes-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewWorkNotes.aspx.cs" Inherits="ViewWorkNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="welcomeBox">
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />        
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <asp:GridView ID="grdViewNotes" runat="server" Width="100%" CssClass="updateTable" AllowSorting="True" AlternatingRowStyle-BackColor="#CCCCCC" AutoGenerateColumns="False" DataKeyNames="WorkOrderID,WorkNoteID" DataSourceID="grdNotesDateSource">
<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="WorkOrderID" HeaderText="Work Order ID" NullDisplayText="There are no Work Notes associated with this work order" ReadOnly="True" SortExpression="WorkOrderID" />
            <asp:BoundField DataField="WorkNoteID" HeaderText="Work Note ID" InsertVisible="False" ReadOnly="True" SortExpression="WorkNoteID" />
            <asp:BoundField DataField="EmpID" HeaderText="Employee ID" SortExpression="EmpID" />
            <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" SortExpression="CustomerID" />
            <asp:BoundField DataField="WNDate" HeaderText="Date" SortExpression="WNDate" DataFormatString="{0:MM-dd-yyyy}"></asp:BoundField>
            <asp:BoundField DataField="WNComments" HeaderText="Note" SortExpression="WNComments" />
        </Columns>
     </asp:GridView>

     <asp:SqlDataSource ID="grdNotesDateSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" DeleteCommand="DELETE FROM [WorkNotes] WHERE [WorkOrderID] = @WorkOrderID AND [WorkNoteID] = @WorkNoteID" InsertCommand="INSERT INTO [WorkNotes] ([WorkOrderID], [EmpID], [CustomerID], [WNDate], [WNComments]) VALUES (@WorkOrderID, @EmpID, @CustomerID, @WNDate, @WNComments)" SelectCommand="SELECT * FROM [WorkNotes] ORDER BY [WNDate]" UpdateCommand="UPDATE [WorkNotes] SET [EmpID] = @EmpID, [CustomerID] = @CustomerID, [WNDate] = @WNDate, [WNComments] = @WNComments WHERE [WorkOrderID] = @WorkOrderID AND [WorkNoteID] = @WorkNoteID">
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

