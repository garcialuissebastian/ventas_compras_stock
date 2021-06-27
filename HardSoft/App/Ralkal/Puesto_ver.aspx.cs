using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Ralkal
{
    public partial class Puesto_ver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]

        public static List<Be.PUESTOS> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.PUESTOS> list = new List<Be.PUESTOS>();

                list = Bll.BllPUESTOS.DameInstancia().Listar( v_tipo,   v_valor.ToUpper().Trim());
                return list;
            }
            catch (Exception)
            {
                
                throw;
            }
             
        
        }


    }
}