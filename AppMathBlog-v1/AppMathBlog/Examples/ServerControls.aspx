<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ServerControls.aspx.cs" Inherits="AppMathBlog.ServerControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h1>Базові приклади</h1>

    <h2>Додавання</h2>
    <asp:TextBox runat="server" ID="a" EnableViewState="false"></asp:TextBox>+<asp:TextBox runat="server" ID="b"></asp:TextBox>=<asp:Label runat="server" ID="sum"></asp:Label>
    <asp:Button runat="server" ID="btnFindSum" Text="Знайти суму" OnClick="btnFindSum_Click" />

    <h2>Інші операції</h2>
    <asp:TextBox runat="server" ID="arg1"></asp:TextBox>
    <asp:DropDownList runat="server" ID="oper" AutoPostBack="true" OnSelectedIndexChanged="oper_SelectedIndexChanged">
        <asp:ListItem Value="" Text="-Виберіть операцію-"></asp:ListItem>
        <asp:ListItem Value="-" Text="-"></asp:ListItem>
        <asp:ListItem Value="*" Text="*"></asp:ListItem>
        <asp:ListItem Value="/" Text="/"></asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox runat="server" ID="arg2"></asp:TextBox>=<asp:Label runat="server" ID="res"></asp:Label>

    <h2>Послідовність чисел Фібоначчі</h2>
    <asp:TextBox runat="server" ID="txtN" Text="2"></asp:TextBox>
    <asp:Button runat="server" ID="btnGenerate" Text="Згенерувати" OnClick="btnGenerate_Click" />
    <div runat="server" id="fib">
    </div>

    <h2>Інкремент</h2>
    <%=i %>
    <asp:Button runat="server" ID="btnInc" Text="Інкремент" OnClick="btnInc_Click" />

</asp:Content>
