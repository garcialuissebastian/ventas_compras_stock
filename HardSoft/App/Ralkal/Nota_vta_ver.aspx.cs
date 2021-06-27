using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
using Microsoft.Reporting.WebForms;
namespace HardSoft.App.Ralkal
{
    public partial class Nota_vta_ver : System.Web.UI.Page 
    { 
        public static string strCurrentDir;
        protected void Page_Load(object sender, EventArgs e)

        {
           strCurrentDir = Server.MapPath(".") + "\\Report\\Nota.rdlc";
           // strCurrentDir = "/App/Ralkal/Report/Nota.rdlc";
        }

        [WebMethod()]

        public static List<Be.NOTA_VTA_TMP> WsListar( string v_valor)
        {
            try
            {
                List<Be.NOTA_VTA_TMP> list = new List<Be.NOTA_VTA_TMP>();

                list = Bll.BllNOTA_VTA.DameInstancia().SP_Listar("");
                return list;
            }
            catch (Exception)
            {
                
                throw;
            }
             
        
        }
        [WebMethod()]

        public static List<Be.Pagos_tmp> WsListarCoutas(string v_valor)
        {
            try
            {
                List<Be.Pagos_tmp> list = new List<Be.Pagos_tmp>();

                list = Bll.BllNOTA_VTA.DameInstancia().SP_ListarCobros(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static void WsPagar(string v_nota, string v_couta)
        {
            try
            {
                
                Bll.BllNOTA_VTA.DameInstancia().Pagar(v_nota,  v_couta);
 
            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static List<Be.PERSONAL> WsListarCobrador(string v_valor)
        {
            try
            {
                List<Be.PERSONAL> list = new List<Be.PERSONAL>();

                list = Bll.BllPERSONAL.DameInstancia().ListarCobrador("");
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static void WsAsignar(string v_cobra, string v_nota)
        {
            try
            {
                 

                 Bll.BllNOTA_VTA.DameInstancia().ASIGNAR_COBRADOR( v_cobra,   v_nota);
               
            }
            catch (Exception)
            {

                throw;
            }


        }




        [WebMethod()]

        public static void WsReport(string v_valor)
        {
            

        }

        protected void BtnRp_Click(object sender, EventArgs e)
        {
            string sal = "0";

            try
            {
               
                LocalReport localReport = new LocalReport();

                localReport.ReportEmbeddedResource = "HardSoft.App.Ralkal.Report.Nota.rdlc"; 

               // localReport.ReportPath = @"Report\\Nota.rdlc";

                System.Data.DataSet dt = Bll.BllClientes.DameInstancia().Buscar_rep(Hdcliente.Value, HdNota.Value);
                sal = "1";

                if (dt.Tables.Count > 0)
                { 

                    ReportDataSource reportDataSource = new ReportDataSource("Clientes", dt.Tables[0]);
                    ReportDataSource reportDataSource1 = new ReportDataSource("Productos", dt.Tables[1]);
                    ReportDataSource reportDataSource2 = new ReportDataSource("Nota_vta", dt.Tables[2]);

                    sal = "11";

                    localReport.DataSources.Add(reportDataSource);
                    localReport.DataSources.Add(reportDataSource1);
                    localReport.DataSources.Add(reportDataSource2);
                    sal = "22";
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

                    sal = "33";
                    //Render the report
                    renderedBytes = localReport.Render(
                        reportType,
                        deviceInfo,
                        out mimeType,
                        out encoding,
                        out fileNameExtension,
                        out streams,
                        out warnings);
                    sal = "3";
                   Response.Clear();
                  Response.ContentType = mimeType;

                    sal = "3";
                     Response.AddHeader("content-disposition", "attachment; filename=Nota." + fileNameExtension);
             
                    
                  Response.BinaryWrite(renderedBytes);
                    Response.End();

                }
            }
            catch (Exception ex)
            {

                Msg.Text = ex  +" - "+sal;

            }

        }

        protected void BtnCouta_Click(object sender, EventArgs e)
        {
            try
            {
                LocalReport localReport = new LocalReport();

                localReport.ReportEmbeddedResource = "HardSoft.App.Ralkal.Report.Cuotas.rdlc";


                System.Data.DataTable dt = Bll.BllNOTA_VTA.DameInstancia().SP_ListarCobros_RP(HdNota.Value);


                if (dt.Rows.Count > 0)
                {

                    ReportDataSource reportDataSource = new ReportDataSource("Cuotas", dt);

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


                    Response.AddHeader("content-disposition", "attachment; filename=Cuotas." + fileNameExtension);


                    Response.BinaryWrite(renderedBytes);
                    Response.End();


                }
            }
            catch (Exception)
            {

                throw;
            }

        }


    }
}