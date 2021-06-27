using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bll;
using Be;
namespace HardSoft.App.Kardex
{
    public partial class Rubros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("VER_KARDEX"))
            {
                Response.Redirect("http://www.hardsoft.com.ar/App/Home.aspx", false);

            }
        }

        [WebMethod()]

        public static void WmModificar2(Be.Kx_Rubro v_obj)
        {


            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Bll.BllKx_Rubro.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmAlta2(Be.Kx_Rubro v_obj)
        { 
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Usuario = user;
                Bll.BllKx_Rubro.DameInstancia().Alta(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }
        
        [WebMethod()]

        public static List<Be.Kx_Rubro> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.Kx_Rubro> list = new List<Be.Kx_Rubro>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.BllKx_Rubro.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim(),user);

                if (list.Count <1) {
                    throw new Exception(" No existen Rubros creados. Vaya a Rubros y agregue uno.");
                }
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

    }
}