<%@ Page Title="WeServeU -Create a New Work Order for Service-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerCreateWO.aspx.cs" Inherits="CustomerCreateWO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="returnHome" OnClick="btnLogout_Click" />
        <asp:Button ID="btnReturnHome" runat="server" Text="Back to Dashboard" CssClass="returnHome" OnClick="btnReturnHome_Click" />
    </div>

    <div id="AddEmp">

        <h3>CREATE NEW WORK ORDER</h3>


        
            <asp:Label ID="Label1" runat="server" Text="Case Number:" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtCaseNumber" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="First Name Service Requested By:" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtFNameServiceRequestedBy" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <br />
            <asp:Label ID="Label15" runat="server" Text="Last Name Service Requested By:" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtLNameServiceRequestedBy" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="First Name Opposing Party:" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtOppFName" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Last Name Opposing Party:" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtOppLName" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <br />            
            <asp:Label ID="Label7" runat="server" Text="Service Street Address:" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtServiceStreetAddress" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Apartment/Suite Number" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtApartment" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <br />
            <asp:Label ID="Label12" runat="server" Text="City:" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="txtAddEmp"></asp:TextBox>
        <br />
            <asp:Label ID="Label9" runat="server" Text="State:" CssClass="lblEmp"></asp:Label>
            <asp:DropDownList ID="ddState" runat="server" CssClass="txtAddEmp">
                <asp:ListItem Value="">Select</asp:ListItem>
                <asp:ListItem Value="AL">Alabama</asp:ListItem>
                <asp:ListItem Value="AK">Alaska</asp:ListItem>
                <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                <asp:ListItem Value="CA">California</asp:ListItem>
                <asp:ListItem Value="CO">Colorado</asp:ListItem>
                <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                <asp:ListItem Value="DE">Delaware</asp:ListItem>
                <asp:ListItem Value="FL">Florida</asp:ListItem>
                <asp:ListItem Value="GA">Georgia</asp:ListItem>
                <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                <asp:ListItem Value="ID">Idaho</asp:ListItem>
                <asp:ListItem Value="IL">Illinois</asp:ListItem>
                <asp:ListItem Value="IN">Indiana</asp:ListItem>
                <asp:ListItem Value="IA">Iowa</asp:ListItem>
                <asp:ListItem Value="KS">Kansas</asp:ListItem>
                <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                <asp:ListItem Value="ME">Maine</asp:ListItem>
                <asp:ListItem Value="MD">Maryland</asp:ListItem>
                <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                <asp:ListItem Value="MI">Michigan</asp:ListItem>
                <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                <asp:ListItem Value="MO">Missouri</asp:ListItem>
                <asp:ListItem Value="MT">Montana</asp:ListItem>
                <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                <asp:ListItem Value="NV">Nevada</asp:ListItem>
                <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                <asp:ListItem Value="NY">New York</asp:ListItem>
                <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                <asp:ListItem Value="OH">Ohio</asp:ListItem>
                <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                <asp:ListItem Value="OR">Oregon</asp:ListItem>
                <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                <asp:ListItem Value="TX">Texas</asp:ListItem>
                <asp:ListItem Value="UT">Utah</asp:ListItem>
                <asp:ListItem Value="VT">Vermont</asp:ListItem>
                <asp:ListItem Value="VA">Virginia</asp:ListItem>
                <asp:ListItem Value="WA">Washington</asp:ListItem>
                <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                <asp:ListItem Value="WY">Wyoming</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label10" runat="server" Text="County:" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtCounty" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <br />
            <asp:Label ID="Label11" runat="server" Text="Zip Code:" CssClass="lblEmp"></asp:Label>
            <asp:TextBox ID="txtZip" runat="server" CssClass="txtAddEmp" MaxLength="10"></asp:TextBox>
            <br />        
         
            <asp:Button ID="btnCreateWO" runat="server" Text="Create Work Order" CssClass="btnDash" OnClick="btnCreateWO_Click" /><br />
        <asp:Label ID="lblCreateWOError" runat="server" Text="" Visible="false"></asp:Label><br />
        <asp:Button ID="btnGoToUpload" runat="server" Text="Upload Documents" Visible="false" CssClass="btnDash" OnClick="btnGoToUpload_Click"/><br />

            











    </div>

</asp:Content>

