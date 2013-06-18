<%@ Page Title="WeServeU -Add Notes-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpAddNotes.aspx.cs" Inherits="EmpAddNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
    </div>

    <div class="adminDashboard">
        
        <h3>ADD NOTES TO WORK ORDER</h3>

        <div class="worknotes">



            <asp:TextBox ID="tbNotes" runat="server" Height="150px" Width="470px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSubNotes" runat="server" OnClick="Button2_Click" Text="Submit Notes" CssClass="btnDash"/>
            <br />
            <asp:Label ID="lblAddSuccess" runat="server" Text="Notes Are Added!" Visible="False" ForeColor="Green"></asp:Label>
            <br />
            <asp:Label ID="lblAddFail" runat="server" Text="Error! Notes Were Not Added!" Visible="False" ForeColor="Red"></asp:Label>
            <br />
            <br />



        </div>
        
    
    
    
    
    </div>



</asp:Content>

