using Be;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Kardex
{
    public partial class Tabla_iibb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        [WebMethod()]


        public static List<kx_iibb> WsListar_kx_iibb(string v_tipo, string v_valor)
        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
            

                List<kx_iibb> list = new List<kx_iibb>();

                list = Bll.Bllkx_config.DameInstancia().Listar_kx_iibb(v_tipo, v_valor.ToUpper().Trim());

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)
            {
                throw;
            }
        }




        [WebMethod()]


        public static void WmGvDel_kx_iibb(Int32 v_Id)
        {
            try
            {

                Bll.Bllkx_config.DameInstancia().Eliminar_kx_iibb(v_Id);

            }

            catch (Exception)
            {

                throw;

            }

        }

        [WebMethod()]


        public static void WmGvMod_kx_iibb(kx_iibb v_obj)
        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                v_obj.Id_Usuario = user;
                Bll.Bllkx_config.DameInstancia().Modificacion_kx_iibb(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


        [WebMethod()]


        public static void WmGvAlta_kx_iibb(kx_iibb v_obj)
        {
            try
            {
             
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                v_obj.Id_Usuario = user;

                Bll.Bllkx_config.DameInstancia().Alta_kx_iibb(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        } 

    
    }
}