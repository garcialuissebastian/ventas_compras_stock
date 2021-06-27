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
    public partial class kx_cajas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]


        public static List<Be.kx_cajas> WsListar_kx_cajas(string v_tipo, string v_valor)

        {
            try
            {
                List<Be.kx_cajas> list = new List<Be.kx_cajas>();

                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
              

                list = Bll.Bllkx_cajas.DameInstancia().Listar_kx_cajas(v_tipo, v_valor.ToUpper().Trim(), conf);

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }




        [WebMethod()]


        public static void WmGvDel_kx_cajas(Int32 v_Id)
        {
            try

            {

                Bll.Bllkx_cajas.DameInstancia().Eliminar_kx_cajas(v_Id);

            }

            catch (Exception)

            {

                throw;

            }

        }

        [WebMethod()]


        public static void WmGvMod_kx_cajas(Be.kx_cajas v_obj)
        {
            try
            {
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.id_config = conf;
                Bll.Bllkx_cajas.DameInstancia().Modificacion_kx_cajas(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


        [WebMethod()]


        public static void WmGvAlta_kx_cajas(Be.kx_cajas v_obj)
        {
            try
            {
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.id_config = conf;
                Bll.Bllkx_cajas.DameInstancia().Alta_kx_cajas(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


    }
}