using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Ralkal
{
    public partial class Personal_ver : System.Web.UI.Page

    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]

        public static List<Be.PERSONAL> WsListar(string v_tipo, string v_valor)
        {
            try
            {
                List<Be.PERSONAL> list = new List<Be.PERSONAL>();

                list = Bll.BllPERSONAL.DameInstancia().Listar( v_tipo,   v_valor.ToUpper().Trim());
                return list;
            }
            catch (Exception)
            {
                
                throw;
            }
             
        
        }


    }
}