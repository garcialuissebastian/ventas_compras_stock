using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;

using Microsoft.Reporting.WebForms;
using System.Data;
using System.IO;

namespace HardSoft.App.Kardex
{
    public partial class Stock_Mov : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("ADM_KARDEX"))
            {
                Response.Redirect("http://www.hardsoft.com.ar/App/Home.aspx", false);

            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                string salida = GenBarra.Generar("000000000000001");

             

            

                if (true)
                {
                    LocalReport localReport = new LocalReport();

                    localReport.ReportEmbeddedResource = "HardSoft.App.Kardex.Report.pp.rdlc";



                    DataTable DatosExt = new DataTable("DatosExt"); 
                    DataColumn colDato1 = new DataColumn("dato1", typeof(String));
                    DatosExt.Columns.Add(colDato1);
                    DataColumn colDato2 = new DataColumn("dato2", typeof(String));
                    DatosExt.Columns.Add(colDato2);
                    DataColumn colDato3 = new DataColumn("dato3", typeof(String));
                    DatosExt.Columns.Add(colDato3);

                    DataRow row1 = DatosExt.NewRow();
                   // row1["dato1"] = "http://www.hardsoft.com.ar/Services/BarcodeHandler.ashx?b=INT2OF5&f=0|38|180|95&n=no&p=no&t=000000000000001";
                  

                    row1["dato1"] = salida;
                    row1["dato2"] = "";
                    row1["dato3"] = "";
                    DatosExt.Rows.Add(row1);


                  //  DataTable dt = Bll.Bllordenes_servicio.DameInstancia().Rp("15");
               
                    if (true)
                    {

                        ReportDataSource reportDataSource = new ReportDataSource("DatosExt", DatosExt);


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

                LblMsg.Text = ex.ToString();

            }
            }
    }
}