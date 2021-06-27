<%@ WebHandler Language="C#" Class="ctrl" %>

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
public class Registro : IHttpHandler {

    private string tipo_ID;
    private string persona_Documento;
    private string mail;
    private string existe = "NO";
    private string p_aut = "066D1FF2C5329F4CB1426CDE2D64AF2D";
    private string v_aut = "";
    
    public void ProcessRequest (HttpContext context)
    {
        try
        {
            string data = string.Empty;
            
            //data = 0 es Meses De la tasa Sum actual
             
            
            if (context.Request.QueryString["data"].Equals("0"))
            {
                v_aut = context.Request.QueryString["v_aut"];
             
                if(v_aut.Equals(p_aut)){

                    data = SetDataPorMese();
                
                }
                
                
            }
            else if (context.Request.QueryString["data"].Equals("1")) 
            {
               //  otro cosa
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

    protected string SetDataPorMese()
    {
            try
        {

                existe =  BllSum.DameInstancia().meses();
            
        

        StringBuilder json = new StringBuilder();
        json.Append("data : [ ");
        json.Append("{" + Environment.NewLine);
        json.Append("'existe' : '");
        json.Append(existe);
        json.Append("'" + Environment.NewLine);
        json.Append("}]");
        return json.ToString();
        }
            catch (Exception)
            {
                throw;
            }
    }
    
    
        
        
    
 
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}