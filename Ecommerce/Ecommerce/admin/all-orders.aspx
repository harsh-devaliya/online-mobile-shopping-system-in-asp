<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="all-orders.aspx.cs" Inherits="Ecommerce.admin.all_orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container px-4 py-4">
        <div class="row">
            <div class="col-md-12">

                <div class="card-header">
                    <div class="clearfix">
                        <h3 class="float-start">View Orders</h3>
                    </div>
                </div>
                <hr class="mt-2" />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="orderid" CssClass="table table-striped">
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
                                <asp:Label ID="lblorderid" runat="server" Text='<%# Eval("orderid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="tracking no">
                            <ItemTemplate>
                                <asp:Label ID="lbltrackingid" runat="server" Text='<%# Eval("trackingid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="username">
                            <ItemTemplate>
                                <asp:Label ID="lblusername" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="quantity">
                            <ItemTemplate>
                                <asp:Label ID="lblquantity" runat="server" Text='<%# Eval("totalquantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="total price">
                            <ItemTemplate>
                                <asp:Label ID="lbltotal" runat="server" Text='<%# Eval("grandtotal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="address">
                            <ItemTemplate>
                                <asp:Label ID="lbladdress" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="order on">
                            <ItemTemplate>
                                <asp:Label ID="lblcreateat" runat="server" Text='<%# Eval("createat", "{0: dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>



                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>

</asp:Content>
