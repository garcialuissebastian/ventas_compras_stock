using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Be
{
    public class sueldo
    {

        public string Id { get; set; }
        public string Empleador { get; set; }
        public string Dominicilio { get; set; }
        public string FechaIng { get; set; }
        public string Tarea { get; set; }
        public string Cuit { get; set; }
        public string Beneficiario { get; set; }
        public string Clasificacion { get; set; }
        public string Periodo_mes { get; set; }
        public string Periodo_anio { get; set; }
        public string Importe_letra { get; set; }
        public string Lugar { get; set; }
        public string Fecha { get; set; }
        public string Total_haberes { get; set; }
        public string Importe_liquido { get; set; }
        public string Importe_cobrar { get; set; }
        public string Fecha_cobro { get; set; }
        public string Banco_cobro { get; set; }
        public string Jornal { get; set; }
        public string Aud { get; set; }

        List<Be.sueldo_conceptos> Item1 = new List<sueldo_conceptos>();

        public List<sueldo_conceptos> Haber
        {
            get { return Item1; }
            set { Item1 = value; }
        }

        List<Be.sueldo_conceptos> Item2 = new List<sueldo_conceptos>();

        public List<sueldo_conceptos> Deducion
        {
            get { return Item2; }
            set { Item2 = value; }
        }
    }

    public class sueldo_conceptos
    {

        public string Id { get; set; }
        public string Nombre { get; set; }
        public string Tipo { get; set; }
        public string Id_sueldo { get; set; }
        public string Importe { get; set; }


    }

}
