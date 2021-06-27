using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Bll;
using System.Net;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Configuration;
using HardSoft.PersonasA13Prod;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Pkcs;
using System.Security.Cryptography;
using System.Security;
using System.Xml;
using System.Text;

namespace HardSoft
{
    /// <summary>
    /// Descripción breve de ObtenerTicket
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class ObtenerTicket : System.Web.Services.WebService
    {
        string Path = ConfigurationManager.AppSettings.Get("PathProyecto").ToString();
        [WebMethod]
        public string ObtenerTokenPersonaBest(string tk)
        {
            if (tk=="066D1FF2C5329F4CB1426CDE2D64AF2D")
            {
                 
            string filename = Path + @"xml\Best\TicketResponse20310149919PV3PersonasA13.xml";
            
            string config = Path + @"xml\Best\Config20310149919PV3ProduccionPersonasA13.xml";

         return   this.IniciarProducion(Path, config, filename); // este metodo carga los datoms inicio en el xml response 
            }
            else
            {
                return "";
            }
        }

        [WebMethod]
        public string ObtenerTokenFacturaBest(string tk)
        {
            if (tk == "066D1FF2C5329F4CB1426CDE2D64AF2D")
            {

                string filename = Path + @"xml\Best\loginTicketResponse.xml";

                string config = Path + @"xml\Best\config.xml";

                return this.IniciarProducionFactura(Path, config, filename); // este metodo carga los datoms inicio en el xml response 
            }
            else
            {
                return "";
            }
        }


        public UInt32 UniqueId; // Entero de 32 bits sin signo que identifica el requerimiento
        public DateTime GenerationTime; // Momento en que fue generado el requerimiento
        public DateTime ExpirationTime; // Momento en el que exoira la solicitud
        public string Service; // Identificacion del WSN para el cual se solicita el TA
        public string Sign; // Firma de seguridad recibida en la respuesta
        public string Token; // Token de seguridad recibido en la respuesta

        public XmlDocument XmlLoginTicketRequest = null/* TODO Change to default(_) if this is not a reference type */;
        public XmlDocument XmlLoginTicketResponse = null/* TODO Change to default(_) if this is not a reference type */;
        public string RutaDelCertificadoFirmante;
        public string XmlStrLoginTicketRequestTemplate = "<loginTicketRequest><header><uniqueId></uniqueId><generationTime></generationTime><expirationTime></expirationTime></header><service></service></loginTicketRequest>";

        private bool _verboseMode = true;

        private static UInt32 _globalUniqueID = 0; // OJO! NO ES THREAD-SAFE

        const string DEFAULT_URLWSAAWSDL = "https://wsaa.afip.gov.ar/ws/services/LoginCms?wsdl"; // no lo usa por usa el ws
        const string DEFAULT_SERVICIO = "wsfe";
        const string DEFAULT_CERTSIGNER = @"c:\\cert.pfx";
        const string DEFAULT_PROXY = null;
        const string DEFAULT_PROXY_USER = null;
        const string DEFAULT_PROXY_PASSWORD = "";
        const bool DEFAULT_VERBOSE = true;
        const string DEFAULT_CERTIFICADO_PASSWORD = "";
        public string SAL_TK = "";
        public string IniciarProducion(string path, string configuracion, string response)
        {
            try
            {
                bool sal = false;

                XmlDocument Xmlconfig = new XmlDocument();


                // en config los datos de proccion
                Xmlconfig.Load(configuracion);




                string strUrlWsaaWsdl = Xmlconfig.SelectSingleNode("//DEFAULT_URLWSAAWSDL").InnerText;

                string strIdServicioNegocio = Xmlconfig.SelectSingleNode("//DEFAULT_SERVICIO").InnerText;
                // si es homo el certHomo y si es produc el certificado es cert.

                string strRutaCertSigner = path + Xmlconfig.SelectSingleNode("//DEFAULT_CERTSIGNER").InnerText;
                string pass = Xmlconfig.SelectSingleNode("//DEFAULT_CERTIFICADO_PASSWORD").InnerText;


                SecureString strPasswordSecureString = new SecureString();
                bool blnVerboseMode = DEFAULT_VERBOSE;

                string strProxy = DEFAULT_PROXY;
                string strProxyUser = DEFAULT_PROXY_USER;
                string strProxyPassword = DEFAULT_PROXY_PASSWORD;



                if (!string.IsNullOrEmpty(pass))
                {
                    foreach (char character in pass.ToCharArray())
                        strPasswordSecureString.AppendChar(character);
                    strPasswordSecureString.MakeReadOnly();
                }

                // Argumentos OK, entonces procesar normalmente...


                string strTicketRespuesta; 
       

                strTicketRespuesta = ObtenerLoginTicketResponseProduccion(strIdServicioNegocio, strUrlWsaaWsdl, strRutaCertSigner, strPasswordSecureString, strProxy, strProxyUser, strProxyPassword, blnVerboseMode, path, SAL_TK);

                return strTicketRespuesta;
            }
            catch (Exception excepcionAlObtenerTicket)
            {
                throw excepcionAlObtenerTicket;
            }
        }

        public string ObtenerLoginTicketResponseProduccion(string argServicio, string argUrlWsaa, string argRutaCertX509Firmante, SecureString argPassword, string argProxy, string argProxyUser, string argProxyPassword, bool argVerbose, string argPath, string argSal)
        {
            this.RutaDelCertificadoFirmante = argRutaCertX509Firmante;
            this._verboseMode = argVerbose;
            CertificadosX509Lib.VerboseMode = argVerbose;
            string sal = "nada";

            string cmsFirmadoBase64 = "";
            string loginTicketResponse;
            XmlNode xmlNodoUniqueId;
            XmlNode xmlNodoGenerationTime;
            XmlNode xmlNodoExpirationTime;
            XmlNode xmlNodoService;

            // PASO 1: Genero el Login Ticket Request
            try
            {
                _globalUniqueID += 1;

                XmlLoginTicketRequest = new XmlDocument();
                XmlLoginTicketRequest.LoadXml(XmlStrLoginTicketRequestTemplate);

                xmlNodoUniqueId = XmlLoginTicketRequest.SelectSingleNode("//uniqueId");
                xmlNodoGenerationTime = XmlLoginTicketRequest.SelectSingleNode("//generationTime");
                xmlNodoExpirationTime = XmlLoginTicketRequest.SelectSingleNode("//expirationTime");
                xmlNodoService = XmlLoginTicketRequest.SelectSingleNode("//service");

                xmlNodoGenerationTime.InnerText = DateTime.Now.AddMinutes(-10).ToString("s");
                xmlNodoExpirationTime.InnerText = DateTime.Now.AddMinutes(+10).ToString("s");
                xmlNodoUniqueId.InnerText = System.Convert.ToString(_globalUniqueID);
                xmlNodoService.InnerText = argServicio;
                this.Service = argServicio;
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                if (this._verboseMode)
                    Console.WriteLine(XmlLoginTicketRequest.OuterXml);
            }
            catch (Exception excepcionAlGenerarLoginTicketRequest)
            {
                throw new Exception("***Error GENERANDO el LoginTicketRequest : " + excepcionAlGenerarLoginTicketRequest.Message + excepcionAlGenerarLoginTicketRequest.StackTrace);
            }

            // PASO 2: Firmo el Login Ticket Request
            try
            {
                if (this._verboseMode)

                {



                    X509Certificate2 certFirmante = new X509Certificate2();
 

                    certFirmante = new X509Certificate2(System.IO.File.ReadAllBytes(RutaDelCertificadoFirmante), argPassword,
             (X509KeyStorageFlags.MachineKeySet | X509KeyStorageFlags.Exportable | X509KeyStorageFlags.PersistKeySet));

                    // Convierto el login ticket request a bytes, para firmar
                    Encoding EncodedMsg = Encoding.UTF8;
                    byte[] msgBytes = EncodedMsg.GetBytes(XmlLoginTicketRequest.OuterXml);

                    // Firmo el msg y paso a Base64
                    byte[] encodedSignedCms = CertificadosX509Lib.FirmaBytesMensaje(msgBytes, certFirmante);
                    cmsFirmadoBase64 = Convert.ToBase64String(encodedSignedCms);
                }
            }
            catch (Exception excepcionAlFirmar)
            {
                throw new Exception("***Error FIRMANDO el LoginTicketRequest c# :   " + excepcionAlFirmar.Message + " " + RutaDelCertificadoFirmante);
            }

            // PASO 3: Invoco al WSAA para obtener el Login Ticket Response
            try
            {


                // '''''''''''''''''''' Instancio el ws desa o produc

                // factElectForm.WSLogin.LoginCMSClient cc = new factElectForm.WSLogin.LoginCMSClient();  ' desarrollo


                WSLoginProduc.LoginCMSClient servicioWsaa = new WSLoginProduc.LoginCMSClient(); // Produc



                loginTicketResponse = servicioWsaa.loginCms(cmsFirmadoBase64);

                
            }
            catch (Exception excepcionAlInvocarWsaa)
            {
                throw new Exception("***Error INVOCANDO al servicio WSAA : " + excepcionAlInvocarWsaa.Message);
            }

 

            return loginTicketResponse;
        }


 
        public string IniciarProducionFactura(string path, string configuracion, string response)
        {
            try
            {
                bool sal = false;

                XmlDocument Xmlconfig = new XmlDocument();


                // en config los datos de proccion
                Xmlconfig.Load(configuracion);




                string strUrlWsaaWsdl = Xmlconfig.SelectSingleNode("//DEFAULT_URLWSAAWSDL").InnerText;

                string strIdServicioNegocio = Xmlconfig.SelectSingleNode("//DEFAULT_SERVICIO").InnerText;
                // si es homo el certHomo y si es produc el certificado es cert.

                string strRutaCertSigner = path + Xmlconfig.SelectSingleNode("//DEFAULT_CERTSIGNER").InnerText;
                string pass = Xmlconfig.SelectSingleNode("//DEFAULT_CERTIFICADO_PASSWORD").InnerText;


                SecureString strPasswordSecureString = new SecureString();
                bool blnVerboseMode = DEFAULT_VERBOSE;

                string strProxy = DEFAULT_PROXY;
                string strProxyUser = DEFAULT_PROXY_USER;
                string strProxyPassword = DEFAULT_PROXY_PASSWORD;



                if (!string.IsNullOrEmpty(pass))
                {
                    foreach (char character in pass.ToCharArray())
                        strPasswordSecureString.AppendChar(character);
                    strPasswordSecureString.MakeReadOnly();
                }

                // Argumentos OK, entonces procesar normalmente...


                string strTicketRespuesta;


                strTicketRespuesta = ObtenerLoginTicketResponsePrueba(strIdServicioNegocio, strUrlWsaaWsdl, strRutaCertSigner, strPasswordSecureString, strProxy, strProxyUser, strProxyPassword, blnVerboseMode, path, SAL_TK);

                return strTicketRespuesta;
            }
            catch (Exception excepcionAlObtenerTicket)
            {
                throw excepcionAlObtenerTicket;
            }
        }

        public string ObtenerLoginTicketResponsePrueba(string argServicio, string argUrlWsaa, string argRutaCertX509Firmante, SecureString argPassword, string argProxy, string argProxyUser, string argProxyPassword, bool argVerbose, string argPath, string argSal)
        {
            this.RutaDelCertificadoFirmante = argRutaCertX509Firmante;
            this._verboseMode = argVerbose;
            CertificadosX509Lib.VerboseMode = argVerbose;
            string sal = "nada";

            string cmsFirmadoBase64 = "";
            string loginTicketResponse;
            XmlNode xmlNodoUniqueId;
            XmlNode xmlNodoGenerationTime;
            XmlNode xmlNodoExpirationTime;
            XmlNode xmlNodoService;

            // PASO 1: Genero el Login Ticket Request
            try
            {
                _globalUniqueID += 1;

                XmlLoginTicketRequest = new XmlDocument();
                XmlLoginTicketRequest.LoadXml(XmlStrLoginTicketRequestTemplate);

                xmlNodoUniqueId = XmlLoginTicketRequest.SelectSingleNode("//uniqueId");
                xmlNodoGenerationTime = XmlLoginTicketRequest.SelectSingleNode("//generationTime");
                xmlNodoExpirationTime = XmlLoginTicketRequest.SelectSingleNode("//expirationTime");
                xmlNodoService = XmlLoginTicketRequest.SelectSingleNode("//service");

                xmlNodoGenerationTime.InnerText = DateTime.Now.AddMinutes(-10).ToString("s");
                xmlNodoExpirationTime.InnerText = DateTime.Now.AddMinutes(+10).ToString("s");
                xmlNodoUniqueId.InnerText = System.Convert.ToString(_globalUniqueID);
                xmlNodoService.InnerText = argServicio;
                this.Service = argServicio;
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                if (this._verboseMode)
                    Console.WriteLine(XmlLoginTicketRequest.OuterXml);
            }
            catch (Exception excepcionAlGenerarLoginTicketRequest)
            {
                throw new Exception("***Error GENERANDO el LoginTicketRequest : " + excepcionAlGenerarLoginTicketRequest.Message + excepcionAlGenerarLoginTicketRequest.StackTrace);
            }

            // PASO 2: Firmo el Login Ticket Request
            try
            {
                if (this._verboseMode)

                {



                    X509Certificate2 certFirmante = new X509Certificate2();


                    certFirmante = new X509Certificate2(System.IO.File.ReadAllBytes(RutaDelCertificadoFirmante), argPassword,
             (X509KeyStorageFlags.MachineKeySet | X509KeyStorageFlags.Exportable | X509KeyStorageFlags.PersistKeySet));

                    // Convierto el login ticket request a bytes, para firmar
                    Encoding EncodedMsg = Encoding.UTF8;
                    byte[] msgBytes = EncodedMsg.GetBytes(XmlLoginTicketRequest.OuterXml);

                    // Firmo el msg y paso a Base64
                    byte[] encodedSignedCms = CertificadosX509Lib.FirmaBytesMensaje(msgBytes, certFirmante);
                    cmsFirmadoBase64 = Convert.ToBase64String(encodedSignedCms);
                }
            }
            catch (Exception excepcionAlFirmar)
            {
                throw new Exception("***Error FIRMANDO el LoginTicketRequest c# :   " + excepcionAlFirmar.Message + " " + RutaDelCertificadoFirmante);
            }

            // PASO 3: Invoco al WSAA para obtener el Login Ticket Response
            try
            {

                 
             
                WSLogin.LoginCMSClient servicioWsaa = new WSLogin.LoginCMSClient(); // Prueba



                loginTicketResponse = servicioWsaa.loginCms(cmsFirmadoBase64);


            }
            catch (Exception excepcionAlInvocarWsaa)
            {
                throw new Exception("***Error INVOCANDO al servicio WSAA : " + excepcionAlInvocarWsaa.Message);
            }



            return loginTicketResponse;
        }



    }



