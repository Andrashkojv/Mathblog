using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;

namespace AppMathBlog.Blog
{
    public partial class Index : System.Web.UI.Page
    {
        protected List<AppMathBlog.Models.Blog> blogs
        {
            get
            {
                var service = new AppMathBlog.Services.BlogService(Session);
                var _blogs = service.GetAllBlogs(q.Text);
                if (SortBy == null || SortOrder == null)
                    return _blogs;
                if(SortBy == "title")
                {
                    return SortOrder == "asc" ? _blogs.OrderBy(x => x.Title).ToList() : _blogs.OrderByDescending(x => x.Title).ToList();
                }
                if (SortBy == "description")
                {
                    return SortOrder == "asc" ? _blogs.OrderBy(x => x.Description).ToList() : _blogs.OrderByDescending(x => x.Description).ToList();
                }

                return _blogs.OrderBy(x => x.Id).ToList();
            }
        }

        protected string SortBy
        {
            get
            {
                return ViewState["SortBy"] as string;
            }
            set
            {
                ViewState["SortBy"] = value;
            }
        }

        protected string SortOrder
        {
            get
            {
                return ViewState["SortOrder"] as string;
            }
            set
            {
                ViewState["SortOrder"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Sort_Click(object sender, EventArgs e)
        {
            var lnkButton = sender as LinkButton;
            SortBy = lnkButton.CommandName;
            SortOrder = lnkButton.CommandArgument;
            lnkButton.CommandArgument = lnkButton.CommandArgument == "asc" ? "desc" : "asc";
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            var lnk = sender as LinkButton;
            BlogListView.ActiveViewIndex = Convert.ToInt32(lnk.CommandArgument);
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            var service = new AppMathBlog.Services.BlogService(Session);
            var _blogs = service.GetAllBlogs(q.Text);
            XmlSerializer serialiser = new XmlSerializer(typeof(List<Models.Blog>));
            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment; filename=blogs.xml");
            Response.ContentType = "text/xml";
            serialiser.Serialize(Response.OutputStream, _blogs);            
            Response.Flush();
            Response.End();
        }

        protected void btnImport_Click(object sender, EventArgs e)
        {
            if(fuImport.HasFile)
            {
                var service = new AppMathBlog.Services.BlogService(Session);                
                XmlSerializer serialiser = new XmlSerializer(typeof(List<Models.Blog>));

                var blogs = (List<Models.Blog>)serialiser.Deserialize(fuImport.PostedFile.InputStream);
                foreach (var item in blogs)
                {
                    service.Create(item);
                }
            }
        }
    }
}