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
    public partial class Personal : System.Web.UI.Page
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
                   
                   

                    //if (Request.QueryString["Ids"] != null)
                    //{
                    //    Be.PERSONAL CLi = new Be.PERSONAL();
                    //    List<Be.PERSONAL> ListaCli = Bll.BllPERSONAL.DameInstancia().Listar("Ids", Request.QueryString["Ids"].ToString());
                    //    if(ListaCli.Count> 0){
                    //    CLi = ListaCli[0];
                    //    TxtId.Text = CLi.Id.ToString();
                    //    TxtNombre.Text = CLi.Nombre;
                    //    TxtApellido.Text = CLi.Apellido;
                    //    cmbTipoDoc.SelectedValue = CLi.Doc_tipo;

                    //    TxtNunDoc.Text = CLi.Doc_no;

                    //    DateTime dt = Convert.ToDateTime(CLi.Fecha_nac);
                    //    TxtDesde.Text = dt.ToString("dd/MM/yyyy");


                    //    DateTime dt2 = Convert.ToDateTime(CLi.Fecha_ing);
                    //    TxtFechaIngreso.Text = dt2.ToString("dd/MM/yyyy");


                    //    cmbPuesto.SelectedValue = CLi.Puesto;

                    //    TxtLugarNac.Text = CLi.Lugar_nac;
                    //    TxtEstadoCivil.Text = CLi.Estado_civil;
                    //    TxtDomiParticular.Text = CLi.Domi_particular;
                    //    TxtEntreParticular.Text = CLi.entre_particular;
                    //    TxtPuertaParticular.Text = CLi.Puerta_particular;
                    //    TxtDepParticular.Text = CLi.Dep_particular;
                    //    TxtCPParticular.Text = CLi.Cp_particular;
                    //    TxtLocalidadParticular.Text = CLi.Loc_particular;
                    //    cmProvParticular.SelectedValue = CLi.Prov_particular;
 

                    //    TxtTelefono.Text = CLi.Tel;
                    //    TxtCel.Text = CLi.Cel;
                    //    txtMail.Text = CLi.Mail;
                    //    TxtFax.Text = CLi.Fax;
                    //    }

                   // }
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

            TxtFechaIngreso.Text = "";
            
            TxtTelefono.Text = "";
            TxtCel.Text = "";
            txtMail.Text = "";
            TxtFax.Text = "";
        
        }

        protected void bntAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Be.PERSONAL CLi = new Be.PERSONAL();

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

                CLi.Puesto = TxtPuesto.Text;
               
                
                CLi.Fecha_ing = TxtFechaIngreso.Text.ToUpper();

                CLi.Tel = TxtTelefono.Text.ToUpper();
                CLi.Cel = TxtCel.Text.ToUpper();
                CLi.Mail = txtMail.Text.ToUpper();
                CLi.Fax = TxtFax.Text.ToUpper();


                Bll.BllPERSONAL.DameInstancia().Alta(CLi);
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
                Be.PERSONAL CLi = new Be.PERSONAL();

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

                CLi.Puesto = TxtPuesto.Text;


                CLi.Fecha_ing = TxtFechaIngreso.Text.ToUpper();

                CLi.Tel = TxtTelefono.Text.ToUpper();
                CLi.Cel = TxtCel.Text.ToUpper();
                CLi.Mail = txtMail.Text.ToUpper();
                CLi.Fax = TxtFax.Text.ToUpper();




                CLi.Id =Convert.ToInt32( TxtId.Text);
                Bll.BllPERSONAL.DameInstancia().Modificacion(CLi);
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


                    Bll.BllPERSONAL.DameInstancia().Eliminar(Convert.ToInt32(TxtId.Text));
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
         [WebMethod()]

        public static Be.PERSONAL WsPersona(string Ids) {
            try
            {
                 Be.PERSONAL CLi = new Be.PERSONAL();
                        List<Be.PERSONAL> ListaCli = new List<PERSONAL>();


                        ListaCli = Bll.BllPERSONAL.DameInstancia().Listar("Ids", Ids.ToString());
                        if (ListaCli.Count>0)
                        {
                            return ListaCli[0];
                        
                        }else{
                            return CLi;
                        }
                        
            }
            catch (Exception)
            {
                
                throw;
            }
        
        
        }


        [WebMethod()]

        public static List<Be.PUESTOS> WsListarPuestos(string v_tipo, string v_valor)
        {
            try
            {
                return Bll.BllPUESTOS.DameInstancia().Listar("", "");


            }
            catch (Exception)
            {

                throw;
            }

        }
        
    }
}