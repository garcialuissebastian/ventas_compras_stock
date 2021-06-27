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
 
using System.IO;
namespace HardSoft.App.Kardex
{
    public partial class Articulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {


               
   

                ///////////////////////


               
               
                HttpContext.Current.Session["ListaProvSel"] = null;
                HttpContext.Current.Session["ListaProv"] = null;
                HttpContext.Current.Session["ListaDep"] = null;
 

                try //dasdnamsndma
                { 
                    if (Session["UsuarioActual"]==null)
                    {
                        Response.Redirect("http://www.hardsoft.com.ar/", false);
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("../../Default.aspx");
                }
            }
        }

        [WebMethod()]

        public static List<Be.pais> WsListarCtas()
        {
            try
            {
                List<Be.pais> list = new List<Be.pais>();

                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = list = Bll.Bllkx_Contable.DameInstancia().ListarCtas( user);

                return list;
            }
            catch (Exception)
            {

                throw;
            }

        }
        [WebMethod()]

        public static List<Be.kx_proveedor> gvProv_del(string v_id)
        {
            try
            {

                List<Be.kx_proveedor> list = new List<Be.kx_proveedor>();


                if (HttpContext.Current.Session["ListaProvSel"] != null)
                {

                    List<Be.kx_proveedor> list2 = new List<Be.kx_proveedor>();
                    list2 = (List<Be.kx_proveedor>)HttpContext.Current.Session["ListaProvSel"];

                    foreach (var item in list2)
                    {
                        if (item.Id != Convert.ToInt32(v_id))
                        {
                            list.Add(item);
                        }
                    }


                }


                HttpContext.Current.Session["ListaProvSel"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
  
        
        
        
        [WebMethod()]

        public static  Be.kx_config WsListarPrecios(string v_id)
        {
            try
            {
                List<Be.kx_config> list = new List<Be.kx_config>();
                // el id del usuario
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_config.DameInstancia().Listar(user);
              
                return list[0];


            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static void WsAltaMod(kx_articulo v_obj)
        {
            try
            {
                List<Be.kx_deposito_reposicion> Dep = (List<Be.kx_deposito_reposicion>)HttpContext.Current.Session["ListaDep"];
                List<Be.kx_proveedor> Prov = (List<Be.kx_proveedor>)HttpContext.Current.Session["ListaProvSel"]; 
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                v_obj.Id_Usuario = user;
                v_obj.Proveedores = Prov;
                v_obj.Depositos = Dep;

                Bll.Bllkx_articulo.DameInstancia().Modificacion(v_obj);
                HttpContext.Current.Session["ListaDep"] = null;
                HttpContext.Current.Session["ListaProvSel"] = null;



            }
            catch (Exception e)
            {
                throw new Exception(e.ToString());
              //  throw;
            }


        }

         [WebMethod()]

        public static void WsAltaArticulo(kx_articulo v_obj)
        {
            try
            {
                List<Be.kx_deposito_reposicion> Dep = (List<Be.kx_deposito_reposicion>)HttpContext.Current.Session["ListaDep"];
                List<Be.kx_proveedor> Prov= (List<Be.kx_proveedor>)HttpContext.Current.Session["ListaProvSel"];
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                v_obj.Id_Usuario = user;
                v_obj.Proveedores = Prov;
                v_obj.Depositos = Dep;

              Bll.Bllkx_articulo.DameInstancia().Alta(v_obj);
              HttpContext.Current.Session["ListaDep"] = null;
              HttpContext.Current.Session["ListaProvSel"] = null;

                

            }
            catch (Exception)
            {

                throw;
            }


        }

         [WebMethod()]

         public static void Anular_articulo(string v_ids, string v_tipo)
         {
             try
             { 
                   Bll.Bllkx_articulo.DameInstancia().Anular_articulo( v_ids,  v_tipo);               
                  
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
                 HttpContext.Current.Session["art"] = list;
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

        public static string WsExisteArticulo(string v_tipo, string v_valor)
        {
            try
            {
            
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
          string      list = Bll.Bllkx_articulo.DameInstancia().ExisteArticulo(v_tipo, v_valor.ToUpper().Trim(), user, "Articulos");
              


                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }



        [WebMethod()]

         public static Be.kx_articulo WsListarArticuloId(string v_id)
         {
             try
             {
                 List<Be.kx_articulo> list = new List<Be.kx_articulo>();
                 string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                if (user == "28")
                {
                    user = "26";
                }
                 list = Bll.Bllkx_articulo.DameInstancia().Listar("99", v_id.ToUpper().Trim(), user, "Articulos");

                 HttpContext.Current.Session["ListaDep"] = list[0].Depositos;
                 HttpContext.Current.Session["ListaProvSel"] = list[0].Proveedores;
                 
                 return list[0]; 
             }
             catch (Exception)
             {

                 throw;
             }


         }

         [WebMethod()]

         public static List<Be.kx_deposito_reposicion> WsListarDep_IdArt(string v_tipo, string v_valor)
         {
             try
             {
                 List<Be.kx_deposito_reposicion> list = new List<Be.kx_deposito_reposicion>();
                 HttpContext.Current.Session["ListaStock"] = list;
               
                 list = Bll.Bllkx_deposito_reposicion.DameInstancia().Listar( v_tipo,  v_valor);
                 
                 HttpContext.Current.Session["ListaStock"] = list;

                 return list;


             }
             catch (Exception)
             {

                 throw;
             }


         }

         [WebMethod()]

         public static void WsModStock(string v_id, string v_dep, string v_cant, string v_motivo, string v_remito, string v_origen, string v_proveedor, string v_comentario, string v_tipo_ingreso, string v_lote, string v_vto)
         {
             try
             {
                 Bll.Bllkx_articulo.DameInstancia().WsModStock(v_id, v_dep, v_cant, v_motivo, v_remito, v_origen, v_proveedor, v_comentario, v_tipo_ingreso ,   v_lote,  v_vto);

             }
             catch (Exception)
             {

                 throw;
             }


         }
        
        [WebMethod()]

        public static List<Be.kx_proveedor> WsListarProv(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.kx_proveedor> list = new List<Be.kx_proveedor>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                list = Bll.Bllkx_proveedor.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim(),user);
                HttpContext.Current.Session["ListaProv"] = list;

                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Kc_Lote> WmAddLote(string v_id, string v_dep, string v_cant, string v_motivo, string v_remito, string v_origen, string v_proveedor, string v_comentario, string v_tipo_ingreso, string v_lote, string v_vto)
        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                Bll.Bllkx_articulo.DameInstancia().WsModStockLt(v_id, v_dep, v_cant, v_motivo, v_remito, v_origen, v_proveedor, v_comentario, v_tipo_ingreso, v_lote, v_vto,"","0", user);

                List<Be.Kc_Lote> list = new List<Be.Kc_Lote>();
                list = Bll.Bllkx_articulo.DameInstancia().ListarKcKardex(v_id,user);

                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static List<Kc_Lote> WmGrillaLote(string v_id )
        {
            try
            { 
                List<Be.Kc_Lote> list = new List<Be.Kc_Lote>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_articulo.DameInstancia().ListarKcKardex(v_id,user);

                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static List<Kc_Lote> WmGrillaLoteXdep(string v_id, string v_dep)
        {
            try
            {
                List<Be.Kc_Lote> list = new List<Be.Kc_Lote>();
                list = Bll.Bllkx_articulo.DameInstancia().ListarKcxDep(v_id, v_dep);

                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
       
        
        
        [WebMethod()]

        public static void gvLote_del(string v_id)
        {
            try
            {

                Bll.Bllkx_articulo.DameInstancia().DeleteKc(v_id);
            }
            catch (Exception)
            {

                throw;
            }


        }
  
       

        [WebMethod()]

        public static void WsLimpiarSelecLote()
        {
            try
            {

                HttpContext.Current.Session["ListaLote"] = null;

                 
            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static void WsLimpiarSelecProv() 
        {
            try
            {
             HttpContext.Current.Session["ListaDep"] = null;
                HttpContext.Current.Session["ListaProvSel"] = null;


            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static List<Be.kx_proveedor> WsListarSelecProv(string v_id)
        {
            try
            {
                List<Be.kx_proveedor> list = new List<Be.kx_proveedor>();
                List<Be.kx_proveedor> listSel = new List<Be.kx_proveedor>();
              
                
               
                list = (List<Be.kx_proveedor>)HttpContext.Current.Session["ListaProv"];
                if (HttpContext.Current.Session["ListaProvSel"]!=null) {
                    listSel = (List<Be.kx_proveedor>)HttpContext.Current.Session["ListaProvSel"];                
                }
                Boolean exite= false;
                foreach (var item2 in listSel)
                {
                    if (Convert.ToInt32(v_id) == item2.Id)
                    {
                        exite = true;
                    }
                }

                if (!exite)
                {

                    foreach (var item in list)
                    {
                        if (Convert.ToInt32(v_id) == item.Id)
                        {
                            listSel.Add(item);
                        }
                    }
                }
                HttpContext.Current.Session["ListaProvSel"] = listSel;
                
                return listSel;


            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]

        public static List<Be.kx_deposito_reposicion>  WmAltaDep(Be.kx_deposito_reposicion v_obj)
        {
            try
            {
                List<Be.kx_deposito_reposicion> list = new List<Be.kx_deposito_reposicion>();
                List<Be.kx_deposito_reposicion> list2 = new List<Be.kx_deposito_reposicion>();

                if (HttpContext.Current.Session["ListaDep"] != null)
                {


                    list2 = (List<Be.kx_deposito_reposicion>)HttpContext.Current.Session["ListaDep"];
                    bool EST = false;
                    foreach (var item in list2)
                    {
                        if (item.id_deposito == v_obj.id_deposito)
                        {
                            EST = true;
                        }
                        else {
                            list.Add(item);   
                        }

                    }
                    if (!EST)
                    {

                        list2.Add(v_obj);
                    }
                    else {
                        list.Add(v_obj);
                        list2.Clear();
                        list2 = list; 
                    }


                }
                else {
                    list2.Add(v_obj);
                }


                HttpContext.Current.Session["ListaDep"] = list2;

                return list2;
           
            
            }
            catch (Exception)
            {

                throw;
            }
        }



        [WebMethod()]

        public static  kx_deposito_reposicion WmListDep(string v_id)
        {
            try
            {
                bool EST = false;
                List<Be.kx_deposito_reposicion> list = new List<Be.kx_deposito_reposicion>();
                List<Be.kx_deposito_reposicion> list2 = new List<Be.kx_deposito_reposicion>();

                kx_deposito_reposicion sal = new kx_deposito_reposicion();
                if (HttpContext.Current.Session["ListaDep"] != null)
                { 
                    list2 = (List<Be.kx_deposito_reposicion>)HttpContext.Current.Session["ListaDep"];
               
                    foreach (var item in list2)
                    {
                        if (item.id_deposito == v_id)
                        {
                            EST = true;
                            sal = item;
                        }
                         
                    }
                    if (!EST)
                    {
                        sal.id_deposito = v_id;
                        sal.stock_maximo = "0";
                        sal.stock_minimo = "0";
                        sal.punto_pedido = "0";
                    }
                    
                }
                else
                {
                    sal.id_deposito = v_id;
                    sal.stock_maximo = "0";
                    sal.stock_minimo = "0";
                    sal.punto_pedido = "0";

                }
                 
                return sal;


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

            localReport.ReportEmbeddedResource = "HardSoft.App.Kardex.Report.CodBar.rdlc";

        

            if (true)
            {   
                string sal = Bll.Bllkx_articulo.DameInstancia().Barcod(TxtTipo.Text);
                string salida = GenBarra.Generar(sal);

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
                row1["dato2"] = "";
                row1["dato3"] = "";
                DatosExt.Rows.Add(row1);


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
                "  <MarginTop>0.05in</MarginTop>" +
                "  <MarginLeft>0.05in</MarginLeft>" +
                "  <MarginRight>0.05in</MarginRight>" +
                "  <MarginBottom>0.05in</MarginBottom>" +
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


                Response.AddHeader("content-disposition", "attachment; filename=BarCod." + fileNameExtension);


                Response.BinaryWrite(renderedBytes);
                Response.End();

            }
            }
            catch (Exception ex)
            {



            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                   List<Be.kx_articulo> list = new List<Be.kx_articulo>();
                   if (HttpContext.Current.Session["art"] != null) { 
                   list = (List<Be.kx_articulo>)HttpContext.Current.Session["art"];

                    

                   DataSet dt = new DataSet();
                
                List<string> noo =new List<string>();
                noo.Add("Proveedores");
                noo.Add("Depositos");
                noo.Add("DepositoSelect");
                noo.Add("ListaSelect");
                noo.Add("Cant");
                noo.Add("PrecioSelect");
                noo.Add("NetoSelect");
                noo.Add("IdGrilla");
                noo.Add("ClienteSelect");
                noo.Add("Id_Usuario");
                


                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment;filename=Articulos.xls");
                Response.AddHeader("Content-Type", "application/vnd.ms-excel");

                GridView grid = new GridView();  
                StringWriter stringWriter = new StringWriter();
                HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

               DataTable dts = exel.ConvertToDataTable(list, noo);

                       // TITULO
               htmlTextWriter.Write("<div> </div> <table border='1' style='margin-top: 10px;'  >    <thead>   <tr><th style='background-color: #ddd;' rowspan='5' colspan='" + dts.Columns.Count + "'><img src='http://www.hardsoft.com.ar/images/logo.png'></th></tr>  </thead></table> ");
       
                grid.DataSource = dts;
                grid.DataBind();
                grid.RenderControl(htmlTextWriter);
                Response.Write(stringWriter.ToString());
             
                htmlTextWriter.Close();               
                stringWriter.Close();


                Response.End();
                        

                       ////////







                   }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
            
                List<Be.kx_deposito_reposicion> list = new List<Be.kx_deposito_reposicion>();
                if (HttpContext.Current.Session["ListaStock"] != null) { 
                list = (List<Be.kx_deposito_reposicion>)HttpContext.Current.Session["ListaStock"];
              

                string strCurrentDir = Server.MapPath(".") + "\\Report\\";
                string strFile = "report_DepArt.xlsx";

                DataSet dt = new DataSet();
                // ExportTextFile();
                //   ExportToExcel();

                // ExportToXLSX(ListasA);
                //  dt.Tables.Add(exel.ConvertToDataTable(list));
                List<string> noo = new List<string>();
                noo.Add("id");
                noo.Add("Deposito");
                dt.Tables.Add(exel.ConvertToDataTable(list, noo));

        

                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment;filename=Stock.xls");
                Response.AddHeader("Content-Type", "application/vnd.ms-excel");
                using (System.IO.StringWriter sw = new System.IO.StringWriter())
                {
                    using (System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw))
                    {
                        GridView grid = new GridView();

                        grid.DataSource = exel.ConvertToDataTable(list, noo);
                     
                        grid.DataBind();
                        grid.RenderControl(htw);
                  
                        Response.Write(sw.ToString());
                    }
                }

                Response.End();
                  
               // CreateExcelFile.CreateExcelDocument(dt, strCurrentDir + strFile);
              //  Response.Redirect("Report/" + strFile, false);
                //createDataInExcel(dt);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

 
    
    }
}