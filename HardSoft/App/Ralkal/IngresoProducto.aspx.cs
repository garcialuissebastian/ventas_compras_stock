using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bll;
using Be;
namespace HardSoft.App.Ralkal
{
    public partial class IngresoProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod()]

        public static void WsAdd(string v_tipo, string v_valor)
        {
            try
            {
                BllProductos.DameInstancia().Entrada(Convert.ToInt32(v_tipo), Convert.ToInt32(v_valor));
            }
            catch (Exception)
            {

                throw;
            }


        }

    }
}