<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="requestServices.aspx.cs" Inherits="requestServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="createAcctContainer" >
        <div id="createAcctHeader">
            <p>
                New customers must create an account using the form below. Customers can then log in to their accounts where they will be able to submit 
                work orders, upload documents, and check the status of existing work orders.
            </p>
        </div>

        <div id="createAcctLblPnl">
                <asp:Label ID="Label1" runat="server" Text="First Name:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label15" runat="server" Text="Firm Name:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label3" runat="server" Text="Phone:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label4" runat="server" Text="Fax:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label5" runat="server" Text="Email:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label6" runat="server" Text="Address:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label7" runat="server" Text="Apartment:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label8" runat="server" Text="City:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label9" runat="server" Text="State:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label10" runat="server" Text="County:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label11" runat="server" Text="Zip Code:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label12" runat="server" Text="Username:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label13" runat="server" Text="Password:" CssClass="createAcctLbl"></asp:Label> <br />
                <asp:Label ID="Label14" runat="server" Text="Verify Password:" CssClass="createAcctLbl" Width="124px"></asp:Label> <br />
        </div>

        <div id="createAcctTxtPnl">
                <asp:TextBox ID="txtFname" runat="server" ForeColor="Gray" CssClass="createAcctTxt" OnClick="this.value=''">First</asp:TextBox> <br />
                <asp:TextBox ID="txtLname" runat="server" ForeColor="Gray" CssClass="createAcctTxt" OnClick="this.value=''">Last</asp:TextBox> <br />
                <asp:TextBox ID="txtFirmName" runat="server" CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtPhone" runat="server"  CssClass="createAcctTxt" MaxLength="10"></asp:TextBox> <br />
                <asp:TextBox ID="txtFax" runat="server"  CssClass="createAcctTxt" MaxLength="10"></asp:TextBox> <br />
                <asp:TextBox ID="txtEmail" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtAddress" runat="server"  CssClass="createAcctTxt" Height="20px"></asp:TextBox> <br />
                <asp:TextBox ID="txtApartment" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtCity" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:DropDownList ID="ddState" runat="server" CssClass="createAcctTxt">
                    <asp:ListItem Value="">Select</asp:ListItem>
                    <asp:ListItem Value="Alabama">Alabama</asp:ListItem>
                    <asp:ListItem Value="Alaska">Alaska</asp:ListItem>
                    <asp:ListItem Value="Arizona">Arizona</asp:ListItem>
                    <asp:ListItem Value="Arkansas">Arkansas</asp:ListItem>
                    <asp:ListItem Value="California">California</asp:ListItem>
                    <asp:ListItem Value="Colorado">Colorado</asp:ListItem>
                    <asp:ListItem Value="Connecticut">Connecticut</asp:ListItem>
                    <asp:ListItem Value="District of Columbia">District of Columbia</asp:ListItem>
                    <asp:ListItem Value="Deleware">Delaware</asp:ListItem>
                    <asp:ListItem Value="Florida">Florida</asp:ListItem>
                    <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                    <asp:ListItem Value="Hawaii">Hawaii</asp:ListItem>
                    <asp:ListItem Value="Idaho">Idaho</asp:ListItem>
                    <asp:ListItem Value="Illinois">Illinois</asp:ListItem>
                    <asp:ListItem Value="Indiana">Indiana</asp:ListItem>
                    <asp:ListItem Value="Iowa">Iowa</asp:ListItem>
                    <asp:ListItem Value="Kansas">Kansas</asp:ListItem>
                    <asp:ListItem Value="Kentucky">Kentucky</asp:ListItem>
                    <asp:ListItem Value="Louisiana">Louisiana</asp:ListItem>
                    <asp:ListItem Value="Maine">Maine</asp:ListItem>
                    <asp:ListItem Value="Maryland">Maryland</asp:ListItem>
                    <asp:ListItem Value="Massachusetts">Massachusetts</asp:ListItem>
                    <asp:ListItem Value="Michingan">Michigan</asp:ListItem>
                    <asp:ListItem Value="Minnesota">Minnesota</asp:ListItem>
                    <asp:ListItem Value="Mississippi">Mississippi</asp:ListItem>
                    <asp:ListItem Value="Missouri">Missouri</asp:ListItem>
                    <asp:ListItem Value="Montana">Montana</asp:ListItem>
                    <asp:ListItem Value="Nebraska">Nebraska</asp:ListItem>
                    <asp:ListItem Value="Nevada">Nevada</asp:ListItem>
                    <asp:ListItem Value="New Hampshire">New Hampshire</asp:ListItem>
                    <asp:ListItem Value="New Jersey">New Jersey</asp:ListItem>
                    <asp:ListItem Value="New Mexico">New Mexico</asp:ListItem>
                    <asp:ListItem Value="New York">New York</asp:ListItem>
                    <asp:ListItem Value="North Carolina">North Carolina</asp:ListItem>
                    <asp:ListItem Value="North Dakota">North Dakota</asp:ListItem>
                    <asp:ListItem Value="Ohio">Ohio</asp:ListItem>
                    <asp:ListItem Value="Oklahoma">Oklahoma</asp:ListItem>
                    <asp:ListItem Value="Oregon">Oregon</asp:ListItem>
                    <asp:ListItem Value="Pennsylvania">Pennsylvania</asp:ListItem>
                    <asp:ListItem Value="Rhode Island">Rhode Island</asp:ListItem>
                    <asp:ListItem Value="South Carolina">South Carolina</asp:ListItem>
                    <asp:ListItem Value="South Dakota">South Dakota</asp:ListItem>
                    <asp:ListItem Value="Tennessee">Tennessee</asp:ListItem>
                    <asp:ListItem Value="Texas">Texas</asp:ListItem>
                    <asp:ListItem Value="Utah">Utah</asp:ListItem>
                    <asp:ListItem Value="Vermont">Vermont</asp:ListItem>
                    <asp:ListItem Value="Virginia">Virginia</asp:ListItem>
                    <asp:ListItem Value="Washington">Washington</asp:ListItem>
                    <asp:ListItem Value="West Virginia">West Virginia</asp:ListItem>
                    <asp:ListItem Value="Wisconsin">Wisconsin</asp:ListItem>
                    <asp:ListItem Value="Wyoming">Wyoming</asp:ListItem>
                </asp:DropDownList> <br />
                <asp:TextBox ID="txtCounty" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtZip" runat="server"  CssClass="createAcctTxt" MaxLength="9"></asp:TextBox> <br />
                <asp:TextBox ID="txtUsername" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtPassword" runat="server"  CssClass="createAcctTxt" TextMode="Password"></asp:TextBox> <br />
                <asp:TextBox ID="txtPasswordVerified" runat="server"  CssClass="createAcctTxt" TextMode="Password"></asp:TextBox> <br />
        </div>
        <asp:Button ID="btnCreateAcct" runat="server" Text="Create Account" OnClick="btnCreateAcct_Click" />
    </div>
</asp:Content>