    class CertificadosX509Lib
    {
        public static bool VerboseMode = false;

        /// <summary>
        ///     ''' Firma mensaje
        ///     ''' </summary>
        ///     ''' <param name="argBytesMsg">Bytes del mensaje</param>
        ///     ''' <param name="argCertFirmante">Certificado usado para firmar</param>
        ///     ''' <returns>Bytes del mensaje firmado</returns>
        ///     ''' <remarks></remarks>
        public static byte[] FirmaBytesMensaje(byte[] argBytesMsg, X509Certificate2 argCertFirmante
    )
        {
            try
            {
                // Pongo el mensaje en un objeto ContentInfo (requerido para construir el obj SignedCms)
                ContentInfo infoContenido = new ContentInfo(argBytesMsg);
                SignedCms cmsFirmado = new SignedCms(infoContenido);

                // Creo objeto CmsSigner que tiene las caracteristicas del firmante
                CmsSigner cmsFirmante = new CmsSigner(argCertFirmante);
                cmsFirmante.IncludeOption = X509IncludeOption.EndCertOnly;

                if (VerboseMode)
                    Console.WriteLine("***Firmando bytes del mensaje...");
                // Firmo el mensaje PKCS #7
                cmsFirmado.ComputeSignature(cmsFirmante);

                if (VerboseMode)
                    Console.WriteLine("***OK mensaje firmado");

                // Encodeo el mensaje PKCS #7.
                return cmsFirmado.Encode();
            }
            catch (Exception excepcionAlFirmar)
            {
                throw new Exception("***Error al firmar: " + excepcionAlFirmar.Message);
                return null;
            }
        }

     

    }


}
