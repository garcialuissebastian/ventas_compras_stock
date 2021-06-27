<%@ WebHandler Language="C#" Class="QRHandler" %>

using System;
using System.Drawing.Imaging;
using System.IO;
using System.Net;
using System.Web;
using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using System.Configuration;


public class QRHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        // Retrieve the parameters from the QueryString
        var codeParams = CodeDescriptor.Init(context.Request);

        // Encode the content
        if (codeParams == null || !codeParams.TryEncode())
        {
            context.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return;
        }

        // Render the QR code as an image (Optional Save with path and name)
        using (var ms = new MemoryStream())
        {
            codeParams.Render(ms);
            context.Response.ContentType = codeParams.ContentType;
            context.Response.OutputStream.Write(ms.GetBuffer(), 0, (int)ms.Length);

            if (codeParams.Name != "no" && codeParams.Path != "no")
            {
                System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
                returnImage.Save(codeParams.Path + codeParams.Name + ".png");
            }
        }
    }

    /// <summary>
    /// Return true to indicate that the handler is thread safe because it is stateless
    /// </summary>
    public bool IsReusable
    {
        get { return true; }
    }
}

/// <summary>
/// Class containing the description of the QR code and wrapping encoding and rendering.
/// </summary>
internal class CodeDescriptor
{
    public ErrorCorrectionLevel Ecl;
    public string Content;
    public QuietZoneModules QuietZones;
    public int ModuleSize;
    public BitMatrix Matrix;
    public string ContentType;
    public string Name;
    public string Path;

    /// <summary>
    /// Parse QueryString that define the QR code properties
    /// </summary>
    /// <param name="request">HttpRequest containing HTTP GET data</param>
    /// <returns>A QR code descriptor object</returns>
    public static CodeDescriptor Init(HttpRequest request)
    {
        var cp = new CodeDescriptor();
        // Error correction level
        if (!Enum.TryParse(request.QueryString["e"], out cp.Ecl))
            cp.Ecl = ErrorCorrectionLevel.L;

        // Code content to encode
        cp.Content = request.QueryString["t"];
        // Size of the quiet zone
        if (!Enum.TryParse(request.QueryString["q"], out cp.QuietZones))
            cp.QuietZones = QuietZoneModules.Two;
        // Module size
        if (!int.TryParse(request.QueryString["s"], out cp.ModuleSize))
            cp.ModuleSize = 12;
        // name QR
        cp.Name = request.QueryString["n"];
        // path QR
        cp.Path = request.QueryString["p"];
        
        return cp;
    }

    /// <summary>
    /// Encode the content with desired parameters and save the generated Matrix
    /// </summary>
    /// <returns>True if the encoding succeeded, false if the content is empty or too large to fit in a QR code</returns>
    public bool TryEncode()
    {
        var encoder = new QrEncoder(Ecl);
        QrCode qr;
        if (!encoder.TryEncode(Content, out qr))
            return false;

        Matrix = qr.Matrix;
        return true;
    }

    /// <summary>
    /// Render the Matrix as a PNG image
    /// </summary>
    /// <param name="ms">MemoryStream to store the image bytes into</param>
    internal void Render(MemoryStream ms)
    {
        var render = new GraphicsRenderer(new FixedModuleSize(ModuleSize, QuietZones));
        render.WriteToStream(Matrix, ImageFormat.Png, ms);
        ContentType = "image/png";
    }
}

