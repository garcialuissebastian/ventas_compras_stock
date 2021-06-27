using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
namespace intranet.App.UsrCtrl
{
    public partial class miCuentaNew : System.Web.UI.UserControl

    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                mysql_usuarios lista = (mysql_usuarios)Session["UsuarioActual"];

                if (lista != null && lista.CLAVE != null)
                {
                
                   // lblSesion.Text = Session["ActiveSession"].ToString();

                 //   lblUsuario.Text = ((mysql_usuarios)Session["UsuarioActual"]).APELLIDO + ", " + ((USUARIO_INTRANET)Session["UsuarioActual"]).NOMBRE;
                    lblMail.Text = ((mysql_usuarios)Session["UsuarioActual"]).USUARIO.ToString();
                    lbluser.Text = lblMail.Text.ToString();
                    if (lblMail.Text.ToString().Length > 18)
                    {
                        lblMail.Text = lblMail.Text.ToString().Substring(0, 15) + "...";
                    } 
                    LblNombre.Text = ((mysql_usuarios)Session["UsuarioActual"]).Config.RazonSocial.ToString();
                    if (LblNombre.Text.ToString().Length > 18)
                    {
                        LblNombre.Text = LblNombre.Text.ToString().Substring(0, 15) + "...";
                    } 
                 
                    
                    
                    LblNombre2.Text = ((mysql_usuarios)Session["UsuarioActual"]).Config.RazonSocial2.ToString();
                    if (LblNombre2.Text.ToString().Length > 18)
                    {
                        LblNombre2.Text = LblNombre2.Text.Substring(0, 15) + "...";
                    }

                    lblrol.Text = ((mysql_usuarios)Session["UsuarioActual"]).ROL;
                    lblCuit.Text = ((mysql_usuarios)Session["UsuarioActual"]).Config.Cuit.ToString();
                    lblAfip.Text = ((mysql_usuarios)Session["UsuarioActual"]).Config.CondicionIVA.ToString() + " (" + ((mysql_usuarios)Session["UsuarioActual"]).Config.Modo.ToString()+ ")";


                    if (!string.IsNullOrEmpty(((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).InicioCaja))
                    {
                        PbnCerrarcaja.Visible = true;
                       lbluserCerrarCaja.Text = "Apertura de caja : " + ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).InicioCaja;
                    }
                    else
                    {
                        PbnCerrarcaja.Visible =false;
                        lbluserCerrarCaja.Text = "";
                    }


                }
            }

        }

     
        public string lblCerrarCaja
        {
            get
            {
                return lbluserCerrarCaja.Text;
            }
            set
            {
                lbluserCerrarCaja.Text = value;
            }
        }
        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("/", false);


        }
    }
}