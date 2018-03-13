using AppMathBlog.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppMathBlog.Blog
{
    public partial class Update : System.Web.UI.Page
    {
        public string _picture;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var id = Convert.ToInt32(Request.QueryString["id"]);
                var service = new BlogService(Session);
                var blog = service.GetById(id);
                if (blog != null)
                {
                    title.Text = blog.Title;
                    description.Text = blog.Description;
                    body.Text = blog.Body;
                    _picture = blog.Picture;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var id = Convert.ToInt32(Request.QueryString["id"]);
                var service = new BlogService(Session);
                var blog = service.GetById(id);
                if (blog != null)
                {
                    blog.Changed = DateTime.Now;
                    blog.Title = title.Text;
                    blog.Description = description.Text;
                    blog.Body = body.Text;
                    if (PictureIsChanged.Value == "true")
                    {
                        blog.Picture = picture.HasFile ? Convert.ToBase64String(picture.FileBytes) : null;
                    }
                    service.Update(blog);
                }
                Response.Redirect("Index.aspx");
            }
        }
    }
}