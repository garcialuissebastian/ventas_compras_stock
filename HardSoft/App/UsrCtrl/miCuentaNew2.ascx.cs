using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
namespace intranet.App.UsrCtrl
{
    public partial class miCuentaNew2 : System.Web.UI.UserControl

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
                    lblMail.Text = "- " + ((mysql_usuarios)Session["UsuarioActual"]).USUARIO.ToString() + " <br/> - " + ((mysql_usuarios)Session["UsuarioActual"]).Descripcion;


                    //if (((USUARIO_INTRANET)Session["UsuarioActual"]).CUILCUIT_LIMPIO != null && !string.IsNullOrEmpty(((USUARIO_INTRANET)Session["UsuarioActual"]).CUILCUIT_LIMPIO))
                    //{

                    //    lblMail.Text = ((USUARIO_INTRANET)Session["UsuarioActual"]).CUILCUIT_LIMPIO;

                    //}
                    //else { lblMail.Text = ((USUARIO_INTRANET)Session["UsuarioActual"]).DOC_NO.ToString(); }


                }
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("http://www.hardsoft.com.ar", false);


        }
    }
}