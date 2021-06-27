using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Hospital.Report
{
    public partial class Aud_ver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

          [WebMethod()]


        public static List<Be.Audiencias> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.Audiencias> list = new List<Be.Audiencias>();

                list = Bll.BllAudiencias.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim());
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }


          [WebMethod()]


          public static List<Be.Audiencia_req> WsListar2(string v_tipo, string v_valor)
          {
              try
              {
                  List<Be.Audiencias> list = new List<Be.Audiencias>();

                  list = Bll.BllAudiencias.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim());
                  return list[0].Requirentes;
              }
              catch (Exception)
              {

                  throw;
              }


          }
          protected void BtnRp_Click(object sender, EventArgs e)
          {
              try
              {
                  Int32 ids = Convert.ToInt32( Hdcliente.Value);



                  LocalReport localReport = new LocalReport();




                  localReport.ReportEmbeddedResource = "HardSoft.App.Hospital.Report.Aud.rdlc";


                  System.Data.DataSet dt = Bll.BllAudiencias.DameInstancia().Buscar_rep(ids.ToString());


                  if (dt.Tables.Count > 0)
                  {

                      ReportDataSource reportDataSource = new ReportDataSource("Aud", dt.Tables[0]);
                      ReportDataSource reportDataSource1 = new ReportDataSource("Req", dt.Tables[1]);
                      ReportDataSource reportDataSource2 = new ReportDataSource("Rdo", dt.Tables[2]);

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
                      HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=Auditoria." + fileNameExtension);
                      HttpContext.Current.Response.BinaryWrite(renderedBytes);
                      HttpContext.Current.Response.End();

                  }
              }
              catch (Exception ex)
              {

                  LblMsg.Text = ex.Message;
              }

          }
    }
}