using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Ralkal
{
    public partial class Productos_categoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod()]

        public static void WmEliminar(string Ids)
        {
            try
            {
                Bll.BllPRODUCTO_CATEGORIAS.DameInstancia().Eliminar(Convert.ToInt32(Ids));
            }
            catch (Exception)
            {

                throw;
            }



        }
    }
}