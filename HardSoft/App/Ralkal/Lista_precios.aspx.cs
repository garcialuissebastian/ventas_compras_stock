using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Ralkal
{
    public partial class Lista_precios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]

        public static void WsActivar(string v_valor, string v_tipo)
        {
            try
            {

                Bll.BllLISTA_PRECIOS.DameInstancia().Actividad(v_valor.ToUpper().Trim(), v_tipo);
               
            }
            catch (Exception)
            {

                throw;
            }

        }
        [WebMethod()]

        public static  Be.LISTA_PRECIOS WsListar(  string v_valor)
        {
            try
            {
                Be.LISTA_PRECIOS list = new Be.LISTA_PRECIOS();

                list = Bll.BllLISTA_PRECIOS.DameInstancia().Listar(v_valor.ToUpper().Trim());
                return list;
            }
            catch (Exception)
            {

                throw;
            }
             
        }
         [WebMethod()]

        public static List<Be.Productos> WsListarP(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.Productos> list = new List<Be.Productos>();
                list = (List<Be.Productos>)HttpContext.Current.Session["PRODUCTOS"];

                if (list==null)
                {
                    list = Bll.BllProductos.DameInstancia().Listar(v_tipo, v_valor.ToUpper().Trim());
                
                } 
                HttpContext.Current.Session["PRODUCTOS"] = list;

                
                return list;
            }
            catch (Exception)
            {

                throw;
            }


        }

         [WebMethod()]

         public static void WmAltaP(Be.LISTA_PRECIOS v_obj)
         {
           
 
             try
             {
                 Bll.BllLISTA_PRECIOS.DameInstancia().Alta(v_obj);
             }
             catch (Exception)
             {

                 throw;
             }



         }
    
    
    }
}