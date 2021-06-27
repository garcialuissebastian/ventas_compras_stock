using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
namespace HardSoft.App.Ralkal
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LblMsg.Text = "";

                if (!Page.IsPostBack)
                {
                    DateTime localDate = DateTime.Now;

                    TxtDesde.Text = localDate.ToString("dd/MM/yyyy");

                    cmbTipoDoc.SelectedIndex = 0;
                   
                    

                    if (Request.QueryString["Ids"] != null)
                    {
                        Be.Clientes CLi = new Be.Clientes();
                        List<Be.Clientes> ListaCli = Bll.BllClientes.DameInstancia().Listar("Ids", Request.QueryString["Ids"].ToString());
                        if(ListaCli.Count> 0){
                        CLi = ListaCli[0];
                        TxtId.Text = CLi.Id.ToString();
                        TxtNombre.Text = CLi.Nombre;
                        TxtApellido.Text = CLi.Apellido;
                        cmbTipoDoc.SelectedValue = CLi.Doc_tipo;
                        TxtNunDoc.Text = CLi.Doc_no;

                        DateTime dt = Convert.ToDateTime(CLi.Fecha_nac);
                        TxtDesde.Text = dt.ToString("dd/MM/yyyy");

                        TxtLugarNac.Text = CLi.Lugar_nac;
                        TxtEstadoCivil.Text = CLi.Estado_civil;
                        TxtDomiParticular.Text = CLi.Domi_particular;
                        TxtEntreParticular.Text = CLi.entre_particular;
                        TxtPuertaParticular.Text = CLi.Puerta_particular;
                        TxtDepParticular.Text = CLi.Dep_particular;
                        TxtCPParticular.Text = CLi.Cp_particular;
                        TxtLocalidadParticular.Text = CLi.Loc_particular;
                        cmProvParticular.SelectedValue = CLi.Prov_particular;

                        TxtRazonComercial.Text = CLi.Razon_social;
                        TxtCuit.Text = CLi.Cuit;
                        TxtRamo.Text = CLi.Ramo;
                        TxtDomiComercial.Text = CLi.Domi_comercial;
                        TxtEntreComercial.Text = CLi.entre_comercial;
                        TxtPuertaComercial.Text = CLi.Puerta_comercial;
                        TxtDepComercial.Text = CLi.Dep_comercial;
                        TxtCPComercial.Text = CLi.Cp_comercial;
                        TxtLocalidadComercial.Text = CLi.Loc_comercial;
                        cmbProvComercial.SelectedValue = CLi.Prov_comercial;

                        TxtTelefono.Text = CLi.Tel;
                        TxtCel.Text = CLi.Cel;
                        txtMail.Text = CLi.Mail;
                        TxtFax.Text = CLi.Fax;
                        }

                    }
                }
            }
            catch (Exception ex)
            {

                LblMsg.Text = ex.Message;
            }
        }


        public void Limpiar() {

            TxtId.Text = "";
            TxtNombre.Text = "";
            TxtApellido.Text = "";

            TxtNunDoc.Text = "";
             
            TxtDesde.Text = ""; 

            TxtLugarNac.Text = "";
            TxtEstadoCivil.Text = "";
            TxtDomiParticular.Text = "";
            TxtEntreParticular.Text = "";
            TxtPuertaParticular.Text = "";
            TxtDepParticular.Text = "";
            TxtCPParticular.Text = "";
            TxtLocalidadParticular.Text = "";
          
            TxtRazonComercial.Text = "";
            TxtCuit.Text = "";
            TxtRamo.Text = "";
            TxtDomiComercial.Text = "";
            TxtEntreComercial.Text = "";
            TxtPuertaComercial.Text = "";
            TxtDepComercial.Text = "";
            TxtCPComercial.Text = "";
            TxtLocalidadComercial.Text = "";
            
            TxtTelefono.Text = "";
            TxtCel.Text = "";
            txtMail.Text = "";
            TxtFax.Text = "";
        
        }

        protected void bntAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Be.Clientes CLi = new Be.Clientes();

                CLi.Nombre = TxtNombre.Text.ToUpper();
                CLi.Apellido = TxtApellido.Text.ToUpper();
                CLi.Doc_tipo = cmbTipoDoc.SelectedValue;
                CLi.Doc_no = TxtNunDoc.Text.ToUpper();
                CLi.Fecha_nac = TxtDesde.Text.ToUpper();
                CLi.Lugar_nac = TxtLugarNac.Text.ToUpper();
                CLi.Estado_civil = TxtEstadoCivil.Text.ToUpper();
                CLi.Domi_particular = TxtDomiParticular.Text.ToUpper();
                CLi.entre_particular = TxtEntreParticular.Text.ToUpper();
                CLi.Puerta_particular = TxtPuertaParticular.Text.ToUpper();
                CLi.Dep_particular = TxtDepParticular.Text.ToUpper();
                CLi.Cp_particular = TxtCPParticular.Text.ToUpper();
                CLi.Loc_particular = TxtLocalidadParticular.Text.ToUpper();
                CLi.Prov_particular = cmProvParticular.SelectedValue;

                CLi.Razon_social = TxtRazonComercial.Text.ToUpper();
                CLi.Cuit = TxtCuit.Text.ToUpper();
                CLi.Ramo = TxtRamo.Text.ToUpper();
                CLi.Domi_comercial = TxtDomiComercial.Text.ToUpper();
                CLi.entre_comercial = TxtEntreComercial.Text.ToUpper();
                CLi.Puerta_comercial = TxtPuertaComercial.Text.ToUpper();
                CLi.Dep_comercial = TxtDepComercial.Text.ToUpper();
                CLi.Cp_comercial = TxtCPComercial.Text.ToUpper();
                CLi.Loc_comercial = TxtLocalidadComercial.Text.ToUpper();
                CLi.Prov_comercial = cmbProvComercial.SelectedValue;

                CLi.Tel = TxtTelefono.Text.ToUpper();
                CLi.Cel = TxtCel.Text.ToUpper();
                CLi.Mail = txtMail.Text.ToUpper();
                CLi.Fax = TxtFax.Text.ToUpper();
                Bll.BllClientes.DameInstancia().Alta(CLi);
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
                Be.Clientes CLi1 = new Be.Clientes();

                CLi1.Nombre = TxtNombre.Text.ToUpper();
                CLi1.Apellido = TxtApellido.Text.ToUpper();
                CLi1.Doc_tipo = cmbTipoDoc.SelectedValue;
                CLi1.Doc_no = TxtNunDoc.Text.ToUpper();

                CLi1.Fecha_nac = TxtDesde.Text.ToUpper();



                CLi1.Lugar_nac = TxtLugarNac.Text.ToUpper();
                CLi1.Estado_civil = TxtEstadoCivil.Text.ToUpper();
                CLi1.Domi_particular = TxtDomiParticular.Text.ToUpper();
                CLi1.entre_particular = TxtEntreParticular.Text.ToUpper();
                CLi1.Puerta_particular = TxtPuertaParticular.Text.ToUpper();
                CLi1.Dep_particular = TxtDepParticular.Text.ToUpper();
                CLi1.Cp_particular = TxtCPParticular.Text.ToUpper();
                CLi1.Loc_particular = TxtLocalidadParticular.Text.ToUpper();
                CLi1.Prov_particular = cmProvParticular.SelectedValue;

                CLi1.Razon_social = TxtRazonComercial.Text.ToUpper();
                CLi1.Cuit = TxtCuit.Text.ToUpper();
                CLi1.Ramo = TxtRamo.Text.ToUpper();
                CLi1.Domi_comercial = TxtDomiComercial.Text.ToUpper();
                CLi1.entre_comercial = TxtEntreComercial.Text.ToUpper();
                CLi1.Puerta_comercial = TxtPuertaComercial.Text.ToUpper();
                CLi1.Dep_comercial = TxtDepComercial.Text.ToUpper();
                CLi1.Cp_comercial = TxtCPComercial.Text.ToUpper();
                CLi1.Loc_comercial = TxtLocalidadComercial.Text.ToUpper();
                CLi1.Prov_comercial = cmbProvComercial.SelectedValue;

                CLi1.Tel = TxtTelefono.Text.ToUpper();
                CLi1.Cel = TxtCel.Text.ToUpper();
                CLi1.Mail = txtMail.Text.ToUpper();
                CLi1.Fax = TxtFax.Text.ToUpper();
                CLi1.Id =Convert.ToInt32( TxtId.Text);
                Bll.BllClientes.DameInstancia().Modificacion(CLi1);
                LblMsg.Text = "Modificado";
            }
            catch (Exception ex)
            {

                LblMsg.Text = ex.Message;
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if(!string.IsNullOrEmpty(TxtId.Text)){


                    Bll.BllClientes.DameInstancia().Eliminar(Convert.ToInt32(TxtId.Text));
                    LblMsg.Text = "El registro fue eliminado";
                }
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
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sa = TxtPuertaParticular.Text.ToUpper(); 
        }
        
    }
}