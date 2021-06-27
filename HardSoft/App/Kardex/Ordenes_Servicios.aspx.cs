using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using  Be;
using Bll;
using Microsoft.Reporting.WebForms;
using System.Data;
namespace HardSoft.App.Kardex
{
    public partial class Ordenes_Servicios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod()]

        public static string WmAlta2Cli(Be.kx_cliente v_obj)
        {
            
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Usuario = user;
                if (Bll.Bllordenes_servicio.DameInstancia().WsExisteDoc(v_obj.Doc_No,user)== 0) {
                    return Bll.Bllkx_cliente.DameInstancia().AltaId(v_obj).ToString();
                
                }
                return "1";
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmMod(Be.ordenes_servicio v_obj)
        {
            try
            {
              Bll.Bllordenes_servicio.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }
        [WebMethod()]

        public static string WsExisteDoc(string v_id)
        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
               
                return Bll.Bllordenes_servicio.DameInstancia().WsExisteDoc(v_id,user).ToString();

            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]

        public static void WmAlta(Be.ordenes_servicio v_obj)
        {
            try
            {
                Bll.Bllordenes_servicio.DameInstancia().Alta(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }
       
        
        
        [WebMethod()]

        public static List<Be.ordenes_servicio> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.ordenes_servicio> list = new List<Be.ordenes_servicio>();

                list = Bll.Bllordenes_servicio.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim());
                HttpContext.Current.Session["Lista"] = list;
               
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]

        public static  ordenes_servicio WsListarId(string v_id)
        {
            try
            {
                List<Be.ordenes_servicio> list = new List<Be.ordenes_servicio>();
                Be.ordenes_servicio pp = new ordenes_servicio();
               
               pp= Bllordenes_servicio.DameInstancia().ListarId(v_id);
                return pp; 
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static void WsFcId(string v_id)
        {
            try
            {
               
                Be.ordenes_servicio pp = new ordenes_servicio();

                pp = Bllordenes_servicio.DameInstancia().ListarId(v_id);
                List<Be.kx_articulo> list = new List<Be.kx_articulo>();
                Be.kx_articulo art = new kx_articulo();
                art.Id = Convert.ToInt32(v_id);
                art.Iva_Venta = "0.21";
                art.Iva_Compra = "0.21";
                art.ListaSelect = "1";
                art.P_FinalL1 = pp.Valor;
                art.PrecioSelect = pp.Valor;

                double a = Convert.ToDouble(pp.Valor);
                
                art.NetoSelect =Convert.ToString(Math.Round( (a/(1+ 0.21)),2)) ;
                art.Cant = "1";                
                art.Tipo_Art = "SERVICIO";
                art.Moneda = "Moneda";
                art.Cont_Venta = "VENTAS";
                art.Cont_Compra = "Cont_Compra";
                art.Nombre = pp.Equipo +" " +pp.Modelo +" "+pp.Motivo+"-"+pp.Info_Tecnico;
                art.ClienteSelect = pp.ClienteObj;
                art.Cod_Manual = "GFXOS";
                list.Add(art);
                HttpContext.Current.Session["SelectArtOS"]=   list ;

                   
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static void WsOrden(string v_Id)
        {
            try
            {
                Be.ordenes_servicio os = new Be.ordenes_servicio();
                List<Be.ordenes_servicio> list = new List<Be.ordenes_servicio>();
                
                list = (List<Be.ordenes_servicio>)HttpContext.Current.Session["Lista"];

                foreach (var item in  list)
                {
                    if (item.Id.ToString() == v_Id) {
                        HttpContext.Current.Session["os"] = item;
                    
                    }
                }




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
                if (!string.IsNullOrEmpty(TxtId.Text)) { 
                LocalReport localReport = new LocalReport();

                localReport.ReportEmbeddedResource = "HardSoft.App.Kardex.Report.Orden.rdlc";



             

                DataTable dt = Bll.Bllordenes_servicio.DameInstancia().Rp(TxtId.Text);


                if (dt.Rows.Count >0)
                {

                    ReportDataSource reportDataSource = new ReportDataSource("Orden", dt);
                   

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
                   
                    Response.Clear();
                    Response.ContentType = mimeType;

                 
                    Response.AddHeader("content-disposition", "attachment; filename=Orden." + fileNameExtension);


                    Response.BinaryWrite(renderedBytes);
                 Response.End();


 

                }
                }
            }
            catch (Exception ex)
            {

               

            }
        }

        protected void BtnImpFc_Click(object sender, EventArgs e)
        {
            try
            { 
                if (true)
                {

                    DataSet ds = Bll.Bllkx_cbtes.DameInstancia().Cbate(TxtIdFc.Text);
                    string TxtTipoRep = ds.Tables["cab"].Rows[0]["Cod_Letra"].ToString();

                    LocalReport localReport = new LocalReport();
                    string ppr = "";
                    if (TxtTipoRep  == "6")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbateB.rdlc";
                    }
                    if (TxtTipoRep  == "8")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbatenNcB.rdlc";
                    }
                    if (TxtTipoRep  == "7")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbatenNdB.rdlc";
                    }

                    if (TxtTipoRep == "1")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbateA.rdlc";
                    }
                    if (TxtTipoRep  == "3")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbateNcA.rdlc";
                    }
                    if (TxtTipoRep  == "2")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbateNdA.rdlc";
                    }


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


                    //Render the report
                    renderedBytes = localReport.Render(
                        reportType,
                        deviceInfo,
                        out mimeType,
                        out encoding,
                        out fileNameExtension,
                        out streams,
                        out warnings);

                    Response.Clear();
                    Response.ContentType = mimeType;


                    Response.AddHeader("content-disposition", "attachment; filename=Cbate." + fileNameExtension);


                    Response.BinaryWrite(renderedBytes);
                    Response.End();

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


    }
}