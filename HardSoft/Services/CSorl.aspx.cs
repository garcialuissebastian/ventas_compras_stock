using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Services;
using System.Configuration;

public partial class CSorl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string PATH = ConfigurationManager.AppSettings.Get("PathORL").ToString();
        string PATHurl = ConfigurationManager.AppSettings.Get("PathORLUrl").ToString();
        if (!this.IsPostBack)
        {
            if (Request.InputStream.Length > 0)
            {
                using (StreamReader reader = new StreamReader(Request.InputStream))
                {
                    try
                    {

                        string imageName =  DateTime.Now.ToString("hhmmss");
                        string hexString = Server.UrlEncode(reader.ReadToEnd());
                
                 //   string imagePath = string.Format("App/Personal/Captures/24964.png", imageName);
                    string imagePathA = PATH + imageName + ".png";

                    File.WriteAllBytes(imagePathA, ConvertHexToBytes(hexString));

                    Session["CapturedImage"] = PATHurl + imageName + ".png";



                    }
                    catch (Exception ex)
                    {

                        Session["CapturedImage"] = ex.Message.ToString() +"-1";
                    }
                }
            }
        }
    }

    private static byte[] ConvertHexToBytes(string hex)
    {
        try
        {

        byte[] bytes = new byte[hex.Length / 2];
        for (int i = 0; i < hex.Length; i += 2)
        {
            bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
        }
        return bytes;
        }
        catch (Exception)
        {

            throw;
        }


       
    }

    [WebMethod(EnableSession = true)]
    public static string GetCapturedImage()
    {
        string url = HttpContext.Current.Session["CapturedImage"].ToString();
      //  HttpContext.Current.Session["CapturedImage"] = null;
        return url;
    }
    
}