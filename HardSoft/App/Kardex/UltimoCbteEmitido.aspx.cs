using Be;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Kardex
{
    public partial class UltimoCbteEmitido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Ticket tk = null;
                if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Modo == "Prueba")
                {
                    tk = new TicketHomo();
                }
                if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.Modo == "Produccion")
                {
                    tk = new TicketProduc();
                }

                tk.UltimoCbteConDatosEnviados(11, 3);


            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}