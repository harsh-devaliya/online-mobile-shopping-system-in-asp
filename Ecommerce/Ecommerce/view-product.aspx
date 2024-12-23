<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="view-product.aspx.cs" Inherits="Ecommerce.view_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-dark">
        <div class="container py-2">
            <div class="row">
                <h4 class="text-white pt-1">View Product</h4>
            </div>
        </div>
    </div>

    <div class="container my-5 product-details">
        <div class="row">
            <div class="col-md-12">

                <asp:DataList ID="DataList1" runat="server" CssClass="mx-5" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>

                        <table class="table table-striped table-bordered">
                            <tr>
                                <td rowspan="5">
                                    <div class="p-3">
                                        <asp:Image ID="productImage" runat="server" ImageUrl='<%# Eval("productimage") %>' Width="310px" Height="350px" />

                                    </div>
                                </td>
                                <td>
                                    <h3 class="pt-3">
                                        <asp:Label ID="productName" runat="server" Text='<%# Eval("productname") %>'></asp:Label></h3>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex justify-content-start pt-3">
                                        <h5 class="text-success">Price: ₹<asp:Label ID="productSellPrice" runat="server" Text='<%# Eval("productsellprice") %>'></asp:Label></h5>
                                        <h5 class="ms-4 text-danger text-decoration-line-through">MRP: ₹<asp:Label ID="productOrgPrice" runat="server" Text='<%# Eval("productorgprice") %>'></asp:Label></h5>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p class="pt-3">
                                        <asp:Label ID="productDescription" runat="server" Text='<%# Eval("productdescription") %>'></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        Quantity:
                                        <asp:DropDownList ID="productQty" runat="server" CssClass="form-select ms-2" Style="width: 70px">
                                            <asp:ListItem Text="1"></asp:ListItem>
                                            <asp:ListItem Text="2"></asp:ListItem>
                                            <asp:ListItem Text="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnAddCart" runat="server" Text="Add To Cart" CommandName="addtocart" CommandArgument='<%# Eval("productid") %>' CssClass="btn btn-primary rounded-0" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>

                <p class="fs-5">
                    <asp:Label ID="lblNotFound" runat="server"></asp:Label>
                </p>

            </div>
        </div>
    </div>

</asp:Content>
