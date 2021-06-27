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
    public partial class Cajas_mov : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("VER_KARDEX"))
            {
                Response.Redirect("http://www.hardsoft.com.ar/App/Home.aspx", false);

            }

        }
 //       [WebMethod()]


//public static List<kx_cajas_mov> WsListar_kx_cajas_mov(string v_tipo, string v_valor)

//        {
//            try
//            {
//                List<kx_cajas_mov> list = new List<kx_cajas_mov>();

//                list = Bll.Bllkx_cajas_mov.DameInstancia().Listar_kx_cajas_mov(v_tipo, v_valor.ToUpper().Trim());

//                HttpContext.Current.Session["Lista"] = list;

//                return list;
//            }
//            catch (Exception)

//            {
//                throw;
//            }
//        }



        [WebMethod()]


        public static List<kx_cajas_ver> WsListar_kx_cajas_mov2(string v_mes, string v_anio)

        {
            try
            {
                List<kx_cajas_ver> list = new List<kx_cajas_ver>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_cajas_mov.DameInstancia().Listar_kx_cajas_mov2(v_mes, v_anio, user);

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }

        [WebMethod()]


        public static void WmGvDel_kx_cajas_mov(Int32 v_Id)
        {
            try

            {

                Bll.Bllkx_cajas_mov.DameInstancia().Eliminar_kx_cajas_mov(v_Id);

            }

            catch (Exception)

            {

                throw;

            }

        }

        [WebMethod()]


        public static void WmGvMod_kx_cajas_mov(kx_cajas_mov v_obj)
        {
            try
            {
                Bll.Bllkx_cajas_mov.DameInstancia().Modificacion_kx_cajas_mov(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


        [WebMethod()]


        public static void WmGvAlta_kx_cajas_mov(kx_cajas_mov v_obj)
        {
            try
            {
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;

                v_obj.id_config = conf;
                v_obj.id_usuario = user;

                Bll.Bllkx_cajas_mov.DameInstancia().Alta_kx_cajas_mov(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}