<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="view-product.aspx.cs" Inherits="Ecommerce.admin.view_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container px-4 py-4">
        <div class="row">
            <div class="col-md-12">

                <div class="card-header">
                    <div class="clearfix">
                        <h3 class="float-start">View Product</h3>
                        <a href="add-product.aspx" class="float-end btn btn-info">Add Product</a>
                    </div>
                </div>
                <hr class="mt-2" />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="productid" CssClass="table table-striped" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>

                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-primary btn-sm" Text="Update"></asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-danger  btn-sm" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-primary btn-sm" Text="Edit"></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger  btn-sm" Text="Delete" OnClientClick="return confirm('Do you want to delete this record?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("productid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control rounded-1" Text='<%# Bind("productcategory") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblcategory" runat="server" Text='<%# Eval("productcategory") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control rounded-1" Text='<%# Bind("productname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblname" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Slug">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSlug" runat="server" CssClass="form-control rounded-1" Text='<%# Bind("productslug") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblslug" runat="server" Text='<%# Eval("productslug") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control rounded-1" Text='<%# Bind("productdescription") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbldescription" runat="server" Text='<%# Eval("productdescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtImage" runat="server" CssClass="form-control rounded-1" Text='<%# Bind("productimage") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="productImg" runat="server" ImageUrl='<%# Eval("productimage") %>' CssClass="rounded-1" Width="55px" Height="70px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Org Price">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOrgPrice" runat="server" CssClass="form-control rounded-1" Text='<%# Bind("productorgprice") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblorgprice" runat="server" Text='<%# Eval("productorgprice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sell Price">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSellPrice" runat="server" CssClass="form-control rounded-1" Text='<%# Bind("productsellprice") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblsellprice" runat="server" Text='<%# Eval("productsellprice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control rounded-1" Text='<%# Bind("productstatus") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("productstatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>

</asp:Content>
