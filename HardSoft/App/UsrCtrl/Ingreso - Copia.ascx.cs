using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Be;
using Bll;
namespace HardSoft.App.UsrCtrl
{
    public partial class Ingreso : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string v_uu = uLogin.Text;
            string v_pp =uPassword.Text;

            

            bool bb = false;

            try
            {


           //     USUARIO_INTRANET lista = BllUsuario_Intranet.DameInstancia().Obtener_usuario(v_uu.Trim().ToUpper());
                mysql_usuarios lista;
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {
                    lista = Bllmysql_usuarios.DameInstancia().Obtener_usuario(v_uu.Trim().ToUpper().Trim().ToUpper());
                    HttpContext.Current.Session["UsuarioActual"] = lista;
                }
                else
                {
                    lista =(Be.mysql_usuarios)  HttpContext.Current.Session["UsuarioActual"];

                }
                if (lista != null && lista.HABILITADO == "SI")
                {
                    string v_clave;
                    v_clave = Encriptor.DameInstancia().GetMD5(v_pp.Trim());
                    if (v_clave == lista.CLAVE)
                    {
                        HttpContext.Current.Session["ActiveSession"] = DateTime.Now.ToString();
                        if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("0"))
                        {
                            Response.Redirect("/App/Homes.aspx", false);   
                        }
                        if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("VER_KARDEX"))
                        {
                            Response.Redirect("/App/Home.aspx", false);
                        }                    
                    }
                    else
                    {
                        Msg.Text = "Usuario o contraseña no valida";
                        HttpContext.Current.Session["UsuarioActual"] = null;

                        
                    }
                }
                else
                {
                    Msg.Text = "Usuario o contraseña no valida";
                    HttpContext.Current.Session["UsuarioActual"] = null;

                }
            }
            catch (Exception ex)
            {
                bb = false;
            }
        }
    }
}