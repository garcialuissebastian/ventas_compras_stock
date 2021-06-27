using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VbWsaa;
using System.Xml;

using Be;
using System.Configuration;
namespace HardSoft
{
  public   abstract  class  Ticket
    {
      public abstract List<TipoDoc> ListTipoDoc();

      public abstract List<PtoVtas> ListPtoVta();
       
      public abstract string UltimoCbte();
        public abstract string CotizacionMoneda(string pModId);
        public abstract kx_cbtes Generar_Cbate(Fact_Cab v_Fact, kx_cbtes kx);
      public abstract void cargar_lote(Fact_Cab v_Fact);

      public abstract string UltimoCbteConDatosEnviados(Int32 v_TipoCbate, Int32 v_PtoVta);
 //   public string Path = "\\\\hmfsw\\web\\DTCWIN027\\wi271852.ferozo.com\\public_html\\";     
  // public string Path = "C:\\Users\\seba\\Documents\\factura_Electronica\\hardsoft\\hardsoft\\";
      public string Path = ConfigurationManager.AppSettings.Get("PathProyecto").ToString();
    }
}
