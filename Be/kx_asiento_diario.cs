using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Be
{
    public class kx_asiento_diario
    {

        public string Id { get; set; }
        public string Nro { get; set; }
        public string Fecha { get; set; }
        public string Codigo { get; set; }
        public string Id_cta { get; set; }
        public string Anio { get; set; }
        public string mes { get; set; }
        public string Documento_concepto { get; set; }
        public string Debe { get; set; }
        public string Haber { get; set; }
        public string Config { get; set; }
        public string Id_Cbte  { get; set; }
        public string  Cbte { get; set; }
        public string CbteTipo { get; set; }
        public string Tipo { get; set; }

  public List<kx_asiento_diario> ITEMS { get; set; } = new List<kx_asiento_diario>();
    }
}


