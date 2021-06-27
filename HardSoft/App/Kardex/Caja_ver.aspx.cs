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
    public partial class Caja_ver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("VER_KARDEX"))
            {
                Response.Redirect("http://www.hardsoft.com.ar/App/Home.aspx", false);

            }
        }

        [WebMethod()]


        public static List<kx_cajas_mov> WsListar_kx_cajas_mov(string v_mes, string v_anio)

        {
            try
            {
                List<kx_cajas_mov> list = new List<kx_cajas_mov>();

                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                list = Bll.Bllkx_cajas_mov.DameInstancia().Listar_kx_cajas_mov(v_mes, v_anio,user);

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }


        [WebMethod()]


        public static List<kx_cajas_mov> WsListar_kx_cajas_id(string v_id )

        {
            try
            {
                List<kx_cajas_mov> list = new List<kx_cajas_mov>();

                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                list = Bll.Bllkx_cajas_mov.DameInstancia().Listar_kx_cajas_mov(v_id, user);

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


        public static void WmGvAlta_kx_cajas_mov(Be.kx_cajas_mov v_obj)
        {
            try
            {
                mysql_usuarios user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]) ;

                string fecha = DateTime.Now.ToString();

                v_obj.fecha = fecha;
                v_obj.caja = user.Caja;
                v_obj.id_usuario = user.ID_USUARIO;
                v_obj.id_config = user.Config.id;

                Bll.Bllkx_cajas_mov.DameInstancia().Alta_kx_cajas_mov(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}