using Be;
using Bll;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Kardex
{
    public partial class Mov_Stock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]


        public static List<kx_stock> WsListar_kx_stock(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"]== null) {

                    throw new Exception("Acceso no valido.");
                
                }

                List<kx_stock> list = new List<kx_stock>();
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_articulo.DameInstancia().Listar_kx_stock(v_tipo, v_valor.ToUpper().Trim(), conf);

                HttpContext.Current.Session["Lista"] = list;

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
                string logo = "http://www.hardsoft.com.ar/images/logo.png";
                if (Session["UsuarioActual"]!=null)
                {
                  //mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                  //byte[] arrImg = user.Config.Logo;
                  //logo = "data:image/png;base64," + Convert.ToBase64String(arrImg);
                }
                
                List<kx_stock> list = new List<kx_stock>();
                if (HttpContext.Current.Session["Lista"] != null)
                {
                    list = (List<Be.kx_stock>)HttpContext.Current.Session["Lista"];



                    DataSet dt = new DataSet();

                    List<string> noo = new List<string>();
                    noo.Add("Id");
                  
                    Response.ClearContent();
                    Response.AddHeader("content-disposition", "attachment;filename=Movimientos.xls");
                    Response.AddHeader("Content-Type", "application/vnd.ms-excel");

                    GridView grid = new GridView();
                    StringWriter stringWriter = new StringWriter();
                    HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

                    DataTable dts = exel.ConvertToDataTable(list, noo);

                    // TITULO
                    htmlTextWriter.Write("<div> </div> <table border='1' style='margin-top: 10px;'  >    <thead>   <tr><th style='background-color: #ddd;' rowspan='5' colspan='" + dts.Columns.Count + "'><img src='"+logo+"'></th></tr>  </thead></table> ");

                    grid.DataSource = dts;
                    grid.DataBind();
                    grid.RenderControl(htmlTextWriter);
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
    }
}