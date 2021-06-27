<%@ WebHandler Language="C#" Class="Registro" %>

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
    
    public void ProcessRequest (HttpContext context)
    {
        try
        {
            string data = string.Empty;
            // Inicializo variable privadas con parametros QueryString segun opcion de data 
            // 0 = Tipo y Nro. Documento
            // 1 = mail
            
            if (context.Request.QueryString["data"].Equals("0"))
            {
                tipo_ID = context.Request.QueryString["td"];
                persona_Documento = context.Request.QueryString["documento"];
                data = SetDataPorDocumento();
            }
            else if (context.Request.QueryString["data"].Equals("1")) 
            {
                mail = context.Request.QueryString["mail"];
                data = SetDataPorMail();
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

    protected string SetDataPorDocumento()
    {
        Be.USUARIO_WEB user = Bll.BllUsuario_web.DameInstancia().Obtener_usuario(tipo_ID, Convert.ToInt32(persona_Documento));
        if (user.DOC_NO != null)
        {
            if (user.HABILITADO == "S")
            {

                existe = "SI";
            }
        }

        StringBuilder json = new StringBuilder();
        json.Append("data : [ ");
        json.Append("{" + Environment.NewLine);
        json.Append("'existe' : '");
        json.Append(existe);
        json.Append("'" + Environment.NewLine);
        json.Append("}]");
        return json.ToString();
    }
    
    protected string SetDataPorMail()
    {
        // Codificar busqueda por mail confirmado para determinar si el mail ya se encuentra registrado como usuario 
        try
        {
            string  Mail_txt  = Bll.BllUsuario_web.DameInstancia().existe_mail(mail);

            if (Mail_txt.Equals("S"))
            {
                existe = "SI";
            }
            if (Mail_txt.Equals("N"))
            {
                existe = "NO";
            }     
         
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