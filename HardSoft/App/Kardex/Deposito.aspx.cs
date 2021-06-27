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
    public partial class Deposito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {
                    Response.Redirect("Login_hosp.aspx");

                }

                if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("ADM_KARDEX")  && !Bllmysql_usuarios.DameInstancia().TienePermisoPara("ADMIN_JUAN_SIMPLE") )
                {
                   

                    if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO.ToUpper() != "FARMACIA" && ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO.ToUpper() != "SANTIAGO" && ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO.ToUpper() != "UPAFARMACIA")
                    {
                        Response.Redirect("/App/Home.aspx");

                    }

                }




            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmModificar2(Be.Kx_Deposito v_obj)
        {


            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Bll.BllKx_Deposito.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmAlta2(Be.Kx_Deposito v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Usuario = user;
                Bll.BllKx_Deposito.DameInstancia().Alta(v_obj);

            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static List<Be.Kx_Deposito> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.Kx_Deposito> list = new List<Be.Kx_Deposito>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.BllKx_Deposito.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim(), user);
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }




      
                 [WebMethod()]
        public static List<Be.Kx_Deposito> ListarFarmaciaDestino( )
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.Kx_Deposito> list = new List<Be.Kx_Deposito>();
                 mysql_usuarios user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]) ;
                list = Bll.BllKx_Deposito.DameInstancia().ListarFarmaciaDestino(user.Config.id, user.ID_USUARIO);
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]
        public static List<Be.Kx_Deposito> WsListarFarmacia(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.Kx_Deposito> list = new List<Be.Kx_Deposito>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                list = Bll.BllKx_Deposito.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim(), user);
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }


    }
}