using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Be
{
    public class kx_cajas
    {

      
        public string id { get; set; }
        public string nombre { get; set; }
        public string id_config { get; set; }
        public string habilitada { get; set; }


     
 
    }


    public class kx_cajas_mov
    {

       
        public string id { get; set; }
        public string fecha { get; set; }
        public string caja { get; set; }
        public string ingreso { get; set; }
        public string agreso { get; set; }
        public string tipo { get; set; }
        public string id_usuario { get; set; }
        public string id_config { get; set; }
        public string nro_cbte { get; set; }
        public string destino_cbte { get; set; }
        public string monto_conteo { get; set; }
        public string id_aper { get; set; }


    }

    public class kx_cajas_ver
    {


        public string id { get; set; }
        public string USUARIO { get; set; }
        public string CAJA { get; set; }
        public string APERTURA { get; set; }
        public string CIERRE { get; set; }
        public string EFECTIVO_APERTURA { get; set; }
        public string EFECTIVO_AL_CIERRE { get; set; }
        public string Pago_Tarjetas { get; set; }
        public string Pago_Efectivo { get; set; }
        public string Pago_Cheques { get; set; }
        public string Pago_Ctacte { get; set; }
  


    }

}
