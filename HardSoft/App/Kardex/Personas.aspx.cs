using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using  Be;
using Bll;
namespace HardSoft.App.Kardex
{
    public partial class Personas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (HttpContext.Current.Session["UsuarioActual"] == null)
            {
                Response.Redirect("Login_hosp.aspx");

            }

            //if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO.ToUpper() != "FARMACIA" && ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO.ToUpper() != "SANTIAGO" && ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO.ToUpper() != "UPAFARMACIA")
            //{
            //    Response.Redirect("/App/Home.aspx");

            //} 
        
        }
        [WebMethod()]

        public static void WmMod(Be.kx_proveedor v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Usuario = user;
                Bll.Bllkx_proveedor.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static List<Combos> WmListarRoles(string v_sis)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }

                string SIS= ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).SISTEMA;
                return Bll.Bllmysql_usuarios.DameInstancia().ListarRoles(SIS);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmAlta2(Be.kx_cliente v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Config = user;

                string v_clave;
                v_clave = Encriptor.DameInstancia().GetMD5(v_obj.Pass_Usuario.Trim());

                v_obj.Pass_Usuario = v_clave;
                Bll.Bllkx_cliente.DameInstancia().AltaPersonas(v_obj);

            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmMod2(Be.kx_cliente v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Bll.Bllkx_cliente.DameInstancia().ModificacionPersona(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static List<Be.provincia> WsListarProvincia(string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.provincia> list = new List<Be.provincia>();

                list = Bll.BllDatosBasico.DameInstancia().ListarProvincias(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.departamento> WsListarDepartamento(string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.departamento> list = new List<Be.departamento>();

                list = Bll.BllDatosBasico.DameInstancia().ListarDepartamento(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static List<Be.distrito> WsListarDistrito(string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.distrito> list = new List<Be.distrito>();

                list = Bll.BllDatosBasico.DameInstancia().ListarDistrito(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.pais> WsListarP(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.pais> list = new List<Be.pais>();

                list = Bll.BllDatosBasico.DameInstancia().ListarPais();

                return list;
            }
            catch (Exception)
            {

                throw;
            }

        }

        [WebMethod()]

        public static Be.kx_cliente WsBuscarP(string v_Id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Be.kx_cliente sal = new kx_cliente();
                List<Be.kx_cliente> list = new List<Be.kx_cliente>();
                if (HttpContext.Current.Session["Lista"] != null) {

                    list = (List<kx_cliente>)HttpContext.Current.Session["Lista"];
                    foreach (var item in list)
                    {
                        if (item.Id.ToString() == v_Id) {
                            sal = item;
                        }

                    }

                }
                return sal;
            }
            catch (Exception)
            {

                throw;
            }

        }


        [WebMethod()]

        public static List<Be.kx_cliente> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                List<Be.kx_cliente> list = new List<Be.kx_cliente>();

                list = Bll.Bllkx_cliente.DameInstancia().ListarPersonas(v_tipo, v_valor.ToUpper().Trim(), user);
                HttpContext.Current.Session["Lista"] = list;

                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static void gvProv_del(string v_id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Bllkx_cliente.DameInstancia().EliminarPersonas(Convert.ToInt32(v_id));

            }
            catch (Exception)
            {

                throw;
            }



        }

        [WebMethod()]
        public static void Pwd (string v_idmail, string pwd)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }

                string v_clave;
                v_clave = Encriptor.DameInstancia().GetMD5(pwd);

                Bllmysql_usuarios.DameInstancia().Modificar_pwd(v_idmail, v_clave);

            }
            catch (Exception)
            {

                throw;
            }



        }

    }
}