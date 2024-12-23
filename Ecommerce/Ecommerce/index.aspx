<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Ecommerce.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="sliders/slider1.jpg" alt="image" style="width:100%;height:500px;">
                <div class="container">
                    <div class="carousel-caption"></div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="sliders/slider2.jpg" alt="image" style="width:100%;height:500px;">
                <div class="container">
                    <div class="carousel-caption"></div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="sliders/slider3.jpg" alt="image" style="width:100%;height:500px;">
                <div class="container">
                    <div class="carousel-caption"></div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="sliders/slider4.jpg" alt="image" style="width:100%;height:500px;">
                <div class="container">
                    <div class="carousel-caption"></div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
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
                                <div class="d-flex justify-content-around">
                                    <p class="text-success">
                                        Price: ₹<asp:Label ID="lblSellPrice" runat="server" Text='<%# Eval("productsellprice") %>'></asp:Label>
                                    </p>
                                    <p class="text-danger text-decoration-line-through">
                                        MRP: ₹<asp:Label ID="lblOrgPrice" runat="server" Text='<%# Eval("productorgprice") %>'></asp:Label>
                                    </p>
                                </div>
                                <asp:Button ID="btnView" runat="server" Text="View Details" CommandName="viewdetails" CommandArgument='<%# Eval("productid") %>' CssClass="btn btn-primary w-100 rounded-0" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>

            </div>
        </div>
    </div>

</asp:Content>
