<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Ecommerce.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-dark">
        <div class="container py-2">
            <div class="row">
                <h4 class="text-white pt-1">Checkout</h4>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <div class="row">
            <div class="col-md-12">

                <div class="row">
                    <div class="col-md-6">
                        <div class="card rounded-1">
                            <div class="card-header rounded-1">
                                <h4>Basic Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">PHONE NUMBER</label>
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="rounded-0 form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">EMAIL ADDRESS</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="rounded-0 form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">DELIVERY ADDRESS</label>
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="rounded-0 form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">PAYMENT OPTIONS</label>
                                    <asp:DropDownList ID="ddlPayment" runat="server" CssClass="rounded-0 form-select">
                                        <asp:ListItem Text="Cash On Delivery"></asp:ListItem>
                                        <asp:ListItem Text="RazorPay"></asp:ListItem>
                                        <asp:ListItem Text="Paypal"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card rounded-1">
                            <div class="card-header rounded-1">
                                <h4>Order Details</h4>
                            </div>
                            <div class="card-body">

                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered text-center">
                                    <Columns>
                                        <asp:ImageField HeaderText="Product" DataImageUrlField="productimage" ControlStyle-Width="50px" ControlStyle-Height="60px"></asp:ImageField>
                                        <asp:BoundField HeaderText="Name" DataField="name" />
                                        <asp:BoundField HeaderText="Price" DataField="price" />
                                        <asp:BoundField HeaderText="Qty" DataField="quantity" />
                                        <asp:BoundField HeaderText="Total" DataField="totalprice" />
                                    </Columns>
                                </asp:GridView>

                                <div style="border: 1px solid black;"></div>

                                <div class="clearfix mt-2">
                                    <h4 class="float-start">Grand Total:</h4>
                                    <h4 class="float-end text-success">₹
                                        <asp:Label ID="lblGrandTotal" runat="server"></asp:Label></h4>
                                </div>

                                <div class="mt-2">
                                    <asp:Button ID="btnPlaceOrder" runat="server" CssClass="w-100 btn btn-primary rounded-0" Text="Place Your Order" OnClick="btnPlaceOrder_Click" />
                                </div>

                            </div>
                        </div>
                    </div>

                </div>



            </div>
        </div>
    </div>

</asp:Content>
