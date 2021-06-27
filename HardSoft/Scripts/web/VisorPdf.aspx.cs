using Microsoft.Reporting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.Scripts.web
{
    public partial class VisorPdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             Response.Clear();
            Response.Cache.SetCacheability(HttpCacheability.Public);
           Response.Cache.SetExpires(DateTime.MinValue);
           Response.Cache.SetNoStore();
        
        }

       
    }
}