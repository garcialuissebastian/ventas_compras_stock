using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using  Be;
using Bll;
namespace HardSoft.App.Kardex
{
    public partial class Proveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HttpContext.Current.Session["ListaBco"] = null;
            }

        }
        [WebMethod()]

        public static void WmMod(Be.kx_proveedor v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<kx_proveedor_bcos> list1 = new List<kx_proveedor_bcos>();


                if (HttpContext.Current.Session["ListaBco"] != null)
                { 
                    list1 = (List<kx_proveedor_bcos>)HttpContext.Current.Session["ListaBco"];
                    v_obj.Bancos = list1; 

                }
                    Bll.Bllkx_proveedor.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }


        [WebMethod()]


        public static List<kx_proveedor_bcos> WmGvDel_kx_proveedor_bcos(string v_Id)
        {
            try

            {
                List<kx_proveedor_bcos> list = new List<kx_proveedor_bcos>();
                List<kx_proveedor_bcos> list1 = new List<kx_proveedor_bcos>();


                if (HttpContext.Current.Session["ListaBco"] != null)
                {
                  
                    list = (List<kx_proveedor_bcos>)HttpContext.Current.Session["ListaBco"];
                   

                    foreach (var item in list)
                    {
                        if (item.Cbu != v_Id)
                        {
                            list1.Add(item);
                        }

                    }

                }
                HttpContext.Current.Session["ListaBco"] = list1;
                return list1;



            }

            catch (Exception)

            {

                throw;

            }

        }
        [WebMethod()]


        public static List<kx_proveedor_bcos> WmGvAlta_kx_proveedor_bcos(kx_proveedor_bcos v_obj)
        {
            try
            {
                List<kx_proveedor_bcos> list = new List<kx_proveedor_bcos>();
              

                if (HttpContext.Current.Session["ListaBco"] == null) {
                    list.Add(v_obj);
                }
                else
                {
                    list = (List<kx_proveedor_bcos>)HttpContext.Current.Session["ListaBco"];
                    list.Add(v_obj); 
                }
                HttpContext.Current.Session["ListaBco"] = list;
                return  list;

            }
            catch (Exception)
            {
                throw;
            }
        }


        [WebMethod()]

        public static void WmAlta2(Be.kx_proveedor v_obj)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<kx_proveedor_bcos> list1 = new List<kx_proveedor_bcos>();


                if (HttpContext.Current.Session["ListaBco"] != null)
                {

                    list1 = (List<kx_proveedor_bcos>)HttpContext.Current.Session["ListaBco"];
                }
                v_obj.Bancos = list1;
                v_obj.Id_Usuario =    ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                Bll.Bllkx_proveedor.DameInstancia().Alta(v_obj);
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
                // hay q habilitar  padron A5 Y A13 EN AFIP
                if (!string.IsNullOrEmpty(v_doc))
                {

                    string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                     
                 Int32   list = Bll.Bllkx_proveedor.DameInstancia().WsExisteDoc(  v_doc, user);
                    if (list > 0)
                    {
                        throw new Exception("Ya esta agregado como proveedor.");
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

        public static List<Be.provincia> WsListarProvincia(  string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.provincia> list = new List<Be.provincia>();
     
                list = Bll.BllDatosBasico.DameInstancia().ListarProvincias(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.departamento> WsListarDepartamento(string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.departamento> list = new List<Be.departamento>();

                list = Bll.BllDatosBasico.DameInstancia().ListarDepartamento(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
        [WebMethod()]

        public static List<Be.distrito> WsListarDistrito(string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.distrito> list = new List<Be.distrito>();

                list = Bll.BllDatosBasico.DameInstancia().ListarDistrito(v_valor);
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }
    
        [WebMethod()]

        public static List<Be.pais> WsListarP(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.pais> list = new List<Be.pais>();

                list = Bll.BllDatosBasico.DameInstancia().ListarPais();
        
                return list;
            }
            catch (Exception)
            {

                throw;
            }
             
        }

        [WebMethod()]

        public static Be.kx_proveedor WsBuscarP(string v_Id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Be.kx_proveedor sal = new kx_proveedor();
                List<Be.kx_proveedor> list = new List<Be.kx_proveedor>();
if(  HttpContext.Current.Session["Lista"] != null){
   
    list = (List<kx_proveedor>) HttpContext.Current.Session["Lista"];
    foreach (var item in list)
    {
        if(item.Id.ToString() ==v_Id){
            sal = item;

                              string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;

                            sal.Cbates = Bll.Bllkx_cbtes.DameInstancia().WsListarPagar(v_Id, user);
        }
        
    }

} 
                return sal;
            }
            catch (Exception)
            {

                throw;
            }

        }

        [WebMethod()]

        public static List<kx_proveedor_bcos> WsListarBcos(string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<kx_proveedor_bcos> list = new List<kx_proveedor_bcos>();
             
                list = Bll.Bllkx_proveedor.DameInstancia().Listar_kx_proveedor_bcos( v_valor);
                HttpContext.Current.Session["ListaBco"] = list;

                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static List<Be.kx_proveedor> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                List<Be.kx_proveedor> list = new List<Be.kx_proveedor>();
                string user = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                list = Bll.Bllkx_proveedor.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim(), user);
              HttpContext.Current.Session["Lista"] = list;
                
                return list;


            }
            catch (Exception)
            {

                throw;
            }


        }

        [WebMethod()]

        public static void gvProv_del(string v_id)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {

                    throw new Exception("Acceso no valido.");

                }
                Bllkx_proveedor.DameInstancia().Eliminar(Convert.ToInt32(v_id));

            }
            catch (Exception)
            {

                throw;
            }


        
        }
    
        


    }
}