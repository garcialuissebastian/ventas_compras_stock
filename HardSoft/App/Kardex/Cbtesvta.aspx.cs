using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
using HardSoft.wsfeProd;     //Produccion
 
using System.Xml;  // desa Homo



using Microsoft.Reporting.WebForms;
using System.Data;
using System.Globalization;
using System.Threading;
using System.Net;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Net.Http;
using intranet.App.UsrCtrl;

namespace HardSoft.App.Kardex
{
    public partial class Cbtesvta : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Access-Control-Allow-Origin", "*");
           
            HttpContext.Current.Session["SelectArt"] = null;
            HttpContext.Current.Session["SelectCheque"] = null;
            HttpContext.Current.Session["SelectTJ"] = null;
            HttpContext.Current.Session["perc"] = null;

            HttpContext.Current.Session["SelectArt"] = null;
            HttpContext.Current.Session["SelectTJ"] = null;
            if (HttpContext.Current.Session["UsuarioActual"] != null)
            {
                if (!string.IsNullOrEmpty(((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).InicioCaja))
                {
                    lblCaja.Text = "Apertura de caja : " + ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).InicioCaja;
                }
                else
                {
                    lblCaja.Text = "";
                }

            }
            if (!Page.IsPostBack)
            {
                if (HttpContext.Current.Session["SelectArtOS"] != null)
                {


                }


            }

        }


        [WebMethod()]

        public static List<pais> WsListarAsc(string v_id)
        {

            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                return Bllkx_cbtes.DameInstancia().WsListarAsc(v_id, user);
            }
            catch (Exception)
            {

                throw;
            }

        }





        [WebMethod()]

        public static List<Be.pais> WsListarPerc()
        {
            try
            {
                List<Be.pais> list = new List<Be.pais>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;


                list = list = Bll.Bllkx_Contable.DameInstancia().ListarPerc(user);

                return list;
            }
            catch (Exception)
            {

                throw;
            }

        }


        [WebMethod()]

        public static List<pais> WsListarTipo()
        {
            try
            {


                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {
                    throw new Exception("acceso invalido");
                }
                List<pais> list = new List<pais>();
                string tipo = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.CondicionIVA;
                if (tipo == "Monotributo")
                {




                    pais p = new pais();
                    p.id_pais = "11";
                    p.nombre = "Factura C";
                    list.Add(p);

                    pais p1 = new pais();
                    p1.id_pais = "12";
                    p1.nombre = "Nota de Débito C";
                    list.Add(p1);

                    pais p2 = new pais();
                    p2.id_pais = "13";
                    p2.nombre = "Nota de Crédito C";
                    list.Add(p2);




                    pais pa = new pais();
                    pa.id_pais = "19";
                    pa.nombre = "Factura E";
                    list.Add(pa);

                    pais p1a = new pais();
                    p1a.id_pais = "20";
                    p1a.nombre = "Nota de Débito E";
                    list.Add(p1a);

                    pais p2a = new pais();
                    p2a.id_pais = "21";
                    p2a.nombre = "Nota de Crédito E";
                    list.Add(p2a);



                    pais pae = new pais();
                    pae.id_pais = "211";
                    pae.nombre = "Factura de Crédito Electrónica Mipymes";
                    list.Add(pae);

                    pais p1ae = new pais();
                    p1ae.id_pais = "213";
                    p1ae.nombre = "Nota de Crédito Electrónica Mipymes ";
                    list.Add(p1ae);

                    pais p2ae = new pais();
                    p2ae.id_pais = "212";
                    p2ae.nombre = "Nota de Débito Electrónica Mipymes ";
                    list.Add(p2ae);



                }


                if (tipo == "Responsable Inscripto")
                {
                    //pais p99 = new pais();
                    //p99.id_pais = "16";
                    //p99.nombre = "Recibo X";
                    //list.Add(p99);

                    pais p = new pais();
                    p.id_pais = "1";
                    p.nombre = "Factura A";
                    list.Add(p);

                    pais p1 = new pais();
                    p1.id_pais = "3";
                    p1.nombre = "Nota de Crédito A";
                    list.Add(p1);

                    pais p2 = new pais();
                    p2.id_pais = "2";
                    p2.nombre = "Nota de Débito A";
                    list.Add(p2);

                    pais p3 = new pais();
                    p3.id_pais = "6";
                    p3.nombre = "Factura B";
                    list.Add(p3);

                    pais p4 = new pais();
                    p4.id_pais = "8";
                    p4.nombre = "Nota de Crédito B";
                    list.Add(p4);

                    pais p5 = new pais();
                    p5.id_pais = "7";
                    p5.nombre = "Nota de Débito B";
                    list.Add(p5);







                }
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        public static string precioDescuento(string v_precio, string v_descuento)
        {
            try
            {
                string sal = "";
                if (string.IsNullOrEmpty(v_descuento))
                {
                    v_descuento = "0";
                }

                Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                var numberFormatInfo = new NumberFormatInfo();
                numberFormatInfo.NumberDecimalSeparator = ".";

                double p1 = Math.Round(Double.Parse(v_precio.ToString().Replace(",", "."), numberFormatInfo), 2);
                double d1 = Math.Round(Double.Parse(v_descuento.ToString().Replace(",", "."), numberFormatInfo), 2);
                double sal1 = Math.Round((p1 - ((p1 * d1) / 100)), 2);

                return sal1.ToString();
            }
            catch (Exception)
            {

                throw;
            }

        }

        public static string netoDescuento(string v_precio, string v_descuento)
        {
            try
            {
                string sal = "";
                if (string.IsNullOrEmpty(v_descuento))
                {
                    v_descuento = "0";
                }

                Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                var numberFormatInfo = new NumberFormatInfo();
                numberFormatInfo.NumberDecimalSeparator = ".";

                double p1 = Math.Round(Double.Parse(v_precio.ToString().Replace(",", "."), numberFormatInfo), 2);
                double d1 = Math.Round(Double.Parse(v_descuento.ToString().Replace(",", "."), numberFormatInfo), 2);
                double sal1 = Math.Round((p1 - ((p1 * d1) / 100)), 2);

                return sal1.ToString();
            }
            catch (Exception)
            {

                throw;
            }

        }

        [WebMethod()]
        // tiene para agregar precio manual - lista manual 
        public static List<Be.kx_articulo> WsAddArticulo2(string v_id, string v_cant, string v_deposito, string v_lista, string PrecioSelect, string NetoSelect, string Descuento)
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
                        if (v_deposito != "")
                        {
                            item.DepositoSelect = v_deposito;
                        }


                        item.ListaSelect = v_lista;
                        item.Descuento = Descuento;
                        item.PrecioOriginal = PrecioSelect;
                        if (v_lista == "6")// precio manual sin lista
                        {
                            item.PrecioSelect = precioDescuento(PrecioSelect, Descuento);
                            item.NetoSelect = netoDescuento(NetoSelect, Descuento);

                        }
                        if (v_lista == "1")
                        {
                            item.PrecioSelect = precioDescuento(item.P_FinalL1, Descuento);
                            item.NetoSelect = netoDescuento(item.P_NetoL1, Descuento);

                        }
                        if (v_lista == "2")
                        {
                            item.PrecioSelect = precioDescuento(item.P_FinalL2, Descuento);
                            item.NetoSelect = netoDescuento(item.P_NetoL2, Descuento);
                        }
                        if (v_lista == "3")
                        {
                            item.PrecioSelect = precioDescuento(item.P_FinalL3, Descuento);
                            item.NetoSelect = netoDescuento(item.P_NetoL3, Descuento);
                        }
                        if (v_lista == "4")
                        {
                            item.PrecioSelect = precioDescuento(item.P_FinalL4, Descuento);
                            item.NetoSelect = netoDescuento(item.P_NetoL4, Descuento);
                        }
                        if (v_lista == "5")
                        {
                            item.PrecioSelect = precioDescuento(item.P_FinalL5, Descuento);
                            item.NetoSelect = netoDescuento(item.P_NetoL5, Descuento);
                        }
                        if (HttpContext.Current.Session["SelectArt"] == null)
                        {
                            item.IdGrilla = 1;
                            list.Add(item);
                            HttpContext.Current.Session["SelectArt"] = list;

                        }
                        else
                        {
                            foreach (var item2 in (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"])
                            {
                                if (item2.Id.ToString() != item.Id.ToString())
                                {
                                    list.Add(item2);
                                }
                            }
                            HttpContext.Current.Session["SelectArt"] = list;
                            list = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"];

                            Random d = new Random();
                            item.IdGrilla = (d.Next() * (list.Count()));

                            list.Add(item);

                            HttpContext.Current.Session["SelectArt"] = list;
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

        public static List<Be.kx_articulo> WsCbteArticulos(string Id_orden)
        {
            try
            {
                List<Be.kx_articulo> listArt = Bll.Bllkx_cbtes.DameInstancia().Cbte_Articulos(Id_orden);
                HttpContext.Current.Session["SelectArt"] = listArt;
                return listArt;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.kx_cbtes_percepciones> WsCbtePerc(string Id_orden)
        {
            try
            {
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                List<Be.kx_cbtes_percepciones> listArt = Bll.Bllkx_cbtes.DameInstancia().Cbte_PercVentas(Id_orden, user);
                HttpContext.Current.Session["perc"] = listArt;
                return listArt;
            }
            catch (Exception)
            {

                throw;
            }


        }


    
        [WebMethod()]

        public static orden WsbsqCbate(string Id_orden)
        {
            try
            {
                orden listArt = Bll.Bllkx_cbtes.DameInstancia().BsqCbte(Id_orden);

                return listArt;
            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]
        // tiene para agregar precio manual - lista manual 
        public static List<Be.kx_articulo> WsModArticulo2(string v_id, string v_cant, string v_deposito, string v_lista, string PrecioSelect, string NetoSelect, string Descuento)
        {
            try
            {
                List<Be.kx_articulo> list2 = new List<Be.kx_articulo>();
                List<Be.kx_articulo> list = new List<Be.kx_articulo>();

                list2 = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"];

                foreach (var item in list2)
                {
                    if (item.Id.ToString() == v_id)
                    {
                        item.Cant = v_cant;
                        item.ListaSelect = v_lista;
                        item.PrecioSelect = PrecioSelect;



                        Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                        var numberFormatInfo = new NumberFormatInfo();
                        numberFormatInfo.NumberDecimalSeparator = ".";
                        Double sal = Math.Round(Double.Parse(item.PrecioOriginal.Replace(",", "."), numberFormatInfo) / (1 + Double.Parse(item.Iva_Venta.Replace(",", "."), numberFormatInfo)), 2);

                        item.NetoSelect = netoDescuento(sal.ToString(), Descuento);

                        item.Descuento = Descuento;
                        list.Add(item);

                    }
                    else
                    {
                        list.Add(item);
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
        public static Be.kx_cliente validad_doc(string v_doc, string v_tipo)
        {
            kx_cliente sal = new kx_cliente();
            try
            {
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
        public static Be.kx_cliente validad_doc2(string v_doc, string v_tipo)
        {

            if (HttpContext.Current.Session["UsuarioActual"] == null)
            {
                throw new Exception("acceso invalido");
            }
            Be.kx_cliente cli = new Be.kx_cliente();

            string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
            cli = Bllkx_cbtes.DameInstancia().WsExiste(v_doc, user);
            cli.Cta_contable = "SI"; // existe en la base cliente
            if (cli.Nombre == null)
            {

                string v_cuit = "";
                string sal = "";
                object obj = null;

                cli.Cta_contable = "NO"; // no existe en la base y lo traigo desde afip

                if (cli.Nombre == null)
                {
                    cli.Cta_contable = "NADA";// no existe en NINGUNA BASE


                }
            }
            return cli;


        }

        [WebMethod()]

        public static void WmLimpiarSesion()
        {

            try
            {

                HttpContext.Current.Session["SelectArt"] = null;
                HttpContext.Current.Session["SelectCheque"] = null;
                HttpContext.Current.Session["SelectTJ"] = null;
                HttpContext.Current.Session["perc"] = null;


            }
            catch (Exception)
            {

                throw;
            }
        }


        [WebMethod()]
        public static void WmBajaOrden(string ids, string user)
        {
            try
            {
                Bll.Bllkx_cbtes.DameInstancia().Orden_Baja(ids, user);

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
                            HttpContext.Current.Session["SelectArt"] = list;

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

        public static List<Be.kx_cheques> WmAddCheque(Be.kx_cheques v_obj)
        {
            if (HttpContext.Current.Session["UsuarioActual"] == null)
            {
                throw new Exception("acceso invalido");
            }
            List<Be.kx_cheques> list = new List<Be.kx_cheques>();
            try
            {
                if (HttpContext.Current.Session["SelectCheque"] != null)
                {
                    list = (List<Be.kx_cheques>)HttpContext.Current.Session["SelectCheque"];

                    v_obj.Id = list.Count() + 1;
                    list.Add(v_obj);
                }
                else
                {
                    v_obj.Id = 1;
                    list.Add(v_obj);
                    HttpContext.Current.Session["SelectCheque"] = list;
                }
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]
        public static List<Be.kx_cheques> gvCh_del(string v_id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {
                    throw new Exception("acceso invalido");
                }

                List<Be.kx_cheques> list = new List<Be.kx_cheques>();


                if (HttpContext.Current.Session["SelectCheque"] != null)
                {

                    List<Be.kx_cheques> list2 = new List<Be.kx_cheques>();
                    list2 = (List<Be.kx_cheques>)HttpContext.Current.Session["SelectCheque"];

                    foreach (var item in list2)
                    {
                        if (item.Id != Convert.ToInt32(v_id))
                        {
                            list.Add(item);
                        }
                    }


                }


                HttpContext.Current.Session["SelectCheque"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }


        [WebMethod()]
        public static List<Be.kx_tarjetas> gvTJ_del(string v_id)
        {
            try
            {

                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {
                    throw new Exception("acceso invalido");
                }
                List<Be.kx_tarjetas> list = new List<Be.kx_tarjetas>();


                if (HttpContext.Current.Session["SelectTJ"] != null)
                {

                    List<Be.kx_tarjetas> list2 = new List<Be.kx_tarjetas>();
                    list2 = (List<Be.kx_tarjetas>)HttpContext.Current.Session["SelectTJ"];

                    foreach (var item in list2)
                    {
                        if (item.Id != Convert.ToInt32(v_id))
                        {
                            list.Add(item);
                        }
                    }


                }


                HttpContext.Current.Session["SelectTJ"] = list;

                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]
        public static List<Be.kx_tarjetas> WmAddTJ(Be.kx_tarjetas v_obj)
        {

            if (HttpContext.Current.Session["UsuarioActual"] == null)
            {
                throw new Exception("acceso invalido");
            }
            List<Be.kx_tarjetas> list = new List<Be.kx_tarjetas>();
            try
            {
                if (HttpContext.Current.Session["SelectTJ"] != null)
                {
                    list = (List<Be.kx_tarjetas>)HttpContext.Current.Session["SelectTJ"];

                    v_obj.Id = list.Count() + 1;
                    list.Add(v_obj);
                }
                else
                {
                    v_obj.Id = 1;
                    list.Add(v_obj);
                    HttpContext.Current.Session["SelectTJ"] = list;
                }
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        [WebMethod()]

        public static List<Be.kx_articulo> WsAddArticuloOrdenes(string Id_orden)
        {
            try
            {
                List<Be.kx_articulo> listArt = Bll.Bllkx_cbtes.DameInstancia().Orden_Articulos(Id_orden);
                HttpContext.Current.Session["SelectArt"] = listArt;
                return listArt;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static orden WsOrden(string Id_orden)
        {
            try
            {
                orden listArt = Bll.Bllkx_cbtes.DameInstancia().BsqOrden(Id_orden);

                return listArt;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]
        public static kx_cbtes WmAddFc(Be.kx_cbtes v_obj)
        {

            if (HttpContext.Current.Session["UsuarioActual"] == null)
            {
                throw new Exception("acceso invalido");
            }
            List<Be.kx_tarjetas> listT = new List<Be.kx_tarjetas>();
            List<Be.kx_cheques> listC = new List<Be.kx_cheques>();
            List<Be.kx_articulo> listA = new List<Be.kx_articulo>();
            List<Be.kx_cbtes_articulos> listCbteArt = new List<Be.kx_cbtes_articulos>();

            List<Fact_detalle> ListDET = new List<Fact_detalle>();
            Fact_detalle DET = new Fact_detalle();
            List<Fact_AlicIva> ListIva = new List<Fact_AlicIva>();

            // LA LISTA DE DE ARTICULO LO ARMA EL JQUERT

            v_obj.PtoVta = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.PtoVta;
            v_obj.CBU = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.CBU;

            //v_obj.PtoVta = "5"; // desde la session del usuario

            Fact_AlicIva IVA1 = new Fact_AlicIva();
            Fact_AlicIva IVAA = new Fact_AlicIva();
            Fact_AlicIva IVAB = new Fact_AlicIva();
            Fact_AlicIva IVAC = new Fact_AlicIva();
            Fact_AlicIva IVAD = new Fact_AlicIva();

            kx_cbtes kx = new kx_cbtes();
            try
            {
                if (HttpContext.Current.Session["SelectArt"] != null)
                {
                    listA = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"];




                    if (HttpContext.Current.Session["SelectCheque"] != null)
                    {
                        v_obj.Cheques = (List<Be.kx_cheques>)HttpContext.Current.Session["SelectCheque"];
                    }
                    if (HttpContext.Current.Session["SelectTJ"] != null)
                    {

                        v_obj.Tarjetas = (List<Be.kx_tarjetas>)HttpContext.Current.Session["SelectTJ"];

                    }

                    Ticket tk = null;

                    if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Modo == "Prueba")
                    {
                        tk = new TicketHomo();
                    }
                    if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Modo == "Produccion")
                    {
                        tk = new TicketProduc();
                    }

                    if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Modo == "PRUEBA_SIN_AFIP")
                    {
                        tk = new TicketHomo();
                    }


                    Fact_Cab CAB = new Fact_Cab();
                    // Cuando se trate de una operación entre un Responsable Inscripto y Monotributista, Consumidor Final, o Exento, el Responsable Inscripto deberá emitir comprobantes tipo “B”.
                    // Si se trata de operaciones entre responsables inscriptos Cbate A (NO acepta dni solo cuit)

                    CAB.CbteTipo = Convert.ToInt32(v_obj.CbteTipo); // 11 factura c -  tipo de comprobante --> getFEParamGetTiposCbte()[11]; 1 factura A ; Factura B-6
                    CAB.PtoVta = Convert.ToInt32(v_obj.PtoVta);


                    DET.Concepto = Convert.ToInt32(v_obj.Concepto); // si es 1 producto , 2 servicio etc --> getFEParamGetTiposConcepto
                    DET.DocTipo = Convert.ToInt32(v_obj.DocTipo); // 96 dni          
                    DET.DocNro = Convert.ToInt64(v_obj.DocNro);



                    Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                    var numberFormatInfo = new NumberFormatInfo();
                    numberFormatInfo.NumberDecimalSeparator = ".";



                    DET.ImpTotal = Math.Round(Double.Parse(v_obj.ImpTotal.Replace(",", "."), numberFormatInfo), 2);
                    DET.ImpTotConc = 0; // COMPROBANTE C ES 0
                    DET.ImpNeto = Math.Round(Double.Parse(v_obj.ImpNeto.Replace(",", "."), numberFormatInfo), 2);

                    DET.ImpOpEx = 0;  // COMPROBANTE C ES 0

                    DET.ImpTrib = Math.Round(Double.Parse(v_obj.ImpTrib.Replace(",", "."), numberFormatInfo), 2);

                    DET.ImpIVA = Math.Round(Double.Parse(v_obj.ImpIVA.ToString().Replace(",", ".")), 2);
                    DateTime now = DateTime.Now;

                    if (string.IsNullOrEmpty(v_obj.MonId))
                    {
                        v_obj.MonId = "PES";
                    }






                    //   v_obj.MonId= DET.MonId;

                    // esta fecha no la estoy usando, cuando envio el comprobante la envio un la fecha actual. . despues ver
                    v_obj.FchVtoPago = v_obj.FchVtoPago;




                    DET.AlicIva = v_obj.AlicIva;


                    List<Fact_Tributo> LTributos = new List<Fact_Tributo>();
                    if (HttpContext.Current.Session["perc"] != null)
                    {

                        v_obj.Percepciones = (List<Be.kx_cbtes_percepciones>)HttpContext.Current.Session["perc"];

                        foreach (var item in v_obj.Percepciones)
                        {
                            Fact_Tributo tt = new Fact_Tributo();
                            tt.Alic = "0";
                            tt.BaseImp = "0";
                            tt.Desc = item.Percep;
                            tt.Id = Convert.ToInt16(item.Tributo);
                            tt.Importe = item.Monto.Replace(",", ".");
                            LTributos.Add(tt);
                        }

                        DET.Tributos = LTributos;
                    }




                    v_obj.CantAlic = v_obj.AlicIva.Count().ToString();

                    ListDET.Add(DET);
                    CAB.CantReg = 1;

                    CAB.Detalle = ListDET;


                    v_obj.Id_config = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                    v_obj.Cuit = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Cuit;
                    v_obj.usuario = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;


                    //foreach (var obj in v_obj.Articulos)
                    //{
                    //    obj.es_Stock = "NO";
                    //}



                    string idOrden = v_obj.Id.ToString();

                    kx = tk.Generar_Cbate(CAB, v_obj);


                    if (kx.Resultado != "R")
                    {
                        Bllkx_cbtes.DameInstancia().PagarOrden(idOrden, kx.Id.ToString());

                    }





                }


                return kx;
            }
            catch (Exception ex)
            {
                // si el certificado expito y lanza un throw la llamada de jquery lo muestra como un error
                // cualquierar lanzado lo muestra
                throw new Exception(ex.ToString());
            }
        }



        protected void BtnImp_Click(object sender, EventArgs e)
        {
            try
            {

                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {
                    throw new Exception("acceso invalido");
                }

                LocalReport localReport = new LocalReport();

                //  
                DataSet ds = Bll.Bllkx_cbtes.DameInstancia().Cbate(TxtRpid.Text);

                string ppr = Bllkx_cbtes.DameInstancia().PathReportCbteOAA(ds.Tables["cab"].Rows[0]["Cod_Letra"].ToString());



                localReport.ReportEmbeddedResource = ppr;



                if (true)
                {

                    string sal = ds.Tables["cab"].Rows[0]["CodBarra"].ToString();
                    string salida = GenBarra.GenerarAFIP(sal);
                    mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                    byte[] arrImg = user.Config.Logo;
                    string salida2 = Convert.ToBase64String(arrImg);

                    string nombreCbte = ds.Tables["cab"].Rows[0]["Letra"].ToString() + ds.Tables["cab"].Rows[0]["PtoVta"].ToString() + ds.Tables["cab"].Rows[0]["CbteDesde"].ToString();

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
                    "  <MarginTop>0.2cm</MarginTop>" +
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


                    Response.AddHeader("content-disposition", "attachment; filename=" + nombreCbte + "." + fileNameExtension);


                    Response.BinaryWrite(renderedBytes);
                    Response.End();

                }
            }
            catch (Exception ex)


            {
                // persistir
                try
                {
                    Be.Bitacora v_bi = new Bitacora();
                    v_bi.id_user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                    v_bi.config_user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                    v_bi.msg = ex.Message;
                    v_bi.metodo = "BtnImp_Click";
                    v_bi.donde = ex.Source;
                    Bll.Bllkx_config.DameInstancia().bitacora(v_bi);
                }
                catch (Exception ex2)
                {
                    LblMsg.Text = ex2.Message;
                }

                LblMsg.Text = ex.Message;
            }




        }

        [WebMethod()]

        public static void WsUpdateCancelar(string v_id, string cbate)
        {
            try
            {
                Bll.Bllkx_cbtes.DameInstancia().UpdateCancelar(v_id, cbate);
            }
            catch (Exception)
            {

                throw;
            }
        }


        [WebMethod()]

        public static string WsCotizacion(string v_id)
        {
            try
            {
                Ticket tk = null;

                if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Modo == "Prueba")
                {
                    tk = new TicketHomo();
                }
                if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Modo == "Produccion")
                {
                    tk = new TicketProduc();
                }

                return tk.CotizacionMoneda(v_id);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod()]

        public static List<Be.kx_articulo> WsAddArticuloManual(Be.kx_articulo v_obj)
        {
            if (HttpContext.Current.Session["UsuarioActual"] == null)
            {
                throw new Exception("acceso invalido");
            }

            if (v_obj.Descuento == "")
            {
                v_obj.Descuento = "0";
            }

            string vPrecio = precioDescuento(v_obj.PrecioSelect, v_obj.Descuento);
            string vNeto = netoDescuento(v_obj.NetoSelect, v_obj.Descuento);

            v_obj.PrecioSelect = vPrecio;
            v_obj.NetoSelect = vNeto;

            List<Be.kx_articulo> list2 = new List<Be.kx_articulo>();
            if (HttpContext.Current.Session["SelectArt"] == null)
            {
                v_obj.IdGrilla = 1;
                list2.Add(v_obj);

                HttpContext.Current.Session["SelectArt"] = list2;
            }
            else
            {

                list2 = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"];
                v_obj.IdGrilla = (1 + list2.Count());
                list2.Add(v_obj);
                HttpContext.Current.Session["SelectArt"] = list2;
            }
            return list2;
        }

        [WebMethod()]


        public static void WmGvAlta_kx_cajas_mov1(kx_cajas_mov v_obj)
        {
            try
            {
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;

                v_obj.id_config = conf;
                v_obj.id_usuario = user;

                Bll.Bllkx_cajas_mov.DameInstancia().Alta_kx_cajas_mov(v_obj);

                ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).InicioCaja = v_obj.fecha;
                ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Caja = v_obj.caja;
            }
            catch (Exception)
            {
                throw;
            }
        }

        [WebMethod()]
        public static void WmGvCarrarCajas_mov1(kx_cajas_mov v_obj)
        {
            try
            {
                string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;
                string caja = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Caja;
                v_obj.id_config = conf;
                v_obj.id_usuario = user;
                v_obj.caja = caja;

                Bll.Bllkx_cajas_mov.DameInstancia().Alta_kx_cajas_mov(v_obj);

                ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).InicioCaja = null;
            }
            catch (Exception)
            {
                throw;
            }
        }

        [WebMethod()]
        public static List<string> Totalescaja()
        {
            try
            {

                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;


                List<string> sal = Bll.Bllkx_cajas_mov.DameInstancia().totalCajaCierre(user);

                return sal;
            }
            catch (Exception)
            {
                throw;
            }
        }
        [WebMethod()]

        public static List<Be.pais> WsListarCtas()
        {
            try
            {
                List<Be.pais> list = new List<Be.pais>();

                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = list = Bll.Bllkx_Contable.DameInstancia().ListarCtas(user);

                return list;
            }
            catch (Exception)
            {

                throw;
            }

        }


        [WebMethod()]
        public static bool Tienecaja()
        {
            bool bb = true;
            try
            {
                if (string.IsNullOrEmpty(((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).InicioCaja))
                {
                    bb = false;
                }
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).ID_USUARIO;

                string TIENE = Bll.Bllkx_cajas_mov.DameInstancia().TieneCajaCerrada(user);
                if (TIENE == "N") // TIENE EL CIERRE
                {
                    bb = false;
                }

                else if (TIENE == "") // NUNCA ABRIO EN EL DIA DE HOY
                {
                    bb = false;
                }

                else  //TIENE EN EL DIA DE HOY UNA APERTURA SIN CIERRE  
                {
                    bb = true;
                    string[] array = TIENE.Split(';');

                    ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).InicioCaja = array[0];
                    ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Caja = array[1];



                }
            }
            catch (Exception)
            {

                throw;
            }

            return bb;
        }

    }
}