using Be;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;
namespace HardSoft.App.Kardex
{
    public partial class ListaPreciosRp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]

        public static List<Be.kx_articulo> WsAgregarArticulo(string v_lista, string v_art)
        {
            try
            {

                List<Be.kx_articulo> listart = new List<Be.kx_articulo>();
                listart = (List<Be.kx_articulo>)HttpContext.Current.Session["art"];

                List<Be.kx_articulo> listselect = new List<Be.kx_articulo>();
                listselect = (List<Be.kx_articulo>)HttpContext.Current.Session["artSelect"];
                bool sal = false;
                foreach (var item1 in listselect)
                {
                    if(item1.Id.ToString() == v_art)
                    {
                        sal = true;
                    }
                }
                if (!sal) {
                    foreach (var item in listart)
                    {
                        if (item.Id.ToString() == v_art)
                        {
                            listselect.Add(item);
                            HttpContext.Current.Session["artSelect"] = listselect;
                            string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                            Bll.Bllkx_articulo.DameInstancia().insertListaReducida(v_lista,   v_art, user, "REDUCIDA");
                        }
                    }
                }

                


                return listselect;


            }
            catch (Exception)
            {

                throw;
            }


        }


        public void reporte()
        {
            LocalReport localReport = new LocalReport();

             localReport.ReportEmbeddedResource = "HardSoft.App.Kardex.Report.ListaPrecios.rdlc";  
           // string strCurrentDir = Server.MapPath(".") + "\\Report\\ListaPrecios.rdlc";
             
         //   localReport.ReportPath = strCurrentDir;
 
                string salida = "";
                mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                byte[] arrImg = user.Config.Logo;
                string salida2 = Convert.ToBase64String(arrImg);
            DataSet ds = Bll.Bllkx_articulo.DameInstancia().ListaPreciosRp(user.Config.id, "REDUCIDA"); 
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
                ReportDataSource reportDataSource2 = new ReportDataSource("ListaPrecios", ds.Tables["ListaPrecios"]);             
                ReportDataSource reportDataSource = new ReportDataSource("DatosExt", DatosExt);




                localReport.DataSources.Add(reportDataSource1);
                localReport.DataSources.Add(reportDataSource2);
            
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


                Response.AddHeader("content-disposition", "attachment; filename=Precios." + fileNameExtension);


                Response.BinaryWrite(renderedBytes);
                Response.End();
            }
        [WebMethod()]

        public static List<Be.kx_articulo> WsListar()
        {
            try
            {

                List<Be.kx_articulo> list = new List<Be.kx_articulo>();
                HttpContext.Current.Session["artSelect"] = list;
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_articulo.DameInstancia().ListarReducida ( user, "REDUCIDA");
                HttpContext.Current.Session["artSelect"] = list;


                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static void Wseliminar(string v_art)
        {
            try
            { 
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                Bll.Bllkx_articulo.DameInstancia().eliminarListaReducida(v_art,user, "REDUCIDA");
                  
            }
            catch (Exception)
            {

                throw;
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            reporte();
        }
    }
}