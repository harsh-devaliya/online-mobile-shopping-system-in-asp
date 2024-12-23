<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="add-product.aspx.cs" Inherits="Ecommerce.admin.add_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container px-4 py-4">
        <div class="row">
            <div class="col-md-12">

                <div class="card-header">
                    <div class="clearfix">
                        <h3 class="float-start">Add Product</h3>
                        <a href="view-product.aspx" class="float-end btn btn-warning">View Product</a>
                    </div>
                </div>
                <hr class="mt-2" />

                <div class="card">

                    <div class="card-body">

                        <div class="mb-3">
                            <label class="form-label">SELECT CATEGORY</label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select" DataTextField="catname" DataValueField="catname"></asp:DropDownList>
                        </div>


                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">NAME</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control rounded-1" placeholder="Enter Product Name"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">SLUG</label>
                                <asp:TextBox ID="txtSlug" runat="server" CssClass="form-control rounded-1" placeholder="Enter Product Slug"></asp:TextBox>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">DESCRIPTION</label>
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control rounded-1" placeholder="Enter Product Description"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">PRODUCT IMAGE</label>
                            <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-control rounded-1" />
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <label class="form-label">ORIGINAL PRICE</label>
                                <asp:TextBox ID="txtOrgPrice" runat="server" CssClass="form-control rounded-1" placeholder="Enter Original Price"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="form-label">SELLING PRICE</label>
                                <asp:TextBox ID="txtSellPrice" runat="server" CssClass="form-control rounded-1" placeholder="Enter Selling Price"></asp:TextBox>
                            </div>
                        </div>

                        <div class="mb-1">
                            <asp:Button ID="addProductBtn" runat="server" CssClass="btn btn-primary rounded-1" Text="Add Product" OnClick="addProductBtn_Click" />
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

</asp:Content>
