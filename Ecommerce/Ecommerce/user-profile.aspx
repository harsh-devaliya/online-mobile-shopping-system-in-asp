<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="user-profile.aspx.cs" Inherits="Ecommerce.user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-control {
            border: 1.3px solid gray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-dark">
        <div class="container py-2">
            <div class="row">
                <h4 class="text-white pt-1">my profile</h4>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <div class="row">
            <div class="col-md-12">

                <div class="card rounded-1 my-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">USERNAME</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control rounded-1" ReadOnly></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">PHONE NUMBER</label>
                                <asp:TextBox ID="txtPhone" runat="server" TextMode="Number" CssClass="form-control rounded-1" placeholder="Enter Phone Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">EMAIL ADDRESS</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control rounded-1" ReadOnly></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">NEW PASSWORD</label>
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control rounded-1" placeholder="Enter New Paswword"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mb-1 clearfix">
                                <asp:Button ID="updateBtn" runat="server" CssClass="float-end btn btn-primary rounded-1" Text="Update Your Profile" OnClick="updateBtn_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
