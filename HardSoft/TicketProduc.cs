using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
 using HardSoft.wsfeProd;     //Produccion
//using HardSoft.wsfe;  // desa Homo
using System.Xml;
using HardSoft.Services;
using Be;
//using HardSoft.PersonasA13Prod;
//using HardSoft.PersonasA4Prod;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VbWsaa;
using Bll;
using System.Globalization;
using System.Threading;
using System.Net;
using HardSoft.PersonasA13Prod;

namespace HardSoft
{
   public class TicketProduc :Ticket 
    {

        public TicketProduc()
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls | (SecurityProtocolType)3072;
        }
        private FEAuthRequest feAutReq;


        public Be.Fact_Cab getCab { get; set; }


        public void BsqPersona() {
            try
            {  
                string cu = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Cuit;

                         TicketAuth auth;
                         auth = this.TicketAfip();
               
             
            }
            catch (Exception)
            {
                
                throw;
            }
        
        
        }

        public override kx_cbtes Generar_Cbate(Fact_Cab v_Fact, kx_cbtes kx)
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
                try
                {
                    this.feAutReq = this.getRq();
                }
                catch (Exception ex)
                {

                    throw new Exception("getRq -->"+ex.ToString());
                }
             


                kx.Cuit = feAutReq.Cuit.ToString();

                feCAEReq.FeCabReq = request2;
                List<FECAEDetRequest> list = new List<FECAEDetRequest>();
                long num = this.UltimoCbte(request2.PtoVta, request2.CbteTipo, this.feAutReq) + 1;

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

                    DateTime now = !string.IsNullOrEmpty(kx.Fecha) ? DateTime.ParseExact(kx.Fecha, "dd/MM/yyyy", CultureInfo.InvariantCulture) : DateTime.Now;
                    //now.Date.ToString("yyyyMMdd");


                    DateTime nowVto = !string.IsNullOrEmpty(kx.FchVtoPago) ? DateTime.ParseExact(kx.FchVtoPago, "dd/MM/yyyy", CultureInfo.InvariantCulture) : now;


                    item.CbteFch = now.Date.ToString("yyyyMMdd");
                    _detalle.CbteFch = now.Date.ToString("yyyyMMdd");

                    if (item.Concepto != 1)
                    {

                        item.FchServDesde = now.AddDays(-30.0).ToString("yyyyMMdd");
                        item.FchServHasta = now.Date.ToString("yyyyMMdd");

                        if (kx.CbteTipo != "213")
                        {  // no debe informarse para nota de credito 
                            item.FchVtoPago = nowVto.Date.ToString("yyyyMMdd");
                        }
                    }


