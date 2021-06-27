using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
using System.Web.Services;
namespace HardSoft.App.Ralkal
{
    public partial class Productos_abm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack){

                //List<Be.PRODUCTO_CATEGORIAS> listP = Bll.BllPRODUCTO_CATEGORIAS.DameInstancia().Listar();              
                
                
                //foreach (var item in listP)
                //{
                //    ListItem t1 = new ListItem();
                //    t1.Text = item.Nombre;
                //    t1.Value = item.Id.ToString();
                //    cmbCategoria.Items.Add(t1);                    
                //}
                //cmbCategoria.SelectedIndex = 0;
                //cmbTasaIVA.SelectedIndex = 0;
            }

        }

        protected void bntAgregar_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void bntCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
        [WebMethod()]

        public static void WmEliminar(string Ids)
        {
            try
            {
                Bll.BllProductos.DameInstancia().Eliminar(Convert.ToInt32(Ids));
            }
            catch (Exception)
            {

                throw;
            }



        }
        [WebMethod()]

        public static void WmModificar(string Ids, string V_nombre, string V_Descripcion)
        {
            Be.PRODUCTO_CATEGORIAS pp = new PRODUCTO_CATEGORIAS();

            pp.Nombre = V_nombre;
            pp.Id = Convert.ToInt32(Ids);
            pp.Descripcion = V_Descripcion;

            try
            {
                Bll.BllPRODUCTO_CATEGORIAS.DameInstancia().Modificacion(pp);
            }
            catch (Exception)
            {

                throw;
            }
        }


        [WebMethod()]

        public static void WmModificar2(Be.Productos v_obj)
        {
            

            try
            {
                Bll.BllProductos.DameInstancia().Modificacion(v_obj);
            }
            catch (Exception)
            {

                throw;
            }
        }


        [WebMethod()]

        public static List<PRODUCTO_CATEGORIAS> WsListarCategorias(string v_tipo, string v_valor)
        {
            try
            {
                return    Bll.BllPRODUCTO_CATEGORIAS.DameInstancia().Listar("","");
               
              
            }
            catch (Exception)
            {
                
                throw;
            }
        
        }
          [WebMethod()]
        public static Be.Productos WsListarProductos(string v_tipo, string v_valor)
        {
            try
            {
                return Bll.BllProductos.DameInstancia().Listar(v_tipo, v_valor)[0];


            }
            catch (Exception)
            {

                throw;
            }

        }

        [WebMethod()]

        public static void WmAlta(Be.Productos v_obj)
        {
          

            try
            {
                Bll.BllProductos.DameInstancia().Alta(v_obj);
            }
            catch (Exception)
            {

                throw;
            }



        }
    
        
    }
}