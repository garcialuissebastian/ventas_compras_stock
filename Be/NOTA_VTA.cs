using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Be
{
    public class NOTA_VTA
    {

        public Int32 Id { get; set; }
        public string Id_vendedor { get; set; }
        public string Pago_efectivo { get; set; }
        public string Senia { get; set; }
        public string Maquina { get; set; }
        public string Anticipo { get; set; }
        public string Coutas { get; set; }
        public string Coutas_tipo { get; set; }
        public string Coutas_pesos { get; set; }
        public string Total_vta { get; set; }
        public string Deuda { get; set; }
        public string Aud { get; set; }
        public string Id_cliente { get; set; }

        public string Vto { get; set; }

        Be.PERSONAL Item1 = new Be.PERSONAL();
        public Be.PERSONAL Vendedor
        {
            get { return Item1; }
            set { Item1 = value; }

        }


        Be.PERSONAL Item2 = new Be.PERSONAL();
        public Be.PERSONAL Cobrador
        {
            get { return Item2; }
            set { Item2 = value; }

        }

    }
}
