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
    public partial class Puestos : System.Web.UI.UserControl
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
                        Be.PUESTOS CLi = new Be.PUESTOS();
                        List<Be.PUESTOS> ListaCli = Bll.BllPUESTOS.DameInstancia().Listar("Ids", Request.QueryString["Ids"].ToString());
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
                Be.PUESTOS CLi = new Be.PUESTOS();

                CLi.Nombre = TxtNombre.Text.ToUpper();
                CLi.Descripcion = TxtDescripcion.Text.ToUpper();
                Bll.BllPUESTOS.DameInstancia().Alta(CLi);
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
                Be.PUESTOS CLi1 = new Be.PUESTOS();

                CLi1.Nombre = TxtNombre.Text.ToUpper();
                CLi1.Descripcion = TxtDescripcion.Text.ToUpper();
                CLi1.Id = Convert.ToInt32(TxtId.Text);
                Bll.BllPUESTOS.DameInstancia().Modificacion(CLi1);
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

    

      


    }
}