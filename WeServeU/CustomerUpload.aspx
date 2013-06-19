<%@ Page Title="WeServeU -Upload Files Here-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerUpload.aspx.cs" Inherits="CustomerUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
    </div>
    <div id="custUpload">
    <h2>Please upload you court provided documents here.</h2>
    <h3>First, Please choose a Work Order to upload documents to.</h3><br />
    <h3>WeserveU requires documents to be uploaded in PDF format.</h3>
        <p>Documents should be uploaded in one .pdf file and be no larger than 10MB.</p>

    <asp:DropDownList ID="ddlWOList" runat="server" DataSourceID="SelectWODDL" DataTextField="Parties"  DataValueField="WorkOrderID" AutoPostBack="true">                
                </asp:DropDownList><br /><br /><br />
                <asp:SqlDataSource ID="SelectWODDL" runat="server" ConnectionString="<%$ ConnectionStrings:UpdateWODataConnection %>" SelectCommand="SELECT [WorkOrderID], CAST([WorkOrderID] AS varchar(20)) + ' ' + [WLName] + ' VS ' + [WOPLName] AS Parties FROM [WorkOrder] WHERE ([CustomerID] = @CustomerID) ORDER BY [WorkOrderID]">
                    <SelectParameters>
                        <asp:SessionParameter Name="CustomerID" SessionField="CustID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
    <asp:FileUpload ID="cstFileUp" runat="server" CssClass="custFileUpload" /><br /><br /><br />
    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CssClass="btnDash" /><br />
    <asp:Label ID="lblUploadStatus" runat="server" Text=""></asp:Label>
        <%--<asp:Button ID="btndown" runat="server" Text="Button" OnClick="btndown_Click" />--%>
        </div>
</asp:Content>

