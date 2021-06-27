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
    public partial class Ctas_Contables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
       

            //mysql_usuarios lista = Bllmysql_usuarios.DameInstancia().Obtener_usuario("seba@quilmes.gov.ar");
            //HttpContext.Current.Session["ActiveSession"] = DateTime.Now.ToString();
            //lista.Config = Bllkx_config.DameInstancia().Obtener_config(lista.ID_USUARIO)[0];
            //lista.ListaConfig = Bllkx_config.DameInstancia().Obtener_config(lista.ID_USUARIO);
            //HttpContext.Current.Session["UsuarioActual"] = lista;
        }

        [WebMethod()]
        public static string WsListarDep()
        {
            try
            {

                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                List<Be.PERS_DEPARTAMENTOS> list = Bll.Bllkx_Contable.DameInstancia().Ctas_jerquia(user);

                return oSerializer.Serialize(list);



            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static void WmDel(string id)
        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                if (!string.IsNullOrEmpty(id))
                {
                    Bll.Bllkx_Contable.DameInstancia().del_cta(id, user);
                }


            }
            catch (Exception)
            {

                throw;
            }
        }



        [WebMethod()]

        public static List<Be.pais> WsListarCtas(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.pais> list = new List<Be.pais>();

                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = list = Bll.Bllkx_Contable.DameInstancia().ListarCtas(v_tipo, v_valor.ToUpper().Trim(),user);

                return list;
            }
            catch (Exception)
            {

                throw;
            }

        }


        [WebMethod()]

        public static void WmAlta(string id, string nombre, string esCuenta, string Codigo)
        {
            try
            {
                if (string.IsNullOrEmpty(id))
                {
                    id = "1";
                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                Bll.Bllkx_Contable.DameInstancia().alta_ctas(id, nombre.ToUpper(),user,esCuenta, Codigo);

            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmMod(string id, string nombre, string idPadre, string esCuenta, string codigo)
        {
            try
            {
                if (string.IsNullOrEmpty(idPadre))
                {
                    idPadre = "1";
                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                Bll.Bllkx_Contable.DameInstancia().mod_cta(id, nombre.ToUpper(), idPadre, esCuenta,user, codigo);

            }
            catch (Exception)
            {

                throw;
            }
        }


    }
}