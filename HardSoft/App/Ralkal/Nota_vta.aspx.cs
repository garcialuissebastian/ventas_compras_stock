using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using Be;
using Bll;
namespace HardSoft.App.Ralkal
{
    public partial class Nota_vta : System.Web.UI.Page
    {
        public static string strCurrentDir;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            LblMsg.Text = "";
            if(!Page.IsPostBack){
            HttpContext.Current.Session["ListaP"] = null;
     
            }
            strCurrentDir = "HardSoft.App.Ralkal.Report.Nota.rdlc";

        }
        protected void BtnRp_Click(object sender, EventArgs e)
        {
            try
            {


                LocalReport localReport = new LocalReport();

                Be.NOTA_VTA nt = Bll.BllNOTA_VTA.DameInstancia().Ultima_nota();


                localReport.ReportEmbeddedResource = "HardSoft.App.Ralkal.Report.NotaC.rdlc"; 


                System.Data.DataSet dt = Bll.BllClientes.DameInstancia().Buscar_rep(nt.Id_cliente, nt.Id.ToString());


                if (dt.Tables.Count > 0)
                {

                    ReportDataSource reportDataSource = new ReportDataSource("Clientes", dt.Tables[0]);
                    ReportDataSource reportDataSource1 = new ReportDataSource("Productos", dt.Tables[1]);
                    ReportDataSource reportDataSource2 = new ReportDataSource("Nota_vta", dt.Tables[2]);

                    localReport.DataSources.Add(reportDataSource);
                    localReport.DataSources.Add(reportDataSource1);
                    localReport.DataSources.Add(reportDataSource2);
                    string reportType = "PDF";
                    string mimeType;
                    string encoding;
                    string fileNameExtension;
                    string deviceInfo =
                    "<DeviceInfo>" +
                    "  <OutputFormat>PDF</OutputFormat>" +
                    "  <PageWidth>21cm</PageWidth>" +
                    "  <PageHeight>29.7cm</PageHeight>" +
                    "  <MarginTop>0.15in</MarginTop>" +
                    "  <MarginLeft>0.15in</MarginLeft>" +
                    "  <MarginRight>0.15in</MarginRight>" +
                    "  <MarginBottom>0.15in</MarginBottom>" +
                    "</DeviceInfo>";
                    Warning[] warnings;
                    string[] streams;
                    byte[] renderedBytes;
                    //Render the report
                    renderedBytes = localReport.Render(
                        reportType,
                        deviceInfo,
                        out mimeType,
                        out encoding,
                        out fileNameExtension,
                        out streams,
                        out warnings);
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.ContentType = mimeType;
                    HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=Nota." + fileNameExtension);
                    HttpContext.Current.Response.BinaryWrite(renderedBytes);
                    HttpContext.Current.Response.End();

                }
            }
            catch (Exception ex)
            {

                LblMsg.Text = ex.Message;
            }

        }


        [WebMethod()]

        public static List<Be.Productos> WsListarP(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.Productos> list = new List<Be.Productos>();

                list = Bll.BllProductos.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim());
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static List<Be.Clientes> WsListarC(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.Clientes> list = new List<Be.Clientes>();

                list = Bll.BllClientes.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim());
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
    
        
        [WebMethod()]

        public static List<Be.Productos>  gvProductos(string v_id, string v_nombre,   string v_precio,   string v_cant)
        {
            try
            {

                List<Be.Productos> list = new List<Be.Productos>();
                Be.Productos pp = new Be.Productos();
                pp.Id = Convert.ToInt32(v_id);                 
                pp.Nombre = v_nombre;
                pp.Precio = v_precio;
                 pp.Cant   = v_cant;

                if (HttpContext.Current.Session["ListaP"] != null) {
                    list = (List<Be.Productos>)HttpContext.Current.Session["ListaP"];
                }
                
                list.Add(pp);
                HttpContext.Current.Session["ListaP"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }



        [WebMethod()]

        public static List<Be.Tarjeta> gvTarjeta(string v_id, string v_nombre, string v_precio, string v_cant)
        {
            try
            {

                List<Be.Tarjeta> list = new List<Be.Tarjeta>();
                Be.Tarjeta pp = new Be.Tarjeta();
               
                
              
                pp.Nombre = v_nombre;
                pp.Precio = v_precio;
                pp.Cant = v_cant;

                if (HttpContext.Current.Session["ListaT"] != null)
                {
                    list = (List<Be.Tarjeta>)HttpContext.Current.Session["ListaT"];
                }

                pp.Id = Convert.ToInt32(list.Count + 1);
                list.Add(pp);
                HttpContext.Current.Session["ListaT"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static void WsGuardar(Be.NOTA_VTA v_obj)
        {
            try
            {


                Bll.BllNOTA_VTA.DameInstancia().Alta(v_obj);

                List<Be.Productos> list = new List<Be.Productos>();


                if (HttpContext.Current.Session["ListaP"] != null)
                {
                    List<Be.Productos> list2 = new List<Be.Productos>();
                    list = (List<Be.Productos>)HttpContext.Current.Session["ListaP"];

                    Bll.BllNOTA_VTA_DET.DameInstancia().Alta(list);

                    HttpContext.Current.Session["ListaP"] = null;

                }

              

 
            }
            catch (Exception)
            {

                throw;
            }


        }
     
         [WebMethod()]

        public static List<Be.Productos> gvProductos_del(string v_id)
        {
            try
            {

                List<Be.Productos> list = new List<Be.Productos>();
                

                if (HttpContext.Current.Session["ListaP"] != null)
                {
                  
                    List<Be.Productos> list2 = new List<Be.Productos>();
                    list2 = (List<Be.Productos>)HttpContext.Current.Session["ListaP"];

                    foreach (var item in list2)
                    {
                        if(item.Id != Convert.ToInt32(v_id)){
                            list.Add(item);
                        }
                    }
                
                
                }

                 
                HttpContext.Current.Session["ListaP"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
      
        [WebMethod()]
         public static List<Be.Tarjeta> gvTarjeta_del(string v_id)
         {
             try
             {

                 List<Be.Tarjeta> list = new List<Be.Tarjeta>();


                 if (HttpContext.Current.Session["ListaT"] != null)
                 {

                     List<Be.Tarjeta> list2 = new List<Be.Tarjeta>();
                     list2 = (List<Be.Tarjeta>)HttpContext.Current.Session["ListaT"];

                     foreach (var item in list2)
                     {
                         if (item.Id != Convert.ToInt32(v_id))
                         {
                             list.Add(item);
                         }
                     }


                 }


                 HttpContext.Current.Session["ListaT"] = list;

                 return list;
             }
             catch (Exception)
             {

                 throw;
             }


         }
        [WebMethod()]

        public static string WsPrecio(string v_id)
        {
            string sal= "0";
            try
            {

                sal = Bll.BllLISTA_PRECIOS.DameInstancia().Precio(v_id).ToString();
                
            }
            catch (Exception)
            {

                throw;
            }
            return sal;

        }

        [WebMethod()]

        public static string WsStock(string v_id)
        {
            string sal = "0";
            try
            {

                sal = Bll.BllLISTA_PRECIOS.DameInstancia().Stock_p(v_id);

            }
            catch (Exception)
            {

                throw;
            }
            return sal;

        }

        [WebMethod()]

        public static List<Be.PERSONAL> WsListarV( string v_valor)
        {
            try
            {

                List<Be.PERSONAL> list = new List<Be.PERSONAL>();



                if (HttpContext.Current.Session["ListaV"] != null)
                {
                    list = (List<Be.PERSONAL>)(HttpContext.Current.Session["ListaV"]);
                }
                else {
                    list = Bll.BllPERSONAL.DameInstancia().ListarVendedores("");
                    HttpContext.Current.Session["ListaV"] = list;
                }


               

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
    }
}