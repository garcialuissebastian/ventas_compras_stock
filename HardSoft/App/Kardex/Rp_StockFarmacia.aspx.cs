using Be;
using Bll;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Kardex
{
    public partial class Rp_Mov_StockFarmacia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]


        public static List<kx_stock> WsListar_kx_stock(string v_tipo, string v_valor, string v_dep)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"]== null) {

                    throw new Exception("Acceso no valido.");
                
                }

                List<kx_stock> list = new List<kx_stock>();
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_articulo.DameInstancia().Listar_kx_stockFarmacia(v_tipo, v_valor.ToUpper().Trim(), conf, v_dep);

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)
            {
                throw;
            }
        }

        [WebMethod()]


        public static List<Kc_Lote> WsListar_kx_stockTotal(string v_tipo, string v_valor, string v_dep)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }

                List<Kc_Lote> list = new List<Kc_Lote>();
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_articulo.DameInstancia().Listar_kx_stockFarmaciaRptotal(v_tipo, v_valor.ToUpper().Trim(), conf, "Farmacia", v_dep);





                HttpContext.Current.Session["ListaLoteSelect"] = list;

                return list;
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
                string logo ="http://"+ HttpContext.Current.Request.Url.Authority + "/images/Hospital/logo_hosp.png";
                if (Session["UsuarioActual"]!=null)
                {
                    //mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                    //byte[] arrImg = user.Config.Logo;
                    //logo = "data:image/png;base64," + Convert.ToBase64String(arrImg);
                }
               
                List<Kc_Lote> list = new List<Kc_Lote>();

           
                if (HttpContext.Current.Session["ListaLoteSelect"] != null)
                {
                    list = (List<Kc_Lote>)HttpContext.Current.Session["ListaLoteSelect"];



                    DataSet dt = new DataSet();

                    List<string> noo = new List<string>();
                  noo.Add("Id_Prov");

                    noo.Add("Id_Prov");
                    noo.Add("Barra");
                    noo.Add("Remito");
                    noo.Add("Motivo");
                    noo.Add("TipoIngreso");
                    noo.Add("Id_Lab");
                    noo.Add("Id_Dep");
                    noo.Add("Id_Art");
                    noo.Add("Id");
                    


                    Response.ClearContent();
                    Response.AddHeader("content-disposition", "attachment;filename=RpStock.xls");
                    Response.AddHeader("Content-Type", "application/vnd.ms-excel");

                    GridView grid = new GridView();
                    StringWriter stringWriter = new StringWriter();
                    HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

                    DataTable dts = exel.ConvertToDataTable(list, noo);
                    // CABECERA
                    dts.Columns[0].ColumnName = "ARTICULO";
                    dts.Columns[1].ColumnName = "COD_MS";
                    dts.Columns[2].ColumnName = "LUGAR";
                    dts.Columns[3].ColumnName = "VENCIMIENTO";
                    dts.Columns[4].ColumnName = "CANTIDAD";
                    dts.Columns[5].ColumnName = "LOTE";
                    dts.Columns[6].ColumnName = "LABORATORIO";


                    // TITULO
                    htmlTextWriter.Write("<div> </div> <table  ' style='margin-top: 10px;'  >    <thead>   <tr><th style='background-color: white;' rowspan='5' colspan='" + dts.Columns.Count + "'><img src='"+logo+ "' style='max-height : 55px; '></th></tr>  </thead></table> ");

                    grid.DataSource = dts;
                    grid.DataBind();
                    grid.RenderControl(htmlTextWriter);

                    Response.Write(AddExcelStyling());
                    Response.Write(stringWriter.ToString());

                    htmlTextWriter.Close();
                    stringWriter.Close();


                    Response.End(); 

                }
            }
            catch (Exception)
            {

                throw;
            }


        }

        protected void BtnRp2_Click(object sender, EventArgs e)
        {
            try
            {
                string logo = "http://" + HttpContext.Current.Request.Url.Authority + "/images/Hospital/logo_hosp.png";
                if (Session["UsuarioActual"] != null)
                {
                    //mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                    //byte[] arrImg = user.Config.Logo;
                    //logo = "data:image/png;base64," + Convert.ToBase64String(arrImg);
                }

                List<Kc_Lote> list = new List<Kc_Lote>();


                if (HttpContext.Current.Session["ListaLoteSelect"] != null)
                {
                    list = (List<Kc_Lote>)HttpContext.Current.Session["ListaLoteSelect"];



                    DataSet dt = new DataSet();

                    List<string> noo = new List<string>();
                    noo.Add("Id_Prov");

                    noo.Add("Id_Prov");
                    noo.Add("Barra");
                    noo.Add("Remito");
                    noo.Add("Motivo");
                    noo.Add("TipoIngreso");
                    noo.Add("Id_Lab");
                    noo.Add("Id_Dep");
                    noo.Add("Id_Art");
                    noo.Add("Id");
                    noo.Add("Fecha_vto");
                    noo.Add("Cod_Lot");
                    noo.Add("desc_Lab");

                    Response.ClearContent();
                    Response.AddHeader("content-disposition", "attachment;filename=RpStock.xls");
                    Response.AddHeader("Content-Type", "application/vnd.ms-excel");

                    GridView grid = new GridView();
                    StringWriter stringWriter = new StringWriter();
                    HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

                    DataTable dts = exel.ConvertToDataTable(list, noo);
                    // CABECERA
                    dts.Columns[0].ColumnName = "ARTICULO";
                    dts.Columns[1].ColumnName = "COD_MS";
                    dts.Columns[2].ColumnName = "LUGAR";
                  
                    dts.Columns[3].ColumnName = "CANTIDAD";
                 


                    // TITULO
                    htmlTextWriter.Write("<div> </div> <table  ' style='margin-top: 10px;'  >    <thead>   <tr><th style='background-color: white;' rowspan='5' colspan='" + dts.Columns.Count + "'><img src='" + logo + "' style='max-height : 55px; '></th></tr>  </thead></table> ");

                    grid.DataSource = dts;
                    grid.DataBind();
                    grid.RenderControl(htmlTextWriter);

                    Response.Write(AddExcelStyling());
                    Response.Write(stringWriter.ToString());

                    htmlTextWriter.Close();
                    stringWriter.Close();


                    Response.End();

                }
            }
            catch (Exception)
            {

                throw;
            }


        }




        private string AddExcelStyling()
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("<html xmlns:o='urn:schemas-microsoft-com:office:office'\n" +

            "xmlns:x='urn:schemas-microsoft-com:office:excel'\n" +
            "xmlns='http://www.w3.org/TR/REC-html40'>\n" +

            "<head>\n");
            sb.Append("<style>\n");

            sb.Append("@page");
            sb.Append("{margin:.3in .70in .3in .70in;\n");

            sb.Append("mso-header-margin:.3in;\n");
            sb.Append("mso-footer-margin:.3in;\n");

            sb.Append("mso-page-orientation:landscape;}\n");
            sb.Append("</style>\n");

            sb.Append("<!--[if gte mso 9]><xml>\n");
            sb.Append("<x:ExcelWorkbook>\n");

            sb.Append("<x:ExcelWorksheets>\n");
            sb.Append("<x:ExcelWorksheet>\n");

            sb.Append("<x:Name>Projects 3 </x:Name>\n");
            sb.Append("<x:WorksheetOptions>\n");

            sb.Append("<x:Print>\n");
            sb.Append("<x:ValidPrinterInfo/>\n");

            sb.Append("<x:PaperSizeIndex>9</x:PaperSizeIndex>\n");
            sb.Append("<x:HorizontalResolution>600</x:HorizontalResolution\n");

            sb.Append("<x:VerticalResolution>600</x:VerticalResolution\n");
            sb.Append("</x:Print>\n");

            sb.Append("<x:Selected/>\n");
            sb.Append("<x:DoNotDisplayGridlines/>\n");

            sb.Append("<x:ProtectContents>False</x:ProtectContents>\n");
            sb.Append("<x:ProtectObjects>False</x:ProtectObjects>\n");

            sb.Append("<x:ProtectScenarios>False</x:ProtectScenarios>\n");
            sb.Append("</x:WorksheetOptions>\n");

            sb.Append("</x:ExcelWorksheet>\n");
            sb.Append("</x:ExcelWorksheets>\n");

            sb.Append("<x:WindowHeight>12780</x:WindowHeight>\n");
            sb.Append("<x:WindowWidth>19035</x:WindowWidth>\n");

            sb.Append("<x:WindowTopX>0</x:WindowTopX>\n");
            sb.Append("<x:WindowTopY>15</x:WindowTopY>\n");

            sb.Append("<x:ProtectStructure>False</x:ProtectStructure>\n");
            sb.Append("<x:ProtectWindows>False</x:ProtectWindows>\n");

            sb.Append("</x:ExcelWorkbook>\n");
            sb.Append("</xml><![endif]-->\n");

            sb.Append("</head>\n");
            sb.Append("<body>\n");

            return sb.ToString();
        }

    }
}