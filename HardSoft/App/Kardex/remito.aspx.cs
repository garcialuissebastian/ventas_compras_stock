using Be;
using Bll;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Kardex
{
    public partial class remito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

         

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
               LocalReport localReport = new LocalReport();
                DataSet ds = Bll.Bllkx_cbtes.DameInstancia().Cbate_Nro(TxtComprobante.Text.Trim());
                string ppr = "HardSoft.App.Kardex.Report.CbateR.rdlc";

                localReport.ReportEmbeddedResource = ppr;

                string sal = ds.Tables["cab"].Rows[0]["CodBarra"].ToString();
                string salida = GenBarra.GenerarAFIP(sal);
                //mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                //byte[] arrImg = user.Config.Logo;
                //string salida2 = Convert.ToBase64String(arrImg);

                string salida2 = "";

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
                row1["dato3"] = TxtFechaDesde.Text.Trim(); // fecha de vto remito
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
                "  <PageWidth>16.5cm</PageWidth>" +
                "  <PageHeight>20.1cm</PageHeight>" +
                "  <MarginTop>1.85cm</MarginTop>" +
                "  <MarginLeft>0.4cm</MarginLeft>" +
                "  <MarginRight>0.0cm</MarginRight>" +
                "  <MarginBottom>0.0cm</MarginBottom>" +
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
}