<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="requestServices.aspx.cs" Inherits="requestServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="createAcctContainer" >
        <div id="createAcctHeader">
            <p>
                Some info goes here
            <br />
            ...On multiple lines
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
                <asp:TextBox ID="txtPhone" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtFax" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtEmail" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtAddress" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtApartment" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtCity" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:DropDownList ID="ddState" runat="server" CssClass="createAcctTxt">
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
                </asp:DropDownList> <br />
                <asp:TextBox ID="txtCounty" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtZip" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtUsername" runat="server"  CssClass="createAcctTxt"></asp:TextBox> <br />
                <asp:TextBox ID="txtPassword" runat="server"  CssClass="createAcctTxt" TextMode="Password"></asp:TextBox> <br />
                <asp:TextBox ID="txtPasswordVerified" runat="server"  CssClass="createAcctTxt" TextMode="Password"></asp:TextBox> <br />
        </div>
        <asp:Button ID="btnCreateAcct" runat="server" Text="Create Account" OnClick="btnCreateAcct_Click" />
    </div>
</asp:Content>

