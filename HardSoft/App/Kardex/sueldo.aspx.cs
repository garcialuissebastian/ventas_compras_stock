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
using System.Web.Services;

namespace HardSoft.App.Kardex
{
    public partial class sueldo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            TxtEmpleador.Text = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Nombre;
            TxtCuit.Text = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Cuit;
            TxtDominicilio.Text = "AVENIDA SAN MARTIN 1077. FLORENCIO VARELA";
            TxtLugar.Text = "FCIO. VARELA";
            if (!Page.IsPostBack) {
                HttpContext.Current.Session["HABERES"] = null;
                HttpContext.Current.Session["DEDUCION"] = null;
            }


        }


        [WebMethod()]


        public static void WmGvDel_sueldo_conceptos(Int32 v_Id)
        {
            try

            {

                Bll.Bllsueldo.DameInstancia().Eliminar_sueldo_conceptos(v_Id);

            }

            catch (Exception)

            {

                throw;

            }

        }

        [WebMethod()]


        public static List<sueldo_conceptos> WsListar_sueldo_conceptos(string v_tipo, string v_valor)

        {
            try
            {
                List<sueldo_conceptos> list = new List<sueldo_conceptos>();

                list = Bll.Bllsueldo.DameInstancia().Listar_sueldo_conceptos(v_tipo, v_valor.ToUpper().Trim());



                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }


        [WebMethod()]


        public static void WmGvAlta_sueldo_conceptos(sueldo_conceptos v_obj)
        {
            try
            {
                Bll.Bllsueldo.DameInstancia().Alta_sueldo_conceptos(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        [WebMethod()]

        public static List<Be.sueldo> WsListar_sueldo(string v_tipo, string v_valor)

        {
            try
            {
                List<Be.sueldo> list = new List<Be.sueldo>();

                list = Bll.Bllsueldo.DameInstancia().Listar_sueldo(v_tipo, v_valor.ToUpper().Trim());

                HttpContext.Current.Session["Lista"] = list;

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }

        [WebMethod()]

        public static  Be.sueldo WsListar_benificiario(string v_valor)

        {
            try
            {
                List<Be.sueldo> list = new List<Be.sueldo>();

                list = Bll.Bllsueldo.DameInstancia().Listar_Benificiario(  v_valor.ToUpper().Trim());


                return list.Count > 0 ? list[0]: new Be.sueldo() ;
            }
            catch (Exception)

            {
                throw;
            }
        }


        [WebMethod()]

        public static List<sueldo_conceptos> WsListar_conceptos(string v_tipo, string v_valor)

        {
            try
            {

                List<sueldo_conceptos> list = new List<sueldo_conceptos>();

                list = Bll.Bllsueldo.DameInstancia().Listar_sueldo_conceptos(v_tipo, v_valor.ToUpper().Trim());



                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }

        [WebMethod()]

        public static List<sueldo_conceptos> WsAltahaber(string v_concepto, string v_importe, string Id)

        {
            try
            {

                List<sueldo_conceptos> list = new List<sueldo_conceptos>();

                sueldo_conceptos obj = new sueldo_conceptos();
                obj.Nombre = v_concepto;
                obj.Id = Id;
                obj.Importe = v_importe;
                obj.Tipo = "HABERES";

                if (HttpContext.Current.Session["HABERES"] == null)
                {
                    list.Add(obj);
                }
                else
                {
                    list = (List<sueldo_conceptos>)HttpContext.Current.Session["HABERES"];
                    list.Add(obj);
                }

                HttpContext.Current.Session["HABERES"] = list;
                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }

        [WebMethod()]

        public static List<sueldo_conceptos> WsAltdeducion(string v_concepto, string v_importe, string Id)

        {
            try
            {

                List<sueldo_conceptos> list = new List<sueldo_conceptos>();

                sueldo_conceptos obj = new sueldo_conceptos();
                obj.Nombre = v_concepto;
                obj.Id= Id;
                obj.Importe = v_importe;
                obj.Tipo = "DEDUCION";

                if (HttpContext.Current.Session["DEDUCION"] == null)
                {
                    list.Add(obj);
                }
                else
                {
                    list = (List<sueldo_conceptos>)HttpContext.Current.Session["DEDUCION"];
                    list.Add(obj);
                }

                HttpContext.Current.Session["DEDUCION"] = list;
                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }

        [WebMethod()]

        public static List<sueldo_conceptos> Wsbajahaber(string v_concepto)

        {
            try
            {

                List<sueldo_conceptos> list = new List<sueldo_conceptos>();
                List<sueldo_conceptos> list2 = new List<sueldo_conceptos>();

                if (HttpContext.Current.Session["HABERES"] != null)
                {
               
                    list = (List<sueldo_conceptos>)HttpContext.Current.Session["HABERES"];
                    foreach (var item in list)
                    {
                        if (item.Id !=v_concepto)
                        {
                            list2.Add(item);
                        }
                    }

                   
                }

                HttpContext.Current.Session["HABERES"] = list2;
                return list2;
            }
            catch (Exception)

            {
                throw;
            }
        }

        [WebMethod()]

        public static List<sueldo_conceptos> Wsbajadeducion(string v_concepto)

        {
            try
            {

                List<sueldo_conceptos> list = new List<sueldo_conceptos>();
                List<sueldo_conceptos> list2 = new List<sueldo_conceptos>();

                if (HttpContext.Current.Session["DEDUCION"] != null)
                {

                    list = (List<sueldo_conceptos>)HttpContext.Current.Session["DEDUCION"];
                    foreach (var item in list)
                    {
                        if (item.Id != v_concepto)
                        {
                            list2.Add(item);
                        }
                    }


                }

                HttpContext.Current.Session["DEDUCION"] = list2;
                return list2;
            }
            catch (Exception)

            {
                throw;
            }
        }

        [WebMethod()]


        public static void WmGvDel_sueldo(Int32 v_Id)
        {
            try

            {

                Bll.Bllsueldo.DameInstancia().Eliminar_sueldo(v_Id);

            }

            catch (Exception)

            {

                throw;

            }

        }

        [WebMethod()]


        public static void WmGvMod_sueldo(Be.sueldo v_obj)
        {
            try
            {
                Bll.Bllsueldo.DameInstancia().Modificacion_sueldo(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


        [WebMethod()]


        public static void WmGvAlta_sueldo(Be.sueldo v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["HABERES"] !=null)
                {
                    v_obj.Haber = (List<sueldo_conceptos>)HttpContext.Current.Session["HABERES"];
                }

                if (HttpContext.Current.Session["DEDUCION"] != null)
                {
                    v_obj.Deducion = (List<sueldo_conceptos>)HttpContext.Current.Session["DEDUCION"];
                }

                Bll.Bllsueldo.DameInstancia().Alta_sueldo(v_obj);

                HttpContext.Current.Session["DEDUCION"] = null;
                HttpContext.Current.Session["HABERES"] = null;
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void BtnRp_Click(object sender, EventArgs e)
        {
            
            report(TxtId.Text);
        }

        protected void report(string ids)
        {
            try
            {
                 
                LocalReport localReport = new LocalReport();

                string strCurrentDir = Server.MapPath(".") + "\\Report\\Sueldo.rdlc";

                localReport.ReportPath = strCurrentDir;


                DataSet dt = Bll.Bllsueldo.DameInstancia().ReportSueldo(ids);
            
                if (dt.Tables["Sueldo"].Rows.Count > 0)
                {
                    ReportDataSource reportDataSource = new ReportDataSource("Sueldo", dt.Tables["Sueldo"]);
                    ReportDataSource reportDataSource1 = new ReportDataSource("Items", dt.Tables["Items"]);
                    localReport.DataSources.Add(reportDataSource);
                    localReport.DataSources.Add(reportDataSource1);
                   
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


                    Response.AddHeader("content-disposition", "attachment; filename=Recibo." + fileNameExtension);


                    Response.BinaryWrite(renderedBytes);
                    Response.End();


                }
                else
                { //lblMsg.Text = "No se encuentra registros."; 
                }
            }
            catch (Exception ex)
            {

                // lblMsg.Text = ex.Message;
            }
        }

    }
}