<%@ Page Title="WeServeU -Create an Account-" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="requestServices.aspx.cs" Inherits="requestServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        New customers may create an account using the form below. Customers can then log in to their accounts where they will be able to submit 
                work orders, upload documents, and check the status of existing work orders.
    </p>
    <p>This website does not support online payments at this time.</p>
    <p>If you do not wish to create an account here on our site please call us at (602) 238-3666 and we will be happy to complete your serve in the traditional manner. </p>
    <p>You can also contact us using the <a href="contact.aspx">Contact Us</a> page. No personal information is stored when contacting us in this way.</p>
    <div class="createAcctContainer">
        <div class="createAcctMain">
            <h3>Create a new account here</h3>


            <asp:Label ID="Label1" runat="server" Text="First Name:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtFname" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFname"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtLname" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtLname"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label15" runat="server" Text="Firm Name:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtFirmName" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Phone:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="txtAddEmp" MaxLength="10"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Fax:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtFax" runat="server" CssClass="txtAddEmp" MaxLength="10"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Email:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Address:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Apartment:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtApartment" runat="server" CssClass="txtAddEmp" MaxLength="10"></asp:TextBox>
            <br />
            <asp:Label ID="Label8" runat="server" Text="City:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label9" runat="server" Text="State:" CssClass="createAcctLbl"></asp:Label>
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddState"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label10" runat="server" Text="County:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtCounty" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCounty"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label11" runat="server" Text="Zip Code:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtZip" runat="server" CssClass="txtAddEmp" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label12" runat="server" Text="Username:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="txtAddEmp"></asp:TextBox>
            <asp:RequiredFieldValidator ID="usernameValidator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label13" runat="server" Text="Password:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="txtAddEmp" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label14" runat="server" Text="Retype Password:" CssClass="createAcctLbl"></asp:Label>
            <asp:TextBox ID="txtPasswordVerified" runat="server" CssClass="txtAddEmp" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPasswordVerified"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="passwordCompareValidator" runat="server" ErrorMessage="*Passwords Must Match" ControlToCompare="txtPassword" ControlToValidate="txtPasswordVerified" ForeColor="Red"></asp:CompareValidator>
        </div>
        <br />
        <asp:Button ID="btnCreateAcct" runat="server" Text="Create Account" OnClick="btnCreateAcct_Click" />
        <br /> <br />
        <asp:Label ID="lblError" runat="server" CssClass="createAcctError" ForeColor="Red" Visible="False"></asp:Label>
    </div>




</asp:Content>

