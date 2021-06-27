﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
namespace Be
{
    public class kx_articulo
    {

        public Int32 Id { get; set; }
        public string Tipo_Art { get; set; }
        public string Nombre { get; set; }
        public string Cod_Manual { get; set; }
        public string Rubro { get; set; }
     
        public string RubroNombre { get; set; }
        public string Sub_Rubro { get; set; }
        public string Sub_RubroNombre { get; set; }
        public string Marca { get; set; }
        public string MarcaNombre { get; set; }
        public string Modelo { get; set; }
        public string ModeloNombre { get; set; }
        public string Barra_Proveedor { get; set; }
        public string Barra_Sistema { get; set; }
        public string Iva_Venta { get; set; }
        public string IIBB { get; set; }
        public string Moneda { get; set; }
        public string Iva_Compra { get; set; }
        public string Cont_Venta { get; set; }
        public string Cont_Compra { get; set; }
        public string P_Neto { get; set; }
        public string P_Final { get; set; }
        public string Util1 { get; set; }
        public string Util2 { get; set; }
        public string Util3 { get; set; }
        public string Util4 { get; set; }
        public string Util5 { get; set; }
        public string P_NetoL1 { get; set; }
        public string P_NetoL2 { get; set; }
        public string P_NetoL3 { get; set; }
        public string P_NetoL4 { get; set; }
        public string P_NetoL5 { get; set; }
        public string P_FinalL1 { get; set; }
        public string P_FinalL2 { get; set; }
        public string P_FinalL3 { get; set; }
        public string P_FinalL4 { get; set; }
        public string P_FinalL5 { get; set; }

        public string DepositoSelect { get; set; }
        public string ListaSelect { get; set; }
        public string Cant { get; set; }

        public string PrecioSelect { get; set; }
        public string PrecioOriginal { get; set; }

        public string Descuento { get; set; } // %
        public string NetoSelect { get; set; }
         
        public string es_Stock { get; set; }
        public string Unidad { get; set; }
        public Int32 IdGrilla { get; set; }

   

   
      

        kx_cliente Item1Cli = new kx_cliente();

        public kx_cliente ClienteSelect
        {
            get { return Item1Cli; }
            set { Item1Cli = value; }
        }
      

        List<Be.kx_proveedor> Item1 = new List<Be.kx_proveedor>();

        public List<Be.kx_proveedor> Proveedores
        {
            get { return Item1; }
            set { Item1 = value; }
        }

        List<Be.kx_deposito_reposicion> Item2 = new List<Be.kx_deposito_reposicion>();

        public List<Be.kx_deposito_reposicion> Depositos
        {
            get { return Item2; }
            set { Item2 = value; }
        }

        public string Lote { get; set; }

        public string Id_Usuario { get; set; }

        public string Anulado { get; set; } 
        public string Sistema { get; set; }

        public string DescripcionPrincipal { get; set; }

        public string DescripcionSecundaria { get; set; }
       
 
    }
    public class kx_cbtes_percepciones
    {

        public string Id { get; set; }
        public string Id_cbte { get; set; }
        public string Percep { get; set; }
        public string Id_Percep { get; set; }
        public string Monto { get; set; }
        public string Obs { get; set; }
        public string Tributo { get; set; }
    }
    public class kx_percepciones
    {

        public string Id { get; set; }
        public string Nombre { get; set; }
        public string Contable { get; set; }
    }

    public class orden
    {
        public string Prioridad { get; set; }
        public string Id { get; set; }
        public string Cliente { get; set; }
        public string Remito { get; set; }
        public string ClienteNombre { get; set; }
        public string TelCli { get; set; }
        
        public string DocTipo { get; set; }

        public string DocNro { get; set; }
        public string CbteTipo { get; set; }
        public string CbteNro { get; set; }

        public string ImpTotal { get; set; }
        public string Saldo { get; set; }

        public string Concepto { get; set; }
        public string Vendedor { get; set; }
        public string Fecha { get; set; }
        public string Estado { get; set; }
        public string Items { get; set; }

        public string Pago_Efectivo { get; set; }
        public string Pago_Cheques { get; set; }
        public string Pago_Tarjetas { get; set; }

        public string Contado { get; set; }
        public string Tj_Debito { get; set; }
        public string Tj_Credito { get; set; }
        public string CtaCte  { get; set; }
        public string Cta_contable { get; set; }

        public string Cheque { get; set; }
        public string Otra { get; set; }

        public string Transferencia { get; set; }

        public string Debe { get; set; }
        public string Haber { get; set; }
    }
}
