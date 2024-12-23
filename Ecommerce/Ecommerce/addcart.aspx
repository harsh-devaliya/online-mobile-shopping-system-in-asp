<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="addcart.aspx.cs" Inherits="Ecommerce.addcart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-dark">
        <div class="container py-2">
            <div class="row">
                <h4 class="text-white pt-1">My Cart</h4>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card rounded-0">
                    <div class="card-body">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-striped text-center" OnRowCommand="GridView1_RowCommand">

                            <EmptyDataTemplate>
                                <h2 class="text-center py-4">Your cart is empty</h2>
                            </EmptyDataTemplate>

                            <Columns>
                                <asp:ImageField HeaderText="Image" DataImageUrlField="productimage" ControlStyle-Width="50px" ControlStyle-Height="60px"></asp:ImageField>
                                <asp:BoundField HeaderText="Name" DataField="name" />
                                <asp:BoundField HeaderText="Price" DataField="price" />
                                <asp:BoundField HeaderText="Quantity" DataField="quantity" />
                                <asp:BoundField HeaderText="Total Price" DataField="totalprice" />

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-danger rounded-0" CommandName="remove" CommandArgument='<%# Eval("cartid") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

                <div class="mt-3" style="margin-right: 70px;">
                    <asp:Button ID="btnCheckout" runat="server" CssClass="float-end btn btn-primary rounded-0" Text="Checkout" OnClick="btnCheckout_Click" />
                </div>

            </div>
        </div>
    </div>

</asp:Content>
