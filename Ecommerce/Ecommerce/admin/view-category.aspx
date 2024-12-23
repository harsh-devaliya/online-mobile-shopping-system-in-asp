<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="view-category.aspx.cs" Inherits="Ecommerce.admin.view_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container px-4 py-4">
        <div class="row">
            <div class="col-md-12">

                <div class="card-header">
                    <div class="clearfix">
                        <h3 class="float-start">View Category</h3>
                        <a href="add-category.aspx" class="float-end btn btn-info">Add Category</a>
                    </div>
                </div>
                <hr class="mt-2" />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="catid" CssClass="table table-striped" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>

                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-primary btn-sm" Text="Update"></asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-danger btn-sm" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-primary btn-sm" Text="Edit"></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm" Text="Delete" OnClientClick="return confirm('Do you want to delete this record?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("catid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCatName" runat="server" Text='<%# Bind("catname") %>' CssClass="form-control rounded-1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblname" runat="server" Text='<%# Eval("catname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Slug">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCatSlug" runat="server" Text='<%# Bind("catslug") %>' CssClass="form-control rounded-1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblslug" runat="server" Text='<%# Eval("catslug") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCatDescription" runat="server" Text='<%# Bind("catdescription") %>' CssClass="form-control rounded-1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbldescription" runat="server" Text='<%# Eval("catdescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCatImage" runat="server" Text='<%# Bind("catimage") %>' CssClass="form-control rounded-1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="catImage" runat="server" ImageUrl='<%# Eval("catimage") %>' CssClass="rounded-1" Width="75px" Height="45px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCatStatus" runat="server" Text='<%# Bind("catstatus") %>' CssClass="form-control rounded-1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("catstatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>

</asp:Content>
