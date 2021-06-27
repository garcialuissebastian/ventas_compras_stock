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
    public partial class UsuariosFarmacia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }





        [WebMethod()]


        public static List<mysql_usuarios> WsListar_mysql_usuarios(string v_tipo, string v_valor)

        {
            try
            {
                List<mysql_usuarios> list = new List<mysql_usuarios>();

                list = Bll.Bllmysql_usuarios.DameInstancia().Listar_mysql_usuarios(v_tipo, v_valor.ToUpper().Trim());

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }




        [WebMethod()]


        public static void WmGvDel_mysql_usuarios(Int32 v_Id)
        {
            try

            {

                Bll.Bllmysql_usuarios.DameInstancia().Eliminar_mysql_usuarios(v_Id);

            }

            catch (Exception)

            {

                throw;

            }

        }

        [WebMethod()]


        public static void WmGvMod_mysql_usuarios(mysql_usuarios v_obj)
        {
            try
            {
                Bll.Bllmysql_usuarios.DameInstancia().Modificacion_mysql_usuarios(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


        [WebMethod()]


        public static void WmGvAlta_mysql_usuarios(mysql_usuarios v_obj)
        {
            try
            {
                Bll.Bllmysql_usuarios.DameInstancia().Alta_mysql_usuarios(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}