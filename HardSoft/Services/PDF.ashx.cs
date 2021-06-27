using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;

namespace HardSoft.Services
{
    /// <summary>
    /// Descripción breve de PDF
    /// </summary>
    public class PDF : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {
      
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Clear();
            context.Response.Cache.SetCacheability(HttpCacheability.Public);
            context.Response.Cache.SetExpires(DateTime.MinValue);
            context.Response.Cache.SetNoStore();
            try
            {

                string data = string.Empty;

                try
                {

                   //HttpContext.Current.Session["UsuarioActual"]; 

                   

                    StringBuilder json = new StringBuilder();
                 

                    
                    json.Append("{" );
                    json.Append("\"");
                    json.Append("existe");
                    json.Append("\" :\"");
                    json.Append(HttpContext.Current.Session["PDF1"].ToString());
                    json.Append("\"");
                    json.Append("}");
                

                  json.ToString();

                  data = json.ToString(); 
                    if (data != string.Empty)
                    {
                        context.Response.Write(data);
                    }
                }
                catch (Exception ex)
                {

                    throw;
                }

            }
            catch (Exception ex)
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
}