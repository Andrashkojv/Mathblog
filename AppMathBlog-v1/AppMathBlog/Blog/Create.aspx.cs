using AppMathBlog.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppMathBlog.Blog
{
    public partial class Create : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        int blogIndex
        {
            get
            {
                if(Application["blogIndex"] == null)
                {
                    Application["blogIndex"] = 1;
                }
                else
                {
                    Application["blogIndex"] = ((int)Application["blogIndex"]) + 1;
                }

                return (int)Application["blogIndex"];
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                BlogService service = new BlogService(Session);

                service.Create(new Models.Blog()
                {
                    Id = blogIndex,
                    Created = DateTime.Now,
                    Changed = DateTime.Now,
                    Title = title.Text,
                    Description = description.Text,
                    Body = body.Text,
                    Picture = picture.HasFile ? Convert.ToBase64String(picture.FileBytes) : null
                });

                Response.Redirect("Index.aspx");
            }
        }
    }
}