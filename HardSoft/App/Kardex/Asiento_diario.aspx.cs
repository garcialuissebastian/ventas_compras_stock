using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
using System.Web.Services;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace HardSoft.App.Kardex
{
    public partial class Asiento_diario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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


        public static List<kx_asiento_diario> WsListar_kx_asiento_diario(string v_tipo, string v_valor, string v_valor1)

        {
            try
            {
                List<kx_asiento_diario> list = new List<kx_asiento_diario>();
                string Id_config = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_asiento_diario.DameInstancia().Listar_kx_asiento_diario(v_tipo, v_valor.ToUpper().Trim(), v_valor1.ToUpper().Trim(), Id_config);

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }




        [WebMethod()]


        public static void WmGvDel_kx_asiento_diario(Int32 v_Id)
        {
            try

            {

                Bll.Bllkx_asiento_diario.DameInstancia().Eliminar_kx_asiento_diario(v_Id);

            }

            catch (Exception)

            {

                throw;

            }

        }

        [WebMethod()]


        public static void WmGvMod_kx_asiento_diario(kx_asiento_diario v_obj)
        {
            try
            {
                Bll.Bllkx_asiento_diario.DameInstancia().Modificacion_kx_asiento_diario(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


        [WebMethod()]


        public static void WmGvAlta_kx_asiento_diario(kx_asiento_diario v_obj)
        {
            try
            {
                Bll.Bllkx_asiento_diario.DameInstancia().Alta_kx_asiento_diario(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


    }
}