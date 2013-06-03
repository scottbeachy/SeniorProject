<%@ Page Title="Add a new Employee" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" Inherits="AddEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">

        $(document).ready(function () {
            $("#ContentPlaceHolder1_txtDOB, #ContentPlaceHolder1_txtLicExp, #ContentPlaceHolder1_txtConAgreeDate, #ContentPlaceHolder1_txtConExp, #ContentPlaceHolder1_txtW9Date").datepicker();
        });
    </script>
    <div class="welcomeBox">
        <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
    </div>
    <div id="AddEmp">
        <asp:Label ID="lblAddSuccess" runat="server" Text="" Visible="false" ForeColor="Green"></asp:Label><br />

        <asp:Label ID="Label1" runat="server" Text="Employee First Name:" CssClass="lblEmp" AssociatedControlID="txtFName" ></asp:Label>
        <asp:TextBox ID="txtFName" CssClass="txtAddEmp" runat="server" ToolTip="First Name"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Employee Last Name:" CssClass="lblEmp" AssociatedControlID="txtLName"></asp:Label>
        <asp:TextBox ID="txtLName"  runat="server" CssClass="txtAddEmp" ToolTip="Last Name"></asp:TextBox><br />
        <asp:Label ID="Label3" runat="server" Text="Date of Birth:" CssClass="lblEmp" AssociatedControlID="txtDOB"></asp:Label>
        <asp:TextBox ID="txtDOB" runat="server" CssClass="txtAddEmp"  ToolTip="Date of Birth"></asp:TextBox><br />
        <asp:Label ID="Label4" runat="server" Text="Social Security Number:" CssClass="lblEmp" AssociatedControlID="txtSSN"></asp:Label>
        <asp:TextBox ID="txtSSN" runat="server" CssClass="txtAddEmp" ToolTip="Social Security Number"></asp:TextBox><br />
        <asp:Label ID="Label5" runat="server" Text="Phone Number:" CssClass="lblEmp" AssociatedControlID="txtPhone"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="txtAddEmp" ToolTip="Phone Number"></asp:TextBox><br />
        <asp:Label ID="Label6" runat="server" Text="Email Address:" CssClass="lblEmp" AssociatedControlID="txtEmail"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="txtAddEmp" ToolTip="Email Address"></asp:TextBox><br />
        <asp:Label ID="Label7" runat="server" Text="Street Address:" CssClass="lblEmp" AssociatedControlID="txtStreet"></asp:Label>
        <asp:TextBox ID="txtStreet" runat="server" CssClass="txtAddEmp" ToolTip="Street Name and Number"></asp:TextBox><br />
        <asp:Label ID="Label8" runat="server" Text="Apartment Number:" CssClass="lblEmp" AssociatedControlID="txtApt"></asp:Label>
        <asp:TextBox ID="txtApt" runat="server" CssClass="txtAddEmp" ToolTip="Apartment Number"></asp:TextBox><br />
        <asp:Label ID="Label9" runat="server" Text="City:" CssClass="lblEmp" AssociatedControlID="txtCity"></asp:Label>
        <asp:TextBox ID="txtCity" runat="server" CssClass="txtAddEmp" ToolTip="City"></asp:TextBox><br />
        <asp:Label ID="Label10" runat="server" Text="State:" CssClass="lblEmp" AssociatedControlID="ddlState"></asp:Label>
        <%--<asp:TextBox ID="txtState" runat="server" CssClass="txtAddEmp" ToolTip="State"></asp:TextBox>--%>
        <asp:DropDownList ID="ddlState" runat="server" ToolTip="State" CssClass="txtAddEmp">
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
        </asp:DropDownList><br />

        <asp:Label ID="Label11" runat="server" Text="Zip:" CssClass="lblEmp" AssociatedControlID="txtZip"></asp:Label>
        <asp:TextBox ID="txtZip" runat="server" CssClass="txtAddEmp" ToolTip="Zip"></asp:TextBox><br />
        <asp:Label ID="Label12" runat="server" Text="County:" CssClass="lblEmp" AssociatedControlID="txtCounty"></asp:Label>
        <asp:TextBox ID="txtCounty" runat="server" CssClass="txtAddEmp" ToolTip="County"></asp:TextBox><br />
        <asp:Label ID="Label13" runat="server" Text="License Number:" CssClass="lblEmp" AssociatedControlID="txtLic"></asp:Label>
        <asp:TextBox ID="txtLic" runat="server" CssClass="txtAddEmp" ToolTip="License Number"></asp:TextBox><br />
        <asp:Label ID="Label14" runat="server" Text="Expiration Date:" CssClass="lblEmp" AssociatedControlID="txtLicExp"></asp:Label>
        <asp:TextBox ID="txtLicExp" runat="server" CssClass="txtAddEmp" ToolTip="License Expiration Date"></asp:TextBox><br />
        <asp:Label ID="Label15" runat="server" Text="County Licensed In:" CssClass="lblEmp" AssociatedControlID="txtLicCounty"></asp:Label>
        <asp:TextBox ID="txtLicCounty" runat="server" CssClass="txtAddEmp" ToolTip="County Licensed In"></asp:TextBox><br />
        <asp:Label ID="Label16" runat="server" Text="Emergency Contact:" CssClass="lblEmp" AssociatedControlID="txtEmerCont"></asp:Label>
        <asp:TextBox ID="txtEmerCont" runat="server" CssClass="txtAddEmp" ToolTip="Emergency Contact for the emplyee"></asp:TextBox><br />
        <asp:Label ID="Label17" runat="server" Text="Contact First Name:" CssClass="lblEmp" AssociatedControlID="txtEFName"></asp:Label>
        <asp:TextBox ID="txtEFName" runat="server" CssClass="txtAddEmp" ToolTip="Emergency Contact First Name"></asp:TextBox><br />
        <asp:Label ID="Label18" runat="server" Text="Contact Last Name:" CssClass="lblEmp" AssociatedControlID="txtELName"></asp:Label>
        <asp:TextBox ID="txtELName" runat="server" CssClass="txtAddEmp" ToolTip="Emergency Contact Last Name"></asp:TextBox><br />
        <asp:Label ID="Label19" runat="server" Text="Contact Phone Number:" CssClass="lblEmp" AssociatedControlID="txtEPhone"></asp:Label>
        <asp:TextBox ID="txtEPhone" runat="server" CssClass="txtAddEmp" ToolTip="Emergency Contact Phone Number"></asp:TextBox><br />
        <asp:Label ID="Label20" runat="server" Text="Contact Complete Address:" CssClass="lblEmp" AssociatedControlID="txtEAddr"></asp:Label>
        <asp:TextBox ID="txtEAddr" runat="server" CssClass="txtAddEmp" ToolTip="Emergency Contact Full Address"></asp:TextBox><br />
        <asp:Label ID="Label21" runat="server" Text="Username for login:" CssClass="lblEmp" AssociatedControlID="txtUser"></asp:Label>
        <asp:TextBox ID="txtUser" runat="server" CssClass="txtAddEmp" ToolTip="Employee Username"></asp:TextBox><br />
        <asp:Label ID="Label22" runat="server" Text="Password:" CssClass="lblEmp" AssociatedControlID="txtPass"></asp:Label>
        <asp:TextBox ID="txtPass" runat="server" CssClass="txtAddEmp" ToolTip="Emplyee Password"></asp:TextBox><br />
        <asp:Label ID="Label23" runat="server" Text="Contract Agreement Date:" CssClass="lblEmp"  AssociatedControlID="txtConAgreeDate"></asp:Label>
        <asp:TextBox ID="txtConAgreeDate" runat="server" CssClass="txtAddEmp" ToolTip="Contract Agreement Date"></asp:TextBox><br />
        <asp:Label ID="Label24" runat="server" Text="Contract Expiration Date:" CssClass="lblEmp" AssociatedControlID="txtConExp"></asp:Label>
        <asp:TextBox ID="txtConExp" runat="server" CssClass="txtAddEmp" ToolTip="Contract Expiration Date"></asp:TextBox><br />
        <asp:Label ID="Label25" runat="server" Text="Base Pay: (ie .25 for 25%) " CssClass="lblEmp" AssociatedControlID="txtBase"></asp:Label>
        <asp:TextBox ID="txtBase" runat="server" CssClass="txtAddEmp" ToolTip="Employees Base Pay"></asp:TextBox><br />
        <asp:Label ID="Label26" runat="server" Text="W9 Filing Date:" CssClass="lblEmp" AssociatedControlID="txtW9Date"></asp:Label>
        <asp:TextBox ID="txtW9Date" runat="server" CssClass="txtAddEmp" ToolTip="W9 Filing Date"></asp:TextBox><br />

        <h3>Is this employee going to be an administrator for this system?</h3>
       <%-- <asp:DropDownList ID="ddlAdmin" runat="server" CssClass="ddlEmp" ToolTip="Select Yes or No">
            <asp:ListItem Value="E" Text="No"></asp:ListItem>
            <asp:ListItem Value="A" Text="Yes"></asp:ListItem>            
        </asp:DropDownList>--%>
        <asp:RadioButtonList ID="rdoAdmin" runat="server" CssClass="rdoAdmin">
            <asp:ListItem Enabled="true" Selected ="true" Text="No" Value="E"></asp:ListItem>
            <asp:ListItem Enabled="true" Selected="False" Text="Yes" Value="A"></asp:ListItem>
        </asp:RadioButtonList>


        <h3>Click the button below to add this employee</h3>
        <asp:Button ID="btnAddEmployee" runat="server" Text="Add" CssClass="btnDash" OnClick="btnAddEmployee_Click"/>
    </div>

</asp:Content>

