using Be;
using Bll;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Kardex
{
    public partial class ResultadoVta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Create a CultureInfo object for French in France.
            CultureInfo FrCulture = new CultureInfo("es-AR");
            // Set the CurrentCulture to fr-FR.
            Thread.CurrentThread.CurrentCulture = FrCulture;
            // Clone the NumberFormatInfo object and create
            // a new object for the local currency of France.
            NumberFormatInfo LocalFormat = (NumberFormatInfo)NumberFormatInfo.CurrentInfo.Clone();
            // Replace the default currency symbol with the local currency symbol.
            LocalFormat.CurrencySymbol = "$";
            int i = 100;
            // Display i formatted as the local currency.
            Console.WriteLine(i.ToString("c", LocalFormat));
            // Display i formatted as the default currency.
            Console.WriteLine(i.ToString("c", NumberFormatInfo.CurrentInfo));
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

 string id_cfg =  ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id.ToString();
 string[] sal = Bll.Bllkx_cbtes.DameInstancia().saldoXmes(anio, id_cfg);

            return sal;
                  
         }
            [WebMethod()]
        public static List<string> Wsserv_artXmes(string v_mes, string v_anio)
        {
            try
            {

            string id_cfg = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id.ToString();
            List<string> sal = Bll.Bllkx_cbtes.DameInstancia().serv_artXmes(v_mes, v_anio, id_cfg);

            return sal;



            }
            catch (Exception)
            {

                throw;
            }



        }
    }
}