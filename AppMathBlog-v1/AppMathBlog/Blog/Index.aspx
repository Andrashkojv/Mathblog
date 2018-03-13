<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AppMathBlog.Blog.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <script src="../Scripts/fileinput.js" type="text/javascript"></script>
    <script src="../Scripts/locales/uk.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $("#fuImport").fileinput({
                language: "uk",
                showPreview: false,
                msgPlaceholder: 'Виберіть файл...',
                'showUpload': false,
                'showRemove': false,
                maxFileCount: 1,
                maxFileSize: 500,                
                browseClass: "btn btn-success",
                browseLabel: "&nbsp; Огляд...",                
                browseIcon: '<i class="glyphicon glyphicon-picture"></i>'
            });
        });
    </script>
    <style>
        .file-caption-main{
            float:left;
        }
        .file-caption,.file-caption-main{
            width:150px!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h2>Список блогів</h2>
    
    <nav class="navbar navbar-default">
      <div class="container-fluid">
         
        <div class="navbar-form navbar-left">
            <asp:TextBox runat="server" ID="q" CssClass="form-control" placeholder="Ключова фраза для пошуку" autocomplete="off" Width="300px" style="display:table-cell"></asp:TextBox>
            <asp:Button runat="server" ID="btnSearch" Text="Знайти" CssClass="btn btn-success" />           
        </div>
        <div class="navbar-form navbar-left">
            <asp:FileUpload runat="server" ID="fuImport" ClientIDMode="Static" AllowMultiple="false" />            
        </div>
        <div class="navbar-form navbar-left">
            <asp:Button runat="server" ID="btnImport" Text="Імпорт" CssClass="btn btn-success" OnClick="btnImport_Click" />
            <%if (blogs.Count > 0)
               {%>  
                <asp:Button runat="server" ID="btnExport" Text="Експорт" CssClass="btn btn-primary" OnClick="btnExport_Click" />
            <%} %>
        </div>
        <div class="navbar-form navbar-right">
            <div class="btn-group">
                <asp:LinkButton runat="server" CssClass="btn btn-default" CommandArgument="0" OnClick="Unnamed_Click"><span class="glyphicon glyphicon-list" aria-hidden="true"></span></asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn btn-default" CommandArgument="1" OnClick="Unnamed_Click"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></asp:LinkButton>
            </div>
        </div>    
      </div>
    </nav>         

    <asp:MultiView runat="server" ID="BlogListView" ActiveViewIndex="0">        
        <asp:View runat="server">
            <%if (blogs.Count > 0)
                {%>  
                <%foreach (var blog in blogs)
                    {%>
                    <div class="media">
                      <div class="media-left">
                        <a href="#">
                          <img class="media-object" src="<%= blog.Picture != null ? "data:image/png;base64," + blog.Picture : "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PCEtLQpTb3VyY2UgVVJMOiBob2xkZXIuanMvNjR4NjQKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNjFhYTE0OGU1MyB0ZXh0IHsgZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE2MWFhMTQ4ZTUzIj48cmVjdCB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSIxMy4xNzk2ODc1IiB5PSIzNi41Ij42NHg2NDwvdGV4dD48L2c+PC9nPjwvc3ZnPg==" %>">
                        </a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading"><%= blog.Title %></h4>
                        <%= blog.Description %>
                      </div>
                    </div>
                <%} %>
            <%} %>
        </asp:View>
        <asp:View runat="server">
            <%if (blogs.Count > 0)
                {%>          
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>
                                <asp:LinkButton runat="server" CommandName="title" CommandArgument="asc" Text="Назва" OnClick="Sort_Click"></asp:LinkButton>
                                <%if (SortBy == "title")
                                    {%>
                                    <span class="glyphicon glyphicon-sort-by-attributes<%= SortOrder == "asc" ? string.Empty : "-alt" %>" aria-hidden="true"></span>                            
                                <%} %>
                            </th>
                            <th>
                                <asp:LinkButton runat="server" CommandName="description" CommandArgument="asc" Text="Опис" OnClick="Sort_Click"></asp:LinkButton>
                                <%if (SortBy == "description")
                                    {%>
                                    <span class="glyphicon glyphicon-sort-by-attributes<%= SortOrder == "asc" ? string.Empty : "-alt" %>" aria-hidden="true"></span>                            
                                <%} %>
                            </th>
                            <th>Створено</th>
                            <th>Змінено</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var blog in blogs)
                            { %>
                            <tr>
                                <td><%= blog.Id %></td>
                                <td><%= blog.Title %></td>
                                <td><%= blog.Description %></td>
                                <td><%= blog.Created %></td>
                                <td><%= blog.Changed %></td>
                                <td style="text-align:right">
                                    <div class="btn-group" role="group">
                                        <a href="/Blog/Delete.aspx?id=<%= blog.Id %>&returnUrl=Index.aspx" class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash"></span> видалити</a>
                                        <a href="/Blog/Update.aspx?id=<%= blog.Id %>" class="btn btn-xs btn-primary"><span class="glyphicon glyphicon-edit"></span> редагувати</a>
                                    </div>
                                </td>
                            </tr>
                        <%} %>
                    </tbody>
                </table>
            <%} %>
        </asp:View>
    </asp:MultiView>

   
</asp:Content>
