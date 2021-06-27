using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bll;
using Be;
using Microsoft.Reporting.WebForms;
using System.Data;
using System.IO;
using System.Net;
 
using System.IO.Compression;
 
namespace HardSoft.App.Kardex
{
    public partial class Cbtes_comprasVer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (HttpContext.Current.Session["UsuarioActual"]==null)
            {
                Response.Redirect("/");
            }
            if (!Bllmysql_usuarios.DameInstancia().TienePermisoPara("VER_KARDEX"))
            {
                Response.Redirect("http://www.hardsoft.com.ar/App/Home.aspx", false);

            }


            string tipo = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.CondicionIVA;

            if (tipo == "Responsable Inscripto")
            {
                PnlCitti.Visible = true;
            }
            else {
                PnlCitti.Visible = false;            
            }
        }
        protected void BtnImp_Click(object sender, EventArgs e)
        {
            try
            {


                LocalReport localReport = new LocalReport();

                string ppr = Bllkx_cbtes.DameInstancia().PathReportCbteOAA(TxtTipoRep.Text);


             

                localReport.ReportEmbeddedResource = ppr;



                if (true)
                {
                    
                    DataSet ds = Bll.Bllkx_cbtes.DameInstancia().Cbate(TxtRpid.Text);

                     

                    string sal = ds.Tables["cab"].Rows[0]["CodBarra"].ToString();
                    string salida = GenBarra.GenerarAFIP(sal);
                    mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                    byte[] arrImg = user.Config.Logo;
                    string salida2 = Convert.ToBase64String(arrImg);


                    string nombreCbte = ds.Tables["cab"].Rows[0]["Letra"].ToString()+ ds.Tables["cab"].Rows[0]["PtoVta"].ToString() + ds.Tables["cab"].Rows[0]["CbteDesde"].ToString();

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

                    //Response.Clear();
                    //Response.ContentType = mimeType;


                    //Response.AddHeader("content-disposition", "attachment; filename=Cbate." + fileNameExtension);


                    //Response.BinaryWrite(renderedBytes);
                    //Response.End();


                    Response.Clear();
                    //Response.ContentType = mimeType;

                    Response.AddHeader("content-disposition", "attachment; filename="+ nombreCbte + "." + fileNameExtension);

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

        public static void WmModificar2(Be.Kx_Rubro v_obj)
        {


            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Bll.BllKx_Rubro.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmAlta2(Be.Kx_Rubro v_obj)
        { 
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Usuario = conf;
                Bll.BllKx_Rubro.DameInstancia().Alta(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }
        [WebMethod()]

        public static void WmBaja2(string v_id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
             
                Bll.Bllkx_cbtes.DameInstancia().Baja_cbatecompras(v_id);
            }
            catch (Exception)
            {

                throw;
            }
        }


        [WebMethod()]

        public static List<Be.kx_cbtes> WsListar(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.kx_cbtes> list = new List<Be.kx_cbtes>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                list = Bll.Bllkx_cbtes.DameInstancia().WsListarCompras(v_tipoCbate, v_tipo, v_valor1.ToUpper(), v_valor2.ToUpper(), user, conf,"99");
                HttpContext.Current.Session["Grilla"] = list;
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]

        public static void Wscttiventas(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.kx_cbtes> list = new List<Be.kx_cbtes>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                Dictionary<string, List<string>> Results;
                Results = Bll.Bllkx_cbtes.DameInstancia().Wscttiventas(v_tipoCbate, v_tipo, v_valor1.ToUpper(), v_valor2.ToUpper(), user, conf);
              
                //foreach (KeyValuePair<string, string> result in Results)
                //{
                         //    Console.WriteLine(string.Format("Key-{0}:Value-{1}", result.Key, result.Value));
                //}
 
                string dirFullPath = HttpContext.Current.Server.MapPath("~/App/Kardex/Report/");

              

                // Write the string array to a new file named "WriteLines.txt".
 

                using (StreamWriter outputFile = new StreamWriter(Path.Combine(dirFullPath, "alicutas.txt")))
                {
                    foreach (KeyValuePair<string, List<string>> result in Results)
                    {
                      //  Console.WriteLine(string.Format("Key-{0}:Value-{1}", result.Key, result.Value));
                        if (result.Key == "alic")
                        {
                            foreach (var item in result.Value)
                            {
                                outputFile.WriteLine(item);
                            }

                        }
                    }
                      
                }



                using (StreamWriter outputFile = new StreamWriter(Path.Combine(dirFullPath, "ventas.txt")))
                {
                    foreach (KeyValuePair<string, List<string>> result in Results)
                    {
                        //  Console.WriteLine(string.Format("Key-{0}:Value-{1}", result.Key, result.Value));
                        if (result.Key == "vtas")
                        {
                            foreach (var item in result.Value)
                            {
                                outputFile.WriteLine(item);
                            }
                            
                        }
                    }

                }





             
                File.Delete(Path.Combine(dirFullPath, "VENTAS.zip"));

                //provide the path and name for the zip file to create
                string zipFile = Path.Combine(dirFullPath, "VENTAS.zip");


                using (var zip = ZipFile.Open(zipFile, ZipArchiveMode.Create))
                {
                    var entry = zip.CreateEntry("alicutas.txt");
                    entry.LastWriteTime = DateTimeOffset.Now;

                    using (var stream = File.OpenRead(Path.Combine(dirFullPath, "alicutas.txt")))
                    using (var entryStream = entry.Open())
                        stream.CopyTo(entryStream);


                    var entry1 = zip.CreateEntry("ventas.txt");
                    entry1.LastWriteTime = DateTimeOffset.Now;

                    using (var stream1 = File.OpenRead(Path.Combine(dirFullPath, "ventas.txt")))
                    using (var entryStream1 = entry1.Open())
                        stream1.CopyTo(entryStream1);
                }
 


                
            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]

        public static List<Be.kx_cbtes> WssaldoXmes(string v_mes, string v_anio )
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.kx_cbtes> list = new List<Be.kx_cbtes>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                list = Bll.Bllkx_cbtes.DameInstancia().WssaldoXmes(v_mes, v_anio, conf);
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

        protected void BtnRp_Click(object sender, EventArgs e)
        {
            List<string> noo = new List<string>();
            noo.Add("Concepto");
            noo.Add("DocTipo");
            noo.Add("usuario");
           noo.Add("Id");
           noo.Add("CantReg");
           noo.Add("aud");
           noo.Add("Vendedor");
           noo.Add("Resultado");
           noo.Add("CbteHasta");
           noo.Add("CbteFch");
            noo.Add("anular_fecha");
            noo.Add("anular_id");



            noo.Add("MonId");
           noo.Add("MonCotiz");
           noo.Add("CodBarra");
           noo.Add("Cuit");

           noo.Add("Id_config");
           noo.Add("Pago_Efectivo");
           noo.Add("Pago_Bancos");
           noo.Add("Pago_Cheques");

           noo.Add("Pago_Tarjetas");
           noo.Add("ImporteLetra");
           noo.Add("Contado");
           noo.Add("treintaDias");


           noo.Add("Tj_Debito");
           noo.Add("Tj_Credito");
           noo.Add("CtaCte");
           noo.Add("Cheque");
           noo.Add("Otra");
           noo.Add("Remito");
           noo.Add("ImpTotConc");

            noo.Add("CantAlic");
            noo.Add("ClienteNombre");
            noo.Add("FchVtoPago");
            noo.Add("TelCli");
            noo.Add("Transferencia");
            noo.Add("anular_Tipo");
            noo.Add("anular_Nro");





            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Cbtes.xls");
            Response.AddHeader("Content-Type", "application/excel");

            GridView grid = new GridView();
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
           
            DataTable dts = exel.ConvertToDataTable(((List<Be.kx_cbtes>)HttpContext.Current.Session["Grilla"]), noo);

            // para que haga la funcion SUM()  desde execl tengo que cambiar la configuracion reginal y pasar . como separador de mil y , como decimal


            // TITULO
            htmlTextWriter.Write(" ");

            grid.DataSource = dts;
            grid.DataBind();
            grid.RenderControl(htmlTextWriter);
            Response.Write(stringWriter.ToString());

            htmlTextWriter.Close();
            stringWriter.Close();


            Response.End();
                        
        
                        
        }

    }
}