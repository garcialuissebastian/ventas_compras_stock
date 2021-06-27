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
    public partial class Marca : System.Web.UI.Page

    {
 
        protected void Page_Load(object sender, EventArgs e)
        {
            


            if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("VER_KARDEX"))
            {
                Response.Redirect("http://www.hardsoft.com.ar/App/Home.aspx", false);

            }
        }

        [WebMethod()]

        public static void WmModificar2(Be.Kx_Modelo v_obj)
        {


            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Usuario = conf;
                Bll.BllKx_Modelo.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmAlta2(Be.Kx_Marca v_obj)
        { 
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Usuario = user;
                Bll.BllKx_Marca.DameInstancia().Alta(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }
        [WebMethod()]

        public static void WmAlta3(Be.Kx_Modelo v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Usuario = user;
                Bll.BllKx_Modelo.DameInstancia().Alta(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }
        
        [WebMethod()]

        public static List<Be.Kx_Marca> WsListarMarca()
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.Kx_Marca> list = new List<Be.Kx_Marca>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                list = Bll.BllKx_Marca.DameInstancia().Listar(user); 
                if (list.Count < 1)
                {
                    throw new Exception(" No existen Marcas creadas. Vaya a Marca y agregue uno.");
                }
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static List<Be.Kx_Marca> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
              
                List<Be.Kx_Marca> list = new List<Be.Kx_Marca>();

                list = Bll.BllKx_Marca.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim(),user);
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.Kx_Modelo> WsListarModelo(string v_sub)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.Kx_Modelo> list = new List<Be.Kx_Modelo>();

                list = Bll.BllKx_Modelo.DameInstancia().ListarSub(v_sub);
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

    }
}