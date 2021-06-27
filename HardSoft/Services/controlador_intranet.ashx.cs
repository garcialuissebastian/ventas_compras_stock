using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using Bll;
using Be;
using System.Web.Services;
using System.Data;


namespace intranet.App.Services
{
  

    /// <summary>
    /// Descripción breve de controlador_intranet
    /// </summary>
    /// 

 
    public class controlador_intranet :  IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {
        string v_permiso = "";
        string existe = "";
        [WebMethod(EnableSession = true)]
        public void ProcessRequest(HttpContext context)
        {
            
            try
            {

                string data = string.Empty;
               


             

                if (context.Request.QueryString["data"].Equals("0"))
                {

                    v_permiso = context.Request.QueryString["v_permiso"];
                    data = SetDataPermiso();
                }


                if (context.Request.QueryString["data"].Equals("1"))
                {
                    string permiso = context.Request.QueryString["permiso"];
                    bool bb = Bllmysql_usuarios.DameInstancia().TienePermisoPara(permiso);

                    if (bb)
                    {
                        existe = "si";
                    
                    }
                    else { existe = "no"; }


                    StringBuilder json = new StringBuilder();
                    json.Append("data : [ ");
                    json.Append("{" + Environment.NewLine);
                    json.Append("'existe' : '");
                    json.Append(existe);
                    json.Append("'" + Environment.NewLine);
                    json.Append("}]");
                data = json.ToString();



                }
                if (context.Request.QueryString["data"].Equals("2"))
                {
                    string v_uu = context.Request.QueryString["v_vv"];
                    string v_pp = context.Request.QueryString["v_pp"];

                   
                    bool bb = false;

                    try
                    {


                        mysql_usuarios lista = Bllmysql_usuarios.DameInstancia().Obtener_usuario(v_uu.Trim().ToUpper().Trim().ToUpper());

               
                      //  USUARIO_INTRANET lista = BllUsuario_Intranet.DameInstancia().Obtener_usuario(v_uu.Trim().ToUpper(), v_pp.Trim());

                        HttpContext.Current.Session["UsuarioActual"] = lista;


                        if (lista != null && lista.HABILITADO == "SI")
                        {
                            string v_clave;
                            v_clave = Encriptor.DameInstancia().GetMD5(v_pp.Trim());
                            if (v_clave == lista.CLAVE)
                            {
                                HttpContext.Current.Session["ActiveSession"] = DateTime.Now.ToString();
                                HttpContext.Current.Session["UsuarioActual"] = lista;
                                    bb = true; 

                            }
                            else
                            {

                                HttpContext.Current.Session["UsuarioActual"] = null;

                                bb = false;
                            }
                        }
                        else
                        {
                            bb = false;
                            HttpContext.Current.Session["UsuarioActual"] = null;

                        }
                    }
                    catch (Exception ex)
                    {
                        bb = false;
                    }

                    if (bb)
                    {
                        existe = "si";
                    }
                    else { existe = "no"; }


                    StringBuilder json = new StringBuilder();
                    json.Append("data : [ ");
                    json.Append("{" + Environment.NewLine);
                    json.Append("'existe' : '");
                    json.Append(existe);
                    json.Append("'" + Environment.NewLine);
                    json.Append("}]");
                    data = json.ToString();



                }
                if (context.Request.QueryString["data"].Equals("3"))
                {
                    


                }
               
                if (data != string.Empty)
                {
                    context.Response.Write(data);
                }
                
             
            }
            catch (Exception ex)
            {
                throw ;
            }
        }


 

        protected string SetDataPermiso()
        {
            Be.PermisoBase perm ;
             BllPermiso _gestorPermisos = new BllPermiso();
             perm = _gestorPermisos.ObtenerUnoPorNombre(v_permiso);
            
if(perm != null){


    existe = perm.descripcion;

}




            StringBuilder json = new StringBuilder();
            json.Append("data : [ ");
            json.Append("{" + Environment.NewLine);
            json.Append("'existe' : '");
            json.Append(existe);
            json.Append("'" + Environment.NewLine);
            json.Append("}]");
            return json.ToString();
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}