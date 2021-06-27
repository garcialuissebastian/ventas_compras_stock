using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using  Be;
using Bll;
using Microsoft.Reporting.WebForms;

namespace HardSoft.App.Kardex
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (HttpContext.Current.Session["UsuarioActual"]== null)
            //{
            //    Response.Redirect("http://www.hardsoft.com.ar");
            
            //}



        }


        [WebMethod()]
        public static Be.kx_cliente validad_doc(string v_doc, string v_tipo)
        {
            kx_cliente sal = new kx_cliente();
            try
            {
                // hay q habilitar  padron A5 Y A13 EN AFIP
                if (!string.IsNullOrEmpty(v_doc))
                {

                    string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                    List<Be.kx_cliente> list = new List<Be.kx_cliente>();
                    list = Bll.Bllkx_cliente.DameInstancia().Listar("4", v_doc, user);
                    if (list.Count > 0)
                    {
                        throw new Exception("Ya esta agregado como cliente.");
                    }
                    TicketProduc tk = new TicketProduc();
                    sal = tk.BuscarPersonas(v_tipo, Convert.ToInt64(v_doc));
                }

            }
            catch (Exception)
            {

                throw;
            }
            return sal;

        }

        [WebMethod()]

        public static void WmMod(Be.kx_proveedor v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                v_obj.Id_Usuario = user;
                Bll.Bllkx_proveedor.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmAlta2(Be.kx_cliente v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                if (Bll.Bllordenes_servicio.DameInstancia().WsExisteDoc(v_obj.Doc_No, user) == 0 && v_obj.Tipo_Doc != "CUIT")
                {
                    v_obj.Id_Usuario = user;
                    Bll.Bllkx_cliente.DameInstancia().Alta(v_obj);
                }
                else {
                   if (v_obj.Tipo_Doc == "CUIT") {
                        v_obj.Id_Usuario = user;
                        Bll.Bllkx_cliente.DameInstancia().Alta(v_obj);                    
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WmMod2(Be.kx_cliente v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Bll.Bllkx_cliente.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }



        [WebMethod()]

        public static void WmCancelarCbte(string id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }

                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;

                Bll.BllDatosBasico.DameInstancia().AnularDeuda(id,user);
                
            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]

        public static List<Be.provincia> WsListarProvincia(  string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.provincia> list = new List<Be.provincia>();

                list = Bll.BllDatosBasico.DameInstancia().ListarProvincias(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.departamento> WsListarDepartamento(string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.departamento> list = new List<Be.departamento>();

                list = Bll.BllDatosBasico.DameInstancia().ListarDepartamento(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static List<Be.distrito> WsListarDistrito(string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.distrito> list = new List<Be.distrito>();

                list = Bll.BllDatosBasico.DameInstancia().ListarDistrito(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
    
        [WebMethod()]

        public static List<Be.pais> WsListarP(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.pais> list = new List<Be.pais>();

                list = Bll.BllDatosBasico.DameInstancia().ListarPais();
        
                return list;
            }
            catch (Exception)
            {

                throw;
            }
             
        }

        [WebMethod()]

        public static Be.kx_cliente WsBuscarP(string v_Id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Be.kx_cliente sal = new kx_cliente();
                List<Be.kx_cliente> list = new List<Be.kx_cliente>();
if(  HttpContext.Current.Session["Lista"] != null){
   
    list = (List<kx_cliente>) HttpContext.Current.Session["Lista"];
    foreach (var item in list)
    {
        if(item.Id.ToString() ==v_Id){
            sal = item;
                            string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                            sal.Cbates = Bll.Bllkx_cbtes.DameInstancia().WsListarAcobrar(v_Id, user);
                        }
        
    }

} 
                return sal;
            }
            catch (Exception)
            {

                throw;
            }

        }

        
        [WebMethod()]

        public static List<Be.kx_cliente> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                List<Be.kx_cliente> list = new List<Be.kx_cliente>();

                list = Bll.Bllkx_cliente.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim(),user);
                HttpContext.Current.Session["Lista"] = list;
                
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static void gvProv_del(string v_id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Bllkx_cliente.DameInstancia().Eliminar(Convert.ToInt32(v_id));

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


    }
}