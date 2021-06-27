using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;

namespace HardSoft.App.Ralkal.CtrlFrm
{
    public partial class Categoria_Productos : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LblMsg.Text = "";

                if (!Page.IsPostBack)
                {


                    if (Request.QueryString["Ids"] != null)
                    {
                        Be.PRODUCTO_CATEGORIAS CLi = new Be.PRODUCTO_CATEGORIAS();
                        List<Be.PRODUCTO_CATEGORIAS> ListaCli = Bll.BllPRODUCTO_CATEGORIAS.DameInstancia().Listar("Ids", Request.QueryString["Ids"].ToString());
                        if (ListaCli.Count > 0)
                        {
                            CLi = ListaCli[0];
                            TxtId.Text = CLi.Id.ToString();
                            TxtNombre.Text = CLi.Nombre;
                            TxtDescripcion.Text = CLi.Descripcion;
                        }

                    }
                    else {
                        Limpiar();
                    }
                }
            }
            catch (Exception ex)
            {

                LblMsg.Text = ex.Message;
            }
        }
        public void Limpiar()
        {

            TxtId.Text = "";
            TxtNombre.Text = "";
            TxtDescripcion.Text = "";


        }
        protected void bntAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Be.PRODUCTO_CATEGORIAS CLi = new Be.PRODUCTO_CATEGORIAS();

                CLi.Nombre = TxtNombre.Text.ToUpper();
                CLi.Descripcion = TxtDescripcion.Text.ToUpper();
                Bll.BllPRODUCTO_CATEGORIAS.DameInstancia().Alta(CLi);
                LblMsg.Text = "Guardado";
                Limpiar();
            }
            catch (Exception ex)
            {

                LblMsg.Text = ex.Message;
            }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                Be.PRODUCTO_CATEGORIAS CLi1 = new Be.PRODUCTO_CATEGORIAS();

                CLi1.Nombre = TxtNombre.Text.ToUpper();
                CLi1.Descripcion = TxtDescripcion.Text.ToUpper();
                CLi1.Id = Convert.ToInt32(TxtId.Text);
                Bll.BllPRODUCTO_CATEGORIAS.DameInstancia().Modificacion(CLi1);
                LblMsg.Text = "Modificado";
            }
            catch (Exception ex)
            {

                LblMsg.Text = ex.Message;
            }


        }

        protected void bntCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(TxtId.Text))
                {


                    Bll.BllClientes.DameInstancia().Eliminar(Convert.ToInt32(TxtId.Text));
                    LblMsg.Text = "El registro fue eliminado";
                }
            }
            catch (Exception ex)
            {

                LblMsg.Text = ex.Message;
            }
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

        public static void WmModificar2(Be.PRODUCTO_CATEGORIAS v_obj)
        {
            Be.PRODUCTO_CATEGORIAS pp = new PRODUCTO_CATEGORIAS();

            pp.Nombre = v_obj.Nombre;
            pp.Id = Convert.ToInt32(v_obj.Id);
            pp.Descripcion = v_obj.Descripcion;

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

        public static void WmAlta(string V_nombre, string V_Descripcion)
        {
            Be.PRODUCTO_CATEGORIAS pp = new PRODUCTO_CATEGORIAS();

            pp.Nombre = V_nombre;
            pp.Descripcion = V_Descripcion;

            try
            {
                Bll.BllPRODUCTO_CATEGORIAS.DameInstancia().Alta(pp);
            }
            catch (Exception)
            {

                throw;
            }



        }




    }
}