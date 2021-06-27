using Bll;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardSoft.App.Kardex
{
    public partial class Ordebes_Rp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
        List<Be.ordenes_servicio> list=        Bll.Bllordenes_servicio.DameInstancia().exec(TxtDesde.Text,TxtHasta.Text);              
               
                if (list.Count>1) {  
                string strCurrentDir = Server.MapPath(".") + "\\Report\\";
                string strFile = "report_DepArt.xlsx";

                DataSet dt = new DataSet();
         
                List<string> noo = new List<string>();
                noo.Add("Id");
                noo.Add("CodMunual");
                noo.Add("ClienteObj");
                noo.Add("Id_cliente");
                noo.Add("ClienteTel");  
                    

                   
                dt.Tables.Add(exel.ConvertToDataTable(list, noo));

                CreateExcelFile.CreateExcelDocument(dt, strCurrentDir + strFile);
                Response.Redirect("Report/" + strFile, false);
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        
        }
        
    }
}