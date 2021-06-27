using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;

namespace HardSoft.Services
{
    /// <summary>
    /// Descripción breve de Subir_archivo
    /// </summary>
    public class Subir_archivo : IHttpHandler
    {

        
        public void ProcessRequest(HttpContext context)
        {
            string imageName = DateTime.Now.ToString("hhmmss");
            string ext ="";
            string fileName = "";
            string PATH = ConfigurationManager.AppSettings.Get("PathORL").ToString(); 

            context.Response.ContentType = "text/plain";
            try
            {
              
                string str_image = "";
                
                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];



                    fileName = System.IO.Path.GetFileNameWithoutExtension(file.FileName).ToLower();
                   ext = System.IO.Path.GetExtension(file.FileName).ToLower();
                   //C:\Users\seba\Documents\factura_Electronica\HardSoft\HardSoft\Subidos\ORL
                

                   byte[] fileData = null;
                   using (var binaryReader = new BinaryReader(context.Request.Files[0].InputStream))
                   {
                       fileData = binaryReader.ReadBytes(context.Request.Files[0].ContentLength);
                   }

                   byte[] fileFinal = ResizeImage(fileData); // si no pasa los 4g

                  // MemoryStream ms = new MemoryStream(fileData);

                
                   string fileExtension = file.ContentType;

                  //  Image image = file.
                    if (!string.IsNullOrEmpty(fileName))
                    {
                        string pathToSave_100 = PATH + fileName + "_" + imageName + ext;
                      //  file.SaveAs(pathToSave_100);

                        FileStream fs = new FileStream(pathToSave_100, FileMode.Create, FileAccess.ReadWrite);
                        BinaryWriter bw = new BinaryWriter(fs);
                        bw.Write(fileFinal);
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

        private Image Redimensionar(Image image, int SizeHorizontalPercent, int SizeVerticalPercent)
{
//Obntenemos el ancho y el alto a partir del porcentaje de tamaño solicitado
int anchoDestino = image.Width * SizeHorizontalPercent / 100;
int altoDestino = image.Height * SizeVerticalPercent / 100;
//Obtenemos la resolucion original 
int resolucion = Convert.ToInt32(image.HorizontalResolution);

return this.Redimensionar(image, anchoDestino, altoDestino, resolucion);
}

        private Image Redimensionar(Image Imagen, int Ancho, int Alto, int resolucion)
        {
            //Bitmap sera donde trabajaremos los cambios
            using (Bitmap imagenBitmap = new Bitmap(Ancho, Alto, PixelFormat.Format32bppRgb))
            {
                imagenBitmap.SetResolution(resolucion, resolucion);
                //Hacemos los cambios a ImagenBitmap usando a ImagenGraphics y la Imagen Original(Imagen)
                //ImagenBitmap se comporta como un objeto de referenciado
                using (Graphics imagenGraphics = Graphics.FromImage(imagenBitmap))
                {
                    imagenGraphics.SmoothingMode = SmoothingMode.AntiAlias;
                    imagenGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    imagenGraphics.PixelOffsetMode = PixelOffsetMode.HighQuality;
                    imagenGraphics.DrawImage(Imagen, new Rectangle(0, 0, Ancho, Alto), new Rectangle(0, 0, Imagen.Width, Imagen.Height), GraphicsUnit.Pixel);
                    //todos los cambios hechos en imagenBitmap lo llevaremos un Image(Imagen) con nuevos datos a travez de un MemoryStream
                    MemoryStream imagenMemoryStream = new MemoryStream();
                    imagenBitmap.Save(imagenMemoryStream, ImageFormat.Jpeg);
                    Imagen = Image.FromStream(imagenMemoryStream);
                }
            }
            return Imagen;
        }

        public byte[] ResizeImage(byte[]  url)
        {
       
            var oldImgStream = new MemoryStream( url);

            if (oldImgStream.Length <= 4194304)
            {
                return oldImgStream.ToArray();
            }

            using (var oldImage = new Bitmap(oldImgStream))
            using (var newImageStream = new MemoryStream())
            {
                var format = oldImage.RawFormat;
                float resizePercent = (float)4194304 / oldImgStream.Length;
                var newImage = ResizeImageByPercent(oldImage, resizePercent);

                newImage.Save(newImageStream, format);

                return newImageStream.ToArray();
            }
        }

        public static Bitmap ResizeImageByPercent(Bitmap image, float resizePercent)
        {
            //Set minimum resizePercentage to 80% 
            resizePercent = resizePercent > 0.8 ? (float)0.8 : resizePercent;

            int newWidth = (int)(image.Width * resizePercent);
            int newHeight = (int)(image.Height * resizePercent);

            var newImage = new Bitmap(newWidth, newHeight);
            using (var graphics = Graphics.FromImage(newImage))
            {
                graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                graphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                graphics.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
                graphics.FillRectangle(Brushes.Transparent, 0, 0, newWidth, newHeight);
                graphics.DrawImage(image, 0, 0, newWidth, newHeight);
                return newImage;
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