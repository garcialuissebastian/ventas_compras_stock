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

namespace HardSoft.App.Kardex
{
    public partial class EgresosFarmacia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //BtnRp.Visible = false;
            if (!Page.IsPostBack) {
                HttpContext.Current.Session["ListaLote"] = null;
            }
        }


    
        
        [WebMethod()]

        public static void WmAddGuardar(string v_motivo, string v_dep_origen, string v_dep_destino, string v_remito, string v_comentario)
        {
            try
            {
                       string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                Kc_Lote_Cab kc = new Kc_Lote_Cab();
                kc.DEPOSITO = v_dep_origen;
                kc.DEPOSITO_DESTINO = v_dep_destino;
                kc.MOTIVO = v_motivo;
                kc.MOTIVO= v_comentario;
                kc.REMITO = v_remito;
                kc.ID_USUARIO = user;

                if (HttpContext.Current.Session["ListaLote"] != null)
                {

                    List<Be.Kc_Lote> list = new List<Be.Kc_Lote>();
                    kc.LIST_LOTES = (List<Be.Kc_Lote>)HttpContext.Current.Session["ListaLote"];

                }
                else {
                    throw new Exception("Agregue elementos a la lista de insumo.");


                }
                Bll.Bllkx_articulo.DameInstancia().egresoLote(kc);
           

            }
            catch (Exception)
            {
                
                throw;
            }
        
        }


        [WebMethod()]

        public static void WmAddGuardarPedido(string v_motivo, string v_dep_origen, string v_dep_destino, string v_remito, string v_comentario, string v_pedido,string v_estado)
        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                Kc_Lote_Cab kc = new Kc_Lote_Cab();
                kc.DEPOSITO = v_dep_origen;
                kc.DEPOSITO_DESTINO = v_dep_destino;
                kc.MOTIVO = v_motivo.ToUpper();
                kc.COMENTARIO = v_comentario.ToUpper();  
                kc.REMITO = v_remito;
                kc.ID_USUARIO = user;
                
                if (HttpContext.Current.Session["ListaLote"] != null)
                {

                    List<Be.Kc_Lote> list = new List<Be.Kc_Lote>();
                    kc.LIST_LOTES = (List<Be.Kc_Lote>)HttpContext.Current.Session["ListaLote"];

                }
                else
                {
                    throw new Exception("Agregue elementos a la lista de insumo.");


                }
                Bll.Bllkx_articulo.DameInstancia().egresoLote(kc);
                Bll.Bllkx_articulo.DameInstancia().actualizar_pedidos(v_pedido,v_estado);

            }
            catch (Exception)
            {

                throw;
            }

        }

        [WebMethod()]

        public static List<Kc_Lote> WsListarArticuloSkFarmacia(string v_tipo, string v_valor, string v_dep)
        {
            try
            {

                List<Kc_Lote> list = new List<Kc_Lote>();

                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
               user = "26";// para farmacia
                list = Bll.Bllkx_articulo.DameInstancia().ListarStockFarmacia(v_tipo, v_valor.ToUpper().Trim(), user, "Farmacia", v_dep);


                HttpContext.Current.Session["ListaLoteSelect"] = list;
                List<Kc_Lote> listAgregadas = new List<Kc_Lote>();

                if (HttpContext.Current.Session["ListaLote"] != null)
                {

                    List<Be.Kc_Lote> list2 = new List<Be.Kc_Lote>();
                    listAgregadas  = (List<Be.Kc_Lote>)HttpContext.Current.Session["ListaLote"];
                     

                    foreach (var item in listAgregadas)
                    {
                        foreach (var item2 in list)

                            if (Convert.ToInt32(item.Id_Art) == Convert.ToInt32(item2.Id_Art))
                            {
                                if (Convert.ToInt32(item.Id_Lab) == Convert.ToInt32(item2.Id_Lab))
                                {

                                    item2.Cant = (Convert.ToInt32(item2.Cant) - Convert.ToInt32(item.Cant)).ToString();

                            }
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

        public static List<Kc_Lote> WmAddLote(string v_id, string v_dep, string v_cant, string v_motivo, string v_remito, string v_origen, string v_proveedor, string v_comentario, string v_tipo_ingreso, string v_lote, string v_vto, string v_lab, string v_desclab, string v_descArt)
        {
            try
            {
                 
                List<Be.Kc_Lote> list = new List<Be.Kc_Lote>();

                Kc_Lote kl = new Kc_Lote();

                kl.Id_Art = v_id;
                kl.Id_Dep = v_dep;
                kl.Cant= v_cant;
                kl.Motivo = v_motivo;
                kl.Remito = v_remito;
                kl.Cod_Lot = v_lote;
                kl.Fecha_vto = v_vto;
                kl.Id_Lab = v_lab;
                kl.desc_Lab = v_desclab;
                kl.desc_Art = v_descArt;
                kl.Id = 1;
                kl.TipoIngreso = v_tipo_ingreso;

                if (HttpContext.Current.Session["ListaLote"] != null)
                {
                    
                    list = (List<Be.Kc_Lote>)HttpContext.Current.Session["ListaLote"];

                    kl.Id = list.Count + 1;
                   
                    foreach (var item in list)
                    {
                        if (Convert.ToInt32(item.Id_Art) == Convert.ToInt32(kl.Id_Art))
                        {
                            if (item.Fecha_vto == v_vto)
                            {
                                throw new Exception("El insumo ya se encuentra en la lista. Elimine el item y vuelva a agregarlo.");
                            }
                        }
                    }

                    list.Add(kl);


                }
                else {
                    list.Add(kl);
                
                }



                HttpContext.Current.Session["ListaLote"] = list;

                return list;



            }
            catch (Exception)
            {

                throw;
            }
        }



        [WebMethod()]

        public static List<Be.Kc_Lote> gvLab_del(string v_id)
        {
            try
            {

                List<Be.Kc_Lote> list = new List<Be.Kc_Lote>();


                if (HttpContext.Current.Session["ListaLote"] != null)
                {

                    List<Be.Kc_Lote> list2 = new List<Be.Kc_Lote>();
                    list2 = (List<Be.Kc_Lote>)HttpContext.Current.Session["ListaLote"];

                    foreach (var item in list2)
                    {
                        if (item.Id != Convert.ToInt32(v_id))
                        {
                            list.Add(item);
                        }
                    }


                }


                HttpContext.Current.Session["ListaLote"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
  
        
      
        [WebMethod()]

        public static List<Be.Combos> WsListarLab(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.Combos> list = new List<Be.Combos>();

                list = Bll.Bllkx_articulo.DameInstancia().ListaLaboratorioCmb();
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }



        protected void report()
        {
            try
            {
                HttpContext.Current.Session["ListaLote"] = null;
                HttpContext.Current.Session["PDF1"] = "";
                LocalReport localReport = new LocalReport();

                string strCurrentDir = Server.MapPath(".") + "\\Report\\EgresoFarmacia.rdlc";

                localReport.ReportPath = strCurrentDir;
                

                DataSet dt = Bll.Bllkx_articulo.DameInstancia().ReportEgreso("");

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
                    string salida = Convert.ToBase64String(renderedBytes);
                    Response.Clear();
                    //Response.ContentType = mimeType;
                    //Response.AddHeader("content-disposition", "attachment; filename=TurnoQuilmes." + fileNameExtension);


                    HttpContext.Current.Session["PDF1"] = salida;
               
                    ScriptManager.RegisterStartupScript(this , GetType(), "ll", "mostrar();", true);

                }
                else { //lblMsg.Text = "No se encuentra registros."; 
                }
           }
            catch (Exception ex)
            {

               // lblMsg.Text = ex.Message;
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


                DataSet dt = Bll.Bllkx_articulo.DameInstancia().ReportEgresoPedido("", Request.QueryString["Nro"]);

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
                    string salida = Convert.ToBase64String(renderedBytes);
                    Response.Clear();
                    //Response.ContentType = mimeType;
                    //Response.AddHeader("content-disposition", "attachment; filename=TurnoQuilmes." + fileNameExtension);


                    HttpContext.Current.Session["PDF1"] = salida;

                    ScriptManager.RegisterStartupScript(this, GetType(), "ll", "mostrar();", true);

                }
                else
                { //lblMsg.Text = "No se encuentra registros."; 
                }
            }
            catch (Exception ex)
            {

          lblMsg.Text = ex.Message;
            }
        }

        protected void BtnRp_Click(object sender, EventArgs e)
        {
           
            if (Request.QueryString["TipoOp"] == "pedido")
            {
                report2();
            }
            else { report(); }
        }
    }
}