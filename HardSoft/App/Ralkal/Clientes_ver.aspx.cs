using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;
namespace HardSoft.App.Ralkal
{
    public partial class Clientes_ver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvGrilla_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                 GridViewRow row =gvGrilla3.SelectedRow;
                Int16 ids = Convert.ToInt16(row.Cells[1].Text);
                Response.Redirect("Clientes.aspx?Ids="+ids, false);
            }
            catch (Exception ex)
            {

                LblMsg.Text = ex.Message;
            }
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
               
               

                if (cmbTipoOp.SelectedValue == "0") {
                    gvGrilla3.DataSource = Bll.BllClientes.DameInstancia().Listar("0",TxtBuscar.Text.ToUpper().Trim());
                }
                if (cmbTipoOp.SelectedValue == "1")
                {
                    gvGrilla3.DataSource = Bll.BllClientes.DameInstancia().Listar("1", TxtBuscar.Text.ToUpper().Trim());
                }
                if (cmbTipoOp.SelectedValue == "2")
                {
                    gvGrilla3.DataSource = Bll.BllClientes.DameInstancia().Listar("2", TxtBuscar.Text.ToUpper().Trim());
                }
                if (cmbTipoOp.SelectedValue == "3")
                {
                    gvGrilla3.DataSource = Bll.BllClientes.DameInstancia().Listar("3", TxtBuscar.Text.ToUpper().Trim());
                }
                if (cmbTipoOp.SelectedValue == "4")
                {
                    gvGrilla3.DataSource = Bll.BllClientes.DameInstancia().Listar("4", TxtBuscar.Text.ToUpper().Trim());
                }
                gvGrilla3.DataBind();
            }
            catch (Exception ex)
            {

                LblMsg.Text = ex.Message;
            }
        }

        
    }
}