using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppMathBlog.Models
{
    public class Blog
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Body { get; set; }
        public DateTime Created { get; set; }
        public DateTime Changed { get; set; }
        public string Picture { get; set; }
    }
}