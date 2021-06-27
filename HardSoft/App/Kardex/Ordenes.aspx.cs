using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
//using HardSoft.wsfeProd;     //Produccion
using HardSoft.wsfe;
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
namespace HardSoft.App.Kardex
{
    public partial class Ordenes : System.Web.UI.Page
    {

        Ticket tk = new TicketHomo();

       
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Access-Control-Allow-Origin", "*");
          
 

                  if (Session["UsuarioActual"]==null)
            {
                Response.Redirect("/", false);

            }

            HttpContext.Current.Session["SelectArt"] = null;
            HttpContext.Current.Session["SelectCheque"] = null;
            HttpContext.Current.Session["SelectTJ"] = null;

            HttpContext.Current.Session["SelectTJ"] = null;
            if (!Page.IsPostBack)
            {
                if (HttpContext.Current.Session["SelectArtOS"] != null) {
                
                
                }
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
                            Random d = new Random();
                            item.IdGrilla = (d.Next() * (list.Count()));


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
        public static Be.kx_cliente validad_doc(string v_doc, string v_tipo)
        {
            kx_cliente sal = new kx_cliente();
            try
            {
                if (!string.IsNullOrEmpty(v_doc)) {

                    string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                    List<Be.kx_cliente> list = new List<Be.kx_cliente>(); 
                    list = Bll.Bllkx_cliente.DameInstancia().Listar("4", v_doc, user); 
                    if (list.Count>0) {
                        throw new Exception("Ya esta agregado como cliente.");
                    }
                    TicketProduc tk = new TicketProduc(); 
                  sal=  tk.BuscarPersonas(v_tipo, Convert.ToInt64(v_doc));
                }
               
            }
            catch (Exception)
            {

                throw;
            }
            return  sal;

}
// [WebMethod()]
//public static Be.kx_cliente validad_doc(string v_doc, string v_tipo)
//{
//    if (HttpContext.Current.Session["UsuarioActual"] == null)
//    {
//        throw new Exception("acceso invalido");
//    }
//      Be.kx_cliente cli = new Be.kx_cliente();
//    string v_cuit = "";
//    string sal = "";
//    object obj = null;
//    if (v_tipo == "DNI")
//    {
//        var url = "https://soa.afip.gob.ar/sr-padron/v2/personas/" + v_doc; 
//        var client34 = new WebClient();            
//        sal = JObject.Parse(client34.DownloadString(url))["success"].ToString();
// sal = sal.Replace("[", string.Empty);
// sal = sal.Replace("]", string.Empty);
// sal = sal.Replace("\r", string.Empty);
// sal = sal.Replace("\n", string.Empty);
//        if(sal=="True"){
//            sal = JObject.Parse(client34.DownloadString(url))["data"].ToString();
//            sal = sal.Replace("[", string.Empty);
//            sal = sal.Replace("]", string.Empty);
//            sal = sal.Replace("\r", string.Empty);
//            sal = sal.Replace("\n", string.Empty);
//            v_cuit = sal.Trim();

//        }        
//    }
//    else {
//        v_cuit = v_doc;

//    }
//    cli.Doc_No = v_doc;
//    var url2 = "https://soa.afip.gob.ar/sr-padron/v2/persona/" + v_cuit;

//     // Syncronious Consumption
//     var syncClient2 = new WebClient();
//     var content2 = syncClient2.DownloadString(url2);




//         try
//         {
//             sal = JObject.Parse(syncClient2.DownloadString(url2))["data"]["categoriasMonotributo"].ToString();
//             sal = sal.Replace("[", string.Empty);
//             sal = sal.Replace("]", string.Empty);
//             sal = sal.Replace("\r", string.Empty);
//             sal = sal.Replace("\n", string.Empty);
//             cli.Iva = "MONOTRIBUTO";
//         }
//         catch (Exception)
//         {
//         }


//         try
//         {
//             sal = JObject.Parse(syncClient2.DownloadString(url2))["data"]["idCatAutonomo"].ToString();
//             sal = sal.Replace("[", string.Empty);
//             sal = sal.Replace("]", string.Empty);
//             sal = sal.Replace("\r", string.Empty);
//             sal = sal.Replace("\n", string.Empty);
//             cli.Iva = "RESPONSABLE INSCRIPTO";
//         }
//         catch (Exception)
//         {
//         }
//         // Create the Json serializer and parse the response
//         DataContractJsonSerializer serializer2 = new DataContractJsonSerializer(typeof(Be.RootObject));

//         using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(content2)))
//         {
//             // deserialize the JSON object using the WeatherData type.
//             var RootObject = (Be.RootObject)serializer2.ReadObject(ms);


//             if (RootObject.data != null)
//             {
//                 try
//                 {

//                     cli.Calle = RootObject.data.domicilioFiscal.direccion;
//                     cli.Cp = RootObject.data.domicilioFiscal.codPostal;
//                     cli.Provincia = RootObject.data.domicilioFiscal.idProvincia.ToString();
//                 }
//                 catch (Exception)
//                 {

//                 }



//                 cli.Nombre = RootObject.data.nombre;


//             }

//             return cli;

//         }
//}

[WebMethod()]
         public static Be.kx_cliente validad_doc2(string v_doc, string v_tipo)
         {

             if (HttpContext.Current.Session["UsuarioActual"] == null)
             {
                 throw new Exception("acceso invalido");
             }
             Be.kx_cliente cli = new Be.kx_cliente();

             string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
             cli =  Bllkx_cbtes.DameInstancia().WsExiste(v_doc,user);
             cli.Cta_contable = "SI"; // existe en la base cliente
             if (cli.Nombre == null)
             {

                 string v_cuit = "";
                 string sal = "";
                 object obj = null;

                // var url = "https://soa.afip.gob.ar/sr-padron/v2/personas/" + v_doc;
                // var client34 = new WebClient();
                // sal = JObject.Parse(client34.DownloadString(url))["success"].ToString();
                // sal = sal.Replace("[", string.Empty);
                // sal = sal.Replace("]", string.Empty);
                // sal = sal.Replace("\r", string.Empty);
                // sal = sal.Replace("\n", string.Empty);
                // if (sal == "True")
                // {
                //     sal = JObject.Parse(client34.DownloadString(url))["data"].ToString();
                //     sal = sal.Replace("[", string.Empty);
                //     sal = sal.Replace("]", string.Empty);
                //     sal = sal.Replace("\r", string.Empty);
                //     sal = sal.Replace("\n", string.Empty);
                //     v_cuit = sal.Trim();
                //     cli.Doc_No = v_doc;
                    
                // }
                // else
                // {

                //     v_cuit = v_doc;
                // }

                // var url2 = "https://soa.afip.gob.ar/sr-padron/v2/persona/" + v_cuit;

                // // Syncronious Consumption
                // var syncClient2 = new WebClient();
                // var content2 = syncClient2.DownloadString(url2);
                // try
                // {
                //     sal = JObject.Parse(syncClient2.DownloadString(url2))["data"]["numeroDocumento"].ToString();
                // sal = sal.Replace("[", string.Empty);
                // sal = sal.Replace("]", string.Empty);
                // sal = sal.Replace("\r", string.Empty);
                // sal = sal.Replace("\n", string.Empty);
                //cli.Doc_No = sal.Trim();

                // }
                // catch (Exception)
                // { 
                // }

                //  try
                // {
                //     sal = JObject.Parse(syncClient2.DownloadString(url2))["data"]["tipoDocumento"].ToString();
                // sal = sal.Replace("[", string.Empty);
                // sal = sal.Replace("]", string.Empty);
                // sal = sal.Replace("\r", string.Empty);
                // sal = sal.Replace("\n", string.Empty);
                // cli.Tipo_Doc = sal.Trim();

                // }
                // catch (Exception)
                // { 
                // }
                 


                 //try
                 //{
                 //    sal = JObject.Parse(syncClient2.DownloadString(url2))["data"]["categoriasMonotributo"].ToString();
                 //    sal = sal.Replace("[", string.Empty);
                 //    sal = sal.Replace("]", string.Empty);
                 //    sal = sal.Replace("\r", string.Empty);
                 //    sal = sal.Replace("\n", string.Empty);
                 //    cli.Iva = "MONOTRIBUTO";
                 //}
                 //catch (Exception)
                 //{
                 //}


                 //try
                 //{
                 //    sal = JObject.Parse(syncClient2.DownloadString(url2))["data"]["idCatAutonomo"].ToString();
                 //    sal = sal.Replace("[", string.Empty);
                 //    sal = sal.Replace("]", string.Empty);
                 //    sal = sal.Replace("\r", string.Empty);
                 //    sal = sal.Replace("\n", string.Empty);
                 //    cli.Iva = "RESPONSABLE INSCRIPTO";
                 //}
                 //catch (Exception)
                 //{
                 //}
                 //// Create the Json serializer and parse the response
                 //DataContractJsonSerializer serializer2 = new DataContractJsonSerializer(typeof(Be.RootObject));

                 //using (var ms = new MemoryStream(Encoding.Unicode.GetBytes(content2)))
                 //{
                 //    // deserialize the JSON object using the WeatherData type.
                 //    var RootObject = (Be.RootObject)serializer2.ReadObject(ms);



                 //    if (RootObject.data != null)
                 //    {
                 //        try
                 //        {
                             
                 //            cli.Calle = RootObject.data.domicilioFiscal.direccion;
                 //            cli.Cp = RootObject.data.domicilioFiscal.codPostal;
                 //            cli.Provincia = RootObject.data.domicilioFiscal.idProvincia.ToString();
                 //        }
                 //        catch (Exception)
                 //        {
                           
                 //        }

                       

                 //        cli.Nombre = RootObject.data.nombre;
                       
   
                 //    }


                 //}
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
                if (HttpContext.Current.Session["SelectCheque"]!= null)
                {
               list= (List<Be.kx_cheques>)HttpContext.Current.Session["SelectCheque"];
               
               v_obj.Id = list.Count() + 1;
                    list.Add(v_obj);
                }
                else {
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
        public static List<orden> WsListar_orden(string v_tipo, string v_valor, string v_valor1)

        {
            try
            {
                List<orden> list = new List<orden>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_cbtes.DameInstancia().Listar_orden(v_tipo, v_valor.ToUpper().Trim(), v_valor1.ToUpper().Trim(), user); 

                return list;
            }
            catch (Exception)

            {
                throw;
            }
        }



        [WebMethod()]
        public static string WmAddFc(Be.kx_cbtes v_obj)
        {
            try
            { v_obj.Id_config= ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                string Idcbte = Bll.Bllkx_cbtes.DameInstancia().Orden_alta(v_obj);
                return Idcbte;
            }
            catch (Exception)
            {

                throw;
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
            

            string ppr = Bllkx_cbtes.DameInstancia().PathReportCbte(TxtTipoRep.Text);

  

            localReport.ReportEmbeddedResource = ppr;

        

            if (true)
            {
                DataSet ds = Bll.Bllkx_cbtes.DameInstancia().Cbate(TxtRpid.Text);

                string sal = ds.Tables["cab"].Rows[0]["CodBarra"].ToString();
                string salida =  GenBarra.GenerarAFIP(sal);
                mysql_usuarios user = (mysql_usuarios)Session["UsuarioActual"];
                byte[] arrImg = user.Config.Logo;
                string salida2 = Convert.ToBase64String(arrImg);
              

                
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
                "  <MarginTop>0.05in</MarginTop>" +
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


                Response.AddHeader("content-disposition", "attachment; filename=Cbate." + fileNameExtension);


                Response.BinaryWrite(renderedBytes);
                Response.End();

            }
            }
            catch (Exception ex)
            

                {
                // persistir
                    try
                    {                  
                Be.Bitacora v_bi =new Bitacora();
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
                if (tipo =="Monotributo") {
                   pais p = new pais();
                    p.id_pais = "17";
                    p.nombre ="Orden de Venta";
                    list.Add(p);

                     

                }


                if (tipo == "Responsable Inscripto")
                {
                    pais p = new pais();
                    p.id_pais = "17";
                    p.nombre = "Orden de Venta";
                    list.Add(p);

                }
                return list;
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
            List<Be.kx_articulo> list2 = new List<Be.kx_articulo>();
            if (HttpContext.Current.Session["SelectArt"] == null)
            {
                v_obj.IdGrilla = 1;
                list2.Add(v_obj);

                HttpContext.Current.Session["SelectArt"] = list2;
            }
            else {

                list2 = (List<Be.kx_articulo>)HttpContext.Current.Session["SelectArt"];
                v_obj.IdGrilla = (1 + list2.Count());
                list2.Add(v_obj);
                HttpContext.Current.Session["SelectArt"] = list2;
            }
            return list2;
        }
   
    
    }

   

    
}