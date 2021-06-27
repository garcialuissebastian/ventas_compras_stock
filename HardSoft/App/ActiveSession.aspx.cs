using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App
{
    public partial class ActiveSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod()]
        public static bool KeepActiveSession()
        
{
            if (HttpContext.Current.Session["ActiveSession"] != null)
            {
                DateTime inicio = DateTime.Parse(HttpContext.Current.Session["ActiveSession"].ToString());
                if (inicio < DateTime.Now)
                    return true;
                else return false;
            }
            else
                return false;
        }
    }
}