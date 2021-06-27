using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dal;
using Be;
using System.Data;
using System.IO;
namespace Bll
{

    public class Bllkx_cbtes
    {
        private Dal.Dalkx_cbtes _mapeador;

        public Bllkx_cbtes()
        {
            _mapeador = new Dalkx_cbtes();
        }

        private static Bllkx_cbtes instancia = null;

        public static Bllkx_cbtes DameInstancia()
        {
            if (instancia == null)
            {
                return new Bllkx_cbtes();
            }
            else
            {
                return instancia;
            }
        }

        public List<string> serv_artXmesCompras(string v_mes, string v_anio, string v_id_cfg)
        {
            try
            {
                return this._mapeador.serv_artXmesCompras(v_mes, v_anio, v_id_cfg);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<string> serv_artXmes(string v_mes, string v_anio, string v_id_cfg)
        {
            try
            {
                return this._mapeador.serv_artXmes( v_mes,  v_anio,  v_id_cfg);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<string> serv_artXmesVtas(string v_mes, string v_anio, string v_id_cfg)
        {
            try
            {
                return this._mapeador.serv_artXmesVtas(v_mes, v_anio, v_id_cfg);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public kx_cbtes GetAnularCbte(string ids)
        {
            try
            {
                return this._mapeador.GetAnularCbte(  ids);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public string[] saldoXmesCompras(string v_anio, string v_cfg)
        {
            try
            {
                return this._mapeador.saldoXmesCompras(v_anio, v_cfg);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public string[] saldoXmes(string v_anio, string v_cfg)
        {
             try
             {
                 return this._mapeador.saldoXmes(v_anio, v_cfg);
             }
             catch (Exception)
             {
                 throw;
             }

         }

        public string[] saldoXmesVtas(string v_anio, string v_cfg)
        {
            try
            {
                return this._mapeador.saldoXmesVtas(v_anio, v_cfg);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public Int32 maxCbtePruebas(string tipocbte, string id_config)
        {
            try
            {
                return this._mapeador.maxCbtePruebas( tipocbte, id_config);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string AltaCompras(kx_cbtes v_obj)
        {
            try
            {
                return this._mapeador.AltaCompras(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string AltaComprasV2(kx_cbtes v_obj)
        {
            try
            {
                return this._mapeador.AltaComprasV2(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string AltaPagoV3(kx_cbtes_pagos v_obj)
        {
            try
            {
                return this._mapeador.AltaPagoV3(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }

        
              public string AltaCobroV3(kx_cbtes_pagos v_obj)
        {
            try
            {
                return this._mapeador.AltaCobroV3(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string AltaCobroV2(kx_cbtes_pagos v_obj)
        {
            try
            {
                return this._mapeador.AltaCobroV2(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string AltaPagoV2(kx_cbtes_pagos v_obj)
        {
            try
            {
                return this._mapeador.AltaPagoV2(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string AltaPago(kx_cbtes v_obj)
        {
            try
            {
                return this._mapeador.AltaPago(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string AltaCobro(kx_cbtes v_obj)
        {
            try
            {
                return this._mapeador.AltaCobro(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string Alta(kx_cbtes v_obj)
        {
            try
            {
              return  this._mapeador.Alta(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void Modificacion(kx_cbtes v_obj)
        {
            try
            {
                this._mapeador.Modificacion(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<pais> WsListarAscProv(string ids, string Conf)
        {
            try
            {
                return this._mapeador.WsListarAscProv(ids, Conf);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<pais> WsListarAsc(string ids, string Conf)
        {
            try
            {
               return this._mapeador.WsListarAsc(  ids, Conf);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void PagarOrden(string ids, string cbate)
        {
            try
            {
                this._mapeador.PagarOrden( ids,  cbate);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public string PathReportCbteJuan(string v_obj)
        {
            string ppr = "";
            try
            {

                if (v_obj == "6")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateB_J.rdlc";
                }
                if (v_obj == "8")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbatenNcB_J.rdlc";
                }
                if (v_obj == "7")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbatenNdB.rdlc";
                }

                if (v_obj == "1")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateA_J.rdlc";
                }
                if (v_obj == "3")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateNcA_J.rdlc";
                }
                if (v_obj == "2")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateNdA.rdlc";
                }
                if (v_obj == "11")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateC.rdlc";

                }

                if (v_obj == "13")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateNcC.rdlc";
                }

                if (v_obj == "16")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateX_J.rdlc";
                }
                return ppr;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public string PathReportCbte(string v_obj)
        {
            string ppr = "";
            try
            {
               
                if (v_obj == "6")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateB.rdlc";
                }
                if (v_obj == "8")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbatenNcB.rdlc";
                }
                if (v_obj == "7")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbatenNdB.rdlc";
                }

                if (v_obj == "1")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateA.rdlc";
                }
                if (v_obj == "3")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateNcA.rdlc";
                }
                if (v_obj == "2")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateNdA.rdlc";
                }
                if (v_obj  == "11")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateC.rdlc";

                }

                if (v_obj == "13")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateNcC.rdlc";
                }

                if (v_obj == "16")
                {
                    ppr = "HardSoft.App.Kardex.Report.CbateX.rdlc";
                }
                return ppr;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public string PathReportCbteOAA(string v_obj)
        {
            string ppr = "";
            try
            {

                if (v_obj == "6")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateB.rdlc";
                }
                if (v_obj == "8")
                {
                    ppr = "HardSoft.App.OAA.Report.CbatenNcB.rdlc";
                }
                if (v_obj == "7")
                {
                    ppr = "HardSoft.App.OAA.Report.CbatenNdB.rdlc";
                }

                if (v_obj == "1")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateA.rdlc";
                }
                if (v_obj == "3")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateNcA.rdlc";
                }
                if (v_obj == "2")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateNdA.rdlc";
                }
                if (v_obj == "11")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateC.rdlc";

                }

                if (v_obj == "13")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateNcC.rdlc";
                }
                if (v_obj == "12")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateNdC.rdlc";
                }
                if (v_obj == "16")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateX.rdlc";
                }

                if (v_obj == "211")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateC211.rdlc";
                }

                if (v_obj == "212")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateNdC212.rdlc";
                }
                if (v_obj == "213")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateNcC213.rdlc";
                }
                if (v_obj == "1111")
                {
                    ppr = "HardSoft.App.OAA.Report.CbateCobroV2.rdlc";
                }
                if (v_obj == "1113")
                {
                    ppr = "HardSoft.App.OAA.Report.CbatePagoV2.rdlc";
                }
                return ppr;
            }
            catch (Exception)
            {
                throw;
            }

        }
        public Be.kx_cliente WsExisteProveedor(string doc, string user)
        {
            try
            {
                return this._mapeador.WsExisteProveedor(doc, user);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public Be.kx_cliente WsExiste(string doc,string user)
        {
            try
            {
              return  this._mapeador.WsExiste( doc,user);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.kx_cbtes> WsListarPagar(string v_cli, string v_conf)
        {
            try
            {
                return this._mapeador.WsListarPagar(v_cli, v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.kx_cbtes> WsListarAcobrar(string v_cli, string v_conf)
        {
            try
            {
             return   this._mapeador.WsListarAcobrar( v_cli,  v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void UpdateCancelar(string id, string cbate)
        {
            try
            {
               this._mapeador.UpdateCancelar(  id,  cbate);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public orden BsqOrden(string v_orden)
        {
            try
            {
                return this._mapeador.BsqOrden( v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public orden BsqCbte(string v_orden)
        {
            try
            {
                return this._mapeador.BsqCbate(v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public orden BsqCbteComprasV2(string v_orden)
        {
            try
            {
                return this._mapeador.BsqCbateComprasV2(v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public orden BsqCbteCompras(string v_orden)
        {
            try
            {
                return this._mapeador.BsqCbateCompras(v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public orden BsqCbatePagar(string v_orden)
        {
            try
            {
                return this._mapeador.BsqCbatePagar(v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public orden BsqCbateCobrar(string v_orden)
        {
            try
            {
                return this._mapeador.BsqCbateCobrar(v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.kx_articulo> Cbte_ArticulosCompras(string v_orden)
        {
            try
            {
                return this._mapeador.Cbte_ArticulosCompras(v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.kx_cbtes_percepciones> Cbte_PercCompras(string v_orden, string v_conf)
        {
            try
            {
                return this._mapeador.Cbte_PercCompras(v_orden, v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.kx_cbtes_percepciones> Cbte_PercVentas(string v_orden, string v_conf)
        {
            try
            {
                return this._mapeador.Cbte_PercVentas(v_orden, v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.kx_articulo> Cbte_Articulos(string v_orden)
        {
            try
            {
                return this._mapeador.Cbte_Articulos(v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.kx_articulo> Orden_Articulos(string v_orden)
        {
            try
            {
              return  this._mapeador.Orden_Articulos( v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<orden> Listar_orden(string v_tipo, string v_valor, string v_valor1, string v_conf)
        {
            try
            {
                return this._mapeador.Listar_orden(v_tipo, v_valor, v_valor1, v_conf);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Orden_Baja(string ids, string user)
        {
            try
            {
         this._mapeador.Orden_Baja(  ids,   user);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string Orden_alta(Be.kx_cbtes v_orden)
        {
            try
            {
             return  this._mapeador.Orden_alta( v_orden);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public DataSet CbateCobroV1(string v_Id)
        {
            try
            {
                return this._mapeador.CbateCobroV1(v_Id);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public DataSet CbatePagoRp(string v_fecha1, string v_fecha2, string v_conf)
        {
            try
            {
                return this._mapeador.CbatePagoRp( v_fecha1,  v_fecha2, v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public DataSet CbatePago(string v_Id)
        {
            try
            {
                return this._mapeador.CbatePago(v_Id);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public DataSet CbateCobro(string v_Id)
        {
            try
            {
                return this._mapeador.CbateCobro(v_Id);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public DataSet Cbate(string v_Id)
        {
            try
            {
             return   this._mapeador.Cbate(v_Id);
            }
            catch (Exception)
            {
                throw;
            }

        }


        public DataSet Cbate_Nro(string v_Id)
        {
            try
            {
                return this._mapeador.Cbate_Nro(v_Id);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<kx_cbtes> Listar()
        {
            try
            {
                return this._mapeador.Listar();
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.kx_cbtes> WssaldoXmesCompras(string v_mes, string v_anio, string v_id_cfg)
        {
            try
            {
                return this._mapeador.WssaldoXmesCompras(v_mes, v_anio, v_id_cfg);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.kx_cbtes> WssaldoXmes(string v_mes, string v_anio, string v_id_cfg)
        {
            try
            {
                return this._mapeador. WssaldoXmes(  v_mes,   v_anio,   v_id_cfg);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.kx_cbtes> WssaldoXmesVtas(string v_mes, string v_anio, string v_id_cfg)
        {
            try
            {
                return this._mapeador.WssaldoXmesVtas(v_mes, v_anio, v_id_cfg);
            }
            catch (Exception)
            {
                throw;
            }

        }


        public Dictionary<string, List<string>> Wscttiventas(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf)
          {
              try
              {

 

                  return this._mapeador.Wscttiventas(v_tipoCbate, v_tipo, v_valor1, v_valor2, v_user, v_conf);
              }
              catch (Exception)
              {
                  throw;
              }

          }
        public void Baja_cbatepagos(string ids)
        {
            try
            {
                this._mapeador.Baja_cbatepagos(ids);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void Baja_cbatecompras(string ids)
        {
            try
            {
                this._mapeador.Baja_cbatecompras(  ids);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.DeudaProveedor> WsListarDeudaCliente(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf, string v_priori)

        {
            try
            {
                return this._mapeador.WsListarDeudaCliente(v_tipoCbate, v_tipo, v_valor1, v_valor2, v_user, v_conf, v_priori);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.DeudaProveedor> WsListarDeudaProveedor(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf, string v_priori)

        {
            try
            {
                return this._mapeador.WsListarDeudaProveedor(v_tipoCbate, v_tipo, v_valor1, v_valor2, v_user, v_conf, v_priori);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.DeudaProveedor> WsRpDeudaProveedor(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2,  string v_conf, string v_priori)

        {
            try
            {
                return this._mapeador.WsRpDeudaProveedor(v_tipoCbate, v_tipo, v_valor1, v_valor2,  v_conf, v_priori);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.temp_deuda_mayor_mov> WsRpMayorMov(string v_fecha1, string v_fecha2, string v_config, string v_cta, string v_cta1)
        {
            try
            {
                return this._mapeador.WsRpMayorMov(v_fecha1, v_fecha2, v_config, v_cta, v_cta1);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.temp_deuda_mayor> WsRpMayor(string v_fecha1, string v_fecha2, string v_config, string v_cta)

        {
            try
            {
                return this._mapeador.WsRpMayor(  v_fecha1,   v_fecha2,   v_config,  v_cta);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.DeudaProveedor> WsRpDeudaCliente(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_conf, string v_priori)

        {
            try
            {
                return this._mapeador.WsRpDeudaCliente(v_tipoCbate, v_tipo, v_valor1, v_valor2, v_conf, v_priori);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.kx_cbtes> WsListarPagos(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf)

        {
            try
            {
                return this._mapeador.WsListarPagos(v_tipoCbate, v_tipo, v_valor1, v_valor2, v_user, v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.kx_cbtes> WsListarCobros(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf)

        {
            try
            {
                return this._mapeador.WsListarCobro(v_tipoCbate, v_tipo, v_valor1, v_valor2, v_user, v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.kx_cbtes> WsListarCompras(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf, string v_priori)

        {
            try
            {
                return this._mapeador.WsListarCompras(v_tipoCbate, v_tipo, v_valor1, v_valor2, v_user, v_conf, v_priori);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.kx_cbtes> WsListar(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf)
        {
            try
            {
                return this._mapeador.WsListar( v_tipoCbate,   v_tipo,   v_valor1,  v_valor2, v_user, v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void Eliminar(Int32 v_id)
        {
            try
            {
                this._mapeador.Eliminar(v_id);
            }
            catch (Exception)
            {
                throw;
            }

        }




        public static string LlenarComprobante(string v_num)
        {
            string sal = "";

            char[] NumArray = v_num.ToCharArray();

            for (int i = 0; i < (8 - NumArray.Length); i++)
            {
                sal = sal + "0";

            }

            return sal + v_num;


        }


        public static int ivaId(string valor)
        {

            if (valor == "0%")
            {
                return 3;

            }
            if (valor == "21%")
            {
                return 5;

            }

            if (valor == "10.5%")
            {
                return 4;

            }

            if (valor == "27%")
            {
                return 6;

            }
            return 0;
        }


        public static string TipoCbteStr(string cmbTipoCbte)
        {
            string tipoC = "";
            if (cmbTipoCbte == "11")
            {
                tipoC = "Factura C";

            }
            if (cmbTipoCbte == "13")
            {
                tipoC = "Nota de crédito C";

            }


            if (cmbTipoCbte == "1")
            {
                tipoC = "Factura A";

            }

            if (cmbTipoCbte == "3")
            {
                tipoC = "Nota de Crédito A";

            }

            if (cmbTipoCbte == "2")
            {
                tipoC = "Nota de Débito A";

            }

            if (cmbTipoCbte == "6")
            {
                tipoC = "Factura B";

            }

            if (cmbTipoCbte == "8")
            {
                tipoC = "Nota de Crédito B";

            }

            if (cmbTipoCbte == "7")
            {
                tipoC = "Nota de Débito B";

            }

            return tipoC;
        }

        public static int Mod10(string str)
        {
            // segun rg1702 afip

            int bb = 0;
            Int32 impar = 0;
            Int32 par = 0;
            Int32 etapa2 = 0;
            Int32 etapa4 = 0;
            Int32 digito = 0;

            foreach (char c in str.ToCharArray())
            {

                // 1 paso sumo los q estan en posicion impar

                bb++;

                if (!(bb % 2 == 0))
                {
                    impar += Convert.ToInt32(c.ToString());
                }
                else
                {
                    par += Convert.ToInt32(c.ToString());

                }



                // multiplico el resultado por 3
                etapa2 = impar * 3;
                // sumo etap2 mas pares

                etapa4 = par + etapa2;


                digito = 10 - (etapa4 - ((etapa4 / 10) * 10));


            }
            if (digito == 10) { return 0; }
            else
            { return digito; }

        }

    }
}
