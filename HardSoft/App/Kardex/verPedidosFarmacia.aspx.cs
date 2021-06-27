using Be;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bll;

namespace HardSoft.App.Kardex
{
    public partial class verPedidosFarmacia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]

        public static void WsEliminarPedido(string v_id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Bll.Bllkx_articulo.DameInstancia().DeletePedido(v_id);

            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]


        public static List<Kc_Lote_Cab> WsListar_kx_pedidos(string v_tipo, string v_valor,string v_desde,string v_hasta)

        {
            try
            {
                //if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("ADM_KARDEX"))
                //{
                //    Response.Redirect("http://www.hardsoft.com.ar/App/Home.aspx", false);

                //}
                List<Kc_Lote_Cab> list = new List<Kc_Lote_Cab>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                list = Bll.Bllkx_articulo.DameInstancia().Listar_kx_pedidosFarmacia(v_tipo, v_valor.ToUpper().Trim() ,user, Bllmysql_usuarios.DameInstancia().TienePermisoPara("FARMACIA_ADMIN"), v_desde,  v_hasta);

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }

        [WebMethod()]


        public static List<Kc_Lote > WsListar_kx_pedidosDet(string v_ids)

        {
            try
            {
                List<Kc_Lote > list = new List<Kc_Lote >();

                list = Bll.Bllkx_articulo.DameInstancia().VerPedidoDet(v_ids);
  

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }

        protected void report2()
        {
            try
            {
                HttpContext.Current.Session["ListaLote"] = null;
                HttpContext.Current.Session["PDF1"] = "";
                LocalReport localReport = new LocalReport();

                string strCurrentDir = Server.MapPath(".") + "\\Report\\EgresoFarmaciaPedido.rdlc";

                localReport.ReportPath = strCurrentDir;


                DataSet dt = Bll.Bllkx_articulo.DameInstancia().ReportEgresoPedido(TxtIds2.Text, TxtIds.Text);

                if (dt.Tables["EgresoFarmacia"].Rows.Count > 0)
                {
                    ReportDataSource reportDataSource = new ReportDataSource("EgresoFarmacia", dt.Tables["EgresoFarmacia"]);
                    ReportDataSource reportDataSource1 = new ReportDataSource("Grilla", dt.Tables["Grilla"]);
                    ReportDataSource reportDataSource2 = new ReportDataSource("GrillaSinStock", dt.Tables["GrillaSinStock"]);
                    localReport.DataSources.Add(reportDataSource2);
                    localReport.DataSources.Add(reportDataSource1);
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
                "  <MarginTop>0.5cm</MarginTop>" +
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
                    Response.AddHeader("content-disposition", "attachment; filename=reporte." + fileNameExtension);



                    Response.BinaryWrite(renderedBytes);
                    Response.End();

                }
                else
                { //lblMsg.Text = "No se encuentra registros."; 
                }
            }
            catch (Exception ex)
            {

                
            }
        }

        protected void report()
        {
            try
            {
                HttpContext.Current.Session["ListaLote"] = null;
                HttpContext.Current.Session["PDF1"] = "";
                LocalReport localReport = new LocalReport();

                string strCurrentDir = Server.MapPath(".") + "\\Report\\PedidosFarmacia.rdlc";

                localReport.ReportPath = strCurrentDir;


                DataSet dt = Bll.Bllkx_articulo.DameInstancia().ReportPedidos(TxtIds.Text);

                if (dt.Tables["EgresoFarmacia"].Rows.Count > 0)
                {
                    ReportDataSource reportDataSource = new ReportDataSource("EgresoFarmacia", dt.Tables["EgresoFarmacia"]);
                    ReportDataSource reportDataSource1 = new ReportDataSource("Grilla", dt.Tables["Grilla"]);
                    localReport.DataSources.Add(reportDataSource1);
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
                "  <MarginTop>0.5cm</MarginTop>" +
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
                    Response.AddHeader("content-disposition", "attachment; filename=reporte." + fileNameExtension);

 

                    Response.BinaryWrite(renderedBytes);
                    Response.End();

                }
                else
                { //lblMsg.Text = "No se encuentra registros."; 
                }
            }
            catch (Exception ex)
            {

                // lblMsg.Text = ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            report();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            report2();
        }
    }
}