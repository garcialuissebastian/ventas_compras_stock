using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
namespace HardSoft.App.Kardex
{
    public partial class Precio_historial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        [WebMethod()]


        public static List<kx_articulo> WsListar_kx_listas_precio_historial(string v_tipo, string v_valor)

        {
            try
            {
                List<kx_articulo> list = new List<kx_articulo>();
                HttpContext.Current.Session["art"] = list;
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                list = Bll.Bllkx_articulo.DameInstancia().Listar_kx_listas_precio_historial(v_tipo, v_valor.ToUpper().Trim(), user, "Articulos");

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }

    }

}