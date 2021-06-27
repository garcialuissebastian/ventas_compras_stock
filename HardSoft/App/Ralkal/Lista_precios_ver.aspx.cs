using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Ralkal
{
    public partial class Lista_precios_ver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]

        public static List<Be.LISTA_PRECIOS> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.LISTA_PRECIOS> list = new List<Be.LISTA_PRECIOS>();

                list = Bll.BllLISTA_PRECIOS.DameInstancia().Listar( v_tipo,   v_valor.ToUpper().Trim());
                return list;
            }
            catch (Exception)
            {
                
                throw;
            }
             
        
        }

     

    }
}