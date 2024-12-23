<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Ecommerce.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-dark">
        <div class="container py-3">
            <div class="row">
                <h4 class="text-white pt-1">Products</h4>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <div class="row">
            <div class="col-md-12">

                <asp:DataList ID="DataList1" runat="server" CssClass="my-3" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <div class="card rounded-0 text-center shadow m-2 mb-3">
                            <div class="card-body">
                                <asp:Image ID="productImage" runat="server" ImageUrl='<%# Eval("productimage") %>' Width="230px" Height="260px" />
                                <h4 class="my-2">
                                    <asp:Label ID="productName" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                                </h4>
                                <asp:Button ID="btnView" runat="server" Text="View Details" CommandName="viewdetails" CommandArgument='<%# Eval("productid") %>' CssClass="mt-1 btn btn-primary w-100 rounded-0" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>

                <p>
                    <asp:Label ID="lblNotFound" runat="server" CssClass="fs-5"></asp:Label>
                </p>

            </div>
        </div>
    </div>

</asp:Content>
