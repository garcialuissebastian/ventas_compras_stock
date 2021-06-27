using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Be
{
    public class ordenes_servicio
    {

        public Int32 Id { get; set; }
        public string CodMunual { get; set; }
        public string Orden_No { get; set; }
        public string Tipo { get; set; }
        public string ContraOrden { get; set; }

        public string Cliente { get; set; }
        public string Cliente_Doc { get; set; }
        public string Modelo { get; set; }
        public string Equipo { get; set; }
        public string Serie { get; set; }
        public string Observacion { get; set; }
        public string Motivo { get; set; }
        public string Info_Tecnico { get; set; }
        public string Clave { get; set; }
        public string Tiempo { get; set; }
        public string Valor { get; set; }
        public string Id_cliente { get; set; }
        public string Fecha { get; set; }
        public kx_cliente ClienteObj { get; set; }
      
        public string ClienteTel { get; set; }

        public string Pagado { get; set; }

        public string Tactil { get; set; } 
        public string Boton_Home { get; set; }
        public string Camara_Tracera { get; set; }
        public string Camara_Delantera { get; set; }
        public string Sensor_Proximidad { get; set; }
        public string Parlantes { get; set; } 
        public string Auricular { get; set; }
        public string Boton_Power { get; set; }
        public string Volumen { get; set; }
       


    }
}
