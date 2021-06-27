using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
 using HardSoft.wsfeProd;     //Produccion
//using HardSoft.wsfe;  // desa Homo
using System.Xml;

using Be;
  
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VbWsaa;
using Bll;
namespace HardSoft
{
   public class TicketProducViejoDeLote:Ticket 
    {
        private FEAuthRequest feAutReq;

      
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
                        iva2.BaseImp = Convert.ToDouble(iva.BaseImp);
                        iva2.Importe = Convert.ToDouble(iva.Importe);
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
               
                Be.USUARIO_INTRANET user = (Be.USUARIO_INTRANET)HttpContext.Current.Session["UsuarioActual"];
               
                TicketAuth auth = this.Ticket(user.CUIT_EMPRESA.ToString());
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

        public TicketAuth Ticket(string v_cuit)
        {
            TicketAuth auth2;
            try
            {
                XmlDocument document = new XmlDocument();
               
                string config ="";

                // estoy hay q traerlo desde la base donde nos dice la ubicacion del tk q nos daa afip

                if(v_cuit=="20310149919"){
                 config = this.Path + @"\\xml\\configProduccion.xml";
                    // salida de  TK   de autentificacion q devuelve afip                     
                }
                 if(v_cuit=="30709138207"){
                     //cicomsa
                     config = this.Path + @"\\xml\\configProduccionCICOMSA.xml";               
                }


              
                XmlDocument document2 = new XmlDocument();
                document2.Load(config); 

                string filename = "";
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


                    new ProgramaPrincipal().IniciarProducion(this.Path,config, filename);
                     

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





        public override List<Be.PtoVtas> ListPtoVta()
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
                    
                    list.Add(item);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return list;
        }

        public FERecuperaLastCbteResponse ConsultarUltimoAutotizado(Int32 v_tipoCbte, Int32 v_PtoVta, FEAuthRequest v_feAutReq)
        {
            ServiceSoapClient fe = new ServiceSoapClient();


            FERecuperaLastCbteResponse Ucta = fe.FECompUltimoAutorizado(v_feAutReq, v_PtoVta, v_tipoCbte);

            return Ucta;

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

       public override string UltimoCbte()
        {
            try
            {
                FERecuperaLastCbteResponse rr = ConsultarUltimoAutotizado(1, 3, feAutReq);

                FECompConsResponse RESULT = ConsultarCompEmitido(rr.CbteNro, rr.CbteTipo, rr.PtoVta, feAutReq);



            return    "Resultado: " + RESULT.Resultado + " CAE: " + RESULT.CodAutorizacion + " Fecha Vto: " + RESULT.FchVto + " Total: " + RESULT.ImpTotal;

            }
            catch (Exception)
            {
                
                throw;
            }
         
        }
       public override string UltimoCbteConDatosEnviados(Int32 v_TipoCbate, Int32 v_PtoVta)
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
       public override kx_cbtes Generar_Cbate(Fact_Cab v_Fact, kx_cbtes kx)
       {
           throw new NotImplementedException();
       }

        public override string CotizacionMoneda(string pModId)
        {
            throw new NotImplementedException();
        }
    }
}