                    // mipymes
                    List<Opcional> LISTop = new List<Opcional>();
                    if (kx.CbteTipo == "201" || kx.CbteTipo == "206" || kx.CbteTipo == "211")
                    {// cbu
                        Opcional op01 = new Opcional()
                        {
                            Id = "2101",
                            Valor = kx.CBU
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


                    if (LISTop.Count > 0)
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
                    if (kx.CbteTipo == "3" || kx.CbteTipo == "2" || kx.CbteTipo == "7" || kx.CbteTipo == "8" || kx.CbteTipo == "13" || kx.CbteTipo == "12" || kx.CbteTipo == "213" || kx.CbteTipo == "212")
                    {

                        CbteAsoc[] CbteAsocArray = new CbteAsoc[1];
                        CbteAsoc CANULAR = new CbteAsoc();


                        if (kx.anular_id != "null")
                        {
                            kx_cbtes cca = Bllkx_cbtes.DameInstancia().GetAnularCbte(kx.anular_id);
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
                    item.MonCotiz = Double.Parse(kx.MonCotiz.Replace(",", "."), numberFormatInfo); 

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
                        tri2.Id = Convert.ToInt16(tri.Id);
                        tri2.Desc = tri.Desc;
                        tri2.Alic = Math.Round(Double.Parse(tri.Alic.Replace(",", "."), numberFormatInfo), 2);
                        tri2.BaseImp = Math.Round(Double.Parse(tri.BaseImp.Replace(",", "."), numberFormatInfo), 2);
                        tri2.Importe = Math.Round(Double.Parse(tri.Importe.Replace(",", "."), numberFormatInfo), 2);
                        tributoArray[num3] = tri2;


                        num3++;
                    }



                    ///////
                    num += 1L;

                    if (kx.CbteTipo != "11" && kx.CbteTipo != "13" && kx.CbteTipo != "12" && kx.CbteTipo != "15")
                    {

                        // si no es monotributo
                        item.Iva = ivaArray;
                    }
                    if (item.ImpTrib > 0)
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
                FECAEResponse response = client.FECAESolicitar(this.feAutReq, feCAEReq);

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
                                            str += item.msg +"; ";
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
        }
        public override void cargar_lote(Fact_Cab v_Fact)
        {
            try
            {
                ServiceSoapClient client = new ServiceSoapClient();
                FECAERequest feCAEReq = new FECAERequest();
                FECAECabRequest request2 = new FECAECabRequest();
                request2.CantReg = v_Fact.CantReg;
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
                    _detalle.CbteDesde = num;
                    _detalle.CbteHasta = num;
                    DateTime now = DateTime.Now;
                    item.CbteFch = now.Date.ToString("yyyyMMdd");
                    _detalle.CbteFch = now.Date.ToString("yyyyMMdd");
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
                        error.msg = response.Errors[k].Msg;
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
                                str = "AUTORIZADO";
                            }
                            _detalle2.Observaciones = str;
                        }
                    }
                }
                v_Fact.Error = list2;
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
                     // si el user no es produccion
                     if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Modo == "Produccion")
                     {
                         string cu = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Cuit;

                         TicketAuth auth;
                         auth = this.TicketAfip();


                         FEAuthRequest request = new FEAuthRequest();
                         request.Cuit = auth.Cuit;
                         request.Sign = auth.Sign;
                         request.Token = auth.Token;
                         request2 = request;
                         return request2;
                     }else{
                         return null;
                     }
                   
                 }
                 catch (Exception)
                 {
                     throw;
                 }
             
               
            
        }

        public FEAuthRequest getRqPersonas(string TIPO)
        {
            FEAuthRequest request2;


            try
            {
                // si el user no es produccion
                 
                    TicketAuth auth=null;
                if (TIPO=="a13")
                {
                    auth = this.TicketPersonas();
                }
                if (TIPO == "a5")
                {
                    auth = this.TicketPersonasA5();
                }
                 


                    FEAuthRequest request = new FEAuthRequest();
                    request.Cuit = auth.Cuit;
                    request.Sign = auth.Sign;
                    request.Token = auth.Token;
                    request2 = request;
                    return request2;
                

            }
            catch (Exception)
            {
                throw;
            }



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

        public TicketAuth TicketAfip()
        {
            // aca cambia en produc recibi cuit



            TicketAuth auth2;
            try
            { 
                XmlDocument document = new XmlDocument();
                string filename = this.Path + @"xml\" + ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.LOGINTICKETRESPONSE_XML;
                document.Load(filename);
                string str2 = this.Path + @"xml\" + ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.CONFIG_XML;
                XmlDocument document2 = new XmlDocument();
                document2.Load(str2);


                document2.SelectSingleNode("/configuracion/certificado/DEFAULT_SERVICIO").InnerText = "wsfe"; // pq desde ws personas setea otro servicio
                document2.Save(str2); // lo salvo en el xml y despues lo buelvo a cargar

                document2.Load(str2);
                string innerText = document.SelectSingleNode("/loginTicketResponse/header/expirationTime").InnerText;
                string s = innerText.Substring(0, 10) + " " + innerText.Substring(11, 8);
                DateTime time = new DateTime();
                time = DateTime.ParseExact(s, "yyyy-MM-dd HH:mm:ss", null);
                DateTime now = DateTime.Now;
                TicketAuth auth = new TicketAuth();
                string config = this.Path + @"xml\" + ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.CONFIG_XML;

                if (now > time)
                {
                    // le pasa el path raiz , y todo el path de la xml config
                    new ProgramaPrincipal().IniciarProducion(this.Path, config, filename); // este metodo carga los datos inicio en el xml response 

                    document = new XmlDocument();
                    string str5 = filename;
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

        public TicketAuth TicketPersonas()
        {
            // tengo q cambiar el nombre del servicio para q  me de un ticket para ese servicio:
             
            TicketAuth auth2;
            try
            {
                XmlDocument document = new XmlDocument();
                string filename = this.Path + @"xml\TicketResponse20310149919PV3PersonasA13.xml";
                document.Load(filename);
                // copio toda la configuracioon mi certificado en produccion y cambio el servicio para q sea el de personas. y lo guardado en otro .xml config
                string str2 = this.Path + @"xml\Config20310149919PV3Produccion.xml" ;
                XmlDocument document2 = new XmlDocument();
                document2.Load(str2);

 document2.SelectSingleNode("/configuracion/certificado/DEFAULT_SERVICIO").InnerText = "ws_sr_padron_a13";

               

                string config = this.Path + @"xml\Config20310149919PV3ProduccionPersonasA13.xml";

                document2.Save(config);

                string innerText = document.SelectSingleNode("/loginTicketResponse/header/expirationTime").InnerText;
                string s = innerText.Substring(0, 10) + " " + innerText.Substring(11, 8);
                DateTime time = new DateTime();
                time = DateTime.ParseExact(s, "yyyy-MM-dd HH:mm:ss", null);
                DateTime now = DateTime.Now;
                TicketAuth auth = new TicketAuth();
               
                if (now > time)
                {
                    // le pasa el path raiz , y todo el path de la xml config
                    new ProgramaPrincipal().IniciarProducion(this.Path, config, filename); // este metodo carga los datos inicio en el xml response 

                    document = new XmlDocument();
                    string str5 = filename;
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

        public TicketAuth TicketPersonasA5()
        {
            // tengo q cambiar el nombre del servicio para q  me de un ticket para ese servicio:

            TicketAuth auth2;
            try
            {
                XmlDocument document = new XmlDocument();
                string filename = this.Path + @"xml\TicketResponse20310149919PV3PersonasA5.xml";
                document.Load(filename);
                // copio toda la configuracioon mi certificado en produccion y cambio el servicio para q sea el de personas. y lo guardado en otro .xml config
                string str2 = this.Path + @"xml\Config20310149919PV3Produccion.xml";
                XmlDocument document2 = new XmlDocument();
                document2.Load(str2);
 
                document2.SelectSingleNode("/configuracion/certificado/DEFAULT_SERVICIO").InnerText = "ws_sr_padron_a5";


                string config = this.Path + @"xml\Config20310149919PV3ProduccionPersonasA5.xml";

                document2.Save(config);

                string innerText = document.SelectSingleNode("/loginTicketResponse/header/expirationTime").InnerText;
                string s = innerText.Substring(0, 10) + " " + innerText.Substring(11, 8);
                DateTime time = new DateTime();
                time = DateTime.ParseExact(s, "yyyy-MM-dd HH:mm:ss", null);
                DateTime now = DateTime.Now;
                TicketAuth auth = new TicketAuth();

                if (now > time)
                {
                    // le pasa el path raiz , y todo el path de la xml config
                    new ProgramaPrincipal().IniciarProducion(this.Path, config, filename); // este metodo carga los datos inicio en el xml response 

                    document = new XmlDocument();
                    string str5 = filename;
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


        //public TicketAuth Ticket(string v_cuit)
        //{
        //    // aca cambia en produc recibi cuit



        //    TicketAuth auth2;
        //    try
        //    {
        //        XmlDocument document = new XmlDocument();

        //        // hay que guardar los xml de config y tk en la base de datos table config para no tener tantos archivos

        //        string config = "";

        //        // estoy hay q traerlo desde la base donde nos dice la ubicacion del tk q nos daa afip

        //        if (v_cuit == "20310149919")
        //        {
        //            config = this.Path + @"\\xml\\configProduccionHardSoft.xml";
        //            // salida de  TK   de autentificacion q devuelve afip                     
        //        }
        //        if (v_cuit == "30709138207")
        //        {
        //            //cicomsa
        //            config = this.Path + @"\\xml\\configProduccionCICOMSA.xml";
        //        }



        //        XmlDocument document2 = new XmlDocument();
        //        document2.Load(config);

        //        string filename = ""; // el pat xml de respuesta tk esta dentro xml config nodo tk
        //        filename = this.Path + document2.SelectSingleNode("//TK").InnerText; ; 
        //        document.Load(filename); 
        //        string innerText = document.SelectSingleNode("/loginTicketResponse/header/expirationTime").InnerText;
        //        string s = innerText.Substring(0, 10) + " " + innerText.Substring(11, 8);
        //        DateTime time = new DateTime();
        //        time = DateTime.ParseExact(s, "yyyy-MM-dd HH:mm:ss", null);
        //        DateTime now = DateTime.Now;
        //        TicketAuth auth = new TicketAuth();
        //        if (now > time)
        //        {
        //            // le pasa el path raiz , y todo el path de la xml config
        //            new ProgramaPrincipal().IniciarProducion(this.Path, config); // este metodo carga los datos inicio en el xml response


        //            document = new XmlDocument();
        //            string str5 = filename;
        //            document.Load(str5);
        //        }
        //        auth.Sign = document.SelectSingleNode("//sign").InnerText;
        //        auth.Token = document.SelectSingleNode("//token").InnerText;
        //        auth.Cuit = Convert.ToInt64(document2.SelectSingleNode("//CUIT").InnerText);
        //        auth2 = auth;




        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    return auth2;
        //}

        public TicketAuth TicketV2(string v_cuit, string servicio)
        {
            if (servicio =="") {
                servicio = "wsfe";
            }
            // aca cambia en produc recibi cuit 
            TicketAuth auth2;
            try
            {
                XmlDocument document = new XmlDocument();

                // hay que guardar los xml de config y tk en la base de datos table config para no tener tantos archivos

                string config = "";

                // estoy hay q traerlo desde la base donde nos dice la ubicacion del tk q nos daa afip

                if (v_cuit == "20310149919")
                {
                    config = "<?xml version='1.0' encoding='UTF-8' standalone='yes'?> <configuracion>  <certificado>    <DEFAULT_URLWSAAWSDL>usa la instancia del obj ws</DEFAULT_URLWSAAWSDL> ";
                    config += "<DEFAULT_SERVICIO>" + servicio + "</DEFAULT_SERVICIO> ";
   config += " <DEFAULT_CERTSIGNER>certificados\\ProduccionHardSoft.pfx</DEFAULT_CERTSIGNER> ";
                    config += "  <DEFAULT_CERTIFICADO_PASSWORD>seba</DEFAULT_CERTIFICADO_PASSWORD> ";
                    config += " <CUIT>20310149919</CUIT> ";
                    config += "  <TK>xml\\loginTicketResponseProduccionHardSoftServicios.xml</TK>";
                    config += "   </certificado> </configuracion>";

                    // salida de  TK   de autentificacion q devuelve afip                     
                }
                if (v_cuit == "30709138207")
                {
                    //cicomsa
                    config = this.Path + @"\\xml\\configProduccionCICOMSA.xml";
                }



                XmlDocument document2 = new XmlDocument();
                document2.LoadXml(config);

                string filename = ""; // el pat xml de respuesta tk esta dentro xml config nodo tk
                filename = this.Path + document2.SelectSingleNode("//TK").InnerText; ;
                document.Load(filename);
                string innerText = document.SelectSingleNode("/loginTicketResponse/header/expirationTime").InnerText;
                string s = innerText.Substring(0, 10) + " " + innerText.Substring(11, 8);
                DateTime time = new DateTime();
                time = DateTime.ParseExact(s, "yyyy-MM-dd HH:mm:ss", null);
                DateTime now = DateTime.Now;
                TicketAuth auth = new TicketAuth();
                if (now > time)
                {
                    // le pasa el path raiz , y todo el path de la xml config
                    new ProgramaPrincipal().IniciarProducionV2(this.Path, config); // este metodo carga los datos inicio en el xml response


                    document = new XmlDocument();
                    string str5 = filename;
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
        public override string UltimoCbteConDatosEnviados(Int32 v_TipoCbate, Int32 v_PtoVta)
        {
            try
            {
              FEAuthRequest Fe = getRq();

          //    PtoVenta[] fd = PtosDeVta(Fe);
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


       public override string CotizacionMoneda(string pModId)
        {
            try
            {
                if (this.feAutReq == null)
                {
                    this.feAutReq = this.getRq();
                }

                ServiceSoapClient client = new ServiceSoapClient();
           Cotizacion  resp = client.FEParamGetCotizacion(this.feAutReq, pModId).ResultGet ;

                return "";

            }
            catch (Exception)
            {

                throw;
            }
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


        public kx_cliente BuscarPersonas(string tipo, long doc)

        {
            kx_cliente cli = new kx_cliente();
            try
            {

               


                FEAuthRequest rq = getRqPersonas("a13");
        HardSoft.PersonasA13Prod. PersonaServiceA13Client pp = new HardSoft.PersonasA13Prod.PersonaServiceA13Client();

                long mdoc = 0;
                if (tipo == "DNI")
                {
                    idPersonaListReturn sal1 = pp.getIdPersonaListByDocumento(rq.Token, rq.Sign, rq.Cuit, doc.ToString()); // x dni obtengo cuit 
                    mdoc = sal1.idPersona[0] ?? 0;

                    cli.Iva = "CONSUMIDOR_FINAL";
                }
                if (tipo == "CUIT")
                {
                    mdoc = doc;

                    cli.Iva = BuscarPersonasA5( doc); // m fijo condicion iva
                }



               personaReturn sPersona = pp.getPersona(rq.Token, rq.Sign, rq.Cuit, mdoc);
                 
                cli.Apellido = sPersona.persona.apellido;
                cli.Calle = sPersona.persona.domicilio[0].calle;
                cli.Cp = sPersona.persona.domicilio[0].codigoPostal;
                cli.Doc_No = mdoc.ToString();

                List<string> vDir = BllDatosBasico.DameInstancia().LugarAfip(sPersona.persona.domicilio[0].localidad == null ? "": sPersona.persona.domicilio[0].localidad.ToUpper()?? "");

                cli.Pais = "1";

                cli.Provincia = sPersona.persona.domicilio[0].idProvincia.ToString();

                if (vDir.Count>0) {
                cli.Distrito = vDir[0];
                cli.Departamento = vDir[1];
                cli.Provincia = vDir[2];
                }


                //  cli.Distrito = sPersona.persona.domicilio[0].localidad.ToString(); 
                cli.Nombre = sPersona.persona.nombre;
                if (!string.IsNullOrEmpty(sPersona.persona.razonSocial))
                {
                    cli.Nombre += " -" + sPersona.persona.razonSocial;
                }
                cli.Numero = sPersona.persona.domicilio[0].numero.ToString();
                cli.Tipo_Doc = "CUIT";
                cli.Fecha_Nac = sPersona.persona.fechaNacimiento.ToString("dd/MM/yyyy");
                cli.Observacion = "Persona " +sPersona.persona.tipoPersona    ;
              
                if ("01/01/0001" != sPersona.persona.fechaNacimiento.ToString("dd/MM/yyyy"))
                {
                    cli.Observacion += " - Fecha de Nac.: " + sPersona.persona.fechaNacimiento.ToString("dd/MM/yyyy")  ;
                }
                if (!string.IsNullOrEmpty(sPersona.persona.descripcionActividadPrincipal))
                {
                    cli.Observacion += " - Act:" + sPersona.persona.descripcionActividadPrincipal ?? "";

                }
                if (!string.IsNullOrEmpty(sPersona.persona.descripcionActividadPrincipal))
                {
                    cli.Observacion += " - Dir:" + sPersona.persona.domicilio[0].direccion.ToString() ?? "" + " ," + sPersona.persona.domicilio[0].localidad.ToString()?? "";

                }
                if ("01/01/0001" != sPersona.persona.fechaFallecimiento.ToString("dd/MM/yyyy")) {
                    cli.Observacion += " - Fecha de Fallecimiento: "+ sPersona.persona.fechaFallecimiento.ToString("dd/MM/yyyy");
                }
                cli.Observacion += " -  CUIT/CUIL: " + cli.Doc_No;
                


            }
            catch (Exception)
            {

                throw;
            }
           

            return cli;

        }

        public string BuscarPersonasA5( long doc) // condicion iva

        {
            string sal = "";
            try
            {
                FEAuthRequest rq = getRqPersonas("a5");
             HardSoft.PersonasA5Prod.PersonaServiceA5Client pp = new HardSoft.PersonasA5Prod.PersonaServiceA5Client();

                long mdoc = 0;
               
                    mdoc = doc; 

                PersonasA5Prod.personaReturn sPersona = pp.getPersona(rq.Token, rq.Sign, rq.Cuit, mdoc);

                if (sPersona.datosGenerales == null)
                {
                    sal = "CONSUMIDOR_FINAL";
                }
               else if (sPersona.datosMonotributo !=null)
                {
                    sal = "MONOTRIBUTO";
                }

               else if ( sPersona.datosRegimenGeneral != null)
                {
                    sal = "RESPONSABLE_INSCRIPTO";
                    foreach (var item in sPersona.datosRegimenGeneral.impuesto)
                    {
                        if (item.idImpuesto== 32)
                        {
                            sal = "EXENTO";
                        }
                    }
                   
                }
               
            }
            catch (Exception)
            {

                throw;
            }


            return sal;

        }

        public override string UltimoCbte()
        {
            throw new NotImplementedException();
        }
    }
}
