using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;

namespace HardSoft.App.Ralkal
{
    public partial class Puesto_per : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]

        public static void WmEliminarP(string Ids)
        {
            try
            {
                Bll.BllPUESTOS.DameInstancia().Eliminar(Convert.ToInt32(Ids));
            }
            catch (Exception)
            {

                throw;
            }



        }
        [WebMethod()]

        public static void WmModificarP(string Ids, string V_nombre, string V_Descripcion)
        {
            Be.PUESTOS pp = new PUESTOS();

            pp.Nombre = V_nombre.ToUpper();
            pp.Id = Convert.ToInt32(Ids);
            pp.Descripcion = V_Descripcion.ToUpper();

            try
            {
                Bll.BllPUESTOS.DameInstancia().Modificacion(pp);
            }
            catch (Exception)
            {

                throw;
            }
        }


        [WebMethod()]

        public static void WmModificar2P(Be.PUESTOS v_obj)
        {
            Be.PUESTOS pp = new PUESTOS();

            pp.Nombre = v_obj.Nombre;
            pp.Id = Convert.ToInt32(v_obj.Id);
            pp.Descripcion = v_obj.Descripcion;

            try
            {
                Bll.BllPUESTOS.DameInstancia().Modificacion(pp);
            }
            catch (Exception)
            {

                throw;
            }
        }
    
        [WebMethod()]

        public static void WmAltaP(string V_nombre, string V_Descripcion)
        {
            Be.PUESTOS pp = new PUESTOS();

            pp.Nombre = V_nombre.ToUpper();
            pp.Descripcion = V_Descripcion.ToUpper();

            try
            {
                Bll.BllPUESTOS.DameInstancia().Alta(pp);
            }
            catch (Exception)
            {

                throw;
            }



        }
    }
}