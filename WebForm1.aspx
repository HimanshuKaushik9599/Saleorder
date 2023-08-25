<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="project21.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"  rel="stylesheet" />
    <script type="text/javascript">
        function showalert(title, message, type) {
            Swal.fire(title, message, type);
        }
        function validation() {
            var location_code = document.getElementById("location").value;
            var date = document.getElementById("calander").value;
            var customerNumber = document.getElementById("customer_number").value;
            if (location_code == "") {
                showalert("Error", "please enter the location code ","error");
                return false;
            }
            if (location_code.length !== 6 || isNaN(location_code)) {
                showalert("Error","please enter the valid location_code","error");
                return false;
            }
            if (date == "") {
                showalert("Error","please enter the date of order ","error");
                return false;
            }
            var datePattern = /^\d{4}-\d{2}-\d{2}$/;
            if (!datePattern.test(date)) {
                showalert( "Error","please enter the correct pattern of date 'yyyy-mm-dd' ","error");
                return false;
            }
            var currentdate = new Date();
            var enterdate = new Date(date);
            if (enterdate > currentdate) {

                showalert("Error","please enter the valid date ","error");
                return false;
            }
            if (customerNumber = "") {
                showalert("Error", "please enter the customer number", "error");
                return false;
            }
            
            return true;
        }
    </script>
    <style>
        body{
            margin:0;
            padding:0;
            background-color:#fff;
        }
       h2{
           text-align:left;
           padding:15px 70px;
           color:#435334;

           
         
       }
       .sale_order{
           background:#9EB384;
           margin-bottom:20px;

       }
       .container{
           width:70%;
           background-color:#fff;
           padding:30px;
           margin-bottom:30px;
box-shadow: 0px 0px 28px -21px rgba(0,0,0,0.75)

       }
       tr{
           border-color:#fff;
       }
       input,select{
           width:180px;
       }
       input[type="checkbox"]{
           width:20px;
       }
      
       .btn_container{
        display:flex;
        align-content:center;
        justify-content:center;


       }
        .btn1 {
            background: #9EB384;
            color: #000;
            margin:0 8px;
        }
    /*   .btn1:hover{

           background:#fff;
           color:#000;
      }     
           */
      
        </style>
</head>
<body>
    <form id="form1" runat="server" >
        <div class="sale_order">
              <h2> Sales Order</h2>
        </div>
        <div class="container">
            <table class="table">
                <tr>
                    <td><asp:Label  runat="server" Text="No" cssclass="form-label"></asp:Label></td>
                    <td><asp:TextBox ID="No" runat="server"   cssclass="form-control"></asp:TextBox></td>
<%--                    <asp:RequiredFieldValidator ID="required1" ControlToValidate="NoT" runat="server" ErrorMessage="No cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <td><asp:Label  runat="server" Text="Order No"><span runat="server" class="Asterix" style="color:red;">*</span></asp:Label></td>
                    <td><asp:TextBox ID="Order_No" runat="server"  cssclass="form-control" ></asp:TextBox></td>
<%--                    <asp:RequiredFieldValidator ID="required2" runat="server" ControlToValidate="Order_NoT" ErrorMessage="please enter the order number" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                   <%-- <asp:RequiredFieldValidator ID="required_field" runat="server" ErrorMessage="ORDER NO REQUIRED" ControlToValidate="Order_NoT"></asp:RequiredFieldValidator>--%>
                </tr>
                <tr>
                    <td><asp:Label  runat="server" Text="Client"><span runat="server" class="Asterix" style="color:red">*</span></asp:Label></td>
                    <td><asp:DropDownList runat="server" ID="Client"  cssclass="form-control">
                        <asp:ListItem Value="Test B2C" Text="Test B2C"></asp:ListItem>
                        <asp:ListItem Value="Test B2B" Text="Test B2B"></asp:ListItem>
                        <asp:ListItem Value="Test C2B" Text="Test C2B"></asp:ListItem>
                        <asp:ListItem Value="Test B2G" Text="Text B2G"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td><asp:Label  runat="server" Text="Location Code"><span runat="server" class="Asterix" style="color:red;">*</span></asp:Label></td>
                    <td><asp:TextBox ID="location" runat="server"  cssclass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label  runat="server" Text="Customer Number"></asp:Label></td>
                    <td><asp:TextBox ID="customer_number" runat="server"  cssclass="form-control"></asp:TextBox></td>
                    <td><asp:Label  runat="server">Partial Delivery Allowed</asp:Label></td>
                    <td><asp:TextBox ID="partial" runat="server"  cssclass="form-control"></asp:TextBox></td>

                </tr>
                <tr>
                    <td><asp:Label  runat="server" >Payment Method Code</asp:Label></td>
                    <td><asp:DropDownList runat="server" ID="payment"  cssclass="form-control">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td><asp:Label  runat="server" >Shipment Method Code</asp:Label></td>
                    <td><asp:DropDownList runat="server" ID="shipment"  cssclass="form-control">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label  runat="server">Channel Identification</asp:Label></td>
                    <td><asp:DropDownList runat="server" ID="channel"  cssclass="form-control">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList></td>
                    <td><asp:Label  runat="server">Batch No</asp:Label></td>
                    <td><asp:TextBox ID="Batch" runat="server"  cssclass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label  runat="server">Tax Structure</asp:Label></td>
                    <td><asp:TextBox ID="tax" runat="server"  cssclass="form-control"></asp:TextBox></td>
                    <td><asp:Label  runat="server">Order Type</asp:Label></td>
                    <td><asp:DropDownList runat="server" ID="order_type" cssclass="form-control">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label  runat="server" >Status</asp:Label></td>
                    <td><asp:TextBox ID="status" runat="server"  cssclass="form-control"></asp:TextBox></td>
                    <td><asp:Label  runat="server">Payment Mode</asp:Label></td>
                    <td><asp:DropDownList runat="server" ID="payment_mode" cssclass="form-control">
                        <asp:ListItem>UPI</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                        <asp:ListItem>Net Banking</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label  runat="server">Reference No</asp:Label></td>
                    <td><asp:TextBox ID="reference_no" runat="server"  cssclass="form-control"></asp:TextBox></td>
                    <td><asp:Label  runat="server">Type of Sale </asp:Label></td>
                    <td><asp:TextBox ID="type_of_sale" runat="server"  cssclass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="b2b" runat="server" Text="Is B2B" ></asp:Label></td>
                    <td><asp:CheckBox ID="checkbox" runat="server"   cssclass="form-control" /></td>
                    <td><asp:Label ID="date" runat="server" Text="Order Date"><span runat="server" class="Asterix" style="color:red;">*</span></asp:Label></td>
                    <td><asp:TextBox ID="calander" runat="server"  cssclass="form-control" ></asp:TextBox></td>

                </tr>
                <tr>
                    <td><asp:Label  runat="server">External Remark</asp:Label></td>
                    <td><asp:TextBox ID="remark" runat="server"  cssclass="form-control"></asp:TextBox></td>
                </tr>

            </table>
            <div class="btn_container">
       
                    <asp:Button ID="button" runat="server" Text="Submit" CssClass="btn1 btn"  OnClick="button_Click" OnClientClick="return validation();"/>
                    <asp:Button ID="back" runat="server" Text="Back" CssClass="btn1 btn" OnClick="back_Click" />
          </div>
        </div>
    </form>
</body>
</html>
