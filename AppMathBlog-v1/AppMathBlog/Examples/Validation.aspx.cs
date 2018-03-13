using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppMathBlog
{
    public partial class Validation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Response.Write("Дані сторінки є дійсними.");                
            }
            else
            {
                Response.Write("Дані сторінки не є дійсними.");
            }
        }

        protected void CustomValidator1_OnServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                args.IsValid = Convert.ToInt32(args.Value) % 5 == 0;
            }
            catch
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator2_OnServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = gF.Checked || gM.Checked;
        }
    }
}