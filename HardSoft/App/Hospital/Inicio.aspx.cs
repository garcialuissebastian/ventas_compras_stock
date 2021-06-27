using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Hospital
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                Bll.BllPERSONAL.DameInstancia().prueba();
            }
            catch (Exception ex)
            {
                msg.Text = ex.Message;
            }
           
        }
    }
}