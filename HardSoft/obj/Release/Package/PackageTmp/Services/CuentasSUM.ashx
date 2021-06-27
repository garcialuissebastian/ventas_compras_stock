<%@ WebHandler Language="C#" Class="CuentasSUM" %>

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
public class CuentasSUM : IHttpHandler {

    private string cuenta;
    private string recibo;
    private string existe = "NO";
    private string adherida = "NO";
    
    public void ProcessRequest (HttpContext context)
    {
        try
        {
            
            string data = string.Empty;
            
            if (context.Request.QueryString["data"].Equals("0"))
            {
                cuenta = context.Request.QueryString["cuenta"];
                recibo = context.Request.QueryString["recibo"];
                data = SetDataCuenta();
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

    protected string SetDataCuenta()
    {
        
        if (!string.IsNullOrEmpty(cuenta) &&  !string.IsNullOrEmpty(recibo))
        {
            existe = Bll.BllCtaCte.DameInstancia().ADHESION_VALIDAR_SUM(Convert.ToInt32(cuenta), recibo.ToString());
            if (existe != "NO")
               adherida = Bll.BllCtaCte.DameInstancia().EXISTE_CTA_SUM(Convert.ToInt32(cuenta), 0);
        }
        
        StringBuilder json = new StringBuilder();
        json.Append("data : [ ");
        json.Append("{" + Environment.NewLine);
        json.Append("'existe' : '");
        json.Append(existe);
        json.Append("'," + Environment.NewLine);
        json.Append("'adherida' : '");
        json.Append(adherida);
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