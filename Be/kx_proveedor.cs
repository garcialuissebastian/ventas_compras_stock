﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Be
{
    public class kx_proveedor
    {
        List<kx_cbtes> Item1 = new List<kx_cbtes>();

        public List<kx_cbtes> Cbates
        {
            get { return Item1; }
            set { Item1 = value; }
        }
        public Int32 Id { get; set; }
        public string Cod_Manual { get; set; }
        public string Cuit { get; set; }
        public string Iva { get; set; }
        public string Tipo { get; set; }
        public string Denominacion { get; set; }
        public string Observacion { get; set; }
        public string Cta_contable { get; set; }
        public string Calle { get; set; }
        public string Numero { get; set; }
        public string Dpto { get; set; }
        public string Pais { get; set; }
        public string Cp { get; set; }
        public string Provincia { get; set; }
        public string Departamento { get; set; }
        public string Distrito { get; set; }
        public string Contac_Nomb { get; set; }
        public string Contac_Tel { get; set; }
        public string Contac_Cel { get; set; }
        public string Contac_Mail { get; set; }
        public string Emp_Tel { get; set; }
        public string Emp_Cel { get; set; }
        public string Emp_Mail { get; set; }
        public string Emp_Web { get; set; }

        public string Contac_Mail1 { get; set; }
        public string Contac_Mail2 { get; set; }
        

        public string Id_Usuario { get; set; }

        public List< kx_proveedor_bcos> Bancos { get; set; } = new List<kx_proveedor_bcos>();

    }

    public class kx_proveedor_bcos
    {

        public string Id { get; set; }
        public string Banco { get; set; }
        public string Cbu { get; set; }
        public string Alias { get; set; }
        public string NroCuenta { get; set; }
        public string Otros { get; set; }
        public string Tipo { get; set; }

        
        public string Id_Proveedor { get; set; }
    }
}
