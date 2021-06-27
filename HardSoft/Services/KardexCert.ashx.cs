using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;

namespace HardSoft.Services
{
    /// <summary>
    /// Descripción breve de KardexCert sube los certificados 
    /// </summary>
    public class KardexCert : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string imageName = DateTime.Now.ToString("hhmmss");
            string ext = "";
            string fileName = "";
            string PATH = ConfigurationManager.AppSettings.Get("PathProyecto").ToString();
            PATH += "certificados\\";
                        context.Response.ContentType = "text/plain";
            try
            {

             

                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];



                    fileName = System.IO.Path.GetFileNameWithoutExtension(file.FileName).ToLower();
                    ext = System.IO.Path.GetExtension(file.FileName).ToLower();
                    //if (ext !=".pfx")
                    //{
                    //    throw new Exception("Extension no validad.");
                    //}
                    byte[] fileData = null;
                    using (var binaryReader = new BinaryReader(context.Request.Files[0].InputStream))
                    {
                        fileData = binaryReader.ReadBytes(context.Request.Files[0].ContentLength);
                    }
 


                    string fileExtension = file.ContentType;
 
                    if (!string.IsNullOrEmpty(fileName))
                    {
                        string pathToSave_100 = PATH + fileName + "_" + imageName + ext; 
                        FileStream fs = new FileStream(pathToSave_100, FileMode.Create, FileAccess.ReadWrite);
                        BinaryWriter bw = new BinaryWriter(fs);
                        bw.Write(fileData);
                        bw.Close(); 
                    }
                }
                //  database record update logic here  ()

                context.Response.Write(fileName + "_" + imageName + ext);
            }
            catch (Exception ac)
            {
                context.Response.Write(ac.Message);
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