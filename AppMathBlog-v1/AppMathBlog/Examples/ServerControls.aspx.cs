using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppMathBlog
{
    public partial class ServerControls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                i = 0;
            }
        }

        protected void btnFindSum_Click(object sender, EventArgs e)
        {
            var _a = Convert.ToInt32(a.Text);
            var _b = Convert.ToInt32(b.Text);
            var s = _a + _b;
            sum.Text = Convert.ToString(s);
        }

        protected void oper_SelectedIndexChanged(object sender, EventArgs e)
        {
            var _a = Convert.ToInt32(arg1.Text);
            var _b = Convert.ToInt32(arg2.Text);
            int? _res = null;
            switch(oper.SelectedIndex)
            {
                case 1: _res = _a - _b; break;
                case 2: _res = _a * _b; break;
                case 3: _res = _a / _b; break;
            } 
            res.Text = Convert.ToString(_res.HasValue ? _res.Value.ToString() : string.Empty);
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            fib.InnerHtml = "";
            var n = Convert.ToInt32(txtN.Text);
            var a = new int[n];
            a[0] = a[1] = 1;
            for(var i = 2; i < n; i++)
            {
                a[i] = a[i - 1] + a[i - 2];
            }

            fib.InnerHtml = string.Join(",", a);

        }

        public int i
        {
            get
            {
                return ViewState["i"] != null ? (int)ViewState["i"] : 0;
            }
            set
            {
                if(ViewState["i"] == null)
                {
                    ViewState["i"] = 0;
                }
                else
                {
                    ViewState["i"] = value;
                }
            }
        }


        protected void btnInc_Click(object sender, EventArgs e)
        {
            i++;
        }
    }
}