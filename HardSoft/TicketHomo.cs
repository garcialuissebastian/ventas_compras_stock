using Be;
using Bll;
using HardSoft.wsfe;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml;
using VbWsaa;
using HardSoft.PersonaA13Homo;
using System.Data;

namespace HardSoft
{ 
    public class TicketHomo : Ticket
    {

        public   TicketHomo()
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls | (SecurityProtocolType)3072;
        }
        private FEAuthRequest feAutReq;


        public Be.Fact_Cab getCab { get; set; }


        public kx_cbtes Generar_CbateCompra(Fact_Cab v_Fact, kx_cbtes kx)
        {
            try
            {
                ServiceSoapClient client = new ServiceSoapClient();
                FECAERequest feCAEReq = new FECAERequest();
                FECAECabRequest request2 = new FECAECabRequest();
                request2.CantReg = v_Fact.CantReg;
                request2.CbteTipo = v_Fact.CbteTipo;
                request2.PtoVta = v_Fact.PtoVta;


                feAutReq = new FEAuthRequest();
                feAutReq.Cuit = Convert.ToInt64(((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Cuit);
                feAutReq.Sign = "";
                feAutReq.Token = "";


                kx.Cuit = feAutReq.Cuit.ToString();

                feCAEReq.FeCabReq = request2;
                List<FECAEDetRequest> list = new List<FECAEDetRequest>();
                long num = Convert.ToInt64( kx.CbteDesde);

                kx.CbteHasta = kx.CbteDesde;
                foreach (Fact_detalle _detalle in v_Fact.Detalle)
                {
                    FECAEDetRequest item = new FECAEDetRequest();
                    item.Concepto = _detalle.Concepto;
                    item.DocTipo = _detalle.DocTipo;
                    item.DocNro = _detalle.DocNro;
                    item.CbteDesde = num;
                    item.CbteHasta = num;
                    _detalle.CbteDesde = num;
                    _detalle.CbteHasta = num;
                    DateTime now = DateTime.Now;
                    item.CbteFch = now.Date.ToString("yyyyMMdd");
                    _detalle.CbteFch = now.Date.ToString("yyyyMMdd");

                    if (item.Concepto != 1)
                    {
                        item.FchServDesde = now.AddDays(-30.0).ToString("yyyyMMdd");
                        item.FchServHasta = now.Date.ToString("yyyyMMdd");
                        item.FchVtoPago = now.Date.ToString("yyyyMMdd");
                    }

                    item.ImpTotal = _detalle.ImpTotal;
                    item.ImpTotConc = _detalle.ImpTotConc;
                    item.ImpNeto = _detalle.ImpNeto;
                    item.ImpOpEx = _detalle.ImpOpEx;
                    item.ImpTrib = _detalle.ImpTrib;
                    item.ImpIVA = _detalle.ImpIVA;
                    item.MonId = _detalle.MonId;
                    item.MonCotiz = _detalle.MonCotiz;

                    Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                    var numberFormatInfo = new NumberFormatInfo();
                    numberFormatInfo.NumberDecimalSeparator = ".";
                    AlicIva[] ivaArray = new AlicIva[_detalle.AlicIva.Count];
                    int num2 = 0;
                    foreach (Fact_AlicIva iva in _detalle.AlicIva)
                    {
                        AlicIva iva2 = new AlicIva();
                        iva2.Id = iva.Id;
                        iva2.BaseImp = Math.Round(Double.Parse(iva.BaseImp.Replace(",", "."), numberFormatInfo), 2);
                        iva2.Importe = Math.Round(Double.Parse(iva.Importe.Replace(",", "."), numberFormatInfo), 2);
                        ivaArray[num2] = iva2;


                        num2++;
                    }
                    // para nota de credito y debito no hace falta informar cbtes asociados

                    ///////
                    num += 1L;

                    if (kx.CbteTipo != "11" && kx.CbteTipo != "13" && kx.CbteTipo != "12" && kx.CbteTipo != "15")
                    {

                        // si no es monotributo
                        item.Iva = ivaArray;
                    }
                    list.Add(item);
                }
                FECAEDetRequest[] requestArray = new FECAEDetRequest[list.Count];
                int index = 0;
                foreach (FECAEDetRequest request4 in list)
                {
                    requestArray[index] = request4;
                    index++;
                }
                feCAEReq.FeDetReq = requestArray;

                FECAEResponse response = new FECAEResponse();

                List<Fact_Error> list2 = new List<Fact_Error>();

                v_Fact.Error = list2;

                string text1 = "";
                kx.Observaciones = "DOCUMENTO  FACTURA DE COMPRA";

                kx.Resultado = " FACTURA DE COMPRAS DOCUMENTO NO VALIDO COMO FACTURA";

                if (kx.CbteTipo == "16") // comprobantes Remito
                {
                    kx.Resultado += " - R";
                }
                kx.CAE = "00000000000";
                kx.CAEFchVto = "99999999";


                string ids = Bll.Bllkx_cbtes.DameInstancia().AltaCompras(kx);

                kx.Id = Convert.ToInt32(ids);

                string enc = kx.Observaciones;
                kx.Observaciones = WebUtility.HtmlDecode(enc);

                return kx;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public kx_cbtes Generar_CbateCompraV2(Fact_Cab v_Fact, kx_cbtes kx)
        {
            try
            {
                ServiceSoapClient client = new ServiceSoapClient();
                FECAERequest feCAEReq = new FECAERequest();
                FECAECabRequest request2 = new FECAECabRequest();
                request2.CantReg = v_Fact.CantReg;
                request2.CbteTipo = v_Fact.CbteTipo;
                request2.PtoVta = v_Fact.PtoVta;


                feAutReq = new FEAuthRequest();
                feAutReq.Cuit = Convert.ToInt64(((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Cuit);
                feAutReq.Sign = "";
                feAutReq.Token = "";


                kx.Cuit = feAutReq.Cuit.ToString();

                feCAEReq.FeCabReq = request2;
                List<FECAEDetRequest> list = new List<FECAEDetRequest>();
                long num = Convert.ToInt64(kx.CbteDesde);

                kx.CbteHasta = kx.CbteDesde;
                foreach (Fact_detalle _detalle in v_Fact.Detalle)
                {
                    FECAEDetRequest item = new FECAEDetRequest();
                    item.Concepto = _detalle.Concepto;
                    item.DocTipo = _detalle.DocTipo;
                    item.DocNro = _detalle.DocNro;
                    item.CbteDesde = num;
                    item.CbteHasta = num;
                    _detalle.CbteDesde = num;
                    _detalle.CbteHasta = num;
                    DateTime now = DateTime.Now;
                    item.CbteFch = now.Date.ToString("yyyyMMdd");
                    _detalle.CbteFch = now.Date.ToString("yyyyMMdd");

                    if (item.Concepto != 1)
                    {
                        item.FchServDesde = now.AddDays(-30.0).ToString("yyyyMMdd");
                        item.FchServHasta = now.Date.ToString("yyyyMMdd");
                        item.FchVtoPago = now.Date.ToString("yyyyMMdd");
                    }

                    item.ImpTotal = _detalle.ImpTotal;
                    item.ImpTotConc = _detalle.ImpTotConc;
                    item.ImpNeto = _detalle.ImpNeto;
                    item.ImpOpEx = _detalle.ImpOpEx;
                    item.ImpTrib = _detalle.ImpTrib;
                    item.ImpIVA = _detalle.ImpIVA;
                    item.MonId = _detalle.MonId;
                    item.MonCotiz = _detalle.MonCotiz;

                    Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                    var numberFormatInfo = new NumberFormatInfo();
                    numberFormatInfo.NumberDecimalSeparator = ".";
                    AlicIva[] ivaArray = new AlicIva[_detalle.AlicIva.Count];
                    int num2 = 0;
                    foreach (Fact_AlicIva iva in _detalle.AlicIva)
                    {
                        AlicIva iva2 = new AlicIva();
                        iva2.Id = iva.Id;
                        iva2.BaseImp = Math.Round(Double.Parse(iva.BaseImp.Replace(",", "."), numberFormatInfo), 2);
                        iva2.Importe = Math.Round(Double.Parse(iva.Importe.Replace(",", "."), numberFormatInfo), 2);
                        ivaArray[num2] = iva2;


                        num2++;
                    }
                    // para nota de credito y debito no hace falta informar cbtes asociados

                    ///////
                    num += 1L;

                    if (kx.CbteTipo != "11" && kx.CbteTipo != "13" && kx.CbteTipo != "12" && kx.CbteTipo != "15")
                    {

                        // si no es monotributo
                        item.Iva = ivaArray;
                    }
                    list.Add(item);
                }
                FECAEDetRequest[] requestArray = new FECAEDetRequest[list.Count];
                int index = 0;
                foreach (FECAEDetRequest request4 in list)
                {
                    requestArray[index] = request4;
                    index++;
                }
                feCAEReq.FeDetReq = requestArray;

                FECAEResponse response = new FECAEResponse();

                List<Fact_Error> list2 = new List<Fact_Error>();

                v_Fact.Error = list2;

                string text1 = "";
                kx.Observaciones = "DOCUMENTO  FACTURA DE COMPRA";

                kx.Resultado = " FACTURA DE COMPRAS DOCUMENTO NO VALIDO COMO FACTURA";

                if (kx.CbteTipo == "16") // comprobantes Remito
                {
                    kx.Resultado += " - R";
                }
                kx.CAE = "00000000000";
                kx.CAEFchVto = "99999999";


                string ids = Bll.Bllkx_cbtes.DameInstancia().AltaComprasV2(kx);

                kx.Id = Convert.ToInt32(ids);

                string enc = kx.Observaciones;
                kx.Observaciones = WebUtility.HtmlDecode(enc);

                return kx;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public kx_cbtes Generar_CbateSinAfip(Fact_Cab v_Fact, kx_cbtes kx)
        {
            try
            {
                ServiceSoapClient client = new ServiceSoapClient();
                FECAERequest feCAEReq = new FECAERequest();
                FECAECabRequest request2 = new FECAECabRequest();
                request2.CantReg = v_Fact.CantReg;
                request2.CbteTipo = v_Fact.CbteTipo;
                request2.PtoVta = v_Fact.PtoVta;


                feAutReq = new FEAuthRequest();
                feAutReq.Cuit = Convert.ToInt64( ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Cuit);
                feAutReq.Sign = "";
                feAutReq.Token = "";
             
                
                kx.Cuit = feAutReq.Cuit.ToString();

                feCAEReq.FeCabReq = request2;
                List<FECAEDetRequest> list = new List<FECAEDetRequest>();
                long num = Convert.ToInt64(Bll.Bllkx_cbtes.DameInstancia().maxCbtePruebas(v_Fact.CbteTipo.ToString(), ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id));
           
                kx.CbteDesde = num.ToString();
                kx.CbteHasta = num.ToString();
                foreach (Fact_detalle _detalle in v_Fact.Detalle)
                {
                    FECAEDetRequest item = new FECAEDetRequest();
                    item.Concepto = _detalle.Concepto;
                    item.DocTipo = _detalle.DocTipo;
                    item.DocNro = _detalle.DocNro;
                    item.CbteDesde = num;
                    item.CbteHasta = num;
                    _detalle.CbteDesde = num;
                    _detalle.CbteHasta = num;
                    DateTime now = DateTime.Now;
                    item.CbteFch = now.Date.ToString("yyyyMMdd");
                    _detalle.CbteFch = now.Date.ToString("yyyyMMdd");

                    if (item.Concepto != 1)
                    {
                        item.FchServDesde = now.AddDays(-30.0).ToString("yyyyMMdd");
                        item.FchServHasta = now.Date.ToString("yyyyMMdd");
                        item.FchVtoPago = now.Date.ToString("yyyyMMdd");
                    }

                    item.ImpTotal = _detalle.ImpTotal;
                    item.ImpTotConc = _detalle.ImpTotConc;
                    item.ImpNeto = _detalle.ImpNeto;
                    item.ImpOpEx = _detalle.ImpOpEx;
                    item.ImpTrib = _detalle.ImpTrib;
                    item.ImpIVA = _detalle.ImpIVA;
                    item.MonId = _detalle.MonId;
                    item.MonCotiz = _detalle.MonCotiz;

                    Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                    var numberFormatInfo = new NumberFormatInfo();
                    numberFormatInfo.NumberDecimalSeparator = ".";
                    AlicIva[] ivaArray = new AlicIva[_detalle.AlicIva.Count];
                    int num2 = 0;
                    foreach (Fact_AlicIva iva in _detalle.AlicIva)
                    {
                        AlicIva iva2 = new AlicIva();
                        iva2.Id = iva.Id;
                        iva2.BaseImp = Math.Round(Double.Parse(iva.BaseImp.Replace(",", "."), numberFormatInfo), 2);
                        iva2.Importe = Math.Round(Double.Parse(iva.Importe.Replace(",", "."), numberFormatInfo), 2);
                        ivaArray[num2] = iva2;


                        num2++;
                    } 
                    // para nota de credito y debito no hace falta informar cbtes asociados

                    ///////
                    num += 1L;

                    if (kx.CbteTipo != "11" && kx.CbteTipo != "13" && kx.CbteTipo != "12" && kx.CbteTipo != "15")
                    {

                        // si no es monotributo
                        item.Iva = ivaArray;
                    }
                    list.Add(item);
                }
                FECAEDetRequest[] requestArray = new FECAEDetRequest[list.Count];
                int index = 0;
                foreach (FECAEDetRequest request4 in list)
                {
                    requestArray[index] = request4;
                    index++;
                }
                feCAEReq.FeDetReq = requestArray;

                FECAEResponse response = new FECAEResponse();
             
                List<Fact_Error> list2 = new List<Fact_Error>();
            
                v_Fact.Error = list2; 

                    string text1 = "Resultado: DOCUMENTO NO VALIDO COMO FACTURA CAE: 000000000000 Fecha Vto: 99/99/9999";
                    kx.Observaciones = "DOCUMENTO NO VALIDO COMO FACTURA";

                    kx.Resultado = "DOCUMENTO NO VALIDO COMO FACTURA";
                if (kx.Id_config=="30") // ES PARA MI EN EL CASO DE Q NO ANDE AFIP AMULAR LOS COMPROBANTES
                {
                    kx.Observaciones = "AUTORIZADO"; 
                    kx.Resultado = "A";
                }
                if (kx.CbteTipo=="16") // comprobantes Remito
                {
                    kx.Resultado += " - R";
                }
                    kx.CAE = "00000000000";
                    kx.CAEFchVto = "99999999";

               
                string ids = Bll.Bllkx_cbtes.DameInstancia().Alta(kx);

                kx.Id = Convert.ToInt32(ids);

                string enc = kx.Observaciones;
                kx.Observaciones = WebUtility.HtmlDecode(enc);

                return kx;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    

        public override kx_cbtes Generar_Cbate(Fact_Cab v_Fact, kx_cbtes kx)
        {
            if ((((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Modo != "PRUEBA_SIN_AFIP") && (v_Fact.CbteTipo !=16 && v_Fact.CbteTipo != 1112))
            {

                try
                {
                    if (string.IsNullOrEmpty(kx.MonId))
                    {
                        kx.MonId = "PES";
                    } 

                    if (kx.MonId == "PES")
                    {

                        kx.MonCotiz = "1";
                    }
                   



                    ServiceSoapClient client = new ServiceSoapClient();
                    FECAERequest feCAEReq = new FECAERequest();
                    FECAECabRequest request2 = new FECAECabRequest();
                    request2.CantReg = v_Fact.CantReg;
                    request2.CbteTipo = v_Fact.CbteTipo;
                    request2.PtoVta = v_Fact.PtoVta;

                    this.feAutReq = this.getRq();
                    kx.Cuit = feAutReq.Cuit.ToString();

                    feCAEReq.FeCabReq = request2;
                    List<FECAEDetRequest> list = new List<FECAEDetRequest>();

                    long num = this.UltimoCbte(request2.PtoVta, request2.CbteTipo, this.feAutReq) + 1;

                    kx.CbteDesde = num.ToString();
                    kx.CbteHasta = num.ToString();
                    foreach (Fact_detalle _detalle in v_Fact.Detalle) // por si es un lote de facturas la recorro
                    {
                        FECAEDetRequest item = new FECAEDetRequest();
                        item.Concepto = _detalle.Concepto;
                        item.DocTipo = _detalle.DocTipo;
                        item.DocNro = _detalle.DocNro;
                        item.CbteDesde = num;
                        item.CbteHasta = num;
                        _detalle.CbteDesde = num;
                        _detalle.CbteHasta = num;

                        DateTime now = !string.IsNullOrEmpty(kx.Fecha) ? DateTime.ParseExact(kx.Fecha, "dd/MM/yyyy", CultureInfo.InvariantCulture) : DateTime.Now;
                        //now.Date.ToString("yyyyMMdd");


                        DateTime nowVto = !string.IsNullOrEmpty(kx.FchVtoPago) ? DateTime.ParseExact(kx.FchVtoPago, "dd/MM/yyyy", CultureInfo.InvariantCulture):now;


                        item.CbteFch =  now.Date.ToString("yyyyMMdd");
                        _detalle.CbteFch = now.Date.ToString("yyyyMMdd");

                        if (item.Concepto != 1)
                        {

                            item.FchServDesde = now.AddDays(-30.0).ToString("yyyyMMdd");
                            item.FchServHasta = now.Date.ToString("yyyyMMdd");

                            if (kx.CbteTipo != "213"  )
                            {  // no debe informarse para nota de credito 
                                item.FchVtoPago = nowVto.Date.ToString("yyyyMMdd");
                            }
                        }


                        // mipymes
                        List<Opcional> LISTop = new List<Opcional>(); 
                        if (kx.CbteTipo == "201" || kx.CbteTipo == "206" || kx.CbteTipo == "211") {// cbu
                            Opcional op01 = new Opcional()
                            {
                                Id = "2101", Valor = kx.CBU
                            };

                            Opcional op02 = new Opcional()
                            {
                                Id = "27",
                                Valor = kx.TipoTranferencia
                            };

                            LISTop.Add(op01);
                            LISTop.Add(op02);
                          }
                         
                        if (kx.CbteTipo == "203" || kx.CbteTipo == "208" || kx.CbteTipo == "213")
                        {// Anulación
                            Opcional op02 = new Opcional()
                            { // PARA HACER UN NOTA DE CREDITO DE FEC:
                                // SI EL CBTE FUE RECHADO POR EL COMPRADOR :
                                Id = "22",
                                Valor = "N" // ES NECESARIO Q ESTE RECHAZADO X EL COMPRADOR

                                // EN EL CASO DE NO FUE RECHAZADO   Valor = "N" 
                            };
                            LISTop.Add(op02);
                        }
                       

                        if (LISTop.Count>0)
                        {
                            Opcional[] OpcionesArray = new Opcional[LISTop.Count];
                        int numOp = 0;

                        foreach (var itemOP in LISTop)
                        {
                            OpcionesArray[numOp] = itemOP;
                            numOp++;
                        }

                            item.Opcionales = OpcionesArray;
                        }
                        //para anular ahora hay q poner el comprobante asociando
                        if (kx.CbteTipo =="3" || kx.CbteTipo == "2" || kx.CbteTipo == "7" || kx.CbteTipo == "8" || kx.CbteTipo == "13" || kx.CbteTipo == "12" || kx.CbteTipo == "213" || kx.CbteTipo == "212"  ) {

                            CbteAsoc[] CbteAsocArray = new CbteAsoc[1];
                           CbteAsoc CANULAR = new CbteAsoc();


                            if (  kx.anular_id !="null")
                            { 
                           kx_cbtes cca =    Bllkx_cbtes.DameInstancia().GetAnularCbte(kx.anular_id);
                                kx.anular_fecha = cca.anular_fecha;
                                kx.anular_Nro = cca.anular_Nro;
                                kx.anular_Tipo = cca.anular_Tipo;

                            }
                            if (kx.CbteTipo == "213" || kx.CbteTipo == "212")
                            {
                                CANULAR.Cuit = kx.Cuit; // cuit del emisor

                            }

                            if (!string.IsNullOrEmpty(kx.anular_fecha))
                            {
                                DateTime CbteFch = DateTime.ParseExact(kx.anular_fecha, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                                CANULAR.CbteFch = CbteFch.Date.ToString("yyyyMMdd");
                            } 
                          
                            CANULAR.Tipo = Convert.ToInt32(kx.anular_Tipo);
                        CANULAR.PtoVta = Convert.ToInt32(kx.PtoVta);
                        CANULAR.Nro = Convert.ToInt32(kx.anular_Nro);
                        
                        CbteAsocArray[0] = CANULAR;
                        item.CbtesAsoc = CbteAsocArray;

                        }


                      
                        item.ImpTotal = _detalle.ImpTotal;
                        item.ImpTotConc = _detalle.ImpTotConc;
                        item.ImpNeto = _detalle.ImpNeto;
                        item.ImpOpEx = _detalle.ImpOpEx;
                        item.ImpTrib = _detalle.ImpTrib;
                        item.ImpIVA = _detalle.ImpIVA;
                        item.MonId = kx.MonId; 
                        Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                        var numberFormatInfo = new NumberFormatInfo();
                        numberFormatInfo.NumberDecimalSeparator = ".";
                        item.MonCotiz = Double.Parse(kx.MonCotiz.Replace(",", "."), numberFormatInfo); ;


                        AlicIva[] ivaArray = new AlicIva[_detalle.AlicIva.Count];
                        int num2 = 0;
                        foreach (Fact_AlicIva iva in _detalle.AlicIva)
                        {
                            AlicIva iva2 = new AlicIva();
                            iva2.Id = iva.Id;
                            iva2.BaseImp = Math.Round(Double.Parse(iva.BaseImp.Replace(",", "."), numberFormatInfo), 2);
                            iva2.Importe = Math.Round(Double.Parse(iva.Importe.Replace(",", "."), numberFormatInfo), 2);
                            ivaArray[num2] = iva2;


                            num2++;
                        }



                        Tributo[] tributoArray = new Tributo[_detalle.Tributos.Count];
                        int num3 = 0;
                        foreach (Fact_Tributo tri in _detalle.Tributos)
                        {
                            Tributo tri2 = new Tributo();
                            tri2.Id = Convert.ToInt16( tri.Id);
                            tri2.Desc=  tri.Desc;
                            tri2.Alic = Math.Round(Double.Parse(tri.Alic.Replace(",", "."), numberFormatInfo), 2);
                            tri2.BaseImp = Math.Round(Double.Parse(tri.BaseImp.Replace(",", "."), numberFormatInfo), 2);
                            tri2.Importe = Math.Round(Double.Parse(tri.Importe.Replace(",", "."), numberFormatInfo), 2);
                            tributoArray[num3] = tri2;


                            num3++;
                        }
                        // para nota de credito y debito no hace falta informar cbtes asociados

                        ///////
                        num += 1L;

                        if (kx.CbteTipo != "11" && kx.CbteTipo != "13" && kx.CbteTipo != "12" && kx.CbteTipo != "15" && kx.CbteTipo != "211" && kx.CbteTipo != "212" && kx.CbteTipo != "213")
                        {

                            // si no es monotributo
                            item.Iva = ivaArray;
                        }
                        if (item.ImpTrib>0)
                        {
                            item.Tributos = tributoArray;
                        }
                       
                        list.Add(item);
                    }
                    FECAEDetRequest[] requestArray = new FECAEDetRequest[list.Count];
                    int index = 0;
                    foreach (FECAEDetRequest request4 in list)
                    {
                        requestArray[index] = request4;
                        index++;
                    }
                    feCAEReq.FeDetReq = requestArray;

                    FECAEResponse response = new FECAEResponse();

                    response = client.FECAESolicitar(this.feAutReq, feCAEReq);

                    List<Fact_Error> list2 = new List<Fact_Error>();
                    if (response.Errors != null)
                    {
                        for (int k = 0; k < response.Errors.Length; k++)
                        {
                            Fact_Error error = new Fact_Error();
                            error.Cod = response.Errors[k].Code.ToString();
                            error.msg = response.Errors[k].Msg;
                            list2.Add(error);
                        }
                    }

                    if (response.FeDetResp != null)
                    {
                        for (int i = 0; i < response.FeDetResp.Length; i++)
                        {
                            foreach (Fact_detalle _detalle2 in v_Fact.Detalle)
                            {
                                if (response.FeDetResp[i].CbteDesde == _detalle2.CbteDesde)
                                {
                                    _detalle2.CAE = response.FeDetResp[i].CAE;
                                    _detalle2.CAEFchVto = response.FeDetResp[i].CAEFchVto;
                                    string str = "";
                                    if (response.FeDetResp[i].Observaciones != null)
                                    {
                                        for (int m = 0; m < response.FeDetResp[i].Observaciones.Length; m++)
                                        {
                                            object obj2 = str;
                                            str = string.Concat(new object[] { obj2, response.FeDetResp[i].Observaciones[m].Msg, " Codigo:", response.FeDetResp[i].Observaciones[m].Code, " <br/> " });
                                        }
                                    }
                                    else
                                    {
                                        if (list2.Count > 0)
                                        {
                                            foreach (var item in list2)
                                            {
                                                str += item.msg + "; ";
                                            }
                                        }
                                        else
                                        {
                                            str = "AUTORIZADO";
                                        }
                                    }
                                    _detalle2.Observaciones = str;
                                    kx.Observaciones = WebUtility.HtmlEncode(str);
                                }
                            }
                        }

                    }

                    v_Fact.Error = list2;
                    if (response.FeCabResp == null)
                    {

                        string ms = "";
                        foreach (var item in list2)
                        {
                            ms += item.msg + " -";
                        }
                        throw new ArgumentException(ms, "response.FeCabResp == null");


                    }
                    v_Fact.Resultado = response.FeCabResp.Resultado;
                    string text1 = "Resultado: " + response.FeCabResp.Resultado + " CAE: " + response.FeDetResp[0].CAE + " Fecha Vto: " + response.FeDetResp[0].CAEFchVto;


                    kx.Resultado = response.FeCabResp.Resultado;
                    kx.CAE = response.FeDetResp[0].CAE;
                    kx.CAEFchVto = response.FeDetResp[0].CAEFchVto;
                    string text2 = "error obj null, mirar   v_Fact.Error: " + text1;


                    if (response.FeDetResp != null)
                    {
                        for (int j = 0; j < response.FeDetResp.Length; j++)
                        {
                            if (response.FeDetResp[j].Observaciones != null)
                            {
                                for (int n = 0; n < response.FeDetResp[j].Observaciones.Length; n++)
                                {
                                    text2 = response.FeDetResp[j].Observaciones[n].Msg + "; cod:" + response.FeDetResp[j].Observaciones[n].Code;


                                }
                            }
                        }
                    }
                    if (response.FeDetResp == null)
                    {
                        // si da un error  
                        kx.Observaciones = WebUtility.HtmlEncode(text2 + " pq response.FeDetResp=null ;");
                        foreach (var item in v_Fact.Error)
                        {
                            kx.Observaciones += item.msg + ";";
                        }

                    }



                    string ids = Bll.Bllkx_cbtes.DameInstancia().Alta(kx);

                    kx.Id = Convert.ToInt32(ids);

                    string enc = kx.Observaciones;
                    kx.Observaciones = WebUtility.HtmlDecode(enc);

                    return kx;
                }
                catch (Exception ex)
                {
                    throw ex;
                }


            }            else {
              return  Generar_CbateSinAfip(v_Fact, kx);           
            
            }
        }

        string TipoCbateAnular = "";
        public void ANULARFact()
        {

            try
            {
                if (feAutReq == null)
                {
                    this.feAutReq = this.getRq();
                   

                }

                Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                var numberFormatInfo = new NumberFormatInfo();
                numberFormatInfo.NumberDecimalSeparator = ".";
               

                kx_cbtes kx = new kx_cbtes();
                // DataSet ds = Bll.Bllkx_cbtes.DameInstancia().Cbate(TxtRpid.Text);
                kx.Cuit = feAutReq.Cuit.ToString();
              //  DataSet ds = bll.Rp(ids);
                DataSet ds = new DataSet();





                if (ds.Tables["cab"].Rows[0]["Afip_Observacion"].ToString() != "AUTORIZADO")
                {
                    if (ds.Tables["cab"].Rows[0]["Afip_Observacion"].ToString() != "RECHAZADO")
                    {

                        throw new Exception("NO SE PUEDE GENERAR LA NOTA DE CREDITO POR QUE EL COMPROBANTE YA FUE ANULADO." );
                    
                    }
                }



                factura fe1 = new factura();

                //      ds.Tables["cab"].Rows[0]["Cod_Letra"].ToString()
                fe1.Domicilio = ds.Tables["cab"].Rows[0]["Cli_Domicilio"].ToString();
                DateTime hoy = DateTime.Now;


                fe1.FechaCbte = hoy;
                fe1.FechaDesde = hoy;
                fe1.FechaHasta = hoy;

                fe1.ClienteIva = ds.Tables["cab"].Rows[0]["Cli_Iva"].ToString();




                fe1.Nombre = ds.Tables["cab"].Rows[0]["Cli_Nombre"].ToString();





                fe1.VtoPago = hoy;
                List<Be.ItemFact> ListItem = new List<ItemFact>();

                foreach (DataRow row in ds.Tables["det"].Rows)
                {
                    Be.ItemFact entidad = new ItemFact();
                    entidad.Cant = row["Cant"].ToString();
                    entidad.Importe = Math.Round(Double.Parse(row["ImpTotal"].ToString().Replace(",", "."), numberFormatInfo), 2);
                    entidad.ImpxUni = row["ImpxUni"].ToString();
                    entidad.Iva = row["Iva"].ToString();
                    entidad.NetoImpTotal = row["NetoImpTotal"].ToString();
                    entidad.NetoImpxUni = row["NetoImpxUni"].ToString();
                    entidad.Detalle = row["Nombre"].ToString();
                    ListItem.Add(entidad);
                }
                fe1.Item = ListItem;
                fe1.Total = ds.Tables["cab"].Rows[0]["Total"].ToString();


                fe1.PtoVta = ds.Tables["cab"].Rows[0]["PtoVta"].ToString();

                fe1.Cuit = ds.Tables["cab"].Rows[0]["Cuit"].ToString(); // cuit del vendedor

                if (TipoCbateAnular == "Nota de crédito C")
                {
                    fe1.TipoCbte = 13;
                    fe1.Letra = "C";
                    fe1.TipoCbteStr = "Nota de crédito C";
                }


                if (TipoCbateAnular == "Nota de Crédito A")
                {
                    fe1.TipoCbte = 3;
                    fe1.Letra = "A";
                    fe1.TipoCbteStr = "Nota de Crédito A";
                }



                if (TipoCbateAnular == "Nota de Crédito B")
                {
                    fe1.TipoCbte = 8;
                    fe1.Letra = "B";
                    fe1.TipoCbteStr = "Nota de Crédito B";
                }


                //////////////// calculo del iva //////////////////////////
                // recorro la lista de productos p/ determinar <ImpNeto> < ImpIVA > < ImpTrib > < ImpTotal >

                double vImpNeto = 0;
                double vImpIVA = 0;
                double vImpTrib = 0;

             

                AlicIva iva21 = new AlicIva();
                AlicIva iva105 = new AlicIva();
                AlicIva iva27 = new AlicIva();
                AlicIva iva0 = new AlicIva();
                List<AlicIva> ListIva = new List<AlicIva>();
                string tiene21 = "";
                string tiene105 = "";
                string tiene27 = "";
                string tiene0 = "";

                //ID   IVA
                //3   0 %  
                //4   10.5 % 
                //5   21 %  
                //6   27 %  
                //8   5 % 
                //9   2.5 %
                foreach (var art in ListItem)
                {

                    if (Bllkx_cbtes.ivaId(art.Iva) == 3 && (fe1.TipoCbte != 11 || fe1.TipoCbte != 13)) //  0% * si no es mono
                    {
                        tiene0 = "S";
                        iva0.Id = 3;
                        iva0.BaseImp += Math.Round(art.Importe); // IMP NETO
                        vImpNeto += Math.Round(iva0.BaseImp, 2);
                        iva0.Importe += 0;//el  importe de iva 
                        vImpIVA += 0;
                    }



                    if (Bllkx_cbtes.ivaId(art.Iva) == 5) //  21%
                    {
                        tiene21 = "S";
                        iva21.Id = 5;
                        iva21.BaseImp += Math.Round(art.Importe / (1 + 0.21), 2); // IMP NETO
                        vImpNeto += Math.Round(iva21.BaseImp, 2);
                        iva21.Importe += Math.Round(art.Importe - art.Importe / (1 + 0.21), 2);//el  importe de iva 
                        vImpIVA += Math.Round(iva21.Importe, 2);
                    }
                    if (Bllkx_cbtes.ivaId(art.Iva) == 4) // 10.5%
                    {
                        tiene105 = "S";
                        iva105.Id = 4;
                        iva105.BaseImp += Math.Round(art.Importe / (1 + 0.105), 2); // IMP NETO
                        vImpNeto += Math.Round(iva105.BaseImp, 2);
                        iva105.Importe += Math.Round(art.Importe - art.Importe / (1 + 0.105), 2);
                        vImpIVA += Math.Round(iva105.Importe, 2);
                    }

                    if (Bllkx_cbtes.ivaId(art.Iva) == 6) // 27%
                    {
                        tiene27 = "S";
                        iva27.Id = 6;
                        iva27.BaseImp += Math.Round(art.Importe / (1 + 0.27), 2); // IMP NETO
                        vImpNeto += Math.Round(iva27.BaseImp, 2);
                        iva27.Importe += Math.Round(art.Importe - art.Importe / (1 + 0.27), 2);
                        vImpIVA += Math.Round(iva27.Importe, 2);
                    }

                }
                // fe1 es el obj mio para insertar en la base
                fe1.vIva0Neto = iva0.BaseImp.ToString();
                fe1.vIva0importe = iva0.Importe.ToString();
                fe1.vIva21Neto = iva21.BaseImp.ToString();
                fe1.vIva21importe = iva21.Importe.ToString();
                fe1.vIva105Neto = iva105.BaseImp.ToString();
                fe1.vIva105importe = iva105.Importe.ToString();
                fe1.vIva27Neto = iva27.BaseImp.ToString();
                fe1.vIva27importe = iva27.Importe.ToString();

                if (tiene21 == "S")
                {
                    ListIva.Add(iva21);
                }
                if (tiene105 == "S")
                {
                    ListIva.Add(iva105);
                }
                if (tiene27 == "S")
                {
                    ListIva.Add(iva27);
                }
                if (tiene0 == "S")
                {
                    ListIva.Add(iva0);
                }
                AlicIva[] ivaArray = new AlicIva[ListIva.Count];
                int num2 = 0;
                foreach (AlicIva iva in ListIva)
                {
                    ivaArray[num2] = iva;
                    num2++;
                }
                ////////////////////////////////// fin iva /////////////////////
                ///


                ServiceSoapClient fe = new ServiceSoapClient();



                FECAERequest FeReq = new FECAERequest();
                FECAECabRequest CAB = new FECAECabRequest();
                CAB.CantReg = 1;
                CAB.CbteTipo = fe1.TipoCbte;
                CAB.PtoVta = Convert.ToInt32(fe1.PtoVta); // ptos de vtas habilitados --> ptosVtas()


                FeReq.FeCabReq = CAB;
                // detalle



                FECAEDetRequest DET = new FECAEDetRequest();


                DET.Concepto = Convert.ToInt32(ds.Tables["cab"].Rows[0]["Concepto"].ToString());

                // si es 1 producto , 2 servicio etc --> getFEParamGetTiposConcepto
                fe1.Concepto = DET.Concepto.ToString();

                TipoDoc Tdoc = new TipoDoc();
                if (ds.Tables["cab"].Rows[0]["Cli_Tipo_Doc"].ToString() == "CUIT :")
                {
                    Tdoc.Descripcion = "CUIT";
                    Tdoc.Id = 80;
                    fe1.tipoDoc = Tdoc;
                }
                if (ds.Tables["cab"].Rows[0]["Cli_Tipo_Doc"].ToString() == "DNI :")
                {
                    Tdoc = new TipoDoc();
                    Tdoc.Descripcion = "DNI";
                    Tdoc.Id = 96;
                    fe1.tipoDoc = Tdoc;
                }

                ////////
                DET.DocTipo = fe1.tipoDoc.Id; // 96 dni del comprador

                fe1.DocTipo_Afip = DET.DocTipo.ToString();



                DET.DocNro = Convert.ToInt64(ds.Tables["cab"].Rows[0]["Cli_DocNO"].ToString()); // del comprador


                fe1.Doc = DET.DocNro;

                long num = this.UltimoCbte(CAB.PtoVta, CAB.CbteTipo, feAutReq) + 1;

                DET.CbteDesde = num;
                DET.CbteHasta = num;

             

                fe1.NumCbte = Bllkx_cbtes.LlenarComprobante(DET.CbteDesde.ToString());

                DateTime dt2 = DateTime.Now;
                DateTime dt = DateTime.Now;
                DET.CbteFch = dt.Date.ToString("yyyyMMdd");

                if (DET.Concepto == 2)
                {


                    if (dt < dt2.AddDays(10) && dt > dt2.AddDays(-10))
                    {
                        DET.CbteFch = dt.Date.ToString("yyyyMMdd");

                    }
                    else
                    {
                        throw new Exception("para servicios la Fecha del comprobante puede ser hasta 10 días anteriores o posteriores a la fecha de generación");
                      

                    }
                }


                if (fe1.TipoCbte != 11 && fe1.TipoCbte != 13 && fe1.TipoCbte != 12 && fe1.TipoCbte != 15)
                {
                    // si no es monotributo
                    DET.Iva = ivaArray;
                    DET.ImpIVA = Math.Round(vImpIVA, 2);
                }

                DET.ImpTotal = Math.Round(Double.Parse(fe1.Total.Replace(",", "."), numberFormatInfo), 2);
                DET.ImpTotConc = 0; // COMPROBANTE C ES 0
                DET.ImpNeto = Math.Round(vImpNeto, 2);
                DET.ImpOpEx = 0;  // COMPROBANTE C ES 0

                //para anular ahora hay q poner el comprobante asociando

                CbteAsoc[] CbteAsocArray = new CbteAsoc[1];
                CbteAsoc CANULAR = new CbteAsoc();
                CANULAR.Tipo = Convert.ToInt32(ds.Tables["cab"].Rows[0]["Cod_Letra"]);
                CANULAR.PtoVta = Convert.ToInt32(ds.Tables["cab"].Rows[0]["PtoVta"]);
                CANULAR.Nro = Convert.ToInt32(ds.Tables["cab"].Rows[0]["CbteDesde"]);

                CbteAsocArray[0] = CANULAR;
                DET.CbtesAsoc = CbteAsocArray;
                /////////////////////////////////////////////////////////

                DET.MonId = "PES";
                DET.MonCotiz = 1;

                if (DET.MonId == "PES")
                {
                    fe1.MonedaStr = "$";

                }

                if (DET.Concepto != 1)
                { // no va para productos
                  // Fechas del período de servicios prestado  campo obligatorio para servicios
                    DET.FchServDesde = fe1.FechaDesde.ToString("yyyyMMdd");
                    DET.FchServHasta = fe1.FechaHasta.ToString("yyyyMMdd");
                    // campo obligatorio para servicios - vto del pago del servicio

                    DET.FchVtoPago = fe1.VtoPago.ToString("yyyyMMdd"); ;
                }



                FECAEDetRequest[] objetosDet = new FECAEDetRequest[] { DET };


                FeReq.FeDetReq = objetosDet;


                FECAEResponse response = fe.FECAESolicitar(feAutReq, FeReq);

                List<Fact_Error> list2 = new List<Fact_Error>();
                if (response.Errors != null)
                {
                    for (int k = 0; k < response.Errors.Length; k++)
                    {
                        Fact_Error error = new Fact_Error();
                        error.Cod = response.Errors[k].Code.ToString();
                        error.msg = response.Errors[k].Msg;
                        list2.Add(error);
                    }
                }

                if (response.FeDetResp != null)
                {
                    for (int i = 0; i < response.FeDetResp.Length; i++)
                    {
                       
                    }

                }

             
                if (response.FeCabResp == null)
                {

                    string ms = "";
                    foreach (var item in list2)
                    {
                        ms += item.msg + " -";
                    }
                    throw new ArgumentException(ms, "response.FeCabResp == null");


                }
            
                string text1 = "Resultado: " + response.FeCabResp.Resultado + " CAE: " + response.FeDetResp[0].CAE + " Fecha Vto: " + response.FeDetResp[0].CAEFchVto;


                kx.Resultado = response.FeCabResp.Resultado;
                kx.CAE = response.FeDetResp[0].CAE;
                kx.CAEFchVto = response.FeDetResp[0].CAEFchVto;
                string text2 = "error obj null, mirar   v_Fact.Error: " + text1;


                if (response.FeDetResp != null)
                {
                    for (int j = 0; j < response.FeDetResp.Length; j++)
                    {
                        if (response.FeDetResp[j].Observaciones != null)
                        {
                            for (int n = 0; n < response.FeDetResp[j].Observaciones.Length; n++)
                            {
                                text2 = response.FeDetResp[j].Observaciones[n].Msg + "; cod:" + response.FeDetResp[j].Observaciones[n].Code;


                            }
                        }
                    }
                }
                if (response.FeDetResp == null)
                {
                    // si da un error  
                    kx.Observaciones = WebUtility.HtmlEncode(text2 + " pq response.FeDetResp=null ;");
                     

                }
                kx.CantReg = "0";
                kx.CbteTipo = fe1.TipoCbte.ToString();
                kx.PtoVta = fe1.PtoVta.ToString();
                kx.Fecha = fe1.FechaCbte.ToString("dd/MM/yyyy");
                kx.usuario = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO;
                kx.Vendedor = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO;
                kx.Cliente = fe1.Nombre.ToString();
                kx.Concepto = fe1.Concepto.ToString();
                kx.DocTipo = fe1.DocTipo_Afip.ToString();
                kx.DocNro = fe1.Doc.ToString();
               
                kx.CbteDesde = num.ToString();
                kx.CbteHasta = num.ToString();
                kx.CbteFch = fe1.FechaCbte.ToString();
                kx.ImpTotal = fe1.Total.ToString();
                kx.ImpTotConc = "0";
                kx.ImpNeto = vImpNeto.ToString();
                kx.ImpOpEx = "0";
                kx.ImpTrib = "0";
                kx.ImpIVA = vImpIVA.ToString();
                kx.MonId = DET.MonId.ToString();
                kx.MonCotiz = "";
                kx.CodBarra = fe1.CodBarra.ToString();
                kx.Id_config = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id; 

                string ids = Bll.Bllkx_cbtes.DameInstancia().Alta(kx);

                kx.Id = Convert.ToInt32(ids);

                string enc = kx.Observaciones;
                kx.Observaciones = WebUtility.HtmlDecode(enc);


            }
            catch (Exception)
            {

                throw;
            }




        }



        public override void cargar_lote(Fact_Cab v_Fact)
        {
            try
            {
                
                ServiceSoapClient client = new ServiceSoapClient();
                FECAERequest feCAEReq = new FECAERequest();
                FECAECabRequest request2 = new FECAECabRequest();
                request2.CantReg = v_Fact.CantReg ;
                request2.CbteTipo = v_Fact.CbteTipo;
                request2.PtoVta = v_Fact.PtoVta;
                this.feAutReq = this.getRq();
                feCAEReq.FeCabReq = request2;
                List<FECAEDetRequest> list = new List<FECAEDetRequest>();
                long num = this.UltimoCbte(request2.PtoVta, request2.CbteTipo, this.feAutReq) + 1;
                foreach (Fact_detalle _detalle in v_Fact.Detalle)
                {
                    FECAEDetRequest item = new FECAEDetRequest();
                    item.Concepto = _detalle.Concepto;
                    item.DocTipo = _detalle.DocTipo;
                    item.DocNro = _detalle.DocNro;
                    item.CbteDesde = num;
                    item.CbteHasta = num;
                    _detalle.CbteDesde=num;
                    _detalle.CbteHasta=num;
                    DateTime now = DateTime.Now;
                    item.CbteFch = now.Date.ToString("yyyyMMdd");
                    _detalle.CbteFch =now.Date.ToString("yyyyMMdd");
                    item.FchServDesde = now.AddDays(-30.0).ToString("yyyyMMdd");
                    item.FchServHasta = now.Date.ToString("yyyyMMdd");
                    item.FchVtoPago = now.Date.ToString("yyyyMMdd");
                    item.ImpTotal = _detalle.ImpTotal;
                    item.ImpTotConc = _detalle.ImpTotConc;
                    item.ImpNeto = _detalle.ImpNeto;
                    item.ImpOpEx = _detalle.ImpOpEx;
                    item.ImpTrib = _detalle.ImpTrib;
                    item.ImpIVA = _detalle.ImpIVA;
                    item.MonId = _detalle.MonId;
                    item.MonCotiz = _detalle.MonCotiz;


                    AlicIva[] ivaArray = new AlicIva[_detalle.AlicIva.Count];
                    int num2 = 0;
                    foreach (Fact_AlicIva iva in _detalle.AlicIva)
                    {
                        AlicIva iva2 = new AlicIva();
                        iva2.Id = iva.Id;
                        iva2.BaseImp = Convert.ToDouble(iva.BaseImp.Replace(",", "."), CultureInfo.GetCultureInfo("en-US").NumberFormat);
                        iva2.Importe = Convert.ToDouble(iva.Importe.Replace(",", "."), CultureInfo.GetCultureInfo("en-US").NumberFormat);
                        ivaArray[num2] = iva2;
                        num2++;
                    }
                    num += 1L;
                    item.Iva = ivaArray;
                    list.Add(item);
                }
                FECAEDetRequest[] requestArray = new FECAEDetRequest[list.Count];
                int index = 0;
                foreach (FECAEDetRequest request4 in list)
                {
                    requestArray[index] = request4;
                    index++;
                }
                feCAEReq.FeDetReq = requestArray;
                FECAEResponse response = client.FECAESolicitar(this.feAutReq, feCAEReq);
                List<Fact_Error> list2 = new List<Fact_Error>();
                if (response.Errors != null)
                {
                    for (int k = 0; k < response.Errors.Length; k++)
                    {
                        Fact_Error error = new Fact_Error();
                        error.Cod = response.Errors[k].Code.ToString();
                        error.msg =response.Errors[k].Msg;
                        list2.Add(error);
                    }
                }
                for (int i = 0; i < response.FeDetResp.Length; i++)
                {
                    foreach (Fact_detalle _detalle2 in v_Fact.Detalle)
                    {
                        if (response.FeDetResp[i].CbteDesde == _detalle2.CbteDesde)
                        {
                            _detalle2.CAE = response.FeDetResp[i].CAE;
                            _detalle2.CAEFchVto =response.FeDetResp[i].CAEFchVto;
                            string str = "";
                            if (response.FeDetResp[i].Observaciones != null)
                            {
                                for (int m = 0; m < response.FeDetResp[i].Observaciones.Length; m++)
                                {
                                    object obj2 = str;
                                    str = string.Concat(new object[] { obj2, response.FeDetResp[i].Observaciones[m].Msg, " Codigo:", response.FeDetResp[i].Observaciones[m].Code, " <br/> " });
                                }
                            }
                            else
                            {
                                str = "AUTORIZADO";
                            }
                            _detalle2.Observaciones=str;
                        }
                    }
                }
                v_Fact.Error=list2;
                v_Fact.Resultado = response.FeCabResp.Resultado;
                string text1 = "Resultado: " + response.FeCabResp.Resultado + " CAE: " + response.FeDetResp[0].CAE + " Fecha Vto: " + response.FeDetResp[0].CAEFchVto;
                for (int j = 0; j < response.FeDetResp.Length; j++)
                {
                    if (response.FeDetResp[j].Observaciones != null)
                    {
                        for (int n = 0; n < response.FeDetResp[j].Observaciones.Length; n++)
                        {
                            string text2 = response.FeDetResp[j].Observaciones[n].Msg + "; cod:" + response.FeDetResp[j].Observaciones[n].Code;
                        }
                    }
                }


                HttpContext.Current.Session["Cab"] = v_Fact;
            
               
                // no insert en homo modo
 


            }
            catch (Exception)
            {
                throw;
            }
        }

        public FERecuperaLastCbteResponse getFECompUltimoAutorizado(int v_ptoVta, int v_tipoCbte, FEAuthRequest v_feAutReq)
        {
            FERecuperaLastCbteResponse response;
            try
            {
                response = new ServiceSoapClient().FECompUltimoAutorizado(v_feAutReq, v_ptoVta, v_tipoCbte);
            }
            catch (Exception)
            {
                throw;
            }
            return response;
        }

        public DocTipo[] getFEParamGetTiposDoc(FEAuthRequest v_feAutReq)
        {
            DocTipo[] resultGet;
            try
            {
                ServiceSoapClient client = new ServiceSoapClient();
                resultGet = client.FEParamGetTiposDoc(v_feAutReq).ResultGet;
           
            
            
            }
            catch (Exception)
            {
                throw;
            }
            return resultGet;
        }

        public FEAuthRequest getRq()
        {
            FEAuthRequest request2;
            try
            {
                string cu = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Cuit;

                TicketAuth auth = null;

                auth = this.Ticketafip();
                // aca cambia en produc
                //if (cu == "20310149919") {
                //    //mono
                //    auth = this.TicketMono();
                //}
                //if (cu == "23232560894") 
                //{// iva
                //     auth = this.Ticket();
                //}

                FEAuthRequest request = new FEAuthRequest();
                request.Cuit = auth.Cuit;
                request.Sign = auth.Sign;

                request.Token = auth.Token;
                request2 = request;




            }
            catch (Exception)
            {
                throw;
            }
            return request2;
        }

        public IvaTipo[] getFEParamGetTiposIva()
        {

            if (this.feAutReq == null)
            {
                this.feAutReq = this.getRq();
            }
           IvaTipo[] resultGet;
            try
            {
                ServiceSoapClient client = new ServiceSoapClient();
                resultGet = client.FEParamGetTiposIva(this.feAutReq).ResultGet;

             
                
            }
            catch (Exception)
            {
                throw;
            }
            return resultGet;
        }


        public override string CotizacionMoneda(string pModId)
        {
            try
            {
                if (this.feAutReq == null)
                {
                    this.feAutReq = this.getRq();
                }

                ServiceSoapClient client = new ServiceSoapClient();
                Cotizacion resp = client.FEParamGetCotizacion(this.feAutReq, pModId).ResultGet;

                return resp.MonCotiz.ToString().Replace(",", ".");

            }
            catch (Exception)
            {

                throw;
            }
        }

        public void personas()
        {
            FEAuthRequest rq = getRq();
            PersonaA13Homo.PersonaServiceA13Client pp = new PersonaServiceA13Client();

            PersonaA13Homo.personaReturn sal = pp.getPersona(rq.Token, rq.Sign, rq.Cuit, 20002307554);

          
       


        }
        public override List<TipoDoc> ListTipoDoc()
        {

          
            List<TipoDoc> list = new List<TipoDoc>();
            try
            {
                if (this.feAutReq == null)
                {
                    this.feAutReq = this.getRq();
                }
                DocTipo[] tipoArray = this.getFEParamGetTiposDoc(this.feAutReq);
                for (int i = 0; i < tipoArray.Length; i++)
                {
                    TipoDoc item = new TipoDoc();
                    new ListItem();
                    item.Descripcion = tipoArray[i].Desc;
                    item.Id = tipoArray[i].Id;
                    list.Add(item);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return list;
        }

        public PtoVenta[] PtosDeVta(FEAuthRequest v_feAutReq)
        {
            PtoVenta[] ventaArray2;
            try
            {
                ServiceSoapClient client = new ServiceSoapClient();
                FEAuthRequest auth = v_feAutReq;
                PtoVenta[] resultGet = client.FEParamGetPtosVenta(auth).ResultGet;
                Err[] errors = client.FEParamGetPtosVenta(auth).Errors;
                string message = "";
                if ((resultGet == null) && (errors != null))
                {
                    foreach (Err err in errors)
                    {
                        string str2 = message;
                        message = str2 + "-" + err.Code.ToString() + ":" + err.Msg.ToString();
                    }
                    throw new ArgumentException(message, "Error Pto Vtas");
                }
                ventaArray2 = resultGet;
            }
            catch (Exception)
            {
                throw;
            }
            return ventaArray2;
        }

        public static string TestConeccion()
        {
            string str4;
            try
            {
                ServiceSoapClient client = new ServiceSoapClient();
                string appServer = client.FEDummy().AppServer;
                string dbServer = client.FEDummy().DbServer;
                string authServer = client.FEDummy().AuthServer;
                str4 = "  Servidor de Aplicaciones: " + appServer + " " + Environment.NewLine + "  Base de datos Afip: " + dbServer + Environment.NewLine + "  Autentificaci\x00f3n con el server: " + authServer;
            }
            catch (Exception)
            {
                throw;
            }
            return str4;
        }

        public TicketAuth TicketMono()
        {
            // aca cambia en produc recibi cuit
            TicketAuth auth2;
            try
            {
                XmlDocument document = new XmlDocument();
                string filename = this.Path + @"\xml\loginTicketResponseHomoHardSoft.xml";
                document.Load(filename);
                string str2 = this.Path + @"\xml\configHomoMono.xml";
                XmlDocument document2 = new XmlDocument();
                document2.Load(str2);
                string innerText = document.SelectSingleNode("/loginTicketResponse/header/expirationTime").InnerText;
                string s = innerText.Substring(0, 10) + " " + innerText.Substring(11, 8);
                DateTime time = new DateTime();
                time = DateTime.ParseExact(s, "yyyy-MM-dd HH:mm:ss", null);
                DateTime now = DateTime.Now;
                TicketAuth auth = new TicketAuth();
                if (now > time)
                {

                    string str5 = this.Path + @"\xml\loginTicketResponseHomoHardSoft.xml";

                    new ProgramaPrincipal().Iniciar(this.Path, "\\xml\\configHomoMono.xml",str5);
                    document = new XmlDocument();
                   
                    document.Load(str5);
                }
                auth.Sign = document.SelectSingleNode("//sign").InnerText;
                auth.Token = document.SelectSingleNode("//token").InnerText;
                auth.Cuit = Convert.ToInt64(document2.SelectSingleNode("//CUIT").InnerText);
                auth2 = auth;
            }
            catch (Exception)
            {
                throw;
            }
            return auth2;
        }

        public TicketAuth Ticketafip()
        {
            // aca cambia en produc recibi cuit
            TicketAuth auth2;
            try
            {

                
                XmlDocument document = new XmlDocument();
                string filename = this.Path + @"xml\"+ ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.LOGINTICKETRESPONSE_XML;
                document.Load(filename);
                string str2 = this.Path + @"xml\"+ ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.CONFIG_XML;
                XmlDocument document2 = new XmlDocument();
                document2.Load(str2);
                string innerText = document.SelectSingleNode("/loginTicketResponse/header/expirationTime").InnerText;
                string s = innerText.Substring(0, 10) + " " + innerText.Substring(11, 8);
                DateTime time = new DateTime();
                time = DateTime.ParseExact(s, "yyyy-MM-dd HH:mm:ss", null);
                DateTime now = DateTime.Now;
                TicketAuth auth = new TicketAuth();
                if (now > time)
                {

                    string str5 = this.Path + @"xml\"+ ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.LOGINTICKETRESPONSE_XML;

                    new ProgramaPrincipal().Iniciar(this.Path, "\\xml\\"+ ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.CONFIG_XML, str5);
                    document = new XmlDocument();

                    document.Load(str5);
                }
                auth.Sign = document.SelectSingleNode("//sign").InnerText;
                auth.Token = document.SelectSingleNode("//token").InnerText;
                auth.Cuit = Convert.ToInt64(document2.SelectSingleNode("//CUIT").InnerText);
                auth2 = auth;
            }
            catch (Exception)
            {
                throw;
            }
            return auth2;
        }


        public TicketAuth Ticket()
        {
            // aca cambia en produc recibi cuit
            TicketAuth auth2;
            try
            {
                XmlDocument document = new XmlDocument();
                string filename = this.Path + @"\xml\loginTicketResponse.xml";
                document.Load(filename);
                string str2 = this.Path + @"\xml\config.xml";
                XmlDocument document2 = new XmlDocument();
                document2.Load(str2);
                string innerText = document.SelectSingleNode("/loginTicketResponse/header/expirationTime").InnerText;
                string s = innerText.Substring(0, 10) + " " + innerText.Substring(11, 8);
                DateTime time = new DateTime();
                time = DateTime.ParseExact(s, "yyyy-MM-dd HH:mm:ss", null);
                DateTime now = DateTime.Now;
                TicketAuth auth = new TicketAuth();
                if (now > time)
                {


                      string str5 = this.Path + @"\xml\loginTicketResponse.xml";
                      new ProgramaPrincipal().Iniciar(this.Path, "\\xml\\config.xml", str5);
                    document = new XmlDocument();
                  
                    document.Load(str5);
                }
                auth.Sign = document.SelectSingleNode("//sign").InnerText;
                auth.Token = document.SelectSingleNode("//token").InnerText;
                auth.Cuit = Convert.ToInt64(document2.SelectSingleNode("//CUIT").InnerText);
                auth2 = auth;
            }   
            catch (Exception)
            {
                throw;
            }
            return auth2;
        }
        public FECompConsResponse ConsultarCompEmitido(Int32 v_cbteNro, Int32 v_cbteTipo, Int32 v_ptoVta, FEAuthRequest v_feAutReq)
        { // dado el tipo de comprobante . punto de venta y num de comprobante devueve lo enviado a FECAESolicitar
            try
            {
                ServiceSoapClient fe = new ServiceSoapClient();
                FECompConsultaReq crq = new FECompConsultaReq();
                crq.CbteNro = v_cbteNro;
                crq.CbteTipo = v_cbteTipo; // fact a
                crq.PtoVta = v_ptoVta;

                FECompConsResponse ccr = fe.FECompConsultar(v_feAutReq, crq).ResultGet;

                return ccr;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public FERecuperaLastCbteResponse ConsultarUltimoAutotizado(Int32 v_tipoCbte, Int32 v_PtoVta, FEAuthRequest v_feAutReq)
        {
            ServiceSoapClient fe = new ServiceSoapClient();


            FERecuperaLastCbteResponse Ucta = fe.FECompUltimoAutorizado(v_feAutReq, v_PtoVta, v_tipoCbte);

            return Ucta;

        }
      public override string UltimoCbteConDatosEnviados(Int32 v_TipoCbate, Int32 v_PtoVta )
        {
            try
            {
                FEAuthRequest Fe = getRq();
                FERecuperaLastCbteResponse rr = ConsultarUltimoAutotizado(v_TipoCbate, v_PtoVta, Fe);

                FECompConsResponse RESULT = ConsultarCompEmitido(rr.CbteNro, rr.CbteTipo, rr.PtoVta, Fe);



                return "Resultado: " + RESULT.Resultado + " CAE: " + RESULT.CodAutorizacion + " Fecha Vto: " + RESULT.FchVto + " Total: " + RESULT.ImpTotal;

            }
            catch (Exception)
            {

                throw;
            }

        }
        public int UltimoCbte(int v_ptoVta, int v_tipoCbte, FEAuthRequest v_feAutReq)
        {
            int cbteNro;
            try
            {
                cbteNro = this.getFECompUltimoAutorizado(v_ptoVta, v_tipoCbte, v_feAutReq).CbteNro;
            }
            catch (Exception)
            {
                throw;
            }
            return cbteNro;
        }

        public string validadCk(bool v_b)
        {
            if (v_b)
            {
                return "X";
            }
            return "";
        }

        public override List<PtoVtas> ListPtoVta()
        {
            List<Be.PtoVtas> list = new List<Be.PtoVtas>();
            try
            {
                if (this.feAutReq == null)
                {
                    this.feAutReq = this.getRq();
                }
                PtoVenta[] pp = PtosDeVta(feAutReq);


                for (int i = 0; i < pp.Length; i++)
                {
                    Be.PtoVtas item = new Be.PtoVtas();
                    new ListItem();
                    item.Descripcion = pp[i].EmisionTipo + " -  N°" + pp[i].Nro;
                    item.Id = pp[i].Nro;
                    list.Add(item);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return list;
        }

        public override string UltimoCbte()
        {
            throw new NotImplementedException();
        }
    }
}

