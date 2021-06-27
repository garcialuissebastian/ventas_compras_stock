using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace HardSoft.App.Kardex
{
    public partial class interbanking : System.Web.UI.Page
    {//sad
        protected void Page_Load(object sender, EventArgs e)
        {
            // We use the HttpUtility class from the System.Web namespace  


            Uri address = new Uri("https://presib.interbanking.com.ar/consultaComunidades.do");  
  
// Create the web request  
HttpWebRequest request = WebRequest.Create(address) as HttpWebRequest;  
  
// Set type to POST  
request.Method = "POST";  
request.ContentType = "application/x-www-form-urlencoded";  
  
// Create the data we want to send  
string pais ="-2";
    string           cuil ="1543000564249";
	string		  nombre_usuario ="prueba01";
	string		  clave ="prueba02";
		string	  comunidad ="30999004144";
		string	   importeDesde ="100.0";
		string	   importeHasta ="20000.0" ;
  
StringBuilder data = new StringBuilder();
data.Append("pais=" + HttpUtility.UrlEncode(pais));
data.Append("&cuil=" + HttpUtility.UrlEncode(cuil));
data.Append("&nombre_usuario=" + HttpUtility.UrlEncode(nombre_usuario));

data.Append("&clave=" + HttpUtility.UrlEncode(clave));
data.Append("&comunidad=" + HttpUtility.UrlEncode(comunidad));
data.Append("&importeDesde=" + HttpUtility.UrlEncode(importeDesde));
data.Append("&importeHasta=" + HttpUtility.UrlEncode(importeHasta));  
// Create a byte array of the data we want to send  
byte[] byteData = UTF8Encoding.UTF8.GetBytes(data.ToString());  
  
// Set the content length in the request headers  
request.ContentLength = byteData.Length;  
  
// Write data  
using (Stream postStream = request.GetRequestStream())  
{  
    postStream.Write(byteData, 0, byteData.Length);  
}  
  
// Get response  
using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)  
{  
    // Get the response stream  
    StreamReader reader = new StreamReader(response.GetResponseStream());  
  
    // Console application output  
    string xml =reader.ReadToEnd();

    XmlDocument document = new XmlDocument();
    document.LoadXml(xml);
    //  auth.Token = document.SelectSingleNode("//token").InnerText;
}  
        }
    }
}
