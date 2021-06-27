<%@ WebHandler Language="C#" Class="CuentasAutomotor" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Text;
using System.Collections;
using System.Collections.ObjectModel;
using System.Web.Script.Serialization;
using System.Configuration;
using Be;
using Bll;
public class CuentasAutomotor : IHttpHandler {

    private string dominio;
    private string recibo;
    private string existe = "NO";
    private string adherido = "NO";
    
    public void ProcessRequest (HttpContext context)
    {
        try
        {
            string data = string.Empty;
            // Inicializo variable privadas con parametros QueryString segun opcion de data 
            // 0 = 
            
            if (context.Request.QueryString["data"].Equals("0"))
            {
                dominio = context.Request.QueryString["dominio"].ToUpper();
                recibo = context.Request.QueryString["recibo"];
                data = SetDataDominio();
            }
            
            if (data != string.Empty)
            {
                context.Response.Write(data);
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    protected string SetDataDominio()
    {
        // Validar si la relación dominio y recibo es existente y si el dominio ya está adherido
        // AAA000  testing esta OK
        // AAA0001  testing esta OK pero ya está adherido
        //if (dominio == "AAA000" || dominio == "AAA001")
        //   existe = "SI";

        //if (dominio == "AAA001")
        //    adherido = "SI";



        if (!string.IsNullOrEmpty(dominio) && !string.IsNullOrEmpty(recibo))
        {
            existe = BllAuto.DameInstancia().ADHESION_VALIDAR_AUTO(dominio.ToString(), recibo.ToString());
            
            
            if (existe != "NO")
                adherido = Bll.BllAuto.DameInstancia().EXISTE_CTA_AUTO(dominio.ToString(),0);
            
        }
        
        StringBuilder json = new StringBuilder();
        json.Append("data : [ ");
        json.Append("{" + Environment.NewLine);
        json.Append("'existe' : '");
        json.Append(existe);
        json.Append("'," + Environment.NewLine);
        json.Append("'adherido' : '");
        json.Append(adherido);
        json.Append("'" + Environment.NewLine);
        json.Append("}]");
        return json.ToString();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}