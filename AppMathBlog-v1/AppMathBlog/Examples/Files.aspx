<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Files.aspx.cs" Inherits="AppMathBlog.Examples.Files" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h2>Приклади завантаження файлів</h2>

    <h3>Зчитування властивостей файлу</h3>
    <asp:FileUpload 
        runat="server" 
        ID="FileUpload0" 
        AllowMultiple="false" />
    <asp:Button runat="server" ID="Button0" Text="Завантажити та прочитати дані" OnClick="Button0_Click" />
    <output id="output0" runat="server"></output>

    <h3>Зчитування одовимірного масиву</h3>
    <asp:FileUpload 
        runat="server" 
        ID="FileUpload1" 
        AllowMultiple="false" />
    <asp:Button runat="server" ID="Button1" Text="Завантажити та прочитати дані" OnClick="Button1_Click" />
    <asp:Table runat="server" ID="Table1" GridLines="Both"></asp:Table>


    <h3>Зчитування двовимірного масиву</h3>
    <asp:FileUpload runat="server" ID="FileUpload2" AllowMultiple="false" />
    <asp:Button runat="server" ID="Button2" Text="Завантажити та прочитати дані" OnClick="Button2_Click" />
    <asp:Table runat="server" ID="Table2" GridLines="Both"></asp:Table>

    <h3>Зчитування даних xml-файлу</h3>
    <asp:FileUpload runat="server" ID="FileUpload3" AllowMultiple="false" />
    <asp:Button runat="server" ID="Button3" Text="Завантажити та прочитати дані" OnClick="Button3_Click" />
    <asp:Table runat="server" ID="Table3" GridLines="Both">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Ід</asp:TableHeaderCell>
            <asp:TableHeaderCell>Модель</asp:TableHeaderCell>
            <asp:TableHeaderCell>Ціна</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>

    <h3>Зчитування даних json-файлу</h3>
    <asp:FileUpload runat="server" ID="FileUpload4" AllowMultiple="false" />
    <asp:Button runat="server" ID="Button4" Text="Завантажити та прочитати дані" OnClick="Button4_Click" />
    <asp:Table runat="server" ID="Table4" GridLines="Both">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Ід</asp:TableHeaderCell>
            <asp:TableHeaderCell>Модель</asp:TableHeaderCell>
            <asp:TableHeaderCell>Ціна</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
</asp:Content>
