using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Microsoft.Reporting.WebForms;

namespace HardSoft.App.Hospital
{
    public partial class AltaAud : System.Web.UI.Page
    {
        DateTime localDate = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(!Page.IsPostBack){

                CmbTipoRq.SelectedIndex = 0;

                TxtDesde.Text = localDate.Day + "/" + localDate.Month + "/" + localDate.Year;
                TxtUltima.Text = TxtDesde.Text;
                TxtPrimera.Text = TxtDesde.Text;
            }

        }


        [WebMethod()]

        public static List<Be.Audiencia_req> gvRq(Audiencia_req v_obj)
        {
            try
            {

                List<
                    
                    Be.Audiencia_req> list = new List<Be.Audiencia_req>();
               

                if (HttpContext.Current.Session["ListaP"] != null)
                {
                    list = (List<Be.Audiencia_req>) HttpContext.Current.Session["ListaP"];
                }

                v_obj.Id = Convert.ToInt32(list.Count + 1);
                list.Add(v_obj);
                HttpContext.Current.Session["ListaP"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

            [WebMethod()]


        public static List<Be.Audiencia_req> gvRq_del(string v_id)
        {
            try
            {

                List<Be.Audiencia_req> list = new List<Be.Audiencia_req>();


                if (HttpContext.Current.Session["ListaP"] != null)
                {

                    List<Be.Audiencia_req> list2 = new List<Be.Audiencia_req>();
                    list2 = (List<Be.Audiencia_req>)HttpContext.Current.Session["ListaP"];

                    foreach (var item in list2)
                    {
                        if (item.Id != Convert.ToInt32(v_id))
                        {
                            list.Add(item);
                        }
                    }


                }


                HttpContext.Current.Session["ListaP"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        public void limpiar(){


            ChArbitraje.Checked = false;
          

           TxtConjunta.Text="";


           TxtConflicto.Text = "" ;
           ChFacilitacion.Checked = false;

           TxtApellido.Text = "";
           TxtNombre.Text = "";
           TxtDni.Text = "";
           TxtLugar.Text = "";

           TxtDesde.Text = "";
           TxtPrimera.Text = "";
           TxtUltima.Text = "";
           TxtLugar1.Text = "";
           ChMediacion.Checked = false;


           ChNegociacion.Checked = false;


           TxtPrivada.Text = "";

           HttpContext.Current.Session["ListaP"] = null;

           TxtDesde.Text = localDate.Day + "/" + localDate.Month + "/" + localDate.Year;
           TxtUltima.Text = TxtDesde.Text;
           TxtPrimera.Text = TxtDesde.Text;
        
        
        }

            protected void Guardar_Click(object sender, EventArgs e)
            {
                try
                {
                    Audiencias aud = new Audiencias();

                    aud.Acuerdo = ChAcuerdo.SelectedValue;
                    if (ChArbitraje.Checked)
                    {
                        aud.Arbitraje = "SI";
                    }
                    else { aud.Arbitraje = "NO"; }

                    aud.Conjunta = TxtConjunta.Text.ToUpper();

                    aud.Convenio = ChConvenio.SelectedValue;
                    aud.Descripcion = TxtConflicto.Text.ToUpper();
                     if (ChFacilitacion.Checked)
                    {
                        aud.Facilitacion = "SI";
                    }
                     else { aud.Facilitacion = "NO"; }

                    aud.Fecha = TxtDesde.Text.ToUpper();
                    aud.Fecha_primera = TxtPrimera.Text.ToUpper();
                    aud.Fecha_ultima = TxtUltima.Text.ToUpper();
                    aud.Lugar = TxtLugar1.Text.ToUpper();
                    if (ChMediacion.Checked)
                    {
                        aud.Mediacion = "SI";
                    }
                    else { aud.Mediacion = "NO"; }

                    if (ChNegociacion.Checked)
                    {
                        aud.Negociacion = "SI";
                    }
                    else { aud.Negociacion = "NO"; }


                    aud.Privada = TxtPrivada.Text.ToUpper();
                      List<Be.Audiencia_req> list = new List<Be.Audiencia_req>();
               

                if (HttpContext.Current.Session["ListaP"] != null)
                {
                    list = (List<Be.Audiencia_req>) HttpContext.Current.Session["ListaP"];
                }

                aud.Requirentes = list;

               




                Bll.BllAudiencias.DameInstancia().Alta(aud);

                limpiar();
                Rp();
              

                }
                catch (Exception ex)
                {
                    
                   LblMsg.Text= ex.Message;
                }
            }

           public void Rp()
            {
                try
                {
                    Int32 ids = Bll.BllAudiencias.DameInstancia().maxId();



                    LocalReport localReport = new LocalReport();

            


                    localReport.ReportEmbeddedResource = "HardSoft.App.Hospital.Report.Aud.rdlc";


                    System.Data.DataSet dt = Bll.BllAudiencias.DameInstancia().Buscar_rep(ids.ToString());


                    if (dt.Tables.Count > 0)
                    {

                        ReportDataSource reportDataSource = new ReportDataSource("Aud", dt.Tables[0]);
                        ReportDataSource reportDataSource1 = new ReportDataSource("Req", dt.Tables[1]);
                        ReportDataSource reportDataSource2 = new ReportDataSource("Rdo", dt.Tables[2]);

                        localReport.DataSources.Add(reportDataSource);
                        localReport.DataSources.Add(reportDataSource1);
                        localReport.DataSources.Add(reportDataSource2);
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
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.ContentType = mimeType;
                        HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=Auditoria." + fileNameExtension);
                        HttpContext.Current.Response.BinaryWrite(renderedBytes);
                        HttpContext.Current.Response.End();

                    }
                }
                catch (Exception ex)
                {

                    LblMsg.Text = ex.Message;
                }

            }
    }
}