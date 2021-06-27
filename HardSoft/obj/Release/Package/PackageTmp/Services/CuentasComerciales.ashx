<%@ WebHandler Language="C#" Class="CuentasComerciales" %>

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
public class CuentasComerciales : IHttpHandler {

    private string cuenta;
    private string cuit;
    private string existe = "NO";
    private string monotributo = "NO";
    
    public void ProcessRequest (HttpContext context)
    {
        try
        {
            string data = string.Empty;
            // Inicializo variable privadas con parametros QueryString segun opcion de data 
            // 0 = 
            // 1 = 
            
            if (context.Request.QueryString["data"].Equals("0"))
            {
                cuenta = context.Request.QueryString["cuenta"];
                cuit = context.Request.QueryString["cuit"];
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
        // Validar si la relación cuenta y cuit es existente
        // De ser existente si la cuenta es monotributo informar monotributo = "SI"
        // 1000 y 1001 testing 1001 es monotributo
        if (cuenta == "1000" || cuenta == "1001")
           existe = "SI";
        
        if (existe == "SI")
        {
            //Si esmonotributo 
            if (cuenta == "1001")
                monotributo = "SI";
        }
       
        StringBuilder json = new StringBuilder();
        json.Append("data : [ ");
        json.Append("{" + Environment.NewLine);
        json.Append("'existe' : '");
        json.Append(existe);
        json.Append("'," + Environment.NewLine);
        json.Append("'monotributo' : '");
        json.Append(monotributo);
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