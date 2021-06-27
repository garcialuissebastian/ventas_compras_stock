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
using System.Data;
namespace HardSoft.App.Kardex
{
    public partial class Contra_Orden : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

         Be.ordenes_servicio  os = new  Be.ordenes_servicio();
         os = ( Be.ordenes_servicio)HttpContext.Current.Session["os"];
         lblOrden.Text = os.Id.ToString();
         TxtClienteNombre.Text = os.Cliente;
         TxtTel.Text = os.ClienteTel;
         TxtMotivo.Text = os.Motivo;
         TxtEquipo.Text = os.Equipo;
         HttpContext.Current.Session["os"] = os;
         HttpContext.Current.Session["SelectArt"] = null;
            HttpContext.Current.Session["art"] = null;

            }
            catch (Exception)
            {

                Response.Redirect("Ordenes_Servicios.aspx", false);
            }
        }

        protected void BtnImpFc_Click(object sender, EventArgs e)
        {
            try
            {
                if (true)
                {

                    DataSet ds = Bll.Bllkx_cbtes.DameInstancia().Cbate(TxtIdFc.Text);
                    string TxtTipoRep = ds.Tables["cab"].Rows[0]["Cod_Letra"].ToString();

                    LocalReport localReport = new LocalReport();
                    string ppr = "";
                    if (TxtTipoRep == "6")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbateB.rdlc";
                    }
                    if (TxtTipoRep == "8")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbatenNcB.rdlc";
                    }
                    if (TxtTipoRep == "7")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbatenNdB.rdlc";
                    }

                    if (TxtTipoRep == "1")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbateA.rdlc";
                    }
                    if (TxtTipoRep == "3")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbateNcA.rdlc";
                    }
                    if (TxtTipoRep == "2")
                    {
                        ppr = "HardSoft.App.Kardex.Report.CbateNdA.rdlc";
                    }


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


                    Response.AddHeader("content-disposition", "attachment; filename=Cbate." + fileNameExtension);


                    Response.BinaryWrite(renderedBytes);
                    Response.End();

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


        [WebMethod()]

        public static void WmModificar2(Be.Kx_Deposito v_obj)
        {


            try
            {
                Bll.BllKx_Deposito.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }


        [WebMethod()]

        public static void WmResetArts()
        { 
            try
            {
                HttpContext.Current.Session["SelectArt"] = null;
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static void WsFcId(string v_id)
        {
            try
            {

                Be.contraordenes_servicio pp = new Be.contraordenes_servicio();
               pp = Bll.Bllordenes_servicio.DameInstancia().ListarIdContra(v_id);
             
                Be.ordenes_servicio pp2 = new ordenes_servicio();

               pp2 = Bllordenes_servicio.DameInstancia().ListarId(pp.Orden_Id);
                List<Be.kx_articulo> list = new List<Be.kx_articulo>();
                Be.kx_articulo art = new kx_articulo();
                art.Id =Convert.ToInt32( v_id);
                art.Iva_Venta = "0.21";
                art.Iva_Compra = "0.21";
                art.ListaSelect = "1";
                art.P_FinalL1 = pp.Valor;
                art.PrecioSelect = pp.Valor;

                double a = Convert.ToDouble(pp.Valor);

                art.NetoSelect = Convert.ToString(Math.Round((a / (1 + 0.21)), 2));
                art.Cant = "1";
                art.Tipo_Art = "SERVICIO";
                art.Moneda = "Moneda";
                art.Cont_Venta = "VENTAS";
                art.Cont_Compra = "Cont_Compra";
                art.Nombre = pp2.Equipo + " " + pp2.Modelo + " " + pp.Motivo + "-" + pp.Info_Tecnico;
                art.ClienteSelect = pp2.ClienteObj;

                if (Convert.ToInt32(pp.No) > 1)
                {
                    art.Cod_Manual = "GFXCO1";
                  
                }
                else {
                    art.Cod_Manual = "GFXCO0";
                }
              
                list.Add(art);
                HttpContext.Current.Session["SelectArtOS"] = list;


            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]

        public static contraordenes_servicio  WmModVer(string v_id)
        {
            try
            {
                Be.contraordenes_servicio ca = Bll.Bllordenes_servicio.DameInstancia().ListarIdContra(v_id);
                HttpContext.Current.Session["SelectArt"] = ca.Repuestos;
                

                return ca;
            }
            catch (Exception)
            {

                throw;
            }
        }
        [WebMethod()]

        public static void WmAlta2(Be.contraordenes_servicio v_obj)
        { 
            try
            {
                if (HttpContext.Current.Session["SelectArt"] != null)
                {
             v_obj.Repuestos = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"];
            }
               

                Bll.Bllordenes_servicio.DameInstancia().AltaContraOrden(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }


        [WebMethod()]

        public static void WmMod2(Be.contraordenes_servicio v_obj)
        {
            try
            {
                v_obj.Repuestos = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"];

                Bll.Bllordenes_servicio.DameInstancia().ModificacionContraOrden(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        
        
        
        [WebMethod()]

        public static List<Be.kx_articulo> gvArt_del(string v_id)
        {
            try
            {

                List<Be.kx_articulo> list = new List<Be.kx_articulo>();


                if (HttpContext.Current.Session["SelectArt"] != null)
                {

                    List<Be.kx_articulo> list2 = new List<Be.kx_articulo>();
                    list2 = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"];

                    foreach (var item in list2)
                    {
                        if (item.IdGrilla != Convert.ToInt32(v_id))
                        {
                            list.Add(item);
                        }
                    }


                }


                HttpContext.Current.Session["SelectArt"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.kx_articulo> WsListarArticulo(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.kx_articulo> list = new List<Be.kx_articulo>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_articulo.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim(), user, "Articulos");
                HttpContext.Current.Session["art"] = list;
                
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }
    
        
        [WebMethod()]

        public static void WsLimpArt()
        {
            try
            {
                HttpContext.Current.Session["art"] = null;

            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.kx_articulo> WsAddArticulo(string v_id, string v_cant, string v_deposito, string v_lista)
        {
            try
            {
                List<Be.kx_articulo> list2 = new List<Be.kx_articulo>();
                List<Be.kx_articulo> list = new List<Be.kx_articulo>();
                list2 = (List<Be.kx_articulo>)HttpContext.Current.Session["art"];
                foreach (var item in list2)
                {
                    if (item.Id.ToString() == v_id)
                    {
                        item.Cant = v_cant;
                        item.DepositoSelect = v_deposito;
                        item.ListaSelect = v_lista;
                        if (v_lista == "1")
                        {
                            item.PrecioSelect = item.P_FinalL1;
                            item.NetoSelect = item.P_NetoL1;
                            
                        }
                        if (v_lista == "2")
                        {
                            item.PrecioSelect = item.P_FinalL2;
                            item.NetoSelect = item.P_NetoL2;
                        }
                        if (v_lista == "3")
                        {
                            item.PrecioSelect = item.P_FinalL3;
                            item.NetoSelect = item.P_NetoL3;
                        }
                        if (v_lista == "4")
                        {
                            item.PrecioSelect = item.P_FinalL4;
                            item.NetoSelect = item.P_NetoL4;
                        }
                        if (v_lista == "5")
                        {
                            item.PrecioSelect = item.P_FinalL5;
                            item.NetoSelect = item.P_NetoL5;
                        }
                        if (HttpContext.Current.Session["SelectArt"] == null)
                        {
                            item.IdGrilla = 1;
                            list.Add(item);
                       HttpContext.Current.Session["SelectArt"]=   list ;

                        }
                        else
                        {
                            list = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"];
                            item.IdGrilla = (1 + list.Count());
                            
                            list.Add(item);
                        }
 

                    }
                }



               
                return list; 
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.kx_articulo> WsAddArticuloSO()
        {
             List<Be.kx_articulo> list2 = new List<Be.kx_articulo>();
                List<Be.kx_articulo> list = new List<Be.kx_articulo>();
                list2 = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArtOS"];
             HttpContext.Current.Session["SelectArt"] = list2 ; 

                return list2;
            }
            
  
        
        [WebMethod()]

        public static Be.kx_articulo WsListarDep_IdArt(  string v_valor)
        {
            try
            {
                List<Be.kx_articulo> list = new List<Be.kx_articulo>();

                list = (List<Be.kx_articulo>)HttpContext.Current.Session["art"]; // no lo usa para hacer el insert, usa json que armo
                foreach (var item in  list)
                {
                    if(item.Id.ToString() == v_valor){
                        return item;
                    }
                }
                return null;


            }
            catch (Exception)
            {

                throw;
            }


        }
        
        
        
        
        
        [WebMethod()]

        public static List<Be.contraordenes_servicio> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                v_valor = ((Be.ordenes_servicio)HttpContext.Current.Session["os"]).Id.ToString();
                List<Be.contraordenes_servicio> list = new List<Be.contraordenes_servicio>();

                list = Bll.Bllordenes_servicio.DameInstancia().ListarContraOrdenListar(v_tipo, v_valor.ToUpper().Trim());
                return list;


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
                if (!string.IsNullOrEmpty(TxtId.Text))
                {
                    LocalReport localReport = new LocalReport();

                    localReport.ReportEmbeddedResource = "HardSoft.App.Kardex.Report.Orden.rdlc";

                    // localReport.ReportPath = @"Report\\Nota.rdlc";

                    DataTable dt = Bll.Bllordenes_servicio.DameInstancia().Rp2(TxtId.Text);


                    if (dt.Rows.Count > 0)
                    {

                        ReportDataSource reportDataSource = new ReportDataSource("Orden", dt);


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



            }
        }

    }
}