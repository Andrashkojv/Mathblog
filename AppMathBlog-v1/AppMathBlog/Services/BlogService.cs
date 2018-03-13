using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using AppMathBlog.Models;

namespace AppMathBlog.Services
{
    public class BlogService
    {
        private HttpSessionState session;             

        public BlogService(HttpSessionState session)
        {
            this.session = session;            
        }

        public List<Models.Blog> GetAllBlogs(string q = null)
        {
            if (session["blogs"] == null)
            {
                return new List<Models.Blog>();
            }
            else
            {
                var blogs = session["blogs"] as List<Models.Blog>;
                if (q == null) return blogs;
                return blogs.Where(x => x.Title != null && x.Title.Contains(q)).ToList();
            }
        }

        public Models.Blog GetById(int id)
        {
            return GetAllBlogs().FirstOrDefault(x => x.Id == id);
        }

        public void Create(Models.Blog blog)
        {
            var blogs = GetAllBlogs();
            blogs.Add(blog);
            // зберегти
            session["blogs"] = blogs;
        }

        public void Update(Models.Blog blog)
        {
            var blogs = GetAllBlogs();
            var i = blogs.FindIndex(x => x.Id == blog.Id);
            if (i >= 0)
            {
                blogs[i] = blog;
                // збереження
                session["blogs"] = blogs;
            }
        }

        public void Delete(int id)
        {
            var blogs = GetAllBlogs();
            var blog = GetById(id);
            blogs.Remove(blog);
            // збереження
            session["blogs"] = blogs;
        }        
    }
}