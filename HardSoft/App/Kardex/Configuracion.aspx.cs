using Be;
using Bll;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace HardSoft.App.Kardex
{
    public partial class Configuracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod()]


        public static List<kx_config> WsListar_kx_config(string v_tipo, string v_valor)

        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                List<kx_config> list = new List<kx_config>();

                mysql_usuarios user1 = (mysql_usuarios)HttpContext.Current.Session["UsuarioActual"];
                user1.ListaConfig = Bllkx_config.DameInstancia().Obtener_config(user);

                HttpContext.Current.Session["UsuarioActual"] = user1;

                list = Bll.Bllkx_config.DameInstancia().Listar_kx_config(v_tipo, v_valor.ToUpper().Trim(), user);

             

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }




        [WebMethod()]


        public static void WmGvDel_kx_config(Int32 v_Id)
        {
            try

            {

                Bll.Bllkx_config.DameInstancia().Eliminar_kx_config(v_Id);

            }

            catch (Exception)

            {

                throw;

            }

        }


        [WebMethod()]


        public static void WsUpdateCert(Int32 v_Id,string Cert, string v_conf,string v_resp, string v_pass , string v_cuit)
        {
            try

            {

                Bll.Bllkx_config.DameInstancia().WsUpdateCert(  v_Id.ToString(),   Cert,  v_conf,  v_resp);


                string RespoXml = @"<?xml version=""1.0"" encoding=""UTF - 8"" standalone=""yes""?><loginTicketResponse version=""1.0""><header><source></source><destination></destination><uniqueId></uniqueId><generationTime></generationTime><expirationTime>2020-04-09T12:39:34.555-03:00</expirationTime></header><credentials><token></token><sign></sign></credentials></loginTicketResponse>";
                string ConfigXml = @"<?xml version=""1.0"" encoding=""UTF - 8"" standalone=""yes""?><configuracion><certificado><DEFAULT_URLWSAAWSDL>usa la instancia del obj ws</DEFAULT_URLWSAAWSDL><DEFAULT_SERVICIO>wsfe</DEFAULT_SERVICIO><DEFAULT_CERTSIGNER>certificados\"+ Cert + "</DEFAULT_CERTSIGNER><DEFAULT_CERTIFICADO_PASSWORD>"+ v_pass + "</DEFAULT_CERTIFICADO_PASSWORD><CUIT>"+v_cuit+"</CUIT></certificado></configuracion>";
                string Path = ConfigurationManager.AppSettings.Get("PathProyecto").ToString();
                string fileConfi = "";
                try
                {

                    //XmlDocument document = new XmlDocument();
                    //fileConfi = Path + @"\xml\"+ v_conf;
                    //document.Load(fileConfi);
                    XmlDocument doc = new XmlDocument();
                    doc.LoadXml(ConfigXml.Trim());
                    fileConfi = Path + @"xml\" + v_conf;
                    XmlTextWriter writer = new XmlTextWriter(fileConfi, null);
                    doc.Save(writer);
                    writer = null;
                        fileConfi = Path + @"xml\" + v_resp;
                    doc = new XmlDocument();
                    doc.LoadXml(RespoXml.Trim());

                    XmlTextWriter writer2 = new XmlTextWriter(fileConfi, null);
                    doc.Save(writer2);
                    writer2 = null;

                }
                //catch (FileNotFoundException ex)
                //{ 
                //}
                catch (Exception)
                {

                    throw;
                }

            }

            catch (Exception)

            {

                throw;

            }

        }

        
              [WebMethod()]


        public static void WmActilizaPrecioUtilidad()
        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                Bll.Bllkx_config.DameInstancia().WmActilizaPrecioUtilidad(user);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [WebMethod()]


        public static void WmGvMod_kx_config(kx_config v_obj)
        {
            try
            {
                Bll.Bllkx_config.DameInstancia().Modificacion_kx_config(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


        [WebMethod()]


        public static void WmGvAlta_kx_config(kx_config v_obj)
        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                v_obj.Usuario = user;
                Bll.Bllkx_config.DameInstancia().Alta_kx_config(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void BtnMonto_Click(object sender, EventArgs e)
        {
            try
            {

                
                if ( !string.IsNullOrEmpty(TxtCosto.Text) )
                {
                    Int32 ds = Int32.Parse(TxtCosto.Text);
                   

                        string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                      
                        Bll.Bllkx_config.DameInstancia().ActualizarPrecioxCosto(user, TxtCosto.Text);

                    lblMsg.Text = " *** PRECIOS  MODIFICADOS."; 
                }


            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}