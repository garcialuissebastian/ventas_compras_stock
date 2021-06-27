using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Be
{
public  class Pagos_tmp
    {
        public string Cuota { get; set; }
        public string Vto { get; set; }
        public string Monto { get; set; }
        public string Estado { get; set; }
         
    }

    public class temp_deuda_mayor_mov
    {
        public string Id { get; set; }
        public string Fecha { get; set; }
        public string Asiento { get; set; }
        public string Detalle { get; set; }
        public string Debe_Mes { get; set; }
        public string Haber_Mes { get; set; }
        public string Debe_Eje { get; set; }
        public string Haber_Eje { get; set; }
        public string Saldo_Eje { get; set; }
        public string Cuenta { get; set; }
        public string Cuenta_Nombre { get; set; }
    }
    public class temp_deuda_mayor
    {
        public string Fecha { get; set; }
        public string Codigo { get; set; }
        public string Id_cta { get; set; }
        public string Documento_concepto { get; set; }

        public string Debe { get; set; }
        public string Haber { get; set; }
        public string Id_Cbte { get; set; }

        public string Tipo { get; set; }
        public string Cta { get; set; }
        public string Orden { get; set; }

    }
}
