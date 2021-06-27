using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Be
{
    public class kx_cbtes  
    {

        public Int32 Id { get; set; }
        public string CantReg { get; set; }
        public string CbteTipo { get; set; }
        public string PtoVta { get; set; }
        public string CBU { get; set; }
        public string TipoTranferencia { get; set; }
        public string Saldo { get; set; }
        public string Fecha { get; set; }
        public string usuario { get; set; }
        public string Resultado { get; set; }
        public string Vendedor { get; set; }
        public string Cliente { get; set; }
        public string ClienteNombre { get; set; }
        public string aud { get; set; }
        public string Concepto { get; set; }
        public string DocTipo { get; set; }
        public string DocNro { get; set; }
        public string CbteDesde { get; set; }
        public string CbteHasta { get; set; }
        public string CbteFch { get; set; }
   
        public string ImpTotConc { get; set; }
        public string ImpNeto { get; set; }
        public string ImpIVA { get; set; }
        public string ImpTotal { get; set; }
        public string ImpOpEx { get; set; }
        public string ImpTrib { get; set; }
       
        public string MonId { get; set; }
        
        public string MonCotiz { get; set; }
        public string CAE { get; set; }
        public string CAEFchVto { get; set; }
        public string Observaciones { get; set; }

        public string CodBarra { get; set; }
        public string Cuit { get; set; }

        public string Id_config { get; set; }

        public string Pago_Efectivo { get; set; }
        public string Pago_Bancos { get; set; }
        public string Pago_Cheques { get; set; }
        public string Pago_Tarjetas { get; set; }
        public string ImporteLetra { get; set; }

        public string Contado { get; set; }

        public string treintaDias { get; set; }
        public string Tj_Debito { get; set; }
        public string Tj_Credito { get; set; }
        public string CtaCte { get; set; } 
        public string Cheque { get; set; }
        public string Otra  { get; set; }
        public string Remito { get; set; }
        public string CantAlic { get; set; }
        public string FchVtoPago { get; set; }
        public string TelCli { get; set; }

        public string Transferencia { get; set; }

        // para anualar un comprobante
        public string anular_Tipo { get; set; }
        
        public string anular_Nro { get; set; }

        public string anular_fecha { get; set; }
        public string anular_id { get; set; }

        public string Cta_contrable { get; set; }
        public string Debe { get; set; }
        public string Haber { get; set; }
        public string Prioridad { get; set; }
        List<Be.kx_cbtes_articulos> Item1 = new List<Be.kx_cbtes_articulos>();

        public List<Be.kx_cbtes_articulos> Articulos
        {
            get { return Item1; }
            set { Item1 = value; }
        }


        List<Be.kx_cheques> Item3 = new List<Be.kx_cheques>();

        public List<Be.kx_cheques> Cheques
        {
            get { return Item3; }
            set { Item3 = value; }
        }

        List<Be.kx_tarjetas> Item5 = new List<Be.kx_tarjetas>();

        public List<Be.kx_tarjetas> Tarjetas
        {
            get { return Item5; }
            set { Item5 = value; }
        }


        List<Be.kx_cbtes_percepciones> ItemPerc = new List<Be.kx_cbtes_percepciones>();

        public List<Be.kx_cbtes_percepciones> Percepciones
        {
            get { return ItemPerc; }
            set { ItemPerc = value; }
        }


        List<Fact_AlicIva> Item6 = new List<Fact_AlicIva>();

        public List<Fact_AlicIva> AlicIva
        {
            get { return Item6; }
            set { Item6 = value; }
        }

    }

    public class kx_cbtes_pagos: kx_cbtes
    {

        public List< kx_cbtes_pagos_items> Pagos_items { get; set; } = new List<kx_cbtes_pagos_items>();
        public List<kx_cbtes_pagos_cbtes> Cbtes { get; set; } = new List<kx_cbtes_pagos_cbtes>();
    }

    public class kx_cbtes_pagos_cbtes
    {

        public string Id { get; set; }
        public string CbteId { get; set; }
        public string Monto { get; set; }
      
    }


    public class DeudaProveedor
    {
        public string Id_compra { get; set; }
        public string TipoCbte_compra { get; set; }
        public string Proveedor { get; set; }
        public string Cbte_compra { get; set; }
        public string Letra_compra { get; set; }
        public string Fecha_compra { get; set; }
        public string FechaVto_compra { get; set; }
        public string Monto_compra { get; set; } 
        public string Prioridad_compra { get; set; }
        public string Saldo { get; set; }

        public string Id_op { get; set; }
        public string Cbte_op { get; set; }
        public string Letra_op { get; set; }
        public string Fecha_op { get; set; }
        public string Monto_op { get; set; }
       


    }
    public class kx_cbtes_pagos_items
    {

        public string Id { get; set; }
        public string Cta_Contable { get; set; }
        public string Cta_ContableStr { get; set; }
        public string Importe { get; set; }
        public string Cheque { get; set; }
        public string Vto { get; set; }
        public string Banco { get; set; }
        public string Observacion { get; set; }
        public string Id_pago { get; set; }

        public string Cbte_Id { get; set; }
        public string cta_compras { get; set; }
        public string Saldo { get; set; }
        public string Saldo_Origen { get; set; }
        public string Fc { get; set; }
    }

}
