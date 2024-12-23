<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="Ecommerce.category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-dark">
        <div class="container py-3">
            <div class="row">
                <h4 class="text-white">Categories</h4>
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
                                <asp:Image ID="catImage" runat="server" ImageUrl='<%# Eval("catimage") %>' Width="230px" Height="140px" />
                                <h5 class="my-1">
                                    <asp:Label ID="lblCatName" runat="server" Text='<%# Eval("catname") %>'></asp:Label>
                                </h5>
                                <asp:Button ID="btnView" runat="server" Text="View Products" CommandName="viewdetails" CommandArgument='<%# Eval("catslug") %>' CssClass="mt-2 btn btn-primary w-100 rounded-0" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>

            </div>
        </div>
    </div>

</asp:Content>
