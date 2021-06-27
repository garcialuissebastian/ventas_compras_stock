using Be;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Kardex
{
    public partial class IngresosFarmacia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                HttpContext.Current.Session["ListaLote"] = null;
            }
        }


        [WebMethod()]

        public static void WmAddGuardar(string v_motivo, string v_dep, string v_remito, string v_origen)
        {
            try
            {
                       string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                Kc_Lote_Cab kc = new Kc_Lote_Cab();
                kc.DEPOSITO = v_dep;
                kc.MOTIVO = v_motivo.ToUpper();
                kc.ORIGEN = v_origen.ToUpper();
                kc.REMITO = v_remito;
                kc.ID_USUARIO = user;

                if (HttpContext.Current.Session["ListaLote"] != null)
                {


                    List<Be.Kc_Lote> list = new List<Be.Kc_Lote>();
                    kc.LIST_LOTES = (List<Be.Kc_Lote>)HttpContext.Current.Session["ListaLote"];

                    if (kc.LIST_LOTES.Count < 1) {


                        throw new Exception(" Agregue elemento a la lista de insumos. ");
                    }
                }
                else
                {

                    throw new Exception(" Agregue elemento a la lista de insumos. ");
                }
                Bll.Bllkx_articulo.DameInstancia().IngresoLote(kc);
           

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

                    List<Be.Kc_Lote> list2 = new List<Be.Kc_Lote>();
                    list = (List<Be.Kc_Lote>)HttpContext.Current.Session["ListaLote"];

                    kl.Id = list.Count + 1;
                   
                    foreach (var item in list2)
                    {
                        if (item.Id == Convert.ToInt32(kl.Id_Art))
                        {
                            if (item.Fecha_vto == v_vto)
                            {
                                throw new Exception("Ya se encuentra agregado ese insumo a la lista.");
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

    }
}