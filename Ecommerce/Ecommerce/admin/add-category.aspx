<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="add-category.aspx.cs" Inherits="Ecommerce.admin.add_category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container px-4 py-4">
        <div class="row">
            <div class="col-md-12">

                    <div class="card-header">
                        <div class="clearfix">
                            <h3 class="float-start">Add Category</h3>
                            <a href="view-category.aspx" class="float-end btn btn-warning">View Category</a>
                        </div>
                    </div>
                <hr class="mt-2" />

                <div class="card">

                <div class="card-body">
                    
                    <div class="mb-3">
                        <label class="form-label">CATEGORY NAME</label>
                        <asp:TextBox ID="txtCatName" runat="server" CssClass="form-control rounded-1" placeholder="Enter Category Name"></asp:TextBox>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">CATEGORY SLUG</label>
                        <asp:TextBox ID="txtCatSlug" runat="server" CssClass="form-control rounded-1" placeholder="Enter Category Slug"></asp:TextBox>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">CATEGORY DESCRIPTION</label>
                        <asp:TextBox ID="txtCatDescription" runat="server" TextMode="MultiLine" CssClass="form-control rounded-1" placeholder="Enter Category Description"></asp:TextBox>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label">CATEGORY IMAGE</label>
                        <asp:FileUpload ID="fileUploadCatImage" runat="server" CssClass="form-control rounded-1" />
                    </div>
                    
                    <div class="mb-1">
                        <asp:Button ID="addCategoryBtn" runat="server" CssClass="btn btn-primary rounded-1" Text="Add Category" OnClick="addCategoryBtn_Click" />
                    </div>

                </div>
                
                </div>
            </div>
        </div>
    </div>

</asp:Content>

