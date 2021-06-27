using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace HardSoft.Services
{
    /// <summary>
    /// Descripción breve de subir
    /// </summary>
    public class subir : IHttpHandler
    {

           [WebMethod(EnableSession = true)]
        public void ProcessRequest(HttpContext context)
        {
            string imageName = DateTime.Now.ToString("hh-mm-ss");
            context.Response.ContentType = "text/plain";
            try
            {
                //string dirFullPath = HttpContext.Current.Server.MapPath("~/img/");
                //string[] files;
                //int numFiles;
                //files = System.IO.Directory.GetFiles("C:\\inetpub\\wwwroot\\intranet\\App\\Deporte\\img\\");
                //numFiles = files.Length;
                //numFiles = numFiles + 1;



                string str_image = "";

                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];

                    
                  
                    string fileName = file.FileName;
                    string fileExtension = file.ContentType;

                    if (!string.IsNullOrEmpty(fileName))
                    {

                        string pathToSave_100 = "C:\\inetpub\\wwwroot\\" + imageName + ".jpg";
                        file.SaveAs(pathToSave_100);
                    }
                }
                //  database record update logic here  ()

                context.Response.Write(imageName + ".jpg");
            }
            catch (Exception ac)
            {

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