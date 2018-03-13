<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="AppMathBlog.Blog.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">        
    <script src="../Scripts/fileinput.js" type="text/javascript"></script>
    <script src="../Scripts/locales/uk.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $("#picture").fileinput({
                language: "uk",
                msgPlaceholder: 'Виберіть файл...',
                'showUpload': false,
                'showRemove': false,
                maxFileCount: 1,
                maxFileSize: 500,
                previewFileType: "image",
                browseClass: "btn btn-success",
                browseLabel: "&nbsp; Огляд...",
                browseIcon: '<i class="glyphicon glyphicon-picture"></i>'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h2>Новий блог</h2>
    <div class="form-group">
        <label for="title">Назва блогу <span style="color:red;font-weight:bold">*</span></label>
        <asp:TextBox runat="server" ID="title" CssClass="form-control" placeholder="Задайте назву блогу"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="title" Text="Введіть назву блогу" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>        
    </div>
    <div class="form-group">
        <label for="description">Короткий опис вмісту блогу<span style="color:red;font-weight:bold">*</span></label>
        <asp:TextBox runat="server" ID="description" class="form-control" placeholder="Задайте короткий опис змісту блогу"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="description" Text="Введіть короткий опис блогу" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label for="body">Вміст публікації</label>
        <asp:TextBox runat="server" ID="body" class="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
    </div> 
    <div class="form-group">
        <label for="picture">Зображення</label>
        <asp:FileUpload runat="server" ID="picture" ClientIDMode="Static" AllowMultiple="False" />                
    </div>
    <div class="form-group">
        <a href="Index.aspx" class="btn btn-default">Скасувати</a>
        <asp:Button runat="server" id="btnCreate" class="btn btn-success" Text="Створити" OnClick="btnCreate_Click"></asp:Button>
    </div>
</asp:Content>
