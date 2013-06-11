<%@ Page Title="WeServeU -Plaintiff/Respondent Work Order-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TrackWOPlaintResp.aspx.cs" Inherits="TrackWOPlaintResp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Admin Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="WorkOrderID" DataSourceID="WOPlaintiffRespDataSource" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="WorkOrderID" HeaderText="WorkOrderID" InsertVisible="False" ReadOnly="True" SortExpression="WorkOrderID" />
            <asp:BoundField DataField="WCaseNumber" HeaderText="WCaseNumber" SortExpression="WCaseNumber" />
            <asp:BoundField DataField="WClientStatus" HeaderText="WClientStatus" SortExpression="WClientStatus" />
            <asp:BoundField DataField="WOPFName" HeaderText="WOPFName" SortExpression="WOPFName" />
            <asp:BoundField DataField="WOPLName" HeaderText="WOPLName" SortExpression="WOPLName" />
            <asp:BoundField DataField="WToBeServed" HeaderText="WToBeServed" SortExpression="WToBeServed" />
            <asp:BoundField DataField="WServAdd" HeaderText="WServAdd" SortExpression="WServAdd" />
            <asp:BoundField DataField="WServApt" HeaderText="WServApt" SortExpression="WServApt" />
            <asp:BoundField DataField="WServCounty" HeaderText="WServCounty" SortExpression="WServCounty" />
            <asp:BoundField DataField="WServCity" HeaderText="WServCity" SortExpression="WServCity" />
            <asp:BoundField DataField="WServState" HeaderText="WServState" SortExpression="WServState" />
            <asp:BoundField DataField="WServZip" HeaderText="WServZip" SortExpression="WServZip" />
            <asp:BoundField DataField="WServedFName" HeaderText="WServedFName" SortExpression="WServedFName" />
            <asp:BoundField DataField="WServedLName" HeaderText="WServedLName" SortExpression="WServedLName" />
            <asp:BoundField DataField="WServedRel" HeaderText="WServedRel" SortExpression="WServedRel" />
            <asp:BoundField DataField="WCountyFiled" HeaderText="WCountyFiled" SortExpression="WCountyFiled" />
            <asp:BoundField DataField="WCourtFiled" HeaderText="WCourtFiled" SortExpression="WCourtFiled" />
            <asp:BoundField DataField="WServedHeight" HeaderText="WServedHeight" SortExpression="WServedHeight" />
            <asp:BoundField DataField="WServedWeight" HeaderText="WServedWeight" SortExpression="WServedWeight" />
            <asp:BoundField DataField="WServedHair" HeaderText="WServedHair" SortExpression="WServedHair" />
            <asp:BoundField DataField="WServedEye" HeaderText="WServedEye" SortExpression="WServedEye" />
            <asp:BoundField DataField="WServedSex" HeaderText="WServedSex" SortExpression="WServedSex" />
            <asp:BoundField DataField="WServedAge" HeaderText="WServedAge" SortExpression="WServedAge" />
            <asp:BoundField DataField="WServDate" HeaderText="WServDate" SortExpression="WServDate" />
            <asp:BoundField DataField="WServTime" HeaderText="WServTime" SortExpression="WServTime" />
            <asp:BoundField DataField="WStatus" HeaderText="WStatus" SortExpression="WStatus" />
            <asp:BoundField DataField="WFiledBy" HeaderText="WFiledBy" SortExpression="WFiledBy" />
            <asp:BoundField DataField="WDateCreated" HeaderText="WDateCreated" SortExpression="WDateCreated" />
            <asp:BoundField DataField="WcertID" HeaderText="WcertID" SortExpression="WcertID" />
            <asp:BoundField DataField="WPaperTitle" HeaderText="WPaperTitle" SortExpression="WPaperTitle" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="WOPlaintiffRespDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID], [WCaseNumber], [WClientStatus], [WOPFName], [WOPLName], [WToBeServed], [WServAdd], [WServApt], [WServCounty], [WServCity], [WServState], [WServZip], [WServedFName], [WServedLName], [WServedRel], [WCountyFiled], [WCourtFiled], [WServedHeight], [WServedWeight], [WServedHair], [WServedEye], [WServedSex], [WServedAge], [WServDate], [WServTime], [WStatus], [WFiledBy], [WDateCreated], [WcertID], [WPaperTitle] FROM [WorkOrder]"></asp:SqlDataSource>
</asp:Content>

