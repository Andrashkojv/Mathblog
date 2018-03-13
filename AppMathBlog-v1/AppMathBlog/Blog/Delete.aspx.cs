using AppMathBlog.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppMathBlog.Blog
{
    public partial class Delete : System.Web.UI.Page
    {
        int id
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["id"]);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //var id = Convert.ToInt32(Request.QueryString["id"]);
                var service = new BlogService(Session);
                var blog = service.GetById(id);
                if(blog != null)
                {
                    title.InnerHtml = blog.Title;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //var id = Convert.ToInt32(Request.QueryString["id"]);
            var service = new BlogService(Session);
            service.Delete(id);
            Response.Redirect("Index.aspx");
        }
    }
}