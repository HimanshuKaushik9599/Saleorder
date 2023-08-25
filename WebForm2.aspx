<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="project21.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"  rel="stylesheet" />

    <style>
        body {
            background: #f4f4f4;
            margin:0;
            padding:0;

        }

        .Container {
            display: grid;
            margin: 80px 50px; 
            
        }

        table {
            background: #fff;
            width: 100%;
        }

        th {
            background: #9EB384;
            color: #435334;
        }

        table, th, td, tr {
            padding: 10px;
            border:solid 1px black;
        }

        td {
            text-align: center;
        }

        .editbtn {
            color: #435334;
            padding: 0 10px;
        }
        td:nth-child(7){

            width:120px;
        }
        #Add{
            float:right;
            margin-right:50px;
                 background: #9EB384;
                 
                 position:absolute;
                 top:70px;
                 right:10px;
                 border-radius:8px;
/*                 border:1px solid #000;
*/                 


        }
        #Add:hover{
            background:#fff;
            color:#000;
        }
        .heading{
            background:#7B996C;
            padding:2px ;
         
         
          
        }
        h2{
            text-align:left;
            margin-left:30px;
                      color: #435334;
        }
        /*tr:nth-child(odd){
          background:#CEDEBD;
      }
       tr:nth-child(even){
          background:#FAF1E4;
      }*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="heading">
            <h2>Order List</h2>
        </div>
        <div class="Container">
            <asp:GridView ID="gridviewid" runat="server" AutoGenerateColumns="false"  DataKeyNames="No" OnRowCommand="gridviewid_RowCommand">
                <Columns>
                    <asp:BoundField DataField="No" HeaderText="No." />
                    <asp:BoundField DataField="Order_No" HeaderText="Order_No" />
                    <asp:BoundField DataField="Client" HeaderText="Client" />
                    <asp:BoundField DataField="Customer_number" HeaderText="Customer_No" />
                    <asp:BoundField DataField="Location_Code" HeaderText="Location_Code" />
                    <asp:BoundField DataField="date" HeaderText="Order_Date" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="Edit" runat="server" CommandName="Edit" CssClass="fa-solid fa-pen-to-square editbtn" CommandArgument='<%#Eval("No") %>'></asp:LinkButton>
                            <asp:LinkButton ID="Delete" runat="server" CommandName="del" CssClass="fa-solid fa-trash editbtn" CommandArgument='<%#Eval("No") %>' OnClientClick='return confirm("Are you sure you want to delete ");'></asp:LinkButton>
<%--                            <asp:LinkButton ID="Invoice" runat="server" CommandName="Invoice" CssClass="fa-solid fa-file-invoice editbtn"></asp:LinkButton>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                

            </asp:GridView>
        </div>
        <div>
                        <asp:Button ID="Add" runat="server" Text="Add Item" OnClick="Add_Click" CssClass="btn" />

        </div>
    </form>
</body>
</html>
