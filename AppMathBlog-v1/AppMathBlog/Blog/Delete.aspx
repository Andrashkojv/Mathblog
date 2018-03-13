<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="AppMathBlog.Blog.Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h2>Видалення блогу</h2>
    <p>
        Ви дійсно бажаєте видалити блог <span id="title" runat="server" class="label label-warning"></span>?
    </p>    

    <div>
        <a href="Index.aspx" class="btn btn-default">Скасувати</a>
        <asp:Button runat="server" ID="btnDelete" Text="Видалити" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
    </div>
</asp:Content>
