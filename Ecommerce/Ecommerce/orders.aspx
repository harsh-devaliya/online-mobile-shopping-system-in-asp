<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="Ecommerce.orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-dark">
        <div class="container py-2">
            <div class="row">
                <h4 class="text-white pt-1">my orders</h4>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card rounded-0">
                    <div class="card-body">

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered text-center">

                            <EmptyDataTemplate>
                                <h2 class="text-center py-4">You haven't any order</h2>
                            </EmptyDataTemplate>

                            <Columns>
                                <asp:BoundField HeaderText="Tracking No" DataField="trackingid" />
                                <asp:BoundField HeaderText="Email ID" DataField="email" />
                                <asp:BoundField HeaderText="Delivered Address" DataField="address" />
                                <asp:BoundField HeaderText="Quantity" DataField="totalquantity" />
                                <asp:BoundField HeaderText="Total Price" DataField="grandtotal" />
                                <asp:BoundField HeaderText="Payment Type" DataField="payment" />
                                <asp:BoundField HeaderText="Ordered On" DataField="createat" DataFormatString="{0:dd MMM yyyy hh:mm tt}" />
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
