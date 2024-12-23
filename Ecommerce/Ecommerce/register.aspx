<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Ecommerce.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-control {
            border: 1.3px solid black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-dark">
        <div class="container py-2">
            <div class="row">
                <h4 class="text-white pt-1">Create account</h4>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card-body">
                    <h5 class="card-title text-center fw-bold mb-2">Register</h5>
                    <div class="underline mb-3" style="border-bottom: 2px solid black;"></div>

                    <div class="mb-3">
                        <label class="form-label">USERNAME <span class="text-danger fw-bold">*</span></label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control rounded-0 py-2" placeholder="Enter Your Username"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">EMAIL <span class="text-danger fw-bold">*</span></label>
                        <asp:TextBox ID="txtEmailAddress" runat="server" TextMode="Email" CssClass="form-control rounded-0 py-2" placeholder="Enter Your Email"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">PHONE <span class="text-danger fw-bold">*</span></label>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Number" CssClass="form-control rounded-0 py-2" placeholder="Enter Phone Number"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">PASSWORD <span class="text-danger fw-bold">*</span></label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control rounded-0 py-2" placeholder="Enter Your Password"></asp:TextBox>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">CONFIRM PASSWORD <span class="text-danger fw-bold">*</span></label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control rounded-0 py-2" placeholder="Enter Confirm Password"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <asp:Button ID="registerBtn" runat="server" CssClass="btn btn-dark rounded-0 text-white text-center w-100" Text="CONTINUE" OnClick="registerBtn_Click" />
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
