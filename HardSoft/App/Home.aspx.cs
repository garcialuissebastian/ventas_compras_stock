using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
using System.Web.Services;
using System.Data;
using Microsoft.Reporting.WebForms;
namespace HardSoft.App
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                ////////////////// LOGIN


                //mysql_usuarios lista = Bllmysql_usuarios.DameInstancia().Obtener_usuario("santiago");
                //HttpContext.Current.Session["ActiveSession"] = DateTime.Now.ToString();
                //lista.ListaConfig = Bllkx_config.DameInstancia().Obtener_config(lista.ID_USUARIO);
                //HttpContext.Current.Session["UsuarioActual"] = lista;

                ///////////////////////////////////


                if (true)
                {


                    if (((mysql_usuarios)Session["UsuarioActual"]).Config == null)
                    {

                            mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                 
                    if (Bllmysql_usuarios.DameInstancia().TienePermisoPara("VER_KARDEX") || Bllmysql_usuarios.DameInstancia().TienePermisoPara("HOSPITAL_MASTER"))
                        {
                           
                        user.ListaConfig = Bllkx_config.DameInstancia().Obtener_config(user.ID_USUARIO);
                     
                        Session["UsuarioActual"] = user;
                       
                        foreach (var item in user.ListaConfig)
                        {
                            if(item.Principal=="S"){
                                user.Config = item;
                                 Session["UsuarioActual"] =user;
                            }


                            
                       
                        }

                        if (user.Config ==null) {

                            throw new Exception("ninguna configuracion esta como principal S");
                        }
                    } else
            {
                
                Response.Redirect("../Default.aspx");
            }
                   
                         
                    }
                    mysql_usuarios user2 = (mysql_usuarios)Session["UsuarioActual"];
                    if (user2.Config.Logo!=null) {

                        if (user2.Config.Logo.Length> 0) {
                            byte[] arrImg = user2.Config.Logo;
                            string salida = "data:image/png;base64," + Convert.ToBase64String(arrImg);
                            img.ImageUrl = salida;

                            //Image milabel = (Image)this.Master.FindControl("LogoAsp");
                            //milabel.ImageUrl = salida;
                        }
                        else
                        {
                            img.ImageUrl = "http://www.hardsoft.com.ar/images/Milogo.png";
                        }
                       
                    }
                    else
                    {
                        img.ImageUrl = "http://www.hardsoft.com.ar/images/Milogo.png";
                    }
                    
                    lblCuit2.Text = user2.Config.Cuit;
                    lblModo.Text = "" + user2.Config.Modo;
                    lblEmpresa2.Text = user2.USUARIO;
                    lblRazon.Text = user2.Config.RazonSocial;

                    
                }
            }
            catch (Exception ex)
            {
                //lblModo.Text = ex.ToString();
                Response.Redirect("../Default.aspx");
            }

        }
        [WebMethod()]
        public static void bitacora(Be.Bitacora v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido");
                }
                v_obj.id_user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                v_obj.config_user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.msg = v_obj.msg.Replace("'", string.Empty);

                Bll.Bllkx_config.DameInstancia().bitacora(v_obj);

            }
            catch (Exception)
            {
                
                throw;
            }
        
        }

        [WebMethod()]

        public static List<Be.kx_config> WsListarCfg()
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido");
                }

                List<Be.kx_config> list = new   List<Be.kx_config> ();
                List<Be.kx_config> list2 = new List<Be.kx_config>();
                list2=((mysql_usuarios) HttpContext.Current.Session["UsuarioActual"]).ListaConfig;
                foreach (var item in list2 )
                {
                    kx_config pp = new kx_config();
                    pp.id = item.id;
                    pp.Cuit = item.Cuit;
                    pp.RazonSocial = item.RazonSocial;
                    pp.DomicilioComercial= item.DomicilioComercial;
                    pp.CondicionIVA= item.CondicionIVA;
                    pp.Modo = item.Modo;
                    pp.PtoVta = item.PtoVta;

                    if (item.id == ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id)
                    {
                        pp.Principal = "S";
                    }
                    list.Add(pp);
                }

                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]

        public static void WsCambiarCfg(string ids)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido");
                }
                List<Be.kx_config> list = new List<Be.kx_config>();
                  mysql_usuarios user = (mysql_usuarios)HttpContext.Current.Session["UsuarioActual"];

                  foreach (var item in user.ListaConfig)
                  {
                      if(item.id==ids){
                          user.Config = item;
                          HttpContext.Current.Session["UsuarioActual"] = user;
                      } 
                  }

               


            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]
        public static void sal(string v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido");
                }
                Bll.BllModelo.DameInstancia().Salida(v_obj);

            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void BtnImp_Click(object sender, EventArgs e)
        {
            try
            {
                if (true)
                {
                    LocalReport localReport = new LocalReport();
                    DataSet ds = Bll.Bllkx_cbtes.DameInstancia().Cbate(TxtRpid.Text);
                    string ppr = Bllkx_cbtes.DameInstancia().PathReportCbte(ds.Tables["cab"].Rows[0]["Cod_Letra"].ToString());

                    localReport.ReportEmbeddedResource = ppr;

                    string sal = ds.Tables["cab"].Rows[0]["CodBarra"].ToString();
                    string salida = GenBarra.GenerarAFIP(sal);
                    mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                    byte[] arrImg = user.Config.Logo;
                    string salida2 = Convert.ToBase64String(arrImg);



                    // todo esto es por el hosting no funciona cuando habilito parametros externos en el report

                    DataTable DatosExt = new DataTable("DatosExt");
                    DataColumn colDato1 = new DataColumn("dato1", typeof(String));
                    DatosExt.Columns.Add(colDato1);
                    DataColumn colDato2 = new DataColumn("dato2", typeof(String));
                    DatosExt.Columns.Add(colDato2);
                    DataColumn colDato3 = new DataColumn("dato3", typeof(String));
                    DatosExt.Columns.Add(colDato3);
                    DataRow row1 = DatosExt.NewRow();
                    row1["dato1"] = salida;
                    row1["dato2"] = salida2;
                    row1["dato3"] = "";
                    DatosExt.Rows.Add(row1);

                    ReportDataSource reportDataSource1 = new ReportDataSource("Cab", ds.Tables["cab"]);
                    ReportDataSource reportDataSource2 = new ReportDataSource("Det", ds.Tables["det"]);
                    ReportDataSource reportDataSource3 = new ReportDataSource("Iva", ds.Tables["Iva"]);
                    ReportDataSource reportDataSource = new ReportDataSource("DatosExt", DatosExt);

                    localReport.DataSources.Add(reportDataSource1);
                    localReport.DataSources.Add(reportDataSource2);
                    localReport.DataSources.Add(reportDataSource3);
                    localReport.DataSources.Add(reportDataSource);
                    string reportType = "PDF";
                    string mimeType;
                    string encoding;
                    string fileNameExtension;
                    string deviceInfo =
                    "<DeviceInfo>" +
                    "  <OutputFormat>PDF</OutputFormat>" +
                    "  <PageWidth>21cm</PageWidth>" +
                    "  <PageHeight>29.7cm</PageHeight>" +
                    "  <MarginTop>0.05in</MarginTop>" +
                    "  <MarginLeft>0.5cm</MarginLeft>" +
                    "  <MarginRight>0.4cm</MarginRight>" +
                    "  <MarginBottom>0.5cm</MarginBottom>" +
                    "</DeviceInfo>";
                    Warning[] warnings;
                    string[] streams;
                    byte[] renderedBytes;


                    renderedBytes = localReport.Render(
                        reportType,
                        deviceInfo,
                        out mimeType,
                        out encoding,
                        out fileNameExtension,
                        out streams,
                        out warnings);




                    Response.Clear();
                    //Response.ContentType = mimeType;

                    Response.AddHeader("content-disposition", "attachment; filename=Cbate." + fileNameExtension);

                    this.Response.Buffer = true;
                    this.Response.ContentType = "application/pdf";
                    Response.BinaryWrite(renderedBytes);
                    // Response.Flush();
                    Response.End();


                }
            }
            catch (Exception ex)
            {
                throw ex;

            }

        }


        [WebMethod()]

        public static string[] GetChartData(string anio)
        {
            if (HttpContext.Current.Session["UsuarioActual"] == null)
            {

                throw new Exception("Acceso no valido");
            }

            string id_cfg = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id.ToString();
            string[] sal = Bll.Bllkx_cbtes.DameInstancia().saldoXmes(anio, id_cfg);

            return sal;

        }


        [WebMethod()]

        public static string[] GetChartDataVtas(string anio)
        {
            if (HttpContext.Current.Session["UsuarioActual"] == null)
            {

                throw new Exception("Acceso no valido");
            }

            string id_cfg = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id.ToString();
            string[] sal = Bll.Bllkx_cbtes.DameInstancia().saldoXmesVtas(anio, id_cfg);

            return sal;

        }

        [WebMethod()]
        public static List<string> Wsserv_artXmes(string v_mes, string v_anio)
        {
            try
            {
                if(HttpContext.Current.Session["UsuarioActual"]== null){

                    throw new Exception("Acceso no valido");
                }

                string id_cfg = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id.ToString();
                List<string> sal = Bll.Bllkx_cbtes.DameInstancia().serv_artXmes(v_mes, v_anio, id_cfg);

                return sal;



            }
            catch (Exception)
            {

                throw;
            }



        }

        [WebMethod()]
        public static List<string> Wsserv_artXmesVtas(string v_mes, string v_anio)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido");
                }

                string id_cfg = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id.ToString();
                List<string> sal = Bll.Bllkx_cbtes.DameInstancia().serv_artXmesVtas(v_mes, v_anio, id_cfg);

                return sal;



            }
            catch (Exception)
            {

                throw;
            }



        }

        [WebMethod()]

        public static List<Be.kx_cbtes> WssaldoXmesVtas(string v_mes, string v_anio)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.kx_cbtes> list = new List<Be.kx_cbtes>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                list = Bll.Bllkx_cbtes.DameInstancia().WssaldoXmesVtas(v_mes, v_anio, conf);
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]

        public static List<Be.Combos> graficos()
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.Combos> list = new List<Be.Combos>();
                
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                Be.Combos cmm1 = new Be.Combos();
                cmm1.descripcion = "VER_FACTURACION";
                cmm1.valor = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.VER_FACTURACION;
                list.Add(cmm1);

                 cmm1 = new Be.Combos();
                cmm1.descripcion = "VER_VENTAS";
                cmm1.valor = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.VER_VENTAS;
                list.Add(cmm1);

           
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

    }
}