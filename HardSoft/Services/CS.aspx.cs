using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Services;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.InputStream.Length > 0)
            {
                using (StreamReader reader = new StreamReader(Request.InputStream))
                {
                    try
                    {
                        string V_LEG = "";
                        if (HttpContext.Current.Session["V_LEG"] != null)
                        {

                            V_LEG = HttpContext.Current.Session["V_LEG"].ToString();
                        }
                        else { V_LEG = "99"; }
                       
                        
                    string hexString = Server.UrlEncode(reader.ReadToEnd());
                    string imageName = V_LEG+"_" + DateTime.Now.ToString("hh-mm-ss");
                 //   string imagePath = string.Format("App/Personal/Captures/24964.png", imageName);
                    string imagePathA = "C:\\inetpub\\wwwroot\\intranet\\App\\Personal\\Captures\\" + imageName + ".png";

                    File.WriteAllBytes(imagePathA, ConvertHexToBytes(hexString));

                    Session["CapturedImage"] =  "https://arquivirtual.quilmes.gov.ar/municipal/App/Personal/Captures/"+ imageName + ".png";



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