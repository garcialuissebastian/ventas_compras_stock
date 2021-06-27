using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
namespace HardSoft.App.Registro
{
    public partial class ModificarPwdIntranet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioActual"] == null)
            {
                Response.Redirect("http://www.hardsoft.com.ar");
            }

            lblmsg.Text = "";
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            try
            {
 
                Bllmysql_usuarios.DameInstancia().Modificar_pwd(((mysql_usuarios)Session["UsuarioActual"]).USUARIO.ToString(), Encriptor.DameInstancia().GetMD5(txtClave.Text.Trim()));
                lblmsg.Text = "*** Contraseña modificada.";
                txtClave.Text = "";
                txtConfirmaClave.Text = "";

            }
            catch (Exception ex)
            {

                lblmsg.Text = ex.Message;
            }
        }


    }
}