using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using MySql.Data.MySqlClient;
using System.Data;
using System.Globalization;
using System.Threading;

namespace Dal
{
    [Serializable()]

    public class Dalkx_cbtes
    {

        private MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");


        MySqlCommand cmm;


        public DataSet Cbate(string v_Id)
        {
            DataSet ds = new DataSet();
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                string cmdTxt = " select cf.Cuit,UPPER( cf.DomicilioComercial) DomicilioComercial, UPPER(cf.CondicionIVA) CondicionIVA,UPPER(cf.RazonSocial) RazonSocial,UPPER(cf.RazonSocial2) RazonSocial2,cf.IIBB,DATE_FORMAT(cf.FechaIniActividad,  '%d/%m/%y') FechaIniActividad,CAST(LPAD(cb.CbteDesde,8,'0')AS CHAR)   CbteDesde,CAST(LPAD(cb.PtoVta,4,'0') AS CHAR) PtoVta,DATE_FORMAT(cb.Fecha, '%d/%m/%Y') Fecha,getLetraNombre(cb.CbteTipo) 'Letra', cb.CbteTipo 'Cod_Letra',  concat(cl.Tipo_Doc,':')  Cli_Tipo_Doc,cl.Iva Cli_Iva,  UPPER(concat(cl.Apellido ,' ',cl.Nombre))  Cli_Nombre, UPPER(concat(cl.Calle,' ',cl.Numero) ) Cli_Domicilio,cb.CAE Cae,cb.CAEFchVto  CaeVto,FormaPrecio(cb.ImpNeto) SubTotal,FormaPrecio(cb.ImpTotal) Total,cl.Doc_No Cli_DocNO, cb.CodBarra  CodBarra,cb.Observaciones Afip_Observacion,getProvincia(cl.Provincia) Cli_Provincia,getDepartamento(cl.Departamento) Cli_Departamento, UPPER(if(cb.ImporteLetra is null,'',cb.ImporteLetra )) ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra,Remito,treintaDias   , if(MonId='PES','$:','USD:') Moneda, if(MonId='DOL',CONCAT('COTIZACIÓN: ',MonCotiz) ,'')  Cotizacion,Transferencia,cf.cbu CBU , Transferencia,  DATE_FORMAT(cb.FchVtoPago ,'%d/%m/%Y')  FchVtoPago, FormaPrecio(ImpTrib)  TributoTotal, if(TipoTranferencia='ADC','Agente de Depósito Colectivo','Sistema de Circulacion Abierta')  TipoTranferencia ";
                cmdTxt += "   from kx_cbtes cb, kx_config cf,kx_cliente cl    where     cf.id =cb.Id_config   and cb.Cliente =  cl.Id and cb.Id = '" + v_Id + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador = new MySqlDataAdapter(cmm);
                DataTable tabla = new DataTable("cab");
                adaptador.Fill(tabla);
                ds.Tables.Add(tabla);

                cmm = null;
                cmdTxt = " select  Nombre, Id_Articulo,Cant,FormaPrecio(NetoImpxUni) NetoImpxUni,concat(Alic,' ',CAST(ImpIva AS CHAR)) Iva,FormaPrecio(NetoImpTotal) NetoImpTotal,FormaPrecio(ImpxUni) ImpxUni,FormaPrecio(ImpTotal) ImpTotal, Descuento from kx_cbtes_articulos where id_cbte= '" + v_Id + "' ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador2 = new MySqlDataAdapter(cmm);
                DataTable tabla2 = new DataTable("det");

                adaptador2.Fill(tabla2);
                ds.Tables.Add(tabla2);



                cmm = null;
                cmdTxt = " select getIva(4,'" + v_Id + "') iva105,  getIva(5,'" + v_Id + "') iva21,  getIva(6,'" + v_Id + "') iva27,  getIva(3,'" + v_Id + "') iva0  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador3 = new MySqlDataAdapter(cmm);
                DataTable tabla3 = new DataTable("Iva");

                adaptador3.Fill(tabla3);
                ds.Tables.Add(tabla3);



                return ds;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }
        }

        public DataSet CbateCobro(string v_Id)
        {
            DataSet ds = new DataSet();
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                string cmdTxt = " select cf.Cuit,UPPER( cf.DomicilioComercial) DomicilioComercial, UPPER(cf.CondicionIVA) CondicionIVA,UPPER(cf.RazonSocial) RazonSocial,UPPER(cf.RazonSocial2) RazonSocial2,cf.IIBB,DATE_FORMAT(cf.FechaIniActividad,  '%d/%m/%y') FechaIniActividad,CAST(LPAD(cb.Id,8,'0')AS CHAR)   CbteDesde,CAST(LPAD(cb.PtoVta,4,'0') AS CHAR) PtoVta,DATE_FORMAT(cb.Fecha, '%d/%m/%Y') Fecha,getLetraNombre(cb.CbteTipo) 'Letra', cb.CbteTipo 'Cod_Letra',  concat('CUIT',':')  Cli_Tipo_Doc,cl.Iva Cli_Iva, UPPER(concat( cl.Nombre,' ', cl.Apellido ))  Cli_Nombre, UPPER(concat(cl.Calle,' ',cl.Numero) ) Cli_Domicilio,  FormaPrecio(cb.ImpTotal) Total,cl.Doc_No Cli_DocNO,   getCbteAsocPago(cb.Id)    Afip_Observacion , getProvincia(cl.Provincia) Cli_Provincia,getDepartamento(cl.Departamento) Cli_Departamento, UPPER(if(cb.ImporteLetra is null,'',cb.ImporteLetra )) ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra, if(MonId='PES','$:','USD:') Moneda, if(MonId='DOL',CONCAT('COTIZACIÓN: ',MonCotiz) ,'')  Cotizacion,Transferencia , FormaPrecio(Pago_Efectivo) Pago_Efectivo, FormaPrecio(Pago_Bancos) Pago_Bancos,FormaPrecio(Pago_Tarjetas) Pago_Tarjetas,FormaPrecio(Pago_Cheques) Pago_Cheques    ";
                cmdTxt += "   from kx_cbtes_cobro cb, kx_config cf,kx_cliente cl    where     cf.id =cb.Id_config   and cb.Cliente =  cl.Id and cb.Id = '" + v_Id + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador = new MySqlDataAdapter(cmm);
                DataTable tabla = new DataTable("cab");
                adaptador.Fill(tabla);
                ds.Tables.Add(tabla);
                 


                return ds;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }
        }
        public DataSet CbateCobroV1(string v_Id)
        {
            DataSet ds = new DataSet();
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                //string cmdTxt = "select cf.Cuit,UPPER( cf.DomicilioComercial) DomicilioComercial, UPPER(cf.CondicionIVA) CondicionIVA,UPPER(cf.RazonSocial) RazonSocial,UPPER(cf.RazonSocial2) RazonSocial2,cf.IIBB,DATE_FORMAT(cf.FechaIniActividad,  '%d/%m/%y') FechaIniActividad,CAST(LPAD(cb.Id,8,'0')AS CHAR)   CbteDesde,CAST(LPAD(cb.PtoVta,4,'0') AS CHAR) PtoVta,DATE_FORMAT(cb.Fecha, '%d/%m/%Y') Fecha,getLetraNombre(cb.CbteTipo) 'Letra', cb.CbteTipo 'Cod_Letra',  concat('CUIT',':')  Cli_Tipo_Doc,cl.Iva Cli_Iva,  UPPER(concat( cl.Cuit))  Cli_Nombre, UPPER(concat(cl.Calle,' ',cl.Numero) ) Cli_Domicilio,  FormaPrecio(cb.ImpTotal) Total,cl.Cuit Cli_DocNO,   getCbteAsocPago(cb.Id)   Afip_Observacion,getProvincia(cl.Provincia) Cli_Provincia,getDepartamento(cl.Departamento) Cli_Departamento, UPPER(if(cb.ImporteLetra is null,'',cb.ImporteLetra )) ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra, if(MonId='PES','$:','USD:') Moneda, if(MonId='DOL',CONCAT('COTIZACIÓN: ',MonCotiz) ,'')  Cotizacion,Transferencia , FormaPrecio(Pago_Efectivo) Pago_Efectivo, FormaPrecio(Pago_Bancos) Pago_Bancos,FormaPrecio(Pago_Tarjetas) Pago_Tarjetas,FormaPrecio(Pago_Cheques) Pago_Cheques ";
                //cmdTxt += "    from  kx_cbtes_pagos cb, kx_config cf, kx_proveedor cl    where     cf.id =cb.Id_config   and cb.Persona =  cl.Id and cb.Id = '" + v_Id + "'";
                //cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                string cmdTxt = " select cf.Cuit,UPPER( cf.DomicilioComercial) DomicilioComercial, UPPER(cf.CondicionIVA) CondicionIVA,UPPER(cf.RazonSocial) RazonSocial,UPPER(cf.RazonSocial2) RazonSocial2,cf.IIBB,DATE_FORMAT(cf.FechaIniActividad,  '%d/%m/%y') FechaIniActividad,CAST(LPAD(cb.Id,8,'0')AS CHAR)   CbteDesde,CAST(LPAD(cb.PtoVta,4,'0') AS CHAR) PtoVta,DATE_FORMAT(cb.Fecha, '%d/%m/%Y') Fecha,getLetraNombre(cb.CbteTipo) 'Letra', cb.CbteTipo 'Cod_Letra',  concat('CUIT',':')  Cli_Tipo_Doc,cl.Iva Cli_Iva, UPPER(concat( cl.Nombre,' ', cl.Apellido ))  Cli_Nombre, UPPER(concat(cl.Calle,' ',cl.Numero) ) Cli_Domicilio,  FormaPrecio(cb.ImpTotal) Total,cl.Doc_No Cli_DocNO,   getCbteAsocCobro(cb.Id)    Afip_Observacion , getProvincia(cl.Provincia) Cli_Provincia,getDepartamento(cl.Departamento) Cli_Departamento, UPPER(if(cb.ImporteLetra is null,'',cb.ImporteLetra )) ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra, if(MonId='PES','$:','USD:') Moneda, if(MonId='DOL',CONCAT('COTIZACIÓN: ',MonCotiz) ,'')  Cotizacion,Transferencia , FormaPrecio(Pago_Efectivo) Pago_Efectivo, FormaPrecio(Pago_Bancos) Pago_Bancos,FormaPrecio(Pago_Tarjetas) Pago_Tarjetas,FormaPrecio(Pago_Cheques) Pago_Cheques    ";
                cmdTxt += "   from kx_cbtes_cobro cb, kx_config cf,kx_cliente cl    where     cf.id =cb.Id_config   and cb.Cliente =  cl.Id and cb.Id = '" + v_Id + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador = new MySqlDataAdapter(cmm);
                DataTable tabla = new DataTable("cab");
                adaptador.Fill(tabla);
                ds.Tables.Add(tabla);

                cmm = null;
                cmdTxt = "";
                cmdTxt = "select   cb.Cta_Contable_Nomb Cta_Contable  ,  FormaPrecio(cb.Importe) Importe,cb.Cheque Cheque, UPPER(cb.Vto) Vto,UPPER(cb.Banco) Banco,UPPER(cb.Observacion)  Observacion, ( select concat( CAST(LPAD(TRIM(cbte.PtoVta),4,'0') AS CHAR),'-',CAST(LPAD(TRIM(cbte.CbteDesde),8,'0')AS CHAR) )  from  kx_cbtes cbte where  cbte.Id= cb.Cbte_Id) Cbte ";
                cmdTxt += "    from  kx_cbtes_cobro_items  cb   where     cb.Id_pago =  '" + v_Id + "' order by Cbte_Id";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador1 = new MySqlDataAdapter(cmm);
                DataTable tabla1 = new DataTable("Items");
                adaptador1.Fill(tabla1);
                ds.Tables.Add(tabla1);

                return ds;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }
        }

        public DataSet CbatePagoRp(string v_fecha1, string v_fecha2, string v_conf)
        {
            DataSet ds = new DataSet();
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                cmm = null;
                string cmdTxt = "sp_temp_pagos_rp";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_fecha1", v_fecha1);
                cnn.AgregarParametroAComando(cmm, "v_fecha2", v_fecha2);
                cnn.AgregarParametroAComando(cmm, "v_conf", v_conf);


                MySqlDataAdapter adaptador = new MySqlDataAdapter(cmm);
                DataTable tabla = new DataTable("PagosRp");
                adaptador.Fill(tabla);
                ds.Tables.Add(tabla);

                

                return ds;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }
        }
        public DataSet CbatePago(string v_Id)
        {
            DataSet ds = new DataSet();
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                string cmdTxt = "select cf.Cuit,UPPER( cf.DomicilioComercial) DomicilioComercial, UPPER(cf.CondicionIVA) CondicionIVA,UPPER(cf.RazonSocial) RazonSocial,UPPER(cf.RazonSocial2) RazonSocial2,cf.IIBB,DATE_FORMAT(cf.FechaIniActividad,  '%d/%m/%y') FechaIniActividad,CAST(LPAD(cb.Id,8,'0')AS CHAR)   CbteDesde,CAST(LPAD(cb.PtoVta,4,'0') AS CHAR) PtoVta,DATE_FORMAT(cb.Fecha, '%d/%m/%Y') Fecha,getLetraNombre(cb.CbteTipo) 'Letra', cb.CbteTipo 'Cod_Letra',  concat('CUIT',':')  Cli_Tipo_Doc,cl.Iva Cli_Iva,  UPPER(concat( cl.Denominacion))  Cli_Nombre, UPPER(concat(cl.Calle,' ',cl.Numero) ) Cli_Domicilio,  FormaPrecio(cb.ImpTotal) Total,cl.Cuit Cli_DocNO,   getCbteAsocPago(cb.Id)   Afip_Observacion,getProvincia(cl.Provincia) Cli_Provincia,getDepartamento(cl.Departamento) Cli_Departamento, UPPER(if(cb.ImporteLetra is null,'',cb.ImporteLetra )) ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra, if(MonId='PES','$:','USD:') Moneda, if(MonId='DOL',CONCAT('COTIZACIÓN: ',MonCotiz) ,'')  Cotizacion,Transferencia , FormaPrecio(Pago_Efectivo) Pago_Efectivo, FormaPrecio(Pago_Bancos) Pago_Bancos,FormaPrecio(Pago_Tarjetas) Pago_Tarjetas,FormaPrecio(Pago_Cheques) Pago_Cheques ";
                cmdTxt += "    from  kx_cbtes_pagos cb, kx_config cf, kx_proveedor cl    where     cf.id =cb.Id_config   and cb.Persona =  cl.Id and cb.Id = '" + v_Id + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador = new MySqlDataAdapter(cmm);
                DataTable tabla = new DataTable("cab");
                adaptador.Fill(tabla);
                ds.Tables.Add(tabla);

                cmm = null;
                cmdTxt = "";
                 cmdTxt = "select   cb.Cta_Contable_Nomb Cta_Contable  ,  FormaPrecio(cb.Importe) Importe,cb.Cheque Cheque, UPPER(cb.Vto) Vto,UPPER(cb.Banco) Banco,UPPER(cb.Observacion)  Observacion, ( select concat( CAST(LPAD(TRIM(cbte.PtoVta),4,'0') AS CHAR),'-',CAST(LPAD(TRIM(cbte.CbteDesde),8,'0')AS CHAR) )  from  kx_compras_cbtes cbte where  cbte.Id= cb.Cbte_Id) Cbte ";
                cmdTxt += "    from  kx_cbtes_pagos_items  cb   where     cb.Id_pago =  '" + v_Id + "' order by Cbte_Id";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador1 = new MySqlDataAdapter(cmm);
                DataTable tabla1 = new DataTable("Items");
                adaptador1.Fill(tabla1);
                ds.Tables.Add(tabla1);

                return ds;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }
        }
        public DataSet CbatePagoV2(string v_Id)
        {
            DataSet ds = new DataSet();
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                string cmdTxt = "select cf.Cuit,UPPER( cf.DomicilioComercial) DomicilioComercial, UPPER(cf.CondicionIVA) CondicionIVA,UPPER(cf.RazonSocial) RazonSocial,UPPER(cf.RazonSocial2) RazonSocial2,cf.IIBB,DATE_FORMAT(cf.FechaIniActividad,  '%d/%m/%y') FechaIniActividad,CAST(LPAD(cb.Id,8,'0')AS CHAR)   CbteDesde,CAST(LPAD(cb.PtoVta,4,'0') AS CHAR) PtoVta,DATE_FORMAT(cb.Fecha, '%d/%m/%Y') Fecha,getLetraNombre(cb.CbteTipo) 'Letra', cb.CbteTipo 'Cod_Letra',  concat('CUIT',':')  Cli_Tipo_Doc,cl.Iva Cli_Iva,  UPPER(concat( cl.Cuit))  Cli_Nombre, UPPER(concat(cl.Calle,' ',cl.Numero) ) Cli_Domicilio,  FormaPrecio(cb.ImpTotal) Total,cl.Cuit Cli_DocNO,   getCbteAsocPago(cb.Id)   Afip_Observacion,getProvincia(cl.Provincia) Cli_Provincia,getDepartamento(cl.Departamento) Cli_Departamento, UPPER(if(cb.ImporteLetra is null,'',cb.ImporteLetra )) ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra, if(MonId='PES','$:','USD:') Moneda, if(MonId='DOL',CONCAT('COTIZACIÓN: ',MonCotiz) ,'')  Cotizacion,Transferencia , FormaPrecio(Pago_Efectivo) Pago_Efectivo, FormaPrecio(Pago_Bancos) Pago_Bancos,FormaPrecio(Pago_Tarjetas) Pago_Tarjetas,FormaPrecio(Pago_Cheques) Pago_Cheques ";
                cmdTxt += "    from  kx_cbtes_pagos cb, kx_config cf, kx_proveedor cl    where     cf.id =cb.Id_config   and cb.Persona =  cl.Id and cb.Id = '" + v_Id + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador = new MySqlDataAdapter(cmm);
                DataTable tabla = new DataTable("cab");
                adaptador.Fill(tabla);
                ds.Tables.Add(tabla);

                cmm = null;
                cmdTxt = "";
                cmdTxt = "select   cb.Cta_Contable_Nomb Cta_Contable  ,  FormaPrecio(cb.Importe) Importe,cb.Cheque Cheque, UPPER(cb.Vto) Vto,UPPER(cb.Banco) Banco,UPPER(cb.Observacion)  Observacion ";
                cmdTxt += "    from  kx_cbtes_pagos_items  cb   where     cb.Id_pago =  '" + v_Id + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador1 = new MySqlDataAdapter(cmm);
                DataTable tabla1 = new DataTable("Items");
                adaptador1.Fill(tabla1);
                ds.Tables.Add(tabla1);

                return ds;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }
        }

        public DataSet Cbate_Nro(string v_nro)
        {
            DataSet ds = new DataSet();
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = " select  Id  as cant  from   kx_cbtes  where  CbteDesde = '" + v_nro + "' ";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataReader lector = cmm.ExecuteReader();
                Int32 v_Id = 0;
                while (lector.Read())
                {
                    v_Id = DalModelo.VeriIntMysql(lector, "cant");
                }
                lector.Close();
                cmm = null;

                cmdTxt = " select cf.Cuit,UPPER( cf.DomicilioComercial) DomicilioComercial, UPPER(cf.CondicionIVA) CondicionIVA,UPPER(cf.RazonSocial) RazonSocial,UPPER(cf.RazonSocial2) RazonSocial2,cf.IIBB,DATE_FORMAT(cf.FechaIniActividad,  '%d/%m/%y') FechaIniActividad,CAST(LPAD(cb.CbteDesde,8,'0')AS CHAR)   CbteDesde,CAST(LPAD(cb.PtoVta,4,'0') AS CHAR) PtoVta,DATE_FORMAT(cb.Fecha, '%d/%m/%y') Fecha,'Letra', cb.CbteTipo 'Cod_Letra',  concat(cl.Tipo_Doc,':')  Cli_Tipo_Doc,cl.Iva Cli_Iva,  UPPER(concat(cl.Apellido ,' ',cl.Nombre))  Cli_Nombre, UPPER(concat(cl.Calle,' ',cl.Numero) ) Cli_Domicilio,cb.CAE Cae,cb.CAEFchVto  CaeVto,FormaPrecio(cb.ImpNeto) SubTotal,FormaPrecio(cb.ImpTotal) Total,cl.Doc_No Cli_DocNO, cb.CodBarra  CodBarra,cb.Observaciones Afip_Observacion,getProvincia(cl.Provincia) Cli_Provincia,getDepartamento(cl.Departamento) Cli_Departamento, UPPER(if(cb.ImporteLetra is null,'',cb.ImporteLetra )) ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra,Remito,treintaDias   ";
                cmdTxt += "   from kx_cbtes cb, kx_config cf,kx_cliente cl    where     cf.id =cb.Id_config   and cb.Cliente =  cl.Id and cb.Id = '" + v_Id + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador = new MySqlDataAdapter(cmm);
                DataTable tabla = new DataTable("cab");
                adaptador.Fill(tabla);
                ds.Tables.Add(tabla);

                cmm = null;
                cmdTxt = " select  Nombre, Id_Articulo,Cant,FormaPrecio(NetoImpxUni) NetoImpxUni,concat(Alic,' ',CAST(ImpIva AS CHAR)) Iva,FormaPrecio(NetoImpTotal) NetoImpTotal,FormaPrecio(ImpxUni) ImpxUni,FormaPrecio(ImpTotal) ImpTotal from kx_cbtes_articulos where id_cbte= '" + v_Id + "' ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador2 = new MySqlDataAdapter(cmm);
                DataTable tabla2 = new DataTable("det");

                adaptador2.Fill(tabla2);
                ds.Tables.Add(tabla2);



                cmm = null;
                cmdTxt = " select getIva(4,'" + v_Id + "') iva105,  getIva(5,'" + v_Id + "') iva21,  getIva(6,'" + v_Id + "') iva27,  getIva(3,'" + v_Id + "') iva0  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataAdapter adaptador3 = new MySqlDataAdapter(cmm);
                DataTable tabla3 = new DataTable("Iva");

                adaptador3.Fill(tabla3);
                ds.Tables.Add(tabla3);



                return ds;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }
        }


        public kx_cbtes GetAnularCbte(string ids) {

            MySqlConnection cnn2 = new MySqlConnection();
            cnn2 = cnn.MySqlCrearNuevaConexion();
            cnn2.Open();
            kx_cbtes entidad2 = new kx_cbtes();
            try
            {

                string cmdTxt = "select Id,DATE_FORMAT(Fecha, '%d/%m/%Y') Fecha, CbteTipo,PtoVta,CbteDesde from kx_cbtes cb where  Id ='" + ids + "'  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataReader lector = cmm.ExecuteReader();

                while (lector.Read())
                {
                   
                    entidad2.anular_id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad2.anular_fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad2.anular_Nro = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad2.anular_Tipo= DalModelo.VerifStringMysql(lector, "CbteTipo");
                }
                lector.Close();
                return entidad2;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }

        public List<pais> WsListarAscProv(string ids, string Conf)
        {
            MySqlConnection cnn2 = new MySqlConnection();
            cnn2 = cnn.MySqlCrearNuevaConexion();
            cnn2.Open();
            List<pais> list = new List<pais>();
            try
            {

                string cmdTxt = " select cb.Cta_contable debe,(select     cbte.Cont_Compra  from kx_compras_cbtes_articulos cbte where       cbte.id_cbte=cb.Id limit 1) haber, Id, concat( getLetraNombre(cb.CbteTipo),'',   CAST(LPAD(cb.PtoVta,4,'0') AS CHAR),'-', CAST(LPAD(cb.CbteDesde,8,'0')AS CHAR), ' (', DATE_FORMAT( cb.Fecha, '%d/%m/%y' ) ,' ', getSaldoProveedor(Id,Id_config),'$ ',Prioridad, ')')   CbteDesde from kx_compras_cbtes cb where  Proveedor ='" + ids + "' and Id_config ='" + Conf + "'   and getSaldoProveedor(Id,Id_config)> 0  order by id    ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataReader lector = cmm.ExecuteReader();

                while (lector.Read())
                {
                    pais entidad2 = new pais();
                    entidad2.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad2.nombre = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad2.id_pais = DalModelo.VerifStringMysql(lector, "debe");
                    entidad2.anulado = DalModelo.VerifStringMysql(lector, "haber");
                    list.Add(entidad2);
                }
                lector.Close();
                return list;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }
        }


        public List<pais> WsListarAsc(string ids, string Conf)
        {
            MySqlConnection cnn2 = new MySqlConnection();
            cnn2 = cnn.MySqlCrearNuevaConexion();
            cnn2.Open();
            List<pais> list = new List<pais>();
            try { 

            string cmdTxt = "select Debe,Haber, Id, concat( getLetraNombre(cb.CbteTipo),'',   CAST(LPAD(cb.PtoVta,4,'0') AS CHAR),'-', CAST(LPAD(cb.CbteDesde,8,'0')AS CHAR),' (',DATE_FORMAT( cb.Fecha, '%d/%m/%y' ) ,' - $',getSaldoCbte(Id),')'  )   CbteDesde  from kx_cbtes cb where  Cliente ='" + ids + "' and Id_config ='" + Conf + "'  and Resultado ='A' and getSaldoCbte(Id) > 0    order by id    ";
  
            cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

            MySqlDataReader lector = cmm.ExecuteReader();

            while (lector.Read())
            {
                    pais entidad2 = new pais();
                entidad2.Id = DalModelo.VeriIntMysql(lector, "Id");
                entidad2.nombre = DalModelo.VerifStringMysql(lector, "CbteDesde"); 
                    entidad2.id_pais = DalModelo.VerifStringMysql(lector, "debe");
                    entidad2.anulado = DalModelo.VerifStringMysql(lector, "haber");

                    list.Add(entidad2);
            }
            lector.Close();
                return list;
             }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }
}

        public void PagarOrden(string ids, string cbate)
        {
            MySqlConnection cnn2 = new MySqlConnection();
            cnn2 = cnn.MySqlCrearNuevaConexion();
            cnn2.Open();
            try
            { 
                cmm = null;
              string  cmdTxt = "update  orden set Estado='"+ cbate + "' where Id ='" + ids + "' ";
              
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                cmm.ExecuteNonQuery();

            }
            catch (Exception)
            { 
                throw;
            } finally 
            { cnn2.Close(); }

        }


        public Be.kx_cliente WsExiste(string doc, string user)
        {
            MySqlConnection cnn2 = new MySqlConnection();
            Int32 sal = 0;
            kx_cliente entidad2 = new kx_cliente();
            try
            {

                string cmdTxt = "select Id,Cod_Manual, Tipo_Doc, Doc_No, Iva, Nombre, Apellido, Observacion, Cta_contable, Calle, Numero, Dpto, Pais, Cp, Provincia, Departamento, Distrito, Contac_Nomb, Contac_Tel, Contac_Cel, Contac_Mail, Emp_Tel, Emp_Cel, Emp_Mail, Emp_Web, ListaPrecio from kx_cliente where   ";


                if (doc == "99")
                {
                    cmdTxt += "  Doc_No like  '" + doc + "' ";
                }
                else {
                    cmdTxt += "  Doc_No like  '" + doc + "' and Id_Usuario= '" + user + "' ";
                }
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
               
            MySqlDataReader    lector = cmm.ExecuteReader();
             
                while (lector.Read())
                { 

                    entidad2.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad2.Cod_Manual = DalModelo.VerifStringMysql(lector, "Cod_Manual");
                    entidad2.Tipo_Doc = DalModelo.VerifStringMysql(lector, "Tipo_Doc");
                    entidad2.Doc_No = DalModelo.VerifStringMysql(lector, "Doc_No");
                    entidad2.Iva = DalModelo.VerifStringMysql(lector, "Iva");
                    entidad2.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad2.Apellido = DalModelo.VerifStringMysql(lector, "Apellido");
                    entidad2.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                    entidad2.Cta_contable = DalModelo.VerifStringMysql(lector, "Cta_contable");
                    entidad2.Calle = DalModelo.VerifStringMysql(lector, "Calle");
                    entidad2.Numero = DalModelo.VerifStringMysql(lector, "Numero");
                    entidad2.Dpto = DalModelo.VerifStringMysql(lector, "Dpto");
                    entidad2.Pais = DalModelo.VerifStringMysql(lector, "Pais");
                    entidad2.Cp = DalModelo.VerifStringMysql(lector, "Cp");
                    entidad2.Provincia = DalModelo.VerifStringMysql(lector, "Provincia");
                    entidad2.Departamento = DalModelo.VerifStringMysql(lector, "Departamento");
                    entidad2.Distrito = DalModelo.VerifStringMysql(lector, "Distrito");
                    entidad2.Contac_Nomb = DalModelo.VerifStringMysql(lector, "Contac_Nomb");
                    entidad2.Contac_Tel = DalModelo.VerifStringMysql(lector, "Contac_Tel");
                    entidad2.Contac_Cel = DalModelo.VerifStringMysql(lector, "Contac_Cel");
                    entidad2.Contac_Mail = DalModelo.VerifStringMysql(lector, "Contac_Mail");
                    entidad2.Emp_Tel = DalModelo.VerifStringMysql(lector, "Emp_Tel");
                    entidad2.Emp_Cel = DalModelo.VerifStringMysql(lector, "Emp_Cel");
                    entidad2.Emp_Mail = DalModelo.VerifStringMysql(lector, "Emp_Mail");
                    entidad2.Emp_Web = DalModelo.VerifStringMysql(lector, "Emp_Web");
                    entidad2.ListaP = DalModelo.VerifStringMysql(lector, "ListaPrecio");
                     
 
                }
                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }


            return entidad2 ;
        }

        public Be.kx_cliente WsExisteProveedor(string doc, string user)
        {
            MySqlConnection cnn2 = new MySqlConnection();
            Int32 sal = 0;
            kx_cliente entidad2 = new kx_cliente();
            try
            {

                string cmdTxt = "select Id,Cod_Manual,'80' Tipo_Doc,Cuit Doc_No, Iva,Denominacion Nombre , Observacion, Cta_contable, Calle, Numero, Dpto, Pais, Cp, Provincia, Departamento, Distrito, Contac_Nomb, Contac_Tel, Contac_Cel, Contac_Mail, Emp_Tel, Emp_Cel, Emp_Mail, Emp_Web,'' ListaPrecio from kx_proveedor where   ";


                if (doc == "99")
                {
                    cmdTxt += "  Cuit like  '" + doc + "' ";
                }
                else
                {
                    cmdTxt += "  Cuit like  '" + doc + "' and Id_Usuario= '" + user + "' ";
                }
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataReader lector = cmm.ExecuteReader();

                while (lector.Read())
                {

                    entidad2.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad2.Cod_Manual = DalModelo.VerifStringMysql(lector, "Cod_Manual");
                    entidad2.Tipo_Doc = DalModelo.VerifStringMysql(lector, "Tipo_Doc");
                    entidad2.Doc_No = DalModelo.VerifStringMysql(lector, "Doc_No");
                    entidad2.Iva = DalModelo.VerifStringMysql(lector, "Iva");
                    entidad2.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                   entidad2.Apellido = "";
                    entidad2.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                    entidad2.Cta_contable = DalModelo.VerifStringMysql(lector, "Cta_contable");
                    entidad2.Calle = DalModelo.VerifStringMysql(lector, "Calle");
                    entidad2.Numero = DalModelo.VerifStringMysql(lector, "Numero");
                    entidad2.Dpto = DalModelo.VerifStringMysql(lector, "Dpto");
                    entidad2.Pais = DalModelo.VerifStringMysql(lector, "Pais");
                    entidad2.Cp = DalModelo.VerifStringMysql(lector, "Cp");
                    entidad2.Provincia = DalModelo.VerifStringMysql(lector, "Provincia");
                    entidad2.Departamento = DalModelo.VerifStringMysql(lector, "Departamento");
                    entidad2.Distrito = DalModelo.VerifStringMysql(lector, "Distrito");
                    entidad2.Contac_Nomb = DalModelo.VerifStringMysql(lector, "Contac_Nomb");
                    entidad2.Contac_Tel = DalModelo.VerifStringMysql(lector, "Contac_Tel");
                    entidad2.Contac_Cel = DalModelo.VerifStringMysql(lector, "Contac_Cel");
                    entidad2.Contac_Mail = DalModelo.VerifStringMysql(lector, "Contac_Mail");
                    entidad2.Emp_Tel = DalModelo.VerifStringMysql(lector, "Emp_Tel");
                    entidad2.Emp_Cel = DalModelo.VerifStringMysql(lector, "Emp_Cel");
                    entidad2.Emp_Mail = DalModelo.VerifStringMysql(lector, "Emp_Mail");
                    entidad2.Emp_Web = DalModelo.VerifStringMysql(lector, "Emp_Web");
                    entidad2.ListaP = DalModelo.VerifStringMysql(lector, "ListaPrecio");


                }
                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }


            return entidad2;
        }

        public int    Mod10(string str)
        {
            // segun rg1702 afip

            int bb = 0;
            Int32 impar = 0;
            Int32 par = 0;
            Int32 etapa2 = 0;
            Int32 etapa4 = 0;
            Int32 digito = 0;

            foreach (char c in str.ToCharArray())
            {

                // 1 paso sumo los q estan en posicion impar

                bb++;
              
                if (!(bb % 2 == 0))
                {
                    impar += Convert.ToInt32(c.ToString());
                }
                else
                {
                    par += Convert.ToInt32(c.ToString());

                }



                // multiplico el resultado por 3
                etapa2 = impar * 3;
                // sumo etap2 mas pares

                etapa4 = par + etapa2;


                digito = 10 - (etapa4 - ((etapa4 / 10) * 10));


            }
            if (digito == 10) { return 0; }
            else
            { return digito; }

        }

        public void UpdateCancelar(string id, string cbate)
        {
            MySqlConnection cnn2 = new MySqlConnection();
          
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = "";
                cmm = null;

                cmdTxt = "update  kx_cbtes   set Observaciones='ANULADO NOTA CREDITO Nro: " + cbate + "' WHERE  Id='"+id+"'";
                 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                cnn2.Close();
            }


        }

        public string AltaCompras(kx_cbtes v_obj)
        {
            Int32 ids = 0;
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {
                string serv = "N";
                string CodBarra = v_obj.Cuit + string.Format("{0:d2}", Convert.ToInt32(v_obj.CbteTipo)) + string.Format("{0:d4}", Convert.ToInt32(v_obj.PtoVta)) + v_obj.CAE + v_obj.CAEFchVto;
                string digi = Mod10(CodBarra).ToString();
                v_obj.CodBarra = CodBarra + digi;


                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";

                if (v_obj.DocNro == "99") // se fija si tiene como cliente un consumidor final sino lo agrega
                {
                    cmm = null;
                    cmdTxt = "wi271852_kardex.consumidor_final";
                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                    cnn.AgregarParametroAComando(cmm, "v_config", v_obj.Id_config);

                    MySqlParameter outSal22 = cnn.AgregarParametroAComandoOut(cmm, "v_sal");
                    cmm.ExecuteNonQuery();
                    v_obj.Cliente = outSal22.Value.ToString();

                    cmm.ExecuteNonQuery();

                }

                cmm = null;

                cmdTxt = "insert into kx_compras_cbtes (CantReg, CbteTipo, PtoVta, Fecha, usuario, Resultado, Vendedor, Proveedor, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones,CodBarra, Id_config,Pago_Efectivo,Pago_Ctacte,Pago_Cheques,Pago_Tarjetas,ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra, Remito,treintaDias, RazonSocial, CantAlic ,FchVtoPago,Transferencia,Prioridad,Cta_contable) values ('" + v_obj.CantReg + "', '" + v_obj.CbteTipo + "', '" + v_obj.PtoVta + "', STR_TO_DATE('" + v_obj.Fecha + "','%d/%m/%Y'), '" + v_obj.usuario + "', '" + v_obj.Resultado + "', '" + v_obj.Vendedor + "', '" + v_obj.Cliente + "', now(), '" + v_obj.Concepto + "', '" + v_obj.DocTipo + "', '" + v_obj.DocNro + "', '" + v_obj.CbteDesde + "', '" + v_obj.CbteHasta + "', '" + v_obj.CbteFch + "', '" + v_obj.ImpTotal + "', '" + v_obj.ImpTotConc + "', '" + v_obj.ImpNeto + "', '" + v_obj.ImpOpEx + "', '" + v_obj.ImpTrib + "', '" + v_obj.ImpIVA + "', '" + v_obj.MonId + "', '" + v_obj.MonCotiz + "', '" + v_obj.CAE + "', '" + v_obj.CAEFchVto + "', '" + v_obj.Observaciones + "','" + v_obj.CodBarra + "' ,'" + v_obj.Id_config + "','" + v_obj.Pago_Efectivo + "','" + v_obj.Pago_Bancos + "'  ,'" + v_obj.Pago_Cheques + "' ,'" + v_obj.Pago_Tarjetas + "','" + v_obj.ImporteLetra + "','" + v_obj.Contado + "','" + v_obj.Tj_Debito + "','" + v_obj.Tj_Credito + "' ,'" + v_obj.CtaCte + "' ,'" + v_obj.Cheque + "' ,'" + v_obj.Otra + "'  ,'" + v_obj.Remito + "'  ,'" + v_obj.treintaDias + "',(select concat(Nombre,' ', Apellido)   from kx_cliente where  id ='" + v_obj.Cliente + "') , '" + v_obj.CantAlic + "', STR_TO_DATE('" + v_obj.FchVtoPago + "','%d/%m/%Y'),'" + v_obj.Transferencia + "','" + v_obj.Prioridad + "','" + v_obj.Cta_contrable + "')  ";




                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();


                cmm = null;

                cmdTxt = " select max(Id) cant from kx_compras_cbtes ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector2 = cmm.ExecuteReader();

                while (lector2.Read())
                {

                    ids = Convert.ToInt32(lector2["cant"]);

                }
                lector2.Close();

                foreach (var obj in v_obj.Articulos)
                {
                    cmm = null;
                    cmdTxt = " insert into kx_compras_cbtes_articulos (Id_Articulo,Cod_Manual, Nombre, Cant, Alic, ImpxUni, ImpTotal, id_cbte,NetoImpxUni,NetoImpTotal,ImpIva,Tipo_Art,Unidad,IIBB,ID_DEPOSITO,Descuento,Cont_Venta,Cont_Compra,Compra_Neto) values ('" + obj.Id_Articulo + "', '" + obj.Cod_Manual + "', '" + obj.Nombre + "', '" + obj.Cant + "', '" + obj.Alic + "', '" + obj.ImpxUni + "', '" + obj.ImpTotal + "', '" + ids + "', '" + obj.NetoImpxUni + "', '" + obj.NetoImpTotal + "', '" + obj.ImpIva + "', '" + obj.Tipo_Art + "', '" + obj.Unidad + "', '" + obj.IIBB + "', '" + obj.DepositoSelect + "', '" + obj.Descuento + "', '" + obj.Cont_Venta + "', '" + obj.Cont_Compra + "', '" + obj.Compra_Neto + "')";

                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                    cmm.ExecuteNonQuery();

                    string ds = DateTime.Now.ToString("dd/MM/yyyy");
                    // PARA Q no DESCUENTE DEL STOCK
                    //serv = "S";

                    //if (obj.es_Stock == "SI")
                    //{
                    //    // PARA Q DESCUENTE DEL STOCK
                    //    serv = "N"; //si es servicio  N pq es articulo  y descuenta
                    //}
                    //if (obj.Cod_Manual == "MANUAL")
                    //{
                    //    serv = "S";
                    //}
                    //if (obj.Tipo_Art == "SERVICIO")
                    //{
                    //    // PARA Q no DESCUENTE DEL STOCK
                    //    serv = "S";
                    //}

                  
                    


                    // actualizo el stock
                    if (obj.es_Stock == "SI" && v_obj.Resultado != "R")

                    {
                        //cmm = null;
                        //cmdTxt = "wi271852_kardex.Stock_update";

                        //cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                        //cnn.AgregarParametroAComando(cmm, "v_tipo", "S");
                        //cnn.AgregarParametroAComando(cmm, "v_art", obj.Id_Articulo);
                        //cnn.AgregarParametroAComando(cmm, "v_cant", obj.Cant);
                        //cnn.AgregarParametroAComando(cmm, "v_dep", obj.DepositoSelect);
                        //cnn.AgregarParametroAComando(cmm, "v_motivo", "Factura n°: " + v_obj.CbteDesde + " - Cbte id: " + ids);


                        //cnn.AgregarParametroAComando(cmm, "v_remito", "");
                        //cnn.AgregarParametroAComando(cmm, "v_origen", "");
                        //cnn.AgregarParametroAComando(cmm, "v_proveedor", "");
                        //cnn.AgregarParametroAComando(cmm, "v_comentario", "");
                        //cnn.AgregarParametroAComando(cmm, "v_tipo_ingreso", "");
                        //cnn.AgregarParametroAComando(cmm, "v_lote", "");
                        //cnn.AgregarParametroAComando(cmm, "v_vto", "");


                        //cmm.ExecuteNonQuery();
                    }

                }

                if (v_obj.Tarjetas != null)
                {
                    foreach (var v_obj1 in v_obj.Tarjetas)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_compras_tarjetas (Tarjeta, Tarjeta_No, Cuotas, Cupon_No, Monto, id_cbte) values ('" + v_obj1.Tarjeta + "', '" + v_obj1.Tarjeta_No + "', '" + v_obj1.Cuotas + "', '" + v_obj1.Cupon_No + "', '" + v_obj1.Monto + "', '" + ids + "') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }
                if (v_obj.AlicIva != null)
                {
                    foreach (var v_obj1 in v_obj.AlicIva)
                    {


                        cmm = null;
                        cmdTxt = " insert into kx_compras_cbtes_aliciva (Id,BaseImp,Importe,id_cbte) values ('" + v_obj1.Id + "', '" + v_obj1.BaseImp + "', '" + v_obj1.Importe + "', '" + ids + "') ";
                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }
                }

                if (v_obj.Cheques != null)
                {
                    foreach (var v_obj2 in v_obj.Cheques)
                    {
                        cmm = null;
                        cmdTxt = "insert into kx_compras_cheques (cheque_no, banco, tipo, monto, id_cbte, Dias, CodCliente, CodProveedor, Librador, FechaEmision, FechaCobro, FechaVto, CUITLibrador) values ('" + v_obj2.cheque_no + "', '" + v_obj2.banco + "', '" + v_obj2.tipo + "', '" + v_obj2.monto + "', '" + ids + "', '" + v_obj2.Dias + "', '" + v_obj2.CodCliente + "', '" + v_obj2.CodProveedor + "', '" + v_obj2.Librador + "',   STR_TO_DATE('" + v_obj2.FechaEmision + "','%d/%m/%Y') ,STR_TO_DATE('" + v_obj2.FechaCobro + "','%d/%m/%Y'), STR_TO_DATE('" + v_obj2.FechaVto + "','%d/%m/%Y'), '" + v_obj2.CUITLibrador + "') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }

                }

                /// registro de asiento de ventas

                cmm = null;
                cmdTxt = "sp_crear_asiento_compras";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_cbte", ids.ToString());
                cmm.ExecuteNonQuery();
                




                return ids.ToString();

            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }


        public string AltaComprasV2(kx_cbtes v_obj)
        {
            Int32 ids = 0;
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {
                string serv = "N";
                string CodBarra = v_obj.Cuit + string.Format("{0:d2}", Convert.ToInt32(v_obj.CbteTipo)) + string.Format("{0:d4}", Convert.ToInt32(v_obj.PtoVta)) + v_obj.CAE + v_obj.CAEFchVto;
                string digi = Mod10(CodBarra).ToString();
                v_obj.CodBarra = CodBarra + digi;


                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";

                if (v_obj.DocNro == "99") // se fija si tiene como cliente un consumidor final sino lo agrega
                {
                    cmm = null;
                    cmdTxt = "wi271852_kardex.consumidor_final";
                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                    cnn.AgregarParametroAComando(cmm, "v_config", v_obj.Id_config);

                    MySqlParameter outSal22 = cnn.AgregarParametroAComandoOut(cmm, "v_sal");
                    cmm.ExecuteNonQuery();
                    v_obj.Cliente = outSal22.Value.ToString();

                    cmm.ExecuteNonQuery();

                }

                cmm = null;

                cmdTxt = "insert into kx_compras_cbtes (CantReg, CbteTipo, PtoVta, Fecha, usuario, Resultado, Vendedor, Proveedor, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones,CodBarra, Id_config,Pago_Efectivo,Pago_Ctacte,Pago_Cheques,Pago_Tarjetas,ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra, Remito,treintaDias, RazonSocial, CantAlic ,FchVtoPago,Transferencia,Prioridad,Cta_contable,CbteAsoc) values ('" + v_obj.CantReg + "', '" + v_obj.CbteTipo + "', '" + v_obj.PtoVta + "', STR_TO_DATE('" + v_obj.Fecha + "','%d/%m/%Y'), '" + v_obj.usuario + "', '" + v_obj.Resultado + "', '" + v_obj.Vendedor + "', '" + v_obj.Cliente + "', now(), '" + v_obj.Concepto + "', '" + v_obj.DocTipo + "', '" + v_obj.DocNro + "', '" + v_obj.CbteDesde.Trim() + "', '" + v_obj.CbteHasta.Trim() + "', '" + v_obj.CbteFch + "', '" + v_obj.ImpTotal + "', '" + v_obj.ImpTotConc + "', '" + v_obj.ImpNeto + "', '" + v_obj.ImpOpEx + "', '" + v_obj.ImpTrib + "', '" + v_obj.ImpIVA + "', '" + v_obj.MonId + "', '" + v_obj.MonCotiz + "', '" + v_obj.CAE + "', '" + v_obj.CAEFchVto + "', '" + v_obj.Observaciones + "','" + v_obj.CodBarra + "' ,'" + v_obj.Id_config + "','" + v_obj.Pago_Efectivo + "','" + v_obj.Pago_Bancos + "'  ,'" + v_obj.Pago_Cheques + "' ,'" + v_obj.Pago_Tarjetas + "','" + v_obj.ImporteLetra + "','" + v_obj.Contado + "','" + v_obj.Tj_Debito + "','" + v_obj.Tj_Credito + "' ,'" + v_obj.CtaCte + "' ,'" + v_obj.Cheque + "' ,'" + v_obj.Otra + "'  ,'" + v_obj.Remito + "'  ,'" + v_obj.treintaDias + "',(select concat(Nombre,' ', Apellido)   from kx_cliente where  id ='" + v_obj.Cliente + "') , '" + v_obj.CantAlic + "', STR_TO_DATE('" + v_obj.FchVtoPago + "','%d/%m/%Y'),'" + v_obj.Transferencia + "','" + v_obj.Prioridad + "','" + v_obj.Cta_contrable + "','" + v_obj.anular_id + "')  ";




                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();


                cmm = null;

                cmdTxt = " select max(Id) cant from kx_compras_cbtes ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector2 = cmm.ExecuteReader();

                while (lector2.Read())
                {

                    ids = Convert.ToInt32(lector2["cant"]);

                }
                lector2.Close();

                foreach (var obj in v_obj.Articulos)
                {
                    cmm = null;
                    cmdTxt = " insert into kx_compras_cbtes_articulos (Id_Articulo,Cod_Manual, Nombre, Cant, Alic, ImpxUni, ImpTotal, id_cbte,NetoImpxUni,NetoImpTotal,ImpIva,Tipo_Art,Unidad,IIBB,ID_DEPOSITO,Descuento,Cont_Venta,Cont_Compra,Compra_Neto) values ('" + obj.Id_Articulo + "', '" + obj.Cod_Manual + "', '" + obj.Nombre + "', '" + obj.Cant + "', '" + obj.Alic + "', '" + obj.ImpxUni + "', '" + obj.ImpTotal + "', '" + ids + "', '" + obj.NetoImpxUni + "', '" + obj.NetoImpTotal + "', '" + obj.ImpIva + "', '" + obj.Tipo_Art + "', '" + obj.Unidad + "', '" + obj.IIBB + "', '" + obj.DepositoSelect + "', '" + obj.Descuento + "', '" + obj.Cont_Venta + "', '" + obj.Cont_Compra + "', '" + obj.Compra_Neto + "')";

                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                    cmm.ExecuteNonQuery();

                    string ds = DateTime.Now.ToString("dd/MM/yyyy");
                    // PARA Q no DESCUENTE DEL STOCK
                    //serv = "S";

                    //if (obj.es_Stock == "SI")
                    //{
                    //    // PARA Q DESCUENTE DEL STOCK
                    //    serv = "N"; //si es servicio  N pq es articulo  y descuenta
                    //}
                    //if (obj.Cod_Manual == "MANUAL")
                    //{
                    //    serv = "S";
                    //}
                    //if (obj.Tipo_Art == "SERVICIO")
                    //{
                    //    // PARA Q no DESCUENTE DEL STOCK
                    //    serv = "S";
                    //}





                    // actualizo el stock
                    if (obj.es_Stock == "SI" && v_obj.Resultado != "R")

                    {
                        //cmm = null;
                        //cmdTxt = "wi271852_kardex.Stock_update";

                        //cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                        //cnn.AgregarParametroAComando(cmm, "v_tipo", "S");
                        //cnn.AgregarParametroAComando(cmm, "v_art", obj.Id_Articulo);
                        //cnn.AgregarParametroAComando(cmm, "v_cant", obj.Cant);
                        //cnn.AgregarParametroAComando(cmm, "v_dep", obj.DepositoSelect);
                        //cnn.AgregarParametroAComando(cmm, "v_motivo", "Factura n°: " + v_obj.CbteDesde + " - Cbte id: " + ids);


                        //cnn.AgregarParametroAComando(cmm, "v_remito", "");
                        //cnn.AgregarParametroAComando(cmm, "v_origen", "");
                        //cnn.AgregarParametroAComando(cmm, "v_proveedor", "");
                        //cnn.AgregarParametroAComando(cmm, "v_comentario", "");
                        //cnn.AgregarParametroAComando(cmm, "v_tipo_ingreso", "");
                        //cnn.AgregarParametroAComando(cmm, "v_lote", "");
                        //cnn.AgregarParametroAComando(cmm, "v_vto", "");


                        //cmm.ExecuteNonQuery();
                    }

                }

                if (v_obj.Percepciones != null)
                {
                    foreach (var v_objp in v_obj.Percepciones)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_cbtes_percepciones (Id_cbte, Id_Percep, Monto, Obs,Config,Tipo) values ('" + ids + "', '" + v_objp.Id_Percep.ToUpper() + "', '" + v_objp.Monto.Replace(",", ".") + "', '" + v_objp.Obs.ToUpper() + "','" + v_obj.Id_config + "','COMPRAS')  ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }

                if (v_obj.Tarjetas != null)
                {
                    foreach (var v_obj1 in v_obj.Tarjetas)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_compras_tarjetas (Tarjeta, Tarjeta_No, Cuotas, Cupon_No, Monto, id_cbte) values ('" + v_obj1.Tarjeta + "', '" + v_obj1.Tarjeta_No + "', '" + v_obj1.Cuotas + "', '" + v_obj1.Cupon_No + "', '" + v_obj1.Monto + "', '" + ids + "') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }
                if (v_obj.AlicIva != null)
                {
                    foreach (var v_obj1 in v_obj.AlicIva)
                    {


                        cmm = null;
                        cmdTxt = " insert into kx_compras_cbtes_aliciva (Id,BaseImp,Importe,id_cbte) values ('" + v_obj1.Id + "', '" + v_obj1.BaseImp + "', '" + v_obj1.Importe + "', '" + ids + "') ";
                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }
                }

                if (v_obj.Cheques != null)
                {
                    foreach (var v_obj2 in v_obj.Cheques)
                    {
                        cmm = null;
                        cmdTxt = "insert into kx_compras_cheques (cheque_no, banco, tipo, monto, id_cbte, Dias, CodCliente, CodProveedor, Librador, FechaEmision, FechaCobro, FechaVto, CUITLibrador) values ('" + v_obj2.cheque_no + "', '" + v_obj2.banco + "', '" + v_obj2.tipo + "', '" + v_obj2.monto + "', '" + ids + "', '" + v_obj2.Dias + "', '" + v_obj2.CodCliente + "', '" + v_obj2.CodProveedor + "', '" + v_obj2.Librador + "',   STR_TO_DATE('" + v_obj2.FechaEmision + "','%d/%m/%Y') ,STR_TO_DATE('" + v_obj2.FechaCobro + "','%d/%m/%Y'), STR_TO_DATE('" + v_obj2.FechaVto + "','%d/%m/%Y'), '" + v_obj2.CUITLibrador + "') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }

                }

                /// registro de asiento de ventas

                cmm = null;
                cmdTxt = "sp_crear_asiento_comprasV2";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_cbte", ids.ToString());
                cmm.ExecuteNonQuery();





                return ids.ToString();

            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }

     
        public string AltaPagoV2(kx_cbtes_pagos v_obj)
        {
            Int32 ids = 0;
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";


                cmm = null;
                //Math.Round(Double.Parse(iva.BaseImp.Replace(",", "."), numberFormatInfo), 2);
                // double total = Math.Round(Convert.ToDouble( v_obj.Pago_Efectivo.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Cheques.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Tarjetas.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Bancos.Replace(",", "."));
                cmdTxt = "insert into kx_cbtes_pagos (  Config, Fecha,  usuario,Resultado,Vendedor,Persona,CbteId, MonId,MonCotiz,Observaciones,Id_config,Pago_Efectivo,Pago_Cheques,Pago_Tarjetas,ImporteLetra ,  Contado,  Tj_Debito, Tj_Credito, CtaCte, Cheque,Otra,RazonSocial,Transferencia,Pago_Bancos,PtoVta,CbteTipo, Cta_Contable,ImpTotal) ";
                cmdTxt += " values ('" + v_obj.Id_config + "',now(), '" + v_obj.usuario + "',  '" + v_obj.Resultado + "', '" + v_obj.Vendedor + "', '" + v_obj.Cliente + "',   '" + v_obj.anular_Nro + "',  '" + v_obj.MonId + "', '" + v_obj.MonCotiz + "', '" + v_obj.Observaciones + "', '" + v_obj.Id_config + "', '" + v_obj.Pago_Efectivo + "', '" + v_obj.Pago_Cheques + "', '" + v_obj.Pago_Tarjetas + "', '" + v_obj.ImporteLetra + "', '" + v_obj.Contado + "', ";
                cmdTxt += "  '" + v_obj.Tj_Debito + "' ,'" + v_obj.Tj_Credito + "' ,'" + v_obj.CtaCte + "' ,'" + v_obj.Cheque + "' ,'" + v_obj.Otra + "' ,(select Denominacion   from kx_proveedor  where  id ='" + v_obj.Cliente + "') , '" + v_obj.Transferencia + "', '" + v_obj.Pago_Bancos + "', '" + v_obj.PtoVta + "', '" + v_obj.CbteTipo + "', '" + v_obj.Cta_contrable + "', '" + v_obj.ImpTotal + "')  ";




                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();


                cmm = null;

                cmdTxt = " select max(Id) cant from kx_cbtes_pagos";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector2 = cmm.ExecuteReader();

                while (lector2.Read())
                {

                    ids = Convert.ToInt32(lector2["cant"]);

                }
                lector2.Close();


                if (v_obj.Tarjetas != null)
                {
                    foreach (var v_obj1 in v_obj.Tarjetas)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_tarjetas (Tarjeta, Tarjeta_No, Cuotas, Cupon_No, Monto, id_cbte, Tipo) values ('" + v_obj1.Tarjeta + "', '" + v_obj1.Tarjeta_No + "', '" + v_obj1.Cuotas + "', '" + v_obj1.Cupon_No + "', '" + v_obj1.Monto + "', '" + ids + "','Pago') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }

                if (v_obj.Cbtes != null)
                {
                    foreach (var v_obj1 in v_obj.Cbtes)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_cbtes_pagos_cbtes (CbteId, Monto,PagoId) values ('" + v_obj1.CbteId + "', '" + v_obj1.Monto + "', '" + ids + "') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }



                if (v_obj.Pagos_items != null)
                {
                    foreach (var v_obj1 in v_obj.Pagos_items)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_cbtes_pagos_items (Cta_Contable, Importe, Cheque, Vto, Banco, Observacion, Id_pago,Cta_Contable_Nomb,Cbte_Id) values ('" + v_obj1.Cta_Contable + "', '" + v_obj1.Importe + "', '" + v_obj1.Cheque + "', '" + v_obj1.Vto + "', '" + v_obj1.Banco + "', '" + v_obj1.Observacion + "', '" + ids + "', '" + v_obj1.Cta_ContableStr + "','" + ((kx_cbtes_pagos_cbtes)v_obj.Cbtes[0]).CbteId + "'  ) ";


                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }

                if (v_obj.Cheques != null)
                {
                    foreach (var v_obj2 in v_obj.Cheques)
                    {
                        cmm = null;
                        cmdTxt = "insert into kx_cheques (cheque_no, banco, tipo, monto, id_cbte, Dias, CodCliente, CodProveedor, Librador, FechaEmision, FechaCobro, FechaVto, CUITLibrador,Tramite) values ('" + v_obj2.cheque_no + "', '" + v_obj2.banco + "', '" + v_obj2.tipo + "', '" + v_obj2.monto + "', '" + ids + "', '" + v_obj2.Dias + "', '" + v_obj2.CodCliente + "', '" + v_obj2.CodProveedor + "', '" + v_obj2.Librador + "',   STR_TO_DATE('" + v_obj2.FechaEmision + "','%d/%m/%Y') ,STR_TO_DATE('" + v_obj2.FechaCobro + "','%d/%m/%Y'), STR_TO_DATE('" + v_obj2.FechaVto + "','%d/%m/%Y'), '" + v_obj2.CUITLibrador + "', 'Pago') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }

                }

                /// registro de asiento 

                cmm = null;
                cmdTxt = "sp_crear_asiento_pagoV2";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_cbte", ids.ToString());
                cmm.ExecuteNonQuery();



                /// actualizo ctacte

                cmm = null;
                cmdTxt = "sp_pago_salgo";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_PAGO", ids.ToString());
                cmm.ExecuteNonQuery();

                return ids.ToString();

            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }

        public string AltaCobro(kx_cbtes v_obj)
        {
            Int32 ids = 0;
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {
               
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";

              
                cmm = null;
            
                cmdTxt = "insert into kx_cbtes_cobro (   Fecha,  usuario,Resultado,Vendedor,Cliente,CbteId, MonId,MonCotiz,Observaciones,Id_config,Pago_Efectivo,Pago_Cheques,Pago_Tarjetas,ImporteLetra ,  Contado,  Tj_Debito, Tj_Credito, CtaCte, Cheque,Otra,RazonSocial,Transferencia,Pago_Bancos,PtoVta) ";
                cmdTxt += " values (now(), '" + v_obj.usuario + "',  '" + v_obj.Resultado + "', '" + v_obj.Vendedor + "', '" + v_obj.Cliente + "',   '" + v_obj.anular_Nro + "',  '" + v_obj.MonId + "', '" + v_obj.MonCotiz + "', '" + v_obj.Observaciones + "', '" + v_obj.Id_config + "', '" + v_obj.Pago_Efectivo + "', '" + v_obj.Pago_Cheques + "', '" + v_obj.Pago_Tarjetas + "', '" + v_obj.ImporteLetra + "', '" + v_obj.Contado + "', ";
                cmdTxt += "  '" + v_obj.Tj_Debito + "' ,'" + v_obj.Tj_Credito + "' ,'" + v_obj.CtaCte + "' ,'" + v_obj.Cheque + "' ,'" + v_obj.Otra + "' ,(select concat(Nombre,' ', Apellido)   from kx_cliente where  id ='" + v_obj.Cliente + "') , '" + v_obj.Transferencia + "', '" + v_obj.Pago_Bancos + "', '" + v_obj.PtoVta + "')  ";




                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();


                cmm = null;

                cmdTxt = " select max(Id) cant from kx_cbtes_cobro ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector2 = cmm.ExecuteReader();

                while (lector2.Read())
                {

                    ids = Convert.ToInt32(lector2["cant"]);

                }
                lector2.Close();

              
                if (v_obj.Tarjetas != null)
                {
                    foreach (var v_obj1 in v_obj.Tarjetas)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_tarjetas (Tarjeta, Tarjeta_No, Cuotas, Cupon_No, Monto, id_cbte, Tipo) values ('" + v_obj1.Tarjeta + "', '" + v_obj1.Tarjeta_No + "', '" + v_obj1.Cuotas + "', '" + v_obj1.Cupon_No + "', '" + v_obj1.Monto + "', '" + ids + "','Cobro') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }
               
                if (v_obj.Cheques != null)
                {
                    foreach (var v_obj2 in v_obj.Cheques)
                    {
                        cmm = null;
                        cmdTxt = "insert into kx_cheques (cheque_no, banco, tipo, monto, id_cbte, Dias, CodCliente, CodProveedor, Librador, FechaEmision, FechaCobro, FechaVto, CUITLibrador,Tramite) values ('" + v_obj2.cheque_no + "', '" + v_obj2.banco + "', '" + v_obj2.tipo + "', '" + v_obj2.monto + "', '" + ids + "', '" + v_obj2.Dias + "', '" + v_obj2.CodCliente + "', '" + v_obj2.CodProveedor + "', '" + v_obj2.Librador + "',   STR_TO_DATE('" + v_obj2.FechaEmision + "','%d/%m/%Y') ,STR_TO_DATE('" + v_obj2.FechaCobro + "','%d/%m/%Y'), STR_TO_DATE('" + v_obj2.FechaVto + "','%d/%m/%Y'), '" + v_obj2.CUITLibrador + "', 'Cobro') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }

                }

                /// registro de asiento 

                cmm = null;
                cmdTxt = "sp_crear_asiento_cobro";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_cbte", ids.ToString());
                cmm.ExecuteNonQuery();
                /// 




                return ids.ToString();

            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }

        public string AltaCobroV2(kx_cbtes_pagos v_obj)
        {
            Int32 ids = 0;
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";


                cmm = null;
                //Math.Round(Double.Parse(iva.BaseImp.Replace(",", "."), numberFormatInfo), 2);
                // double total = Math.Round(Convert.ToDouble( v_obj.Pago_Efectivo.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Cheques.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Tarjetas.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Bancos.Replace(",", "."));
                cmdTxt = "insert into kx_cbtes_cobro ( ImpTotal, Fecha,  usuario,Resultado,Vendedor,Cliente,CbteId, MonId,MonCotiz,Observaciones,Id_config,Pago_Efectivo,Pago_Cheques,Pago_Tarjetas,ImporteLetra ,  Contado,  Tj_Debito, Tj_Credito, CtaCte, Cheque,Otra,RazonSocial,Transferencia,Pago_Bancos,PtoVta) ";
                cmdTxt += " values ( '" + v_obj.ImpTotal + "', now(), '" + v_obj.usuario + "',  '" + v_obj.Resultado + "', '" + v_obj.Vendedor + "', '" + v_obj.Cliente + "',   '" + v_obj.anular_Nro + "',  '" + v_obj.MonId + "', '" + v_obj.MonCotiz + "', '" + v_obj.Observaciones + "', '" + v_obj.Id_config + "', '" + v_obj.Pago_Efectivo + "', '" + v_obj.Pago_Cheques + "', '" + v_obj.Pago_Tarjetas + "', '" + v_obj.ImporteLetra + "', '" + v_obj.Contado + "', ";
                cmdTxt += "  '" + v_obj.Tj_Debito + "' ,'" + v_obj.Tj_Credito + "' ,'" + v_obj.CtaCte + "' ,'" + v_obj.Cheque + "' ,'" + v_obj.Otra + "' ,(select concat(Nombre,' ', Apellido)   from kx_cliente where  id ='" + v_obj.Cliente + "') , '" + v_obj.Transferencia + "', '" + v_obj.Pago_Bancos + "', '" + v_obj.PtoVta + "')  ";




                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();


                cmm = null;

                cmdTxt = " select max(Id) cant from kx_cbtes_cobro ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector2 = cmm.ExecuteReader();

                while (lector2.Read())
                {

                    ids = Convert.ToInt32(lector2["cant"]);

                }
                lector2.Close();


                if (v_obj.Tarjetas != null)
                {
                    foreach (var v_obj1 in v_obj.Tarjetas)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_tarjetas (Tarjeta, Tarjeta_No, Cuotas, Cupon_No, Monto, id_cbte, Tipo) values ('" + v_obj1.Tarjeta + "', '" + v_obj1.Tarjeta_No + "', '" + v_obj1.Cuotas + "', '" + v_obj1.Cupon_No + "', '" + v_obj1.Monto + "', '" + ids + "','Cobro') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }

                if (v_obj.Cbtes != null)
                {
                    foreach (var v_obj1 in v_obj.Cbtes)
                    {
                        cmm = null;

                        cmdTxt = " insert into   kx_cbtes_cobro_cbtes (CbteId, Monto,PagoId) values ('" + v_obj1.CbteId + "', '" + v_obj1.Monto + "', '" + ids + "') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }



                if (v_obj.Pagos_items != null)
                {
                    foreach (var v_obj1 in v_obj.Pagos_items)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_cbtes_cobro_items   (Cta_Contable, Importe, Cheque, Vto, Banco, Observacion, Id_pago,Cta_Contable_Nomb,Cbte_Id) values ('" + v_obj1.Cta_Contable + "', '" + v_obj1.Importe + "', '" + v_obj1.Cheque + "', '" + v_obj1.Vto + "', '" + v_obj1.Banco + "', '" + v_obj1.Observacion + "', '" + ids + "', '" + v_obj1.Cta_ContableStr + "','" + ((kx_cbtes_pagos_cbtes)v_obj.Cbtes[0]).CbteId + "'  ) ";


                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }

                if (v_obj.Cheques != null)
                {
                    foreach (var v_obj2 in v_obj.Cheques)
                    {
                        cmm = null;
                        cmdTxt = "insert into kx_cheques (cheque_no, banco, tipo, monto, id_cbte, Dias, CodCliente, CodProveedor, Librador, FechaEmision, FechaCobro, FechaVto, CUITLibrador,Tramite) values ('" + v_obj2.cheque_no + "', '" + v_obj2.banco + "', '" + v_obj2.tipo + "', '" + v_obj2.monto + "', '" + ids + "', '" + v_obj2.Dias + "', '" + v_obj2.CodCliente + "', '" + v_obj2.CodProveedor + "', '" + v_obj2.Librador + "',   STR_TO_DATE('" + v_obj2.FechaEmision + "','%d/%m/%Y') ,STR_TO_DATE('" + v_obj2.FechaCobro + "','%d/%m/%Y'), STR_TO_DATE('" + v_obj2.FechaVto + "','%d/%m/%Y'), '" + v_obj2.CUITLibrador + "', 'Cobro') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }

                }

                /// registro de asiento 

                cmm = null;
                cmdTxt = "sp_crear_asiento_cobroV2";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_cbte", ids.ToString());
                cmm.ExecuteNonQuery();



                /// actualizo ctacte

                cmm = null;
                cmdTxt = "sp_cobro_saldo";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_PAGO", ids.ToString());
                cmm.ExecuteNonQuery();

                return ids.ToString();

            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }

        public string AltaCobroV3(kx_cbtes_pagos v_obj)
        {// paga varios recibos.
            Int32 ids = 0;
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";


                cmm = null;
               
                cmdTxt = "insert into kx_cbtes_cobro (   Fecha,  usuario,Resultado,Vendedor,Cliente,CbteId, MonId,MonCotiz,Observaciones,Id_config,Pago_Efectivo,Pago_Cheques,Pago_Tarjetas,ImporteLetra ,  Contado,  Tj_Debito, Tj_Credito, CtaCte, Cheque,Otra,RazonSocial,Transferencia,Pago_Bancos,PtoVta,CbteTipo,  ImpTotal) ";
                cmdTxt += " values (  now(), '" + v_obj.usuario + "',  '" + v_obj.Resultado + "', '" + v_obj.Vendedor + "', '" + v_obj.Cliente + "',   '" + v_obj.anular_Nro + "',  '" + v_obj.MonId + "', '" + v_obj.MonCotiz + "', '" + v_obj.Observaciones + "', '" + v_obj.Id_config + "', '" + v_obj.Pago_Efectivo + "', '" + v_obj.Pago_Cheques + "', '" + v_obj.Pago_Tarjetas + "', '" + v_obj.ImporteLetra + "', '" + v_obj.Contado + "', ";
                cmdTxt += "  '" + v_obj.Tj_Debito + "' ,'" + v_obj.Tj_Credito + "' ,'" + v_obj.CtaCte + "' ,'" + v_obj.Cheque + "' ,'" + v_obj.Otra + "' ,(select concat(Nombre,' ', Apellido)   from kx_cliente where  id ='" + v_obj.Cliente + "') , '" + v_obj.Transferencia + "', '" + v_obj.Pago_Bancos + "', '" + v_obj.PtoVta + "' , '" + v_obj.CbteTipo + "',  '" + v_obj.ImpTotal + "')  ";



                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();


                cmm = null;

                cmdTxt = " select max(Id) cant from kx_cbtes_cobro";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector2 = cmm.ExecuteReader();

                while (lector2.Read())
                {

                    ids = Convert.ToInt32(lector2["cant"]);

                }
                lector2.Close();


                if (v_obj.Tarjetas != null)
                {
                    foreach (var v_obj1 in v_obj.Tarjetas)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_tarjetas (Tarjeta, Tarjeta_No, Cuotas, Cupon_No, Monto, id_cbte, Tipo) values ('" + v_obj1.Tarjeta + "', '" + v_obj1.Tarjeta_No + "', '" + v_obj1.Cuotas + "', '" + v_obj1.Cupon_No + "', '" + v_obj1.Monto + "', '" + ids + "','Cobro') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }





                if (v_obj.Pagos_items != null)
                {
                    foreach (var v_obj1 in v_obj.Pagos_items)
                    {
                        cmm = null;

                        cmdTxt = " insert into  kx_cbtes_cobro_items  (Cta_Contable, Importe, Cheque, Vto, Banco, Observacion, Id_pago,Cta_Contable_Nomb,Cbte_Id,cta_venta,cta_ventaStr ) values ('" + v_obj1.Cta_Contable + "', '" + v_obj1.Importe + "', '" + v_obj1.Cheque + "', '" + v_obj1.Vto + "', '" + v_obj1.Banco + "', '" + v_obj1.Observacion + "', '" + ids + "', '" + v_obj1.Cta_ContableStr + "', '" + v_obj1.Cbte_Id + "', '" + v_obj1.cta_compras + "', getCtaNombre('" + v_obj1.cta_compras + "','" + v_obj.Id_config + "') ) ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }


                cmm = null;

                cmdTxt = " insert into kx_cbtes_cobro_cbtes  (Monto,PagoId,CbteId)  (select  sum(cb.Importe), cb.Id_pago,cb.Cbte_Id  from kx_cbtes_cobro_items cb   where cb.Id_pago = '" + ids + "'  group by cb.Id_pago,cb.Cbte_Id) ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();





                if (v_obj.Cheques != null)
                {
                    foreach (var v_obj2 in v_obj.Cheques)
                    {
                        cmm = null;
                        cmdTxt = "insert into kx_cheques (cheque_no, banco, tipo, monto, id_cbte, Dias, CodCliente, CodProveedor, Librador, FechaEmision, FechaCobro, FechaVto, CUITLibrador,Tramite) values ('" + v_obj2.cheque_no + "', '" + v_obj2.banco + "', '" + v_obj2.tipo + "', '" + v_obj2.monto + "', '" + ids + "', '" + v_obj2.Dias + "', '" + v_obj2.CodCliente + "', '" + v_obj2.CodProveedor + "', '" + v_obj2.Librador + "',   STR_TO_DATE('" + v_obj2.FechaEmision + "','%d/%m/%Y') ,STR_TO_DATE('" + v_obj2.FechaCobro + "','%d/%m/%Y'), STR_TO_DATE('" + v_obj2.FechaVto + "','%d/%m/%Y'), '" + v_obj2.CUITLibrador + "', 'Cobro') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }

                }

                /// registro de asiento 

                cmm = null;
                cmdTxt = "sp_crear_asiento_cobroV2";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_cbte", ids.ToString());
                cmm.ExecuteNonQuery();



                /// actualizo ctacte

                cmm = null;
                cmdTxt = "sp_cobro_saldo";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_PAGO", ids.ToString());
                cmm.ExecuteNonQuery();

                return ids.ToString();

            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }


        public string AltaPagoV3(kx_cbtes_pagos v_obj)
        {// paga varios recibos.
            Int32 ids = 0;
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";


                cmm = null;
                //Math.Round(Double.Parse(iva.BaseImp.Replace(",", "."), numberFormatInfo), 2);
                // double total = Math.Round(Convert.ToDouble( v_obj.Pago_Efectivo.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Cheques.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Tarjetas.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Bancos.Replace(",", "."));
                cmdTxt = "insert into kx_cbtes_pagos ( Config,  Fecha,  usuario,Resultado,Vendedor,Persona,CbteId, MonId,MonCotiz,Observaciones,Id_config,Pago_Efectivo,Pago_Cheques,Pago_Tarjetas,ImporteLetra ,  Contado,  Tj_Debito, Tj_Credito, CtaCte, Cheque,Otra,RazonSocial,Transferencia,Pago_Bancos,PtoVta,CbteTipo, Cta_Contable,ImpTotal) ";
                cmdTxt += " values ('" + v_obj.Id_config + "',now(), '" + v_obj.usuario + "',  '" + v_obj.Resultado + "', '" + v_obj.Vendedor + "', '" + v_obj.Cliente + "',   '" + v_obj.anular_Nro + "',  '" + v_obj.MonId + "', '" + v_obj.MonCotiz + "', '" + v_obj.Observaciones + "', '" + v_obj.Id_config + "', '" + v_obj.Pago_Efectivo + "', '" + v_obj.Pago_Cheques + "', '" + v_obj.Pago_Tarjetas + "', '" + v_obj.ImporteLetra + "', '" + v_obj.Contado + "', ";
                cmdTxt += "  '" + v_obj.Tj_Debito + "' ,'" + v_obj.Tj_Credito + "' ,'" + v_obj.CtaCte + "' ,'" + v_obj.Cheque + "' ,'" + v_obj.Otra + "' ,(select Denominacion   from kx_proveedor  where  id ='" + v_obj.Cliente + "') , '" + v_obj.Transferencia + "', '" + v_obj.Pago_Bancos + "', '" + v_obj.PtoVta + "', '" + v_obj.CbteTipo + "', '" + v_obj.Cta_contrable + "', '" + v_obj.ImpTotal + "')  ";




                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();


                cmm = null;

                cmdTxt = " select max(Id) cant from kx_cbtes_pagos";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector2 = cmm.ExecuteReader();

                while (lector2.Read())
                {

                    ids = Convert.ToInt32(lector2["cant"]);

                }
                lector2.Close();


                if (v_obj.Tarjetas != null)
                {
                    foreach (var v_obj1 in v_obj.Tarjetas)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_tarjetas (Tarjeta, Tarjeta_No, Cuotas, Cupon_No, Monto, id_cbte, Tipo) values ('" + v_obj1.Tarjeta + "', '" + v_obj1.Tarjeta_No + "', '" + v_obj1.Cuotas + "', '" + v_obj1.Cupon_No + "', '" + v_obj1.Monto + "', '" + ids + "','Pago') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }

            



                if (v_obj.Pagos_items != null)
                {
                    foreach (var v_obj1 in v_obj.Pagos_items)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_cbtes_pagos_items (Cta_Contable, Importe, Cheque, Vto, Banco, Observacion, Id_pago,Cta_Contable_Nomb,Cbte_Id,cta_compras,cta_comprasStr ) values ('" + v_obj1.Cta_Contable + "', '" + v_obj1.Importe + "', '" + v_obj1.Cheque + "', '" + v_obj1.Vto + "', '" + v_obj1.Banco + "', '" + v_obj1.Observacion + "', '" + ids + "', '" + v_obj1.Cta_ContableStr + "', '" + v_obj1.Cbte_Id + "', '" + v_obj1.cta_compras + "', getCtaNombre('" + v_obj1.cta_compras + "','" + v_obj.Id_config + "') ) ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }

         
                        cmm = null;

                        cmdTxt = " insert into kx_cbtes_pagos_cbtes (Monto,PagoId,CbteId)  (select  sum(cb.Importe), cb.Id_pago,cb.Cbte_Id  from kx_cbtes_pagos_items cb   where cb.Id_pago = '" + ids + "'  group by cb.Id_pago,cb.Cbte_Id) ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();

 



                if (v_obj.Cheques != null)
                {
                    foreach (var v_obj2 in v_obj.Cheques)
                    {
                        cmm = null;
                        cmdTxt = "insert into kx_cheques (cheque_no, banco, tipo, monto, id_cbte, Dias, CodCliente, CodProveedor, Librador, FechaEmision, FechaCobro, FechaVto, CUITLibrador,Tramite) values ('" + v_obj2.cheque_no + "', '" + v_obj2.banco + "', '" + v_obj2.tipo + "', '" + v_obj2.monto + "', '" + ids + "', '" + v_obj2.Dias + "', '" + v_obj2.CodCliente + "', '" + v_obj2.CodProveedor + "', '" + v_obj2.Librador + "',   STR_TO_DATE('" + v_obj2.FechaEmision + "','%d/%m/%Y') ,STR_TO_DATE('" + v_obj2.FechaCobro + "','%d/%m/%Y'), STR_TO_DATE('" + v_obj2.FechaVto + "','%d/%m/%Y'), '" + v_obj2.CUITLibrador + "', 'Pago') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }

                }

                /// registro de asiento 

                cmm = null;
                cmdTxt = "sp_crear_asiento_pagoV3";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_cbte", ids.ToString());
                cmm.ExecuteNonQuery();



                /// actualizo ctacte

                cmm = null;
                cmdTxt = "sp_pago_salgo";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_PAGO", ids.ToString());
                cmm.ExecuteNonQuery();

                return ids.ToString();

            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }

        public string AltaPago(kx_cbtes v_obj)
        {
            Int32 ids = 0;
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";


                cmm = null;
                //Math.Round(Double.Parse(iva.BaseImp.Replace(",", "."), numberFormatInfo), 2);
               // double total = Math.Round(Convert.ToDouble( v_obj.Pago_Efectivo.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Cheques.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Tarjetas.Replace(",", ".")) + Convert.ToDouble(v_obj.Pago_Bancos.Replace(",", "."));
                cmdTxt = "insert into kx_cbtes_pagos (   Fecha,  usuario,Resultado,Vendedor,Persona,CbteId, MonId,MonCotiz,Observaciones,Id_config,Pago_Efectivo,Pago_Cheques,Pago_Tarjetas,ImporteLetra ,  Contado,  Tj_Debito, Tj_Credito, CtaCte, Cheque,Otra,RazonSocial,Transferencia,Pago_Bancos,PtoVta,CbteTipo) ";
                cmdTxt += " values (now(), '" + v_obj.usuario + "',  '" + v_obj.Resultado + "', '" + v_obj.Vendedor + "', '" + v_obj.Cliente + "',   '" + v_obj.anular_Nro + "',  '" + v_obj.MonId + "', '" + v_obj.MonCotiz + "', '" + v_obj.Observaciones + "', '" + v_obj.Id_config + "', '" + v_obj.Pago_Efectivo + "', '" + v_obj.Pago_Cheques + "', '" + v_obj.Pago_Tarjetas + "', '" + v_obj.ImporteLetra + "', '" + v_obj.Contado + "', ";
                cmdTxt += "  '" + v_obj.Tj_Debito + "' ,'" + v_obj.Tj_Credito + "' ,'" + v_obj.CtaCte + "' ,'" + v_obj.Cheque + "' ,'" + v_obj.Otra + "' ,(select Denominacion   from kx_proveedor  where  id ='" + v_obj.Cliente + "') , '" + v_obj.Transferencia + "', '" + v_obj.Pago_Bancos + "', '" + v_obj.PtoVta + "', '" + v_obj.CbteTipo + "')  ";




                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();


                cmm = null;

                cmdTxt = " select max(Id) cant from kx_cbtes_pagos";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector2 = cmm.ExecuteReader();

                while (lector2.Read())
                {

                    ids = Convert.ToInt32(lector2["cant"]);

                }
                lector2.Close();


                if (v_obj.Tarjetas != null)
                {
                    foreach (var v_obj1 in v_obj.Tarjetas)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_tarjetas (Tarjeta, Tarjeta_No, Cuotas, Cupon_No, Monto, id_cbte, Tipo) values ('" + v_obj1.Tarjeta + "', '" + v_obj1.Tarjeta_No + "', '" + v_obj1.Cuotas + "', '" + v_obj1.Cupon_No + "', '" + v_obj1.Monto + "', '" + ids + "','Pago') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }

                if (v_obj.Cheques != null)
                {
                    foreach (var v_obj2 in v_obj.Cheques)
                    {
                        cmm = null;
                        cmdTxt = "insert into kx_cheques (cheque_no, banco, tipo, monto, id_cbte, Dias, CodCliente, CodProveedor, Librador, FechaEmision, FechaCobro, FechaVto, CUITLibrador,Tramite) values ('" + v_obj2.cheque_no + "', '" + v_obj2.banco + "', '" + v_obj2.tipo + "', '" + v_obj2.monto + "', '" + ids + "', '" + v_obj2.Dias + "', '" + v_obj2.CodCliente + "', '" + v_obj2.CodProveedor + "', '" + v_obj2.Librador + "',   STR_TO_DATE('" + v_obj2.FechaEmision + "','%d/%m/%Y') ,STR_TO_DATE('" + v_obj2.FechaCobro + "','%d/%m/%Y'), STR_TO_DATE('" + v_obj2.FechaVto + "','%d/%m/%Y'), '" + v_obj2.CUITLibrador + "', 'Pago') ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                    }

                }

                /// registro de asiento 

                cmm = null;
                cmdTxt = "sp_crear_asiento_pago";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_cbte", ids.ToString());
                cmm.ExecuteNonQuery();
                




                return ids.ToString();

            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }

        public string Alta(kx_cbtes v_obj)
        {
            Int32 ids = 0;
                MySqlConnection cnn2 = new MySqlConnection();
             
            try
            {
                string serv = "N";
                string CodBarra = v_obj.Cuit + string.Format("{0:d2}", Convert.ToInt32(v_obj.CbteTipo)) + string.Format("{0:d4}", Convert.ToInt32(v_obj.PtoVta)) + v_obj.CAE + v_obj.CAEFchVto;
                string digi = Mod10(CodBarra).ToString();
                v_obj.CodBarra = CodBarra + digi;


                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";

                if (v_obj.DocNro == "99") // se fija si tiene como cliente un consumidor final sino lo agrega
                {
                    cmm = null;
                    cmdTxt = "wi271852_kardex.consumidor_final";
                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                    cnn.AgregarParametroAComando(cmm, "v_config", v_obj.Id_config);

                    MySqlParameter outSal22 = cnn.AgregarParametroAComandoOut(cmm, "v_sal");
                    cmm.ExecuteNonQuery();
                    v_obj.Cliente = outSal22.Value.ToString();

                    cmm.ExecuteNonQuery();

                }

                cmm = null;

                cmdTxt = "insert into kx_cbtes (CantReg, CbteTipo, PtoVta, Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones,CodBarra, Id_config,Pago_Efectivo,Pago_Ctacte,Pago_Cheques,Pago_Tarjetas,ImporteLetra,Contado,Tj_Debito,Tj_Credito,CtaCte,Cheque,Otra, Remito,treintaDias, RazonSocial, CantAlic ,FchVtoPago,Transferencia,Pago_Bancos,TipoTranferencia,CbteAsoc, Debe, Haber) values ('" + v_obj.CantReg + "', '" + v_obj.CbteTipo + "', '" + v_obj.PtoVta + "', STR_TO_DATE('" + v_obj.Fecha + "','%d/%m/%Y'), '" + v_obj.usuario + "', '" + v_obj.Resultado + "', '" + v_obj.Vendedor + "', '" + v_obj.Cliente + "', now(), '" + v_obj.Concepto + "', '" + v_obj.DocTipo + "', '" + v_obj.DocNro + "', '" + v_obj.CbteDesde.Trim() + "', '" + v_obj.CbteHasta.Trim() + "', '" + v_obj.CbteFch + "', '" + v_obj.ImpTotal + "', '" + v_obj.ImpTotConc + "', '" + v_obj.ImpNeto + "', '" + v_obj.ImpOpEx + "', '" + v_obj.ImpTrib + "', '" + v_obj.ImpIVA + "', '" + v_obj.MonId + "', '" + v_obj.MonCotiz + "', '" + v_obj.CAE + "', '" + v_obj.CAEFchVto + "', '" + v_obj.Observaciones + "','" + v_obj.CodBarra + "' ,'" + v_obj.Id_config + "','" + v_obj.Pago_Efectivo + "','" + v_obj.Pago_Bancos + "'  ,'" + v_obj.Pago_Cheques + "' ,'" + v_obj.Pago_Tarjetas + "','" + v_obj.ImporteLetra + "','" + v_obj.Contado + "','" + v_obj.Tj_Debito + "','" + v_obj.Tj_Credito + "' ,'" + v_obj.CtaCte + "' ,'" + v_obj.Cheque + "' ,'" + v_obj.Otra + "'  ,'" + v_obj.Remito + "'  ,'" + v_obj.treintaDias + "',(select concat(Nombre,' ', Apellido)   from kx_cliente where  id ='" + v_obj.Cliente + "') , '" + v_obj.CantAlic + "', STR_TO_DATE('" + v_obj.FchVtoPago + "','%d/%m/%Y'),'" + v_obj.Transferencia + "','" + v_obj.Pago_Bancos + "','" + v_obj.TipoTranferencia + "', '" + v_obj.anular_id+ "', '" + v_obj.Debe + "', '" + v_obj.Haber + "')  ";




     cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
     cmm.ExecuteNonQuery();


     cmm = null;

     cmdTxt = " select max(Id) cant from kx_cbtes ";

     cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
     MySqlDataReader lector2 = cmm.ExecuteReader();

     while (lector2.Read())
     {

         ids = Convert.ToInt32(lector2["cant"]);

     }
     lector2.Close();

     foreach (var obj in v_obj.Articulos)
     {
         cmm = null;
         cmdTxt = " insert into kx_cbtes_articulos (Id_Articulo,Cod_Manual, Nombre, Cant, Alic, ImpxUni, ImpTotal, id_cbte,NetoImpxUni,NetoImpTotal,ImpIva,Tipo_Art,Unidad,IIBB,ID_DEPOSITO,Descuento,Cont_Venta,Cont_Compra,Compra_Neto) values ('" + obj.Id_Articulo + "', '" + obj.Cod_Manual + "', '" + obj.Nombre + "', '" + obj.Cant + "', '" + obj.Alic + "', '" + obj.ImpxUni + "', '" + obj.ImpTotal + "', '" + ids + "', '" + obj.NetoImpxUni + "', '" + obj.NetoImpTotal + "', '" + obj.ImpIva + "', '" + obj.Tipo_Art + "', '" + obj.Unidad + "', '" + obj.IIBB + "', '" + obj.DepositoSelect + "', '" + obj.Descuento + "', '" + obj.Cont_Venta + "', '" + obj.Cont_Compra + "', '" + obj.Compra_Neto + "')";

         cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
         cmm.ExecuteNonQuery();

         string ds = DateTime.Now.ToString("dd/MM/yyyy");
         // PARA Q no DESCUENTE DEL STOCK
         //serv = "S";

         //if (obj.es_Stock == "SI")
         //{
         //    // PARA Q DESCUENTE DEL STOCK
         //    serv = "N"; //si es servicio  N pq es articulo  y descuenta
         //}
         //if (obj.Cod_Manual == "MANUAL")
         //{
         //    serv = "S";
         //}
         //if (obj.Tipo_Art == "SERVICIO")
         //{
         //    // PARA Q no DESCUENTE DEL STOCK
         //    serv = "S";
         //}

         if (obj.Cod_Manual == "GFXOS")
         {
             serv = "S";
             cmm = null;
             cmdTxt = "update ordenes_servicio  set Pagado ='" + ids + "' where  Id='" + obj.Id_Articulo + "'";
             cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
             cmm.ExecuteNonQuery();
         }

         if (obj.Cod_Manual == "GFXCO0")
         {
             serv = "S";
             cmm = null;
             cmdTxt = "update contraordenes_servicio cs,  ordenes_servicio os  set os.Pagado ='" + ids + "', cs.Pagado ='" + ids + "'  where cs.Orden_Id = os.Id and cs.Id='" + obj.Id_Articulo + "'";
             cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
             cmm.ExecuteNonQuery();
         }
         if (obj.Cod_Manual == "GFXCO1")
         {
             serv = "S";
             cmm = null;
             cmdTxt = "update contraordenes_servicio  set Pagado ='" + ids + "' where  Id='" + obj.Id_Articulo + "'";
             cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
             cmm.ExecuteNonQuery();

         }


         // actualizo el stock
         if (obj.es_Stock == "SI" && v_obj.Resultado != "R")
      
         {
             cmm = null;
             cmdTxt = "wi271852_kardex.Stock_update";

             cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
             cnn.AgregarParametroAComando(cmm, "v_tipo", "S");
             cnn.AgregarParametroAComando(cmm, "v_art", obj.Id_Articulo);
             cnn.AgregarParametroAComando(cmm, "v_cant", obj.Cant);
             cnn.AgregarParametroAComando(cmm, "v_dep", obj.DepositoSelect);
             cnn.AgregarParametroAComando(cmm, "v_motivo", "Factura n°: " + v_obj.CbteDesde.Trim() + " - Cbte id: " + ids);
              
      
             cnn.AgregarParametroAComando(cmm, "v_remito", "");
             cnn.AgregarParametroAComando(cmm, "v_origen", "");
             cnn.AgregarParametroAComando(cmm, "v_proveedor", "");
             cnn.AgregarParametroAComando(cmm, "v_comentario", "");
             cnn.AgregarParametroAComando(cmm, "v_tipo_ingreso", "");
             cnn.AgregarParametroAComando(cmm, "v_lote","");
             cnn.AgregarParametroAComando(cmm, "v_vto", "");


             cmm.ExecuteNonQuery();
         }

     }

     if (v_obj.Tarjetas != null)
     {
         foreach (var v_obj1 in v_obj.Tarjetas)
         {
                          cmm = null;
          
                 cmdTxt = " insert into kx_tarjetas (Tarjeta, Tarjeta_No, Cuotas, Cupon_No, Monto, id_cbte,Tipo) values ('" + v_obj1.Tarjeta + "', '" + v_obj1.Tarjeta_No + "', '" + v_obj1.Cuotas + "', '" + v_obj1.Cupon_No + "', '" + v_obj1.Monto + "', '" + ids + "','VENTAS') ";
         
             cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
             cmm.ExecuteNonQuery();

           
         }
     }
     if (v_obj.AlicIva != null )
     {
         foreach (var v_obj1 in v_obj.AlicIva)
         {

             
             cmm = null;
             cmdTxt = " insert into kx_cbtes_AlicIva (Id,BaseImp,Importe,id_cbte) values ('" + v_obj1.Id + "', '" + v_obj1.BaseImp + "', '" + v_obj1.Importe + "', '" + ids + "') ";
             cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
             cmm.ExecuteNonQuery();
         }
     }

     if (v_obj.Cheques != null)
     {
         foreach (var v_obj2 in v_obj.Cheques)
         {
             cmm = null; 
                 cmdTxt = "insert into kx_cheques (cheque_no, banco, tipo, monto, id_cbte, Dias, CodCliente, CodProveedor, Librador, FechaEmision, FechaCobro, FechaVto, CUITLibrador,Tramite) values ('" + v_obj2.cheque_no + "', '" + v_obj2.banco + "', '" + v_obj2.tipo + "', '" + v_obj2.monto + "', '" + ids + "', '" + v_obj2.Dias + "', '" + v_obj2.CodCliente + "', '" + v_obj2.CodProveedor + "', '" + v_obj2.Librador + "',   STR_TO_DATE('" + v_obj2.FechaEmision + "','%d/%m/%Y') ,STR_TO_DATE('" + v_obj2.FechaCobro + "','%d/%m/%Y'), STR_TO_DATE('" + v_obj2.FechaVto + "','%d/%m/%Y'), '" + v_obj2.CUITLibrador + "','VENTAS') ";
             
             cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
             cmm.ExecuteNonQuery();
         }

     }

                if (v_obj.Percepciones != null)
                {
                    foreach (var v_objp in v_obj.Percepciones)
                    {
                        cmm = null;

                        cmdTxt = " insert into kx_cbtes_percepciones (Id_cbte, Id_Percep, Monto, Obs,Config,Tipo) values ('" + ids + "', '" + v_objp.Id_Percep.ToUpper() + "', '" + v_objp.Monto.Replace(",", ".") + "', '" + v_objp.Obs.ToUpper() + "','" + v_obj.Id_config + "','VENTAS')  ";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();


                    }
                }


                /// registro de asiento de ventas
                if (  v_obj.Resultado != "R")

                {
                    cmm = null;
                    cmdTxt = "sp_crear_asiento_vta";
                    if (v_obj.Id_config=="30")
                    {
                        cmdTxt = "sp_crear_asiento_vtaOaa";
                    }
                
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_cbte", ids.ToString());
                cmm.ExecuteNonQuery();
                    ///
                   }




                    return ids.ToString();
              
            }
            catch 
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
                cnn2.Close();
            }

        }
        public List<Be.kx_cbtes> WssaldoXmesCompras(string v_mes, string v_anio, string v_id_cfg)
        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {
                string cmdTxt = "";
 
                cmdTxt = "   SELECT cb.Id, cb.CantReg, ct.nombre CbteTipo, cb.PtoVta, DATE_FORMAT( cb.Fecha, '%d/%m/%y' ) Fecha, cb.usuario, cb.Resultado, cb.Vendedor, cb.Proveedor Cliente, cb.aud, cb.Concepto, cb.DocTipo, concat( dt.nombre, ' ', cb.DocNro ) DocNro, cb.CbteDesde, cb.CbteHasta, cb.CbteFch, cb.ImpTotal, cb.ImpTotConc, cb.ImpNeto, cb.ImpOpEx, cb.ImpTrib, cb.ImpIVA, cb.MonId, cb.MonCotiz, cb.CAE, cb.CAEFchVto, cb.Observaciones  FROM kx_compras_cbtes cb, kx_doc_tipo dt, kx_cbtes_tipos ct    ";
                cmdTxt += "  WHERE   ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and   Year( Fecha ) ='" + v_anio + "'  AND Month( Fecha ) = '" + v_mes + "' AND Resultado <> 'R' and CbteTipo in(1,6,11,15, 3,8,13)  and Id_config='" + v_id_cfg + "'   ORDER BY cb.CbteHasta DESC ";



                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }
        public List<Be.kx_cbtes> WssaldoXmes(string v_mes, string v_anio, string v_id_cfg)
        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {
                string cmdTxt = "";

                //    cmdTxt = " select Id,CantReg, CbteTipo, PtoVta,DATE_FORMAT(Fecha,  '%d/%m/%y') Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones from kx_cbtes where CbteDesde 	='" + v_valor1 + "' and  CbteTipo ='" + v_tipoCbate + "' order by CbteHasta desc";

                    cmdTxt = " SELECT cb.Id, cb.CantReg, ct.nombre CbteTipo, cb.PtoVta, DATE_FORMAT( cb.Fecha, '%d/%m/%y' ) Fecha, cb.usuario, cb.Resultado, cb.Vendedor, cb.Cliente, cb.aud, cb.Concepto, cb.DocTipo, concat( dt.nombre, ' ', cb.DocNro ) DocNro, cb.CbteDesde, cb.CbteHasta, cb.CbteFch, cb.ImpTotal, cb.ImpTotConc, cb.ImpNeto, cb.ImpOpEx, cb.ImpTrib, cb.ImpIVA, cb.MonId, cb.MonCotiz, cb.CAE, cb.CAEFchVto, cb.Observaciones FROM kx_cbtes cb, kx_doc_tipo dt, kx_cbtes_tipos ct  ";
                    cmdTxt += "  WHERE   ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and   Year( Fecha ) ='" + v_anio + "'  AND Month( Fecha ) = '" + v_mes + "' AND Resultado <> 'R' and CbteTipo in(1,6,11,15, 3,8,13)  and Id_config='" + v_id_cfg + "'   ORDER BY cb.CbteHasta DESC ";
                


                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }
        public List<Be.kx_cbtes> WssaldoXmesVtas(string v_mes, string v_anio, string v_id_cfg)
        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {
                string cmdTxt = "";

                //    cmdTxt = " select Id,CantReg, CbteTipo, PtoVta,DATE_FORMAT(Fecha,  '%d/%m/%y') Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones from kx_cbtes where CbteDesde 	='" + v_valor1 + "' and  CbteTipo ='" + v_tipoCbate + "' order by CbteHasta desc";

                cmdTxt = " SELECT cb.Id, cb.CantReg, ct.nombre CbteTipo, cb.PtoVta, DATE_FORMAT( cb.Fecha, '%d/%m/%y' ) Fecha, cb.usuario, cb.Resultado, cb.Vendedor, cb.Cliente, cb.aud, cb.Concepto, cb.DocTipo, concat( dt.nombre, ' ', cb.DocNro ) DocNro, cb.CbteDesde, cb.CbteHasta, cb.CbteFch, cb.ImpTotal, cb.ImpTotConc, cb.ImpNeto, cb.ImpOpEx, cb.ImpTrib, cb.ImpIVA, cb.MonId, cb.MonCotiz, cb.CAE, cb.CAEFchVto, cb.Observaciones FROM kx_cbtes cb, kx_doc_tipo dt, kx_cbtes_tipos ct  ";
                cmdTxt += "  WHERE   ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and   Year( Fecha ) ='" + v_anio + "'  AND Month( Fecha ) = '" + v_mes + "' AND Resultado <> 'R' and CbteTipo in(1,6,11,15, 3,8,13,16,18)  and Id_config='" + v_id_cfg + "'   ORDER BY cb.CbteHasta DESC ";



                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public orden BsqCbate(string v_orden)
        {
            orden lista = new orden();
            try
            {
                string cmdTxt = "";

                cmdTxt = "  select Remito, fc.Id, Cliente, cc.Nombre ClienteNombre, cc.Tipo_Doc DocTipo,cc.Doc_No DocNro,concat( cc.Contac_Tel, ' ',cc.Contac_Cel)  TelCli, fc.CbteTipo  ,fc.ImpTotal  ,fc.Concepto ,fc.Vendedor   , DATE_FORMAT(fc.Fecha, '%d/%m/%Y') Fecha ,  fc.Contado, fc.Tj_Debito,fc.Tj_Credito,fc.CtaCte , fc.Cheque ,fc.Otra , fc.CbteDesde,  fc.Transferencia, fc.Pago_Efectivo,fc.Pago_Cheques,fc.Pago_Tarjetas, getSaldoCbte(fc.Id) saldo, fc.Debe, fc.Haber from kx_cbtes fc, kx_cliente cc where fc.Cliente = cc.Id  and fc.Id='" + v_orden + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                Be.orden entidad = new Be.orden();
                while (lector.Read())
                {
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.Remito = DalModelo.VerifStringMysql(lector, "Remito");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.ClienteNombre = DalModelo.VerifStringMysql(lector, "ClienteNombre");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.TelCli = DalModelo.VerifStringMysql(lector, "TelCli");

                    entidad.Debe = DalModelo.VerifStringMysql(lector, "Debe");
                    entidad.Haber = DalModelo.VerifStringMysql(lector, "Haber");
                    entidad.CbteNro = DalModelo.VerifStringMysql(lector, "CbteDesde");

                    entidad.Pago_Efectivo = DalModelo.VerifStringMysql(lector, "Pago_Efectivo");
                    entidad.Pago_Cheques = DalModelo.VerifStringMysql(lector, "Pago_Cheques");
                    entidad.Pago_Tarjetas = DalModelo.VerifStringMysql(lector, "Pago_Tarjetas");


                    entidad.Contado = DalModelo.VerifStringMysql(lector, "Contado");
                    entidad.Tj_Debito = DalModelo.VerifStringMysql(lector, "Tj_Debito");
                    entidad.Tj_Credito = DalModelo.VerifStringMysql(lector, "Tj_Credito");
                    entidad.CtaCte = DalModelo.VerifStringMysql(lector, "CtaCte");
                    entidad.Cheque = DalModelo.VerifStringMysql(lector, "Cheque");
                    entidad.Otra = DalModelo.VerifStringMysql(lector, "Otra");
                    entidad.Transferencia= DalModelo.VerifStringMysql(lector, "Transferencia");
                }

                lector.Close();
                return entidad;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }




        }
        public orden BsqCbateCompras(string v_orden)
        {
            orden lista = new orden();
            try
            {
                string cmdTxt = "";

                cmdTxt = "  select Remito, fc.Id, Proveedor Cliente, cc.Denominacion ClienteNombre,'CUIT' DocTipo,cc.Cuit DocNro,concat( cc.Contac_Tel, ' ',cc.Contac_Cel)  TelCli, fc.CbteTipo  ,fc.ImpTotal  ,fc.Concepto ,fc.Vendedor   , DATE_FORMAT(fc.Fecha, '%d/%m/%Y') Fecha ,  fc.Contado, fc.Tj_Debito,fc.Tj_Credito,fc.CtaCte , fc.Cheque ,fc.Otra , fc.CbteDesde,  fc.Transferencia, fc.Pago_Efectivo,fc.Pago_Cheques,fc.Pago_Tarjetas, getSaldoProveedor(fc.Id,fc.Id_config) saldo , fc.Prioridad from kx_compras_cbtes fc, kx_proveedor   cc where fc.Proveedor = cc.Id  and fc.Id= '" + v_orden + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                Be.orden entidad = new Be.orden();
                while (lector.Read())
                {
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.Remito = DalModelo.VerifStringMysql(lector, "Remito");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.ClienteNombre = DalModelo.VerifStringMysql(lector, "ClienteNombre");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.TelCli = DalModelo.VerifStringMysql(lector, "TelCli");

                    entidad.CbteNro = DalModelo.VerifStringMysql(lector, "CbteDesde");

                    entidad.Pago_Efectivo = DalModelo.VerifStringMysql(lector, "Pago_Efectivo");
                    entidad.Pago_Cheques = DalModelo.VerifStringMysql(lector, "Pago_Cheques");
                    entidad.Pago_Tarjetas = DalModelo.VerifStringMysql(lector, "Pago_Tarjetas");


                    entidad.Contado = DalModelo.VerifStringMysql(lector, "Contado");
                    entidad.Tj_Debito = DalModelo.VerifStringMysql(lector, "Tj_Debito");
                    entidad.Tj_Credito = DalModelo.VerifStringMysql(lector, "Tj_Credito");
                    entidad.CtaCte = DalModelo.VerifStringMysql(lector, "CtaCte");
                    entidad.Cheque = DalModelo.VerifStringMysql(lector, "Cheque");
                    entidad.Otra = DalModelo.VerifStringMysql(lector, "Otra");
                    entidad.Transferencia = DalModelo.VerifStringMysql(lector, "Transferencia");
                    entidad.Prioridad = DalModelo.VerifStringMysql(lector, "Prioridad");
                    
                }

                lector.Close();
                return entidad;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }




        }
        public orden BsqCbateComprasV2(string v_orden)
        {
            orden lista = new orden();
            try
            {
                string cmdTxt = "";

                cmdTxt = "  select Remito, fc.Id, Proveedor Cliente, cc.Denominacion ClienteNombre,'CUIT' DocTipo,cc.Cuit DocNro,concat( cc.Contac_Tel, ' ',cc.Contac_Cel)  TelCli, fc.CbteTipo  ,fc.ImpTotal  ,fc.Concepto ,fc.Vendedor   , DATE_FORMAT(fc.Fecha, '%d/%m/%Y') Fecha ,  fc.Contado, fc.Tj_Debito,fc.Tj_Credito,fc.CtaCte , fc.Cheque ,fc.Otra , fc.CbteDesde,  fc.Transferencia, fc.Pago_Efectivo,fc.Pago_Cheques,fc.Pago_Tarjetas, getSaldoProveedor(fc.Id,fc.Id_config) saldo , fc.Prioridad , fc.Cta_contable from kx_compras_cbtes fc, kx_proveedor   cc where fc.Proveedor = cc.Id  and fc.Id= '" + v_orden + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                Be.orden entidad = new Be.orden();
                while (lector.Read())
                {
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.Remito = DalModelo.VerifStringMysql(lector, "Remito");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.ClienteNombre = DalModelo.VerifStringMysql(lector, "ClienteNombre");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.TelCli = DalModelo.VerifStringMysql(lector, "TelCli");
                    entidad.Cta_contable = DalModelo.VerifStringMysql(lector, "Cta_contable");

                    entidad.CbteNro = DalModelo.VerifStringMysql(lector, "CbteDesde");

                    entidad.Pago_Efectivo = DalModelo.VerifStringMysql(lector, "Pago_Efectivo");
                    entidad.Pago_Cheques = DalModelo.VerifStringMysql(lector, "Pago_Cheques");
                    entidad.Pago_Tarjetas = DalModelo.VerifStringMysql(lector, "Pago_Tarjetas");


                    entidad.Contado = DalModelo.VerifStringMysql(lector, "Contado");
                    entidad.Tj_Debito = DalModelo.VerifStringMysql(lector, "Tj_Debito");
                    entidad.Tj_Credito = DalModelo.VerifStringMysql(lector, "Tj_Credito");
                    entidad.CtaCte = DalModelo.VerifStringMysql(lector, "CtaCte");
                    entidad.Cheque = DalModelo.VerifStringMysql(lector, "Cheque");
                    entidad.Otra = DalModelo.VerifStringMysql(lector, "Otra");
                    entidad.Transferencia = DalModelo.VerifStringMysql(lector, "Transferencia");
                    entidad.Prioridad = DalModelo.VerifStringMysql(lector, "Prioridad");

                }

                lector.Close();
                return entidad;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }




        }

        public orden BsqCbatePagar(string v_orden)
        {
            orden lista = new orden();
            try
            {
                string cmdTxt = "";

                cmdTxt = "   select Remito, fc.Id,Proveedor Cliente, cc.Denominacion ClienteNombre, 'CUIT' DocTipo,cc.Cuit DocNro,concat( cc.Contac_Tel, ' ',cc.Contac_Cel)  TelCli, fc.CbteTipo  ,fc.ImpTotal  ,fc.Concepto ,fc.Vendedor   , DATE_FORMAT(fc.Fecha, '%d/%m/%Y') Fecha ,  fc.Contado, fc.Tj_Debito,fc.Tj_Credito,fc.CtaCte , fc.Cheque ,fc.Otra ,concat( CAST(LPAD(TRIM(fc.PtoVta),4,'0') AS CHAR),'-', CAST(LPAD(TRIM(fc.CbteDesde),8,'0')AS CHAR))   CbteDesde,  fc.Transferencia, fc.Pago_Efectivo,fc.Pago_Cheques,fc.Pago_Tarjetas, getSaldoProveedor (fc.Id,fc.Id_config) saldo, fc.Cta_contable  from kx_compras_cbtes fc, kx_proveedor cc where fc.Proveedor = cc.Id  and fc.Id='" + v_orden + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                Be.orden entidad = new Be.orden();
                while (lector.Read())
                {
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.Remito = DalModelo.VerifStringMysql(lector, "Remito");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.ClienteNombre = DalModelo.VerifStringMysql(lector, "ClienteNombre");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.ImpTotal = "Imp.original: " + DalModelo.VerifStringMysql(lector, "ImpTotal") +"$";
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.TelCli = DalModelo.VerifStringMysql(lector, "TelCli");

                    entidad.CbteNro = DalModelo.VerifStringMysql(lector, "CbteDesde");

                    entidad.Pago_Efectivo = DalModelo.VerifStringMysql(lector, "Pago_Efectivo");
                    entidad.Pago_Cheques = DalModelo.VerifStringMysql(lector, "Pago_Cheques");
                    entidad.Pago_Tarjetas = DalModelo.VerifStringMysql(lector, "Pago_Tarjetas");


                    entidad.Contado = DalModelo.VerifStringMysql(lector, "Contado");
                    entidad.Tj_Debito = DalModelo.VerifStringMysql(lector, "Tj_Debito");
                    entidad.Tj_Credito = DalModelo.VerifStringMysql(lector, "Tj_Credito");
                    entidad.CtaCte = DalModelo.VerifStringMysql(lector, "CtaCte");
                    entidad.Cheque = DalModelo.VerifStringMysql(lector, "Cheque");
                    entidad.Otra = DalModelo.VerifStringMysql(lector, "Otra");
                    entidad.Transferencia = DalModelo.VerifStringMysql(lector, "Transferencia");
                    entidad.Cta_contable = DalModelo.VerifStringMysql(lector, "Cta_contable");
                    
                }

                lector.Close();
                return entidad;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }




        }
        public orden BsqCbateCobrar(string v_orden)
        {
            orden lista = new orden();
            try
            {
                string cmdTxt = "";

                cmdTxt = "  select Remito, fc.Id, Cliente, cc.Nombre ClienteNombre, cc.Tipo_Doc DocTipo,cc.Doc_No DocNro,concat( cc.Contac_Tel, ' ',cc.Contac_Cel)  TelCli, fc.CbteTipo  ,fc.ImpTotal  ,fc.Concepto ,fc.Vendedor   , DATE_FORMAT(fc.Fecha, '%d/%m/%Y') Fecha ,  fc.Contado, fc.Tj_Debito,fc.Tj_Credito,fc.CtaCte , fc.Cheque ,fc.Otra ,concat( CAST(LPAD(fc.PtoVta,4,'0') AS CHAR),'-', CAST(LPAD(fc.CbteDesde,8,'0')AS CHAR))   CbteDesde,  fc.Transferencia, fc.Pago_Efectivo,fc.Pago_Cheques,fc.Pago_Tarjetas, getSaldoCbte(fc.Id) saldo from kx_cbtes fc, kx_cliente cc where fc.Cliente = cc.Id  and fc.Id='" + v_orden + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                Be.orden entidad = new Be.orden();
                while (lector.Read())
                {
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.Remito = DalModelo.VerifStringMysql(lector, "Remito");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.ClienteNombre = DalModelo.VerifStringMysql(lector, "ClienteNombre");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.ImpTotal = "Imp.original: " + DalModelo.VerifStringMysql(lector, "ImpTotal") + "$";
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.TelCli = DalModelo.VerifStringMysql(lector, "TelCli");

                    entidad.CbteNro = DalModelo.VerifStringMysql(lector, "CbteDesde");

                    entidad.Pago_Efectivo = DalModelo.VerifStringMysql(lector, "Pago_Efectivo");
                    entidad.Pago_Cheques = DalModelo.VerifStringMysql(lector, "Pago_Cheques");
                    entidad.Pago_Tarjetas = DalModelo.VerifStringMysql(lector, "Pago_Tarjetas");


                    entidad.Contado = DalModelo.VerifStringMysql(lector, "Contado");
                    entidad.Tj_Debito = DalModelo.VerifStringMysql(lector, "Tj_Debito");
                    entidad.Tj_Credito = DalModelo.VerifStringMysql(lector, "Tj_Credito");
                    entidad.CtaCte = DalModelo.VerifStringMysql(lector, "CtaCte");
                    entidad.Cheque = DalModelo.VerifStringMysql(lector, "Cheque");
                    entidad.Otra = DalModelo.VerifStringMysql(lector, "Otra");
                    entidad.Transferencia = DalModelo.VerifStringMysql(lector, "Transferencia");
                }

                lector.Close();
                return entidad;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }




        }

        public orden BsqOrden(string v_orden)
        {
           orden lista = new orden();
            try
            {
                string cmdTxt = "";

                cmdTxt = " select Id, Cliente, ClienteNombre, DocTipo, DocNro, TelCli,  CbteTipo, ImpTotal, Concepto,Vendedor ,Fecha from orden where Id='" + v_orden + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                Be.orden entidad = new Be.orden();
                while (lector.Read())
                { 
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.ClienteNombre = DalModelo.VerifStringMysql(lector, "ClienteNombre");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.TelCli = DalModelo.VerifStringMysql(lector, "TelCli");
                }

                lector.Close();
                return entidad;
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


         

        }

        public List<Be.kx_articulo> Orden_Articulos( string v_orden)
        { 
            List<Be.kx_articulo> lista = new List<Be.kx_articulo>();
            try
            {
                string cmdTxt = "";
 
                cmdTxt = " select Id, Id_Articulo,  Cod_Manual,  Nombre,  Cant,  Iva_Venta, NetoImpxUni,  ImpxUni,  Tipo_Art,  Unidad, IIBB,ID_DEPOSITO, es_Stock, ListaSelect, id_orden  from orden_articulos  where id_orden='"+ v_orden + "'";
          
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt); 
                MySqlDataReader lector = cnn.ExecuteReader(cmm); 
                while (lector.Read())
                { 
                    Be.kx_articulo entidad = new Be.kx_articulo();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id_Articulo");
                    entidad.Cod_Manual = DalModelo.VerifStringMysql(lector, "Cod_Manual");
                    entidad.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.Cant = DalModelo.VerifStringMysql(lector, "Cant").Replace(",",".");
                    entidad.Iva_Venta= DalModelo.VerifStringMysql(lector, "Iva_Venta");
                    entidad.NetoSelect = DalModelo.VerifStringMysql(lector, "NetoImpxUni");
                    entidad.PrecioSelect = DalModelo.VerifStringMysql(lector, "ImpxUni");
                    entidad.PrecioOriginal = entidad.PrecioSelect;
                   entidad.Tipo_Art = DalModelo.VerifStringMysql(lector, "Tipo_Art");
                    entidad.Unidad = DalModelo.VerifStringMysql(lector, "Unidad");
                    entidad.IIBB = DalModelo.VerifStringMysql(lector, "IIBB");
                    entidad.DepositoSelect = DalModelo.VerifStringMysql(lector, "ID_DEPOSITO");
                    entidad.Descuento ="0";
                    //  entidad.es_Stock = DalModelo.VerifStringMysql(lector, "es_Stock");
                    entidad.es_Stock = "NO"; // PARA QUE ACTUALICE EL STOCK EN DAL.INSERT YA Q SE ACTUALIZO A LA HORA DE HACER LA ORDEN
                    entidad.ListaSelect = DalModelo.VerifStringMysql(lector, "ListaSelect");
                    entidad.IdGrilla = (1 + lista.Count());
                    lista.Add(entidad); 
                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.kx_articulo> Cbte_Articulos(string v_orden)
        {
            List<Be.kx_articulo> lista = new List<Be.kx_articulo>();
            try
            {
                string cmdTxt = "";

                cmdTxt = "  select Id, Id_Articulo,  Cod_Manual,  Nombre,  Cant,getIvaByNombre(Alic) Iva_Venta, NetoImpxUni,  ImpxUni,  Tipo_Art,  Unidad, IIBB,ID_DEPOSITO,'' es_Stock,'' ListaSelect ,id_cbte ,Descuento,Cont_Venta,Cont_Compra  from kx_cbtes_articulos where id_cbte='" + v_orden + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                while (lector.Read())
                {
                    Be.kx_articulo entidad = new Be.kx_articulo();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id_Articulo");
                    entidad.Cod_Manual = DalModelo.VerifStringMysql(lector, "Cod_Manual");
                    entidad.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.Cant = DalModelo.VerifStringMysql(lector, "Cant").Replace(",", ".");
                    entidad.Iva_Venta = DalModelo.VerifStringMysql(lector, "Iva_Venta");
                    entidad.Iva_Compra= DalModelo.VerifStringMysql(lector, "Iva_Venta");
                    entidad.NetoSelect = DalModelo.VerifStringMysql(lector, "NetoImpxUni");
                    entidad.PrecioSelect = DalModelo.VerifStringMysql(lector, "ImpxUni");
                    entidad.Tipo_Art = DalModelo.VerifStringMysql(lector, "Tipo_Art");
                    entidad.Unidad = DalModelo.VerifStringMysql(lector, "Unidad");
                    entidad.IIBB = DalModelo.VerifStringMysql(lector, "IIBB");
                    entidad.DepositoSelect = DalModelo.VerifStringMysql(lector, "ID_DEPOSITO");
                    entidad.Descuento = DalModelo.VerifStringMysql(lector, "Descuento");
                    entidad.Cont_Venta = DalModelo.VerifStringMysql(lector, "Cont_Venta");
                    entidad.Cont_Compra = DalModelo.VerifStringMysql(lector, "Cont_Compra");
                    //  entidad.es_Stock = DalModelo.VerifStringMysql(lector, "es_Stock");
                    entidad.es_Stock = "NO"; // PARA QUE ACTUALICE EL STOCK EN DAL.INSERT YA Q SE ACTUALIZO A LA HORA DE HACER LA ORDEN
                    entidad.ListaSelect = DalModelo.VerifStringMysql(lector, "ListaSelect");
                    entidad.IdGrilla = (1 + lista.Count());
                    lista.Add(entidad);
                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }
        public List<Be.kx_articulo> Cbte_ArticulosCompras(string v_orden)
        {
            List<Be.kx_articulo> lista = new List<Be.kx_articulo>();
            try
            {
                string cmdTxt = "";

                cmdTxt = "  select Id, Id_Articulo,  Cod_Manual,  Nombre,  Cant,getIvaByNombre(Alic) Iva_Venta, NetoImpxUni,  ImpxUni,  Tipo_Art,  Unidad, IIBB,ID_DEPOSITO,'' es_Stock,'' ListaSelect ,id_cbte ,Descuento,Cont_Venta,Cont_Compra  from kx_compras_cbtes_articulos where id_cbte='" + v_orden + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                while (lector.Read())
                {
                    Be.kx_articulo entidad = new Be.kx_articulo();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id_Articulo");
                    entidad.Cod_Manual = DalModelo.VerifStringMysql(lector, "Cod_Manual");
                    entidad.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.Cant = DalModelo.VerifStringMysql(lector, "Cant").Replace(",", ".");
                    entidad.Iva_Venta = DalModelo.VerifStringMysql(lector, "Iva_Venta");
                    entidad.Iva_Compra = DalModelo.VerifStringMysql(lector, "Iva_Venta");
                    entidad.NetoSelect = DalModelo.VerifStringMysql(lector, "NetoImpxUni");
                    entidad.PrecioSelect = DalModelo.VerifStringMysql(lector, "ImpxUni");
                    entidad.Tipo_Art = DalModelo.VerifStringMysql(lector, "Tipo_Art");
                    entidad.Unidad = DalModelo.VerifStringMysql(lector, "Unidad");
                    entidad.IIBB = DalModelo.VerifStringMysql(lector, "IIBB");
                    entidad.DepositoSelect = DalModelo.VerifStringMysql(lector, "ID_DEPOSITO");
                    entidad.Descuento = DalModelo.VerifStringMysql(lector, "Descuento");
                    entidad.Cont_Venta = DalModelo.VerifStringMysql(lector, "Cont_Venta");
                    entidad.Cont_Compra = DalModelo.VerifStringMysql(lector, "Cont_Compra");
                    //  entidad.es_Stock = DalModelo.VerifStringMysql(lector, "es_Stock");
                    entidad.es_Stock = "NO"; // PARA QUE ACTUALICE EL STOCK EN DAL.INSERT YA Q SE ACTUALIZO A LA HORA DE HACER LA ORDEN
                    entidad.ListaSelect = DalModelo.VerifStringMysql(lector, "ListaSelect");
                    entidad.IdGrilla = (1 + lista.Count());
                    lista.Add(entidad);
                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }



        public List<Be.kx_cbtes_percepciones> Cbte_PercCompras(string v_orden, string v_config)
        {
            List<Be.kx_cbtes_percepciones> lista = new List<Be.kx_cbtes_percepciones>();
            try
            {
                string cmdTxt = "";

                cmdTxt = "  select cbte.Monto,cbte.Obs,cbte.Id_Percep,  per.Nombre from kx_cbtes_percepciones cbte , kx_percepciones per where cbte.Tipo='COMPRAS'  and  per.Id= cbte.Id_Percep   and Id_cbte='" + v_orden + "' and cbte.Config='" + v_config + "'   ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                while (lector.Read())
                {
                    Be.kx_cbtes_percepciones entidad = new Be.kx_cbtes_percepciones();
                    entidad.Monto = DalModelo.VerifStringMysql(lector, "Monto").Replace(",", ".");
                    entidad.Obs = DalModelo.VerifStringMysql(lector, "Obs");
                    entidad.Id_Percep = DalModelo.VerifStringMysql(lector, "Id_Percep");
                    entidad.Percep = DalModelo.VerifStringMysql(lector, "Nombre");
                    lista.Add(entidad);
                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.kx_cbtes_percepciones> Cbte_PercVentas(string v_orden, string v_config)
        {
            List<Be.kx_cbtes_percepciones> lista = new List<Be.kx_cbtes_percepciones>();
            try
            {
                string cmdTxt = "";

                cmdTxt = "  select cbte.Monto,cbte.Obs,cbte.Id_Percep,  per.Nombre from kx_cbtes_percepciones cbte , kx_percepciones per where cbte.Tipo='VENTAS'  and  per.Id= cbte.Id_Percep   and Id_cbte='" + v_orden + "' and cbte.Config='" + v_config + "'   ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                while (lector.Read())
                {
                    Be.kx_cbtes_percepciones entidad = new Be.kx_cbtes_percepciones();
                    entidad.Monto = DalModelo.VerifStringMysql(lector, "Monto").Replace(",", ".");
                    entidad.Obs = DalModelo.VerifStringMysql(lector, "Obs");
                    entidad.Id_Percep = DalModelo.VerifStringMysql(lector, "Id_Percep");
                    entidad.Percep = DalModelo.VerifStringMysql(lector, "Nombre");
                    lista.Add(entidad);
                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<orden> Listar_orden(string v_tipo, string v_valor, string v_valor1, string v_config)

        { 
            List<orden> lista = new List<orden>();
            try
            {
                 
                string cmdTxt = " select Id,Cliente, ClienteNombre, getTipoDoc(DocTipo)   DocTipo, DocNro, TelCli, getCbte(CbteTipo)  CbteTipo, FormaPrecio( ImpTotal)  ImpTotal, Concepto, Vendedor, Fecha, Estado , (select count(*) from orden_articulos where id_orden=orden.Id ) Items  from orden  ";
                string cmdTxt2 = "";
                if (v_tipo == "99")
                {
                    cmdTxt2 = "    where  Id_config='" + v_config + "'  and    DATE( Fecha )  >=  STR_TO_DATE('" + v_valor + "','%d/%m/%Y')  and DATE( Fecha )  <=   STR_TO_DATE('" + v_valor1 + "','%d/%m/%Y')   and ANULADO='NO' order by id desc ";
                }
                if (v_tipo == "0")
                {
                    cmdTxt2 = "   where  Id_config='" + v_config + "'  and  Vendedor like '%" + v_valor + "%' and  Fecha > curdate() and ANULADO='NO' order by id desc ";
                }
                if (string.IsNullOrEmpty(v_valor))
                {
                    cmdTxt2 = "  where  Id_config='" + v_config + "'  and   Fecha > curdate() and ANULADO='NO' order by id desc ";
                }
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt+ cmdTxt2);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    orden entidad = new orden();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id").ToString();
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.ClienteNombre = DalModelo.VerifStringMysql(lector, "ClienteNombre");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.TelCli = DalModelo.VerifStringMysql(lector, "TelCli");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Estado = DalModelo.VerifStringMysql(lector, "Estado");
                    entidad.Items= DalModelo.VerifStringMysql(lector, "Items");
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;
        }
        public string Orden_alta(Be.kx_cbtes v_obj)
        {
            string cmdTxt = "";
            MySqlConnection cnn2 = new MySqlConnection();
            try
            {

                List<Be.kx_articulo> listart = new List<Be.kx_articulo>();

          
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
             
              
                cmm = null;
                cmdTxt = "insert into orden ( Cliente, ClienteNombre, DocTipo, DocNro,   CbteTipo, ImpTotal, Concepto,Vendedor ,Fecha,TelCli,Id_config) values ";
                cmdTxt += "  ( '" + v_obj.Cliente + "'  , '" + v_obj.ClienteNombre + "'  ,'" + v_obj.DocTipo + "' ,'" + v_obj.DocNro + "' , '" + v_obj.CbteTipo + "' ,'" + v_obj.ImpTotal + "' ,'" + v_obj.Concepto + "' ,'" + v_obj.Vendedor + "'  ,now(),'" + v_obj.TelCli + "','" + v_obj.Id_config + "')  ";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                cnn.ExecuteNonQuery(cmm);


                cmm = null;
                cmdTxt = " select max(Id)  sal from orden ";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                Int32 MaxId = 0;
                while (lector.Read())
                { 
                    MaxId = DalModelo.VeriIntMysql(lector, "sal");
                }
                lector.Close();


                Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                var numberFormatInfo = new NumberFormatInfo();
                numberFormatInfo.NumberDecimalSeparator = ".";

                foreach (var item in v_obj.Articulos)
                {
                    kx_articulo ent = new kx_articulo();
                    ent.Cant = item.Cant;
                    ent.Cod_Manual = item.Cod_Manual;
                    ent.Id = Convert.ToInt32(item.Id_Articulo);
                    ent.Nombre = item.Nombre;

                    double dd = Convert.ToDouble(item.Alic.Replace("%", ""));
                    dd = (dd / 100);
                    ent.Iva_Venta = Math.Round(dd , 2).ToString();
                    ent.NetoSelect = item.NetoImpxUni;
                    ent.PrecioSelect = item.ImpxUni;
                    ent.Tipo_Art = item.Tipo_Art;
                    ent.Unidad = item.Unidad;
                    ent.IIBB = item.IIBB;
                    ent.DepositoSelect = item.DepositoSelect;
                    ent.es_Stock = item.es_Stock;
                    //    ent.ListaSelect = item.ListaSelect
                    listart.Add(ent);


                    // actualizo el stock
                    if (item.es_Stock == "SI")

                    {
                        cmm = null;
                        cmdTxt = "wi271852_kardex.Stock_update";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                        cnn.AgregarParametroAComando(cmm, "v_tipo", "S");
                        cnn.AgregarParametroAComando(cmm, "v_art", item.Id_Articulo);
                        cnn.AgregarParametroAComando(cmm, "v_cant", item.Cant);
                        cnn.AgregarParametroAComando(cmm, "v_dep", item.DepositoSelect);
                        cnn.AgregarParametroAComando(cmm, "v_motivo", "  Orden venta id: " + MaxId);


                        cnn.AgregarParametroAComando(cmm, "v_remito", "");
                        cnn.AgregarParametroAComando(cmm, "v_origen", "");
                        cnn.AgregarParametroAComando(cmm, "v_proveedor", "");
                        cnn.AgregarParametroAComando(cmm, "v_comentario", "");
                        cnn.AgregarParametroAComando(cmm, "v_tipo_ingreso", "");
                        cnn.AgregarParametroAComando(cmm, "v_lote", "");
                        cnn.AgregarParametroAComando(cmm, "v_vto", "");


                        cmm.ExecuteNonQuery();
                    }
                }



                cmm = null;
                foreach (var art in listart)
                {
                    cmdTxt = " insert into orden_articulos (   Id_Articulo,  Cod_Manual,  Nombre,  Cant,  Iva_Venta, NetoImpxUni,  ImpxUni,  Tipo_Art,  Unidad, IIBB,ID_DEPOSITO, es_Stock, ListaSelect, id_orden ) values ";
                    cmdTxt += "  ( '" + art.Id + "', '" + art.Cod_Manual + "' , '" + art.Nombre + "' , '" + art.Cant + "' , '" + art.Iva_Venta + "'  ,  '" + art.NetoSelect + "', '" + art.PrecioSelect + "' , '" + art.Tipo_Art + "' , '" + art.Unidad + "' , '" + art.IIBB + "','" + art.DepositoSelect + "' ,'" + art.es_Stock + "' ,'" + art.ListaSelect + "','" + MaxId + "'  ) ";

                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, ""); 
                    cnn.ExecuteNonQuery(cmm);


                 

                }

                return MaxId.ToString();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn2.Close();
                
            }

        }

        public void Orden_Baja(string ids, string user)
        {
            string cmdTxt = "";
            MySqlConnection cnn2 = new MySqlConnection();
            try
            {

                List<Be.kx_articulo> listart = new List<Be.kx_articulo>();


                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                cmm = null;
                cmdTxt = " update  orden set ANULADO=concat('ANULADO POR " + user+ " ',  DATE_FORMAT(now(), '%d/%m/%y'))  where Id='" + ids + "'  ";
               cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();
                 


                cmm = null;
                cmdTxt = " select Id_Articulo,es_Stock,Cant,ID_DEPOSITO from orden_articulos where id_orden ='" + ids + "' ";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector = cmm.ExecuteReader();
              
                while (lector.Read())
                {
                    kx_articulo art = new kx_articulo();
                    art.es_Stock = DalModelo.VerifStringMysql(lector, "es_Stock");
                    art.Id = DalModelo.VeriIntMysql(lector, "Id_Articulo");
                    art.Cant= DalModelo.VerifStringMysql (lector, "Cant");
                    art.DepositoSelect = DalModelo.VerifStringMysql(lector, "ID_DEPOSITO");
                    listart.Add(art);
                }
                lector.Close();

                foreach (var item in listart)
                {
                    if (item.es_Stock == "SI")

                    {
                        cmm = null;
                        cmdTxt = "wi271852_kardex.Stock_update";

                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                        cnn.AgregarParametroAComando(cmm, "v_tipo", "E");
                        cnn.AgregarParametroAComando(cmm, "v_art", item.Id);
                        cnn.AgregarParametroAComando(cmm, "v_cant", item.Cant);
                        cnn.AgregarParametroAComando(cmm, "v_dep", item.DepositoSelect);
                        cnn.AgregarParametroAComando(cmm, "v_motivo", " Anulación Orden de venta id: " + ids);


                        cnn.AgregarParametroAComando(cmm, "v_remito", "");
                        cnn.AgregarParametroAComando(cmm, "v_origen", "");
                        cnn.AgregarParametroAComando(cmm, "v_proveedor", "");
                        cnn.AgregarParametroAComando(cmm, "v_comentario", "");
                        cnn.AgregarParametroAComando(cmm, "v_tipo_ingreso", "");
                        cnn.AgregarParametroAComando(cmm, "v_lote", "");
                        cnn.AgregarParametroAComando(cmm, "v_vto", "");


                        cmm.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn2.Close();

            }

        }


        public Dictionary<string, List<string>> Wscttiventas(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf)
        {
            try
            {
                List<string> listAlic = new List<string>();
                List<string> listVentas = new List<string>();
                var diccionario = new Dictionary<string, List<string>>();
          string     cmdTxt = "";

          cmdTxt = " select concat(LPAD(CbteTipo, 3, 0)  ,LPAD(PtoVta, 5, 0) ,LPAD(CbteDesde, 20, 0) ,LPAD(REPLACE(REPLACE(FormaPrecio(BaseImp),'.',''),',','') , 15, 0) ,LPAD(ali.Id, 4, 0) ,LPAD(REPLACE(REPLACE(FormaPrecio(Importe),'.',''),',','') , 15, 0) )  sal  from kx_cbtes , kx_cbtes_aliciva ali where ali.id_cbte= kx_cbtes.Id  and Id_config ='" + v_conf + "' and Fecha between STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor2 + "', '%d/%m/%Y' )  and resultado <> 'R'  order by Fecha ";    
            cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                { 
                    listAlic.Add(lector.GetString(0));     
                }
                diccionario.Add("alic", listAlic);
                lector.Close();

                // vtas
                cmm = null;
                cmdTxt = " select concat( DATE_FORMAT(FECHA, '%Y%m%d') ,LPAD(CbteTipo, 3, 0) ,LPAD(PtoVta, 5, 0),LPAD(CbteDesde, 20, 0),LPAD(CbteHasta, 20, 0) ,LPAD(DocTipo, 2, 0) ,LPAD(DocNro, 20, 0) ,RPAD(RazonSocial, 30,' ') ,LPAD(REPLACE(REPLACE(FormaPrecio(ImpTotal),'.',''),',','') , 15, 0)  ,LPAD(REPLACE(REPLACE(FormaPrecio(ImpTotConc),'.',''),',','') , 15, 0)   ,LPAD(REPLACE(REPLACE(FormaPrecio(0),'.',''),',','') , 15, 0)  ,LPAD(REPLACE(REPLACE(FormaPrecio(ImpOpEx),'.',''),',','') , 15, 0)    ,LPAD(REPLACE(REPLACE(FormaPrecio(0),'.',''),',','') , 15, 0) ,LPAD(REPLACE(REPLACE(FormaPrecio(0),'.',''),',','') , 15, 0) ,LPAD(REPLACE(REPLACE(FormaPrecio(ImpTrib),'.',''),',','') , 15, 0)   ,LPAD(REPLACE(REPLACE(FormaPrecio(0),'.',''),',','') , 15, 0)  ,LPAD(MonId, 3, 0)     , '0001000000'  , CantAlic  , '0'  ,LPAD(REPLACE(REPLACE(FormaPrecio(0),'.',''),',','') , 15, 0)   ,concat( DATE_FORMAT(FchVtoPago, '%Y%m%d')  )  )  sal  from kx_cbtes   where  Id_config ='" + v_conf + "' and Fecha between STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor2 + "', '%d/%m/%Y' )  and resultado <> 'R'  order by Fecha ";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                lector = null;
                lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    listVentas.Add(lector.GetString(0));
                }

                diccionario.Add("vtas", listVentas);
                lector.Close();

                return diccionario;

          }
          catch (Exception)
          {
              
              throw;
          }
            finally
            {
                cnn.Close(cmm);
            }
        
        }

        public List<Be.kx_cbtes> WsListarAcobrar(  string v_cli, string v_conf)

        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {
                string cmdTxt = "";

                
                    //    cmdTxt = " select Id,CantReg, CbteTipo, PtoVta,DATE_FORMAT(Fecha,  '%d/%m/%y') Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones from kx_cbtes where CbteDesde 	='" + v_valor1 + "' and  CbteTipo ='" + v_tipoCbate + "' order by CbteHasta desc";

                    cmdTxt = "  SELECT cb.Id,cte.id CantReg, ct.nombre CbteTipo, cb.PtoVta, DATE_FORMAT( cb.Fecha, '%d/%m/%y' ) Fecha, cb.usuario, cb.Resultado, cb.CbteTipo Vendedor, cb.Cliente, cb.aud, cb.Concepto, cb.DocTipo, concat( dt.nombre, ' ', cb.DocNro ) DocNro,concat( CAST(LPAD(cb.PtoVta,4,'0') AS CHAR),'-',CAST(LPAD(cb.CbteDesde,8,'0')AS CHAR) )  CbteDesde, cb.CbteHasta, cb.CbteFch, formaPrecioCbte(cb.ImpTotal , cb.Id)  ImpTotal,  formaPrecioCbte(cb.ImpTotConc , cb.Id)    ImpTotConc, formaPrecioCbte(cb.ImpNeto , cb.Id)   ImpNeto, formaPrecioCbte(cb.ImpOpEx , cb.Id)    ImpOpEx, formaPrecioCbte(cb.ImpTrib , cb.Id)     ImpTrib,formaPrecioCbte(cb.ImpIVA , cb.Id) ImpIVA,cb.MonId, cb.MonCotiz, cb.CAE, cb.CAEFchVto, cb.Observaciones,cte.saldo  FROM kx_cbtes cb, kx_doc_tipo dt, kx_cbtes_tipos ct , kx_ctacte cte WHERE cte.Tipo ='VENTAS' and ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and    resultado <> 'R'  and cte.id_cbte = cb.Id  and cte.estado='I' and cte.id_cliente ='" + v_cli + "' and cb.Id_config='" + v_conf + "'   ORDER BY cb.CbteHasta DESC ";

                

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal").Replace(" ", "");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc").Replace(" ", "");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto").Replace(" ", "");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx").Replace(" ", "");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib").Replace(" ", "");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA").Replace(" ", "");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "saldo");
                    entidad.Cta_contrable ="29"; // deudores x venta si es ctacte
                    lista.Add(entidad);


                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.kx_cbtes> WsListarPagar(string v_cli, string v_conf)

        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {
                string cmdTxt = "";


                //    cmdTxt = " select Id,CantReg, CbteTipo, PtoVta,DATE_FORMAT(Fecha,  '%d/%m/%y') Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones from kx_cbtes where CbteDesde 	='" + v_valor1 + "' and  CbteTipo ='" + v_tipoCbate + "' order by CbteHasta desc";

                cmdTxt = "  SELECT cb.Id,cte.id CantReg, ct.Letras CbteTipo, cb.PtoVta, DATE_FORMAT( cb.Fecha, '%d/%m/%y' ) Fecha, cb.usuario, cb.Resultado, cb.CbteTipo Vendedor,cb.Proveedor  Cliente, cb.aud, cb.Concepto, cb.DocTipo, concat( dt.nombre, ' ', cb.DocNro ) DocNro, concat( CAST(LPAD(cb.PtoVta,4,'0') AS CHAR),'-',CAST(LPAD(cb.CbteDesde,8,'0')AS CHAR) )  CbteDesde, cb.CbteHasta, cb.CbteFch, formaPrecioCbte(cb.ImpTotal , cb.Id)  ImpTotal,  formaPrecioCbte(cb.ImpTotConc , cb.Id)    ImpTotConc, formaPrecioCbte(cb.ImpNeto , cb.Id)   ImpNeto, formaPrecioCbte(cb.ImpOpEx , cb.Id)    ImpOpEx, formaPrecioCbte(cb.ImpTrib , cb.Id)     ImpTrib,formaPrecioCbte(cb.ImpIVA , cb.Id) ImpIVA,cb.MonId, cb.MonCotiz, cb.CAE, cb.CAEFchVto, cb.Observaciones,cte.saldo, cb.Cta_contable, cb.Prioridad FROM kx_compras_cbtes cb, kx_doc_tipo dt, kx_cbtes_tipos ct , kx_ctacte cte WHERE cte.Tipo ='COMPRAS' and ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and    resultado <> 'R'  and cte.id_cbte = cb.Id  and cte.estado='I' and cte.id_cliente ='" + v_cli + "' and cb.Id_config='" + v_conf + "' and cb.CbteTipo not in ('8','13','21')   ORDER BY cb.CbteHasta DESC ";



                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal").Replace(" ", "");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc").Replace(" ", "");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto").Replace(" ", "");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx").Replace(" ", "");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib").Replace(" ", "");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA").Replace(" ", "");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "saldo");
                    entidad.Cta_contrable = DalModelo.VerifStringMysql(lector, "Cta_contable");
                    entidad.Prioridad = DalModelo.VerifStringMysql(lector, "Prioridad");
                    lista.Add(entidad);


                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.kx_cbtes> WsListarCompras(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf, string v_priori)

        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {
                string cmdTxt = " SELECT distinct cb.Id, ct.id CantReg, ct.nombre CbteTipo, cb.PtoVta, DATE_FORMAT( cb.Fecha, '%d/%m/%y' ) Fecha, cb.usuario, cb.Resultado, cb.Vendedor, cl.Denominacion  Cliente, cb.aud, cb.Concepto, cb.DocTipo, concat( dt.nombre, ' ', cb.DocNro ) DocNro, concat( CAST(LPAD(cb.PtoVta,4,'0') AS CHAR),'-', CAST(LPAD(cb.CbteDesde,8,'0')AS CHAR))   CbteDesde, cb.CbteHasta, cb.CbteFch, formaPrecioCbte(cb.ImpTotal , cb.Id)    ImpTotal,formaPrecioCbte(cb.ImpTotConc , cb.Id)  ImpTotConc,formaPrecioCbte(cb.ImpNeto , cb.Id) ImpNeto, formaPrecioCbte(cb.ImpOpEx , cb.Id)  ImpOpEx, formaPrecioCbte(cb.ImpTrib , cb.Id)   ImpTrib,formaPrecioCbte(cb.ImpIVA , cb.Id)    ImpIVA, cb.MonId, cb.MonCotiz, cb.CAE, cb.CAEFchVto, cb.Observaciones, cb.Prioridad  FROM kx_compras_cbtes cb, kx_doc_tipo dt, kx_cbtes_tipos ct, kx_proveedor cl   ";

                if (v_tipo == "1")
                {
                    //    cmdTxt = " select Id,CantReg, CbteTipo, PtoVta,DATE_FORMAT(Fecha,  '%d/%m/%y') Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones from kx_cbtes where CbteDesde 	='" + v_valor1 + "' and  CbteTipo ='" + v_tipoCbate + "' order by CbteHasta desc";

                    cmdTxt += "  WHERE CbteDesde 	like  '%" + v_valor1 + "%' AND ct.id = cb.CbteTipo and cl.Id = cb.Proveedor AND dt.id = cb.DocTipo and  ( CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R' and cb.Id_config='" + v_conf + "' and  ( Prioridad ='" + v_priori + "' OR 99= '" + v_priori + "' )     ORDER BY cb.CbteHasta DESC ";

                }
                if (v_tipo == "2")
                {
                    cmdTxt += "   WHERE   ct.id = cb.CbteTipo AND dt.id = cb.DocTipo  and cl.Id = cb.Proveedor and (cb.CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R'   and cb.Id_config='" + v_conf + "'  and cb.Fecha between STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor2 + "', '%d/%m/%Y' ) and  ( Prioridad ='" + v_priori + "' OR 99= '" + v_priori + "' )  order by CbteDesde desc";


                }
                if (v_tipo == "3")
                {

                    cmdTxt += "  WHERE  cl.Cuit  like '%" + v_valor1 + "%' and cl.Id = cb.Proveedor  AND ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and  (cb.CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R'   and cb.Id_config='" + v_conf + "'  and  ( Prioridad ='" + v_priori + "' OR 99= '" + v_priori + "' )    ORDER BY cb.CbteHasta DESC ";

                }

                if (v_tipo == "4")
                {

                    cmdTxt += "   WHERE cl.Denominacion like '%" + v_valor1 + "%' and cl.Id = cb.Proveedor  AND ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and  (cb.CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R'  AND    cb.Id_config='" + v_conf + "'  and  ( Prioridad ='" + v_priori + "' OR 99= '" + v_priori + "' )   ORDER BY cb.CbteHasta DESC ";

                }
                if (v_tipo == "5") // Code cliente
                {

                    cmdTxt += "   WHERE cl.Cod_Manual like '%" + v_valor1 + "%' and cl.Id = cb.Proveedor  AND ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and  (cb.CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R'   and cb.Id_config='" + v_conf + "' and  ( Prioridad ='" + v_priori + "' OR 99= '" + v_priori + "' )    ORDER BY cb.CbteHasta DESC ";

                }



                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal").Replace(" ", "");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc").Replace(" ", "");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto").Replace(" ", "");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx").Replace(" ", "");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib").Replace(" ", "");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA").Replace(" ", "");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    entidad.Prioridad = DalModelo.VerifStringMysql(lector, "Prioridad");
                    
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }
        public List<Be.DeudaProveedor> WsRpDeudaProveedor(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2,   string v_conf, string v_priori)

        {

            List<DeudaProveedor> lista = new List<DeudaProveedor>();
            MySqlConnection cnn2 = null;
            try
            {
              
                cmm = null;
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "sp_temp_deuda_proveedor";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_fecha1", v_valor1);
                cnn.AgregarParametroAComando(cmm, "v_fecha2", v_valor2);
                cnn.AgregarParametroAComando(cmm, "v_config", v_conf);
                cnn.AgregarParametroAComando(cmm, "v_tipo", v_tipo);
                cnn.AgregarParametroAComando(cmm, "v_prov", v_tipoCbate);
                cnn.AgregarParametroAComando(cmm, "v_priori", v_priori);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    DeudaProveedor entidad = new DeudaProveedor();
                    entidad.Proveedor = DalModelo.VerifStringMysql(lector, "Proveedor");
                    entidad.Letra_compra = DalModelo.VerifStringMysql(lector, "Tipo"); 
                    entidad.Cbte_compra = DalModelo.VerifStringMysql(lector, "Nro");
                    entidad.Fecha_compra = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.FechaVto_compra = DalModelo.VerifStringMysql(lector, "Vto");
                    entidad.Monto_compra = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.Monto_op = DalModelo.VerifStringMysql(lector, "ImpOP");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo"); 

                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.DeudaProveedor> WsRpDeudaCliente(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_conf, string v_priori)

        {

            List<DeudaProveedor> lista = new List<DeudaProveedor>();
            MySqlConnection cnn2 = null;
            try
            {

                cmm = null;
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "sp_temp_deuda_cliente";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_fecha1", v_valor1);
                cnn.AgregarParametroAComando(cmm, "v_fecha2", v_valor2);
                cnn.AgregarParametroAComando(cmm, "v_config", v_conf);
                cnn.AgregarParametroAComando(cmm, "v_tipo", v_tipo);
                cnn.AgregarParametroAComando(cmm, "v_prov", v_tipoCbate);
                cnn.AgregarParametroAComando(cmm, "v_priori", v_priori);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    DeudaProveedor entidad = new DeudaProveedor();
                    entidad.Proveedor = DalModelo.VerifStringMysql(lector, "Proveedor");
                    entidad.Letra_compra = DalModelo.VerifStringMysql(lector, "Tipo");
                    entidad.Cbte_compra = DalModelo.VerifStringMysql(lector, "Nro");
                    entidad.Fecha_compra = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.FechaVto_compra = DalModelo.VerifStringMysql(lector, "Vto");
                    entidad.Monto_compra = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.Monto_op = DalModelo.VerifStringMysql(lector, "ImpOP");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");

                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.temp_deuda_mayor_mov> WsRpMayorMov(string v_fecha1, string v_fecha2, string v_config, string v_cta, string v_cta1)

        {

            List<temp_deuda_mayor_mov> lista = new List<temp_deuda_mayor_mov>();
            MySqlConnection cnn2 = null;
            try
            {

                cmm = null;
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "sp_temp_mayor_mov";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_fecha1", v_fecha1);
                cnn.AgregarParametroAComando(cmm, "v_fecha2", v_fecha2);
                cnn.AgregarParametroAComando(cmm, "v_config", v_config);
                cnn.AgregarParametroAComando(cmm, "v_cta1", v_cta);
                cnn.AgregarParametroAComando(cmm, "v_cta2", v_cta1);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    temp_deuda_mayor_mov entidad = new temp_deuda_mayor_mov();
                    entidad.Asiento = DalModelo.VerifStringMysql(lector, "Asiento");
                    entidad.Cuenta = DalModelo.VerifStringMysql(lector, "Cuenta");
                    entidad.Cuenta_Nombre = DalModelo.VerifStringMysql(lector, "Cuenta_Nombre");
                    entidad.Debe_Eje = DalModelo.VerifStringMysql(lector, "Debe_Eje");
                    entidad.Debe_Mes = DalModelo.VerifStringMysql(lector, "Debe_Mes");
                    entidad.Detalle = DalModelo.VerifStringMysql(lector, "Detalle");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Haber_Eje = DalModelo.VerifStringMysql(lector, "Haber_Eje");
                    entidad.Haber_Mes = DalModelo.VerifStringMysql(lector, "Haber_Mes");
                    entidad.Id= DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Saldo_Eje = DalModelo.VerifStringMysql(lector, "Saldo_Eje");
               
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }


        public List<Be.temp_deuda_mayor> WsRpMayor( string v_fecha1  , string  v_fecha2  , string v_config , string  v_cta)

        {

            List<temp_deuda_mayor> lista = new List<temp_deuda_mayor>();
            MySqlConnection cnn2 = null;
            try
            {

                cmm = null;
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "sp_temp_mayor";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_fecha1", v_fecha1);
                cnn.AgregarParametroAComando(cmm, "v_fecha2", v_fecha2);
                cnn.AgregarParametroAComando(cmm, "v_config", v_config);
                cnn.AgregarParametroAComando(cmm, "v_cta", v_cta);
               
                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    temp_deuda_mayor entidad = new temp_deuda_mayor();
                    entidad.Codigo= DalModelo.VerifStringMysql(lector, "Codigo");
                    entidad.Cta = DalModelo.VerifStringMysql(lector, "Cta");
                    entidad.Debe = DalModelo.VerifStringMysql(lector, "Debe");
                    entidad.Documento_concepto = DalModelo.VerifStringMysql(lector, "Documento_concepto");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Haber = DalModelo.VerifStringMysql(lector, "Haber");
                    entidad.Id_Cbte= DalModelo.VerifStringMysql(lector, "Id_Cbte");
                    entidad.Id_cta = DalModelo.VerifStringMysql(lector, "Id_cta");
                    entidad.Orden= DalModelo.VerifStringMysql(lector, "Orden"); 
                    entidad.Tipo = DalModelo.VerifStringMysql(lector, "Tipo");
 
                   
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.DeudaProveedor> WsListarDeudaProveedor(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf, string v_priori)

        {
            MySqlConnection cnn2 = null;
            List<DeudaProveedor> lista = new List<DeudaProveedor>();
            try
            {
                //string cmdTxt = "   select cbte.Id Id_compra,  concat( CAST(LPAD(TRIM(cbte.PtoVta),4,'0') AS CHAR),'-',CAST(LPAD(TRIM(cbte.CbteDesde),8,'0')AS CHAR) )   Cbte_compra , (select ifnull( Letras,'')  from  kx_cbtes_tipos tipocbte1 where tipocbte1.Id=cbte.CbteTipo) Letra_compra,DATE_FORMAT(cbte.Fecha, '%d/%m/%Y')  Fecha_compra, DATE_FORMAT(cbte.FchVtoPago, '%d/%m/%Y')  FechaVto_compra,cbte.ImpTotal Monto_compra,if(Prioridad='Pagar con prioridad','X','')  Prioridad_compra , ifnull( ctacte.Saldo,0) Saldo   , opc.PagoId  Id_op ,(select ifnull( Letras,'') from  kx_cbtes_tipos tipocbte where tipocbte.Id=op.CbteTipo)  Letra_op,DATE_FORMAT(op.Fecha, '%d/%m/%Y')  Fecha_op, (select sum(Importe)  from kx_cbtes_pagos_items where Id_pago=opc.PagoId  and Cbte_Id=cbte.Id) Monto_op     , CAST(LPAD(TRIM(op.Id),8,'0') AS CHAR)    Cbte_op ,cbte.CbteTipo TipoCbte_compra ";
                //cmdTxt += " from kx_compras_cbtes cbte     left join  kx_ctacte ctacte on cbte.Id =ctacte.id_cbte   and ctacte.Tipo ='COMPRAS'  left join kx_doc_tipo dt on cbte.DocTipo=dt.id   left join   kx_cbtes_pagos_cbtes opc  on opc.CbteId= cbte.Id     left join   kx_cbtes_pagos op  on op.Id=  opc.PagoId ";

                //if (v_tipo == "2")
                //{
                //    cmdTxt += "   WHERE    (cbte.Proveedor ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' )  and  cbte.Id_config='" + v_conf + "' and (Prioridad <>'' or 99= '" + v_priori + "' )  and  cbte.Fecha between STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor2 + "', '%d/%m/%Y' )  order by  YEAR( cbte.Fecha), MONTH( cbte.Fecha),DAY( cbte.Fecha) ,cbte.Id , cbte.CbteDesde,op.Id desc   ";

                //}
                //if (v_tipo == "7")
                //{
                //    cmdTxt += "   WHERE    (cbte.Proveedor ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' )  and  cbte.Id_config='" + v_conf + "' and (Prioridad <>'' or 99= '" + v_priori + "' )  and  cbte.FchVtoPago between STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor2 + "', '%d/%m/%Y' )  order by   YEAR( cbte.Fecha), MONTH( cbte.Fecha),DAY( cbte.Fecha)  ,cbte.Id  , cbte.CbteDesde,op.Id desc  ";

                //}


                //cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

            
                cmm = null;
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "sp_temp_informe_proveedor";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_fecha1", v_valor1);
                cnn.AgregarParametroAComando(cmm, "v_fecha2", v_valor2);
                cnn.AgregarParametroAComando(cmm, "v_config", v_conf);
                cnn.AgregarParametroAComando(cmm, "v_prov", v_tipoCbate);
                cnn.AgregarParametroAComando(cmm, "v_priori", v_priori);
                cnn.AgregarParametroAComando(cmm, "v_tipo", v_tipo);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                 

                while (lector.Read())
                {

                    DeudaProveedor entidad = new DeudaProveedor();
                    entidad.Cbte_compra = DalModelo.VerifStringMysql(lector, "Cbte_compra");
                    entidad.Cbte_op= DalModelo.VerifStringMysql(lector, "Cbte_op");
                    entidad.Fecha_compra = DalModelo.VerifStringMysql(lector, "Fecha_compra");
                    entidad.Fecha_op = DalModelo.VerifStringMysql(lector, "Fecha_op");
                    entidad.Id_compra = DalModelo.VerifStringMysql(lector, "Id_compra");
                    entidad.Id_op = DalModelo.VerifStringMysql(lector, "Id_op");
                    entidad.Letra_compra = DalModelo.VerifStringMysql(lector, "Letra_compra");
                    entidad.Letra_op = DalModelo.VerifStringMysql(lector, "Letra_op");
                    entidad.Monto_compra= DalModelo.VerifStringMysql(lector, "Monto_compra");
                    entidad.Monto_op = DalModelo.VerifStringMysql(lector, "Monto_op");
                    entidad.Prioridad_compra = DalModelo.VerifStringMysql(lector, "Prioridad_compra");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");
                    entidad.TipoCbte_compra = DalModelo.VerifStringMysql(lector, "TipoCbte_compra");
                    entidad.FechaVto_compra = DalModelo.VerifStringMysql(lector, "FechaVto_compra");
                    
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn2.Close();
              //  cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.DeudaProveedor> WsListarDeudaCliente(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf, string v_priori)

        {
            MySqlConnection cnn2 = null;
            List<DeudaProveedor> lista = new List<DeudaProveedor>();
         
            try
            {
              

                cmm = null;
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "sp_temp_informe_cliente";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_fecha1", v_valor1);
                cnn.AgregarParametroAComando(cmm, "v_fecha2", v_valor2);
                cnn.AgregarParametroAComando(cmm, "v_config", v_conf);
                cnn.AgregarParametroAComando(cmm, "v_prov", v_tipoCbate);
                cnn.AgregarParametroAComando(cmm, "v_priori", v_priori);
                cnn.AgregarParametroAComando(cmm, "v_tipo", v_tipo);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);




                while (lector.Read())
                {

                    DeudaProveedor entidad = new DeudaProveedor();
                    entidad.Cbte_compra = DalModelo.VerifStringMysql(lector, "Cbte_compra");
                    entidad.Cbte_op = DalModelo.VerifStringMysql(lector, "Cbte_op");
                    entidad.Fecha_compra = DalModelo.VerifStringMysql(lector, "Fecha_compra");
                    entidad.Fecha_op = DalModelo.VerifStringMysql(lector, "Fecha_op");
                    entidad.Id_compra = DalModelo.VerifStringMysql(lector, "Id_compra");
                    entidad.Id_op = DalModelo.VerifStringMysql(lector, "Id_op");
                    entidad.Letra_compra = DalModelo.VerifStringMysql(lector, "Letra_compra");
                    entidad.Letra_op = DalModelo.VerifStringMysql(lector, "Letra_op");
                    entidad.Monto_compra = DalModelo.VerifStringMysql(lector, "Monto_compra");
                    entidad.Monto_op = DalModelo.VerifStringMysql(lector, "Monto_op");
                    entidad.Prioridad_compra = DalModelo.VerifStringMysql(lector, "Prioridad_compra");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");
                    entidad.TipoCbte_compra = DalModelo.VerifStringMysql(lector, "TipoCbte_compra");
                    entidad.FechaVto_compra = DalModelo.VerifStringMysql(lector, "FechaVto_compra");

                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }
        public List<Be.kx_cbtes> WsListarCobro(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf)

        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {
                string cmdTxt = "  SELECT distinct cb.Id, ct.id CantReg, ct.nombre CbteTipo, cb.PtoVta, DATE_FORMAT( cb.Fecha, '%d/%m/%Y' ) Fecha, cb.usuario, cb.Resultado, cb.Vendedor,   concat( UPPER( cl.Nombre ),' ',UPPER( cl.Apellido ) )  Cliente, cb.aud,'' Concepto, '80'  DocTipo, concat(cl.Tipo_Doc, ' ', cl.Doc_No) DocNro, concat( CAST(LPAD(cb.PtoVta,4,'0') AS CHAR),'-', CAST(LPAD(cb.Id,8,'0')AS CHAR))   CbteDesde,''  CbteHasta,DATE_FORMAT( cb.Fecha, '%d/%m/%Y' )  CbteFch, formaPrecioCbte(cb.ImpTotal , cb.Id)    ImpTotal, '0'  ImpTotConc,'0' ImpNeto,'0'  ImpOpEx,'0'   ImpTrib, '0'   ImpIVA, cb.MonId, cb.MonCotiz, '' CAE, '' CAEFchVto, cb.Observaciones,getCbteAsoccobro(cb.Id) Prioridad  FROM kx_cbtes_cobro cb,  kx_cbtes_tipos ct,kx_cliente cl    ";

                if (v_tipo == "1")
                {
                    //    cmdTxt = " select Id,CantReg, CbteTipo, PtoVta,DATE_FORMAT(Fecha,  '%d/%m/%y') Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones from kx_cbtes where CbteDesde 	='" + v_valor1 + "' and  CbteTipo ='" + v_tipoCbate + "' order by CbteHasta desc";

                    cmdTxt += "  WHERE cb.Id	= '" + v_valor1 + "'   cl.Id = cb.Cliente  AND ct.id = cb.CbteTipo    and   cb.Id_config='" + v_conf + "'  AND  (cl.Id= '" + v_tipoCbate + "' or  '" + v_tipoCbate + "'= '99') ORDER BY cb.Id DESC ";

                }
                if (v_tipo == "2")
                {
                    cmdTxt += "   WHERE   cl.Id = cb.Cliente  AND ct.id = cb.CbteTipo   and cb.Id_config='" + v_conf + "'  and cb.Fecha between STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor2 + "', '%d/%m/%Y' ) and (cl.Id= '" + v_tipoCbate + "' or  '" + v_tipoCbate + "'= '99')  order by cb.Id desc";


                }
                if (v_tipo == "3")
                {

                    cmdTxt += "  WHERE  cl.Doc_No  like '%" + v_valor1 + "%' and  cl.Id = cb.Cliente  AND ct.id = cb.CbteTipo    and cb.Id_config='" + v_conf + "'  and (cl.Id= '" + v_tipoCbate + "' or  '" + v_tipoCbate + "'= '99')  ORDER BY cb.Id DESC ";

                }

                if (v_tipo == "4")
                {

                    cmdTxt += "   WHERE cl.Nombre like '%" + v_valor1 + "%' and cl.Id = cb.Client  AND ct.id = cb.CbteTipo  AND    cb.Id_config='" + v_conf + "' and (cl.Id= '" + v_tipoCbate + "' or  '" + v_tipoCbate + "'= '99')    ORDER BY cb.Id DESC ";

                }



                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal").Replace(" ", "");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc").Replace(" ", "");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto").Replace(" ", "");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx").Replace(" ", "");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib").Replace(" ", "");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA").Replace(" ", "");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    entidad.Prioridad = DalModelo.VerifStringMysql(lector, "Prioridad");

                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.kx_cbtes> WsListarPagos(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf)

        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {
                string cmdTxt = " SELECT distinct cb.Id, ct.id CantReg, ct.nombre CbteTipo, cb.PtoVta, DATE_FORMAT( cb.Fecha, '%d/%m/%Y' ) Fecha, cb.usuario, cb.Resultado, cb.Vendedor, cl.Denominacion  Cliente, cb.aud,'' Concepto,'80'  DocTipo,concat('CUIT', ' ', cl.Cuit ) DocNro, concat( CAST(LPAD(cb.PtoVta,4,'0') AS CHAR),'-', CAST(LPAD(cb.Id,8,'0')AS CHAR))   CbteDesde,''  CbteHasta,DATE_FORMAT( cb.Fecha, '%d/%m/%Y' )  CbteFch, formaPrecioCbte(cb.ImpTotal , cb.Id)    ImpTotal, '0'  ImpTotConc,'0' ImpNeto,'0'  ImpOpEx,'0'   ImpTrib, '0'   ImpIVA, cb.MonId, cb.MonCotiz, '' CAE, '' CAEFchVto, cb.Observaciones,getCbteAsocPago(cb.Id) Prioridad   FROM kx_cbtes_pagos cb,  kx_cbtes_tipos ct, kx_proveedor cl    ";

                if (v_tipo == "1")
                {
                    //    cmdTxt = " select Id,CantReg, CbteTipo, PtoVta,DATE_FORMAT(Fecha,  '%d/%m/%y') Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones from kx_cbtes where CbteDesde 	='" + v_valor1 + "' and  CbteTipo ='" + v_tipoCbate + "' order by CbteHasta desc";

                    cmdTxt += "  WHERE cb.Id	= '" + v_valor1 + "'  AND cl.Id = cb.Persona  AND ct.id = cb.CbteTipo  and   cb.Id_config='" + v_conf + "'  AND  (cl.Id= '" + v_tipoCbate + "' or  '" + v_tipoCbate + "'= '99') ORDER BY cb.Id DESC ";

                }
                if (v_tipo == "2")
                {
                    cmdTxt += "   WHERE  cl.Id = cb.Persona  AND ct.id = cb.CbteTipo   and cb.Id_config='" + v_conf + "'  and cb.Fecha between STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor2 + "', '%d/%m/%Y' ) and (cl.Id= '" + v_tipoCbate + "' or  '" + v_tipoCbate + "'= '99')  order by cb.Id desc";


                }
                if (v_tipo == "3")
                {

                    cmdTxt += "  WHERE  cl.Cuit  like '%" + v_valor1 + "%' and  cl.Id = cb.Persona  AND ct.id = cb.CbteTipo    and cb.Id_config='" + v_conf + "'  and (cl.Id= '" + v_tipoCbate + "' or  '" + v_tipoCbate + "'= '99')  ORDER BY cb.Id DESC ";

                }

                if (v_tipo == "4")
                {

                    cmdTxt += "   WHERE cl.Denominacion like '%" + v_valor1 + "%' and cl.Id = cb.Persona  AND ct.id = cb.CbteTipo  AND    cb.Id_config='" + v_conf + "' and (cl.Id= '" + v_tipoCbate + "' or  '" + v_tipoCbate + "'= '99')    ORDER BY cb.Id DESC ";

                }
                


                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal").Replace(" ", "");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc").Replace(" ", "");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto").Replace(" ", "");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx").Replace(" ", "");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib").Replace(" ", "");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA").Replace(" ", "");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    entidad.Prioridad = DalModelo.VerifStringMysql(lector, "Prioridad");

                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public List<Be.kx_cbtes> WsListar(string v_tipoCbate, string v_tipo, string v_valor1, string v_valor2, string v_user, string v_conf)

        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {
                string cmdTxt = " SELECT distinct cb.Id, ct.id CantReg, ct.nombre CbteTipo, cb.PtoVta, DATE_FORMAT( cb.Fecha, '%d/%m/%y' ) Fecha, cb.usuario, cb.Resultado, cb.Vendedor, cb.Cliente, cb.aud, cb.Concepto, cb.DocTipo, concat( dt.nombre, ' ', cb.DocNro ) DocNro, concat( CAST(LPAD(cb.PtoVta,4,'0') AS CHAR),'-', CAST(LPAD(cb.CbteDesde,8,'0')AS CHAR))   CbteDesde, cb.CbteHasta, cb.CbteFch, formaPrecioCbte(cb.ImpTotal , cb.Id)    ImpTotal,formaPrecioCbte(cb.ImpTotConc , cb.Id)  ImpTotConc,formaPrecioCbte(cb.ImpNeto , cb.Id) ImpNeto, formaPrecioCbte(cb.ImpOpEx , cb.Id)  ImpOpEx, formaPrecioCbte(cb.ImpTrib , cb.Id)   ImpTrib,formaPrecioCbte(cb.ImpIVA , cb.Id)    ImpIVA, cb.MonId, cb.MonCotiz, cb.CAE, cb.CAEFchVto, cb.Observaciones  FROM kx_cbtes cb, kx_doc_tipo dt, kx_cbtes_tipos ct,kx_cliente cl   ";
                 
                if (v_tipo == "1")
                {
                //    cmdTxt = " select Id,CantReg, CbteTipo, PtoVta,DATE_FORMAT(Fecha,  '%d/%m/%y') Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones from kx_cbtes where CbteDesde 	='" + v_valor1 + "' and  CbteTipo ='" + v_tipoCbate + "' order by CbteHasta desc";

                    cmdTxt += "  WHERE CbteDesde 	='" + v_valor1 + "' AND ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and  ( CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R' and cb.Id_config='" + v_conf + "'    ORDER BY  month( cb.Fecha),day( cb.Fecha) DESC ";
                
                }
                if (v_tipo == "2")
                {
                    cmdTxt += "   WHERE   ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and (cb.CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R'   and cb.Id_config='" + v_conf + "'  and cb.Fecha between STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor2 + "', '%d/%m/%Y' ) order by month( cb.Fecha),day( cb.Fecha) desc";
                  

                }
                if (v_tipo == "3")
                {
                   
                    cmdTxt += "  WHERE  CbteDesde like '" + v_valor1 + "' AND ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and  (cb.CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R'  AND cl.id = cb.Cliente  and cb.Id_config='" + v_conf + "'   ORDER BY month( cb.Fecha),day( cb.Fecha) DESC ";

                }

                if (v_tipo == "4")
                {
                    
                    cmdTxt += "   WHERE cl.Nombre like '%" + v_valor1 + "%' AND ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and  (cb.CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R'  AND cl.id = cb.Cliente  and cb.Id_config='" + v_conf + "'   ORDER BY month( cb.Fecha),day( cb.Fecha) DESC ";

                }
                if (v_tipo == "5") // Code cliente
                {

                    cmdTxt += "   WHERE cl.Cod_Manual like '%" + v_valor1 + "%' AND ct.id = cb.CbteTipo AND dt.id = cb.DocTipo and  (cb.CbteTipo ='" + v_tipoCbate + "' OR 99= '" + v_tipoCbate + "' ) and resultado <> 'R'  AND cl.id = cb.Cliente  and cb.Id_config='" + v_conf + "'   ORDER BY month( cb.Fecha),day( cb.Fecha) DESC ";

                }



                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal").Replace(" ", "");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc").Replace(" ", "");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto").Replace(" ", "");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx").Replace(" ", "");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib").Replace(" ", "");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA").Replace(" ", "");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;

        }

        public void Baja_cbatecompras(string ids)
        {
            MySqlConnection cnn2 = new MySqlConnection();


            try
            {
                //string cmdTxt = " delete from kx_compras_cbtes_articulos where Id ='" + ids + "'  ; delete from kx_compras_cbtes where Id ='" + ids + "'  ";

                //cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                //cnn.ExecuteNonQuery(cmm); 
                    cnn2 = cnn.MySqlCrearNuevaConexion();
                    cnn2.Open();
                    cmm = null;
            string    cmdTxt = "eliminar_cbte_compras";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_id", ids.ToString());
                cmm.ExecuteNonQuery();


            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }

        }

        public void Baja_cbatepagos(string ids)
        {
            MySqlConnection cnn2 = new MySqlConnection();


            try
            { 
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                cmm = null;
                string cmdTxt = "eliminar_cbte_pago";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_id", ids.ToString());
                cmm.ExecuteNonQuery();


            }
            catch
            {
                throw;
            }
            finally
            {
                cnn2.Close();
            }

        }

        public void Modificacion(kx_cbtes v_obj)
        {
            try
            {
                string cmdTxt = "update kx_cbtes set CantReg='" + v_obj.CantReg + "' , CbteTipo='" + v_obj.CbteTipo + "' , PtoVta='" + v_obj.PtoVta + "' , Fecha='" + v_obj.Fecha + "' , usuario='" + v_obj.usuario + "' , Resultado='" + v_obj.Resultado + "' , Vendedor='" + v_obj.Vendedor + "' , Cliente='" + v_obj.Cliente + "' , aud='" + v_obj.aud + "' , Concepto='" + v_obj.Concepto + "' , DocTipo='" + v_obj.DocTipo + "' , DocNro='" + v_obj.DocNro + "' , CbteDesde='" + v_obj.CbteDesde + "' , CbteHasta='" + v_obj.CbteHasta + "' , CbteFch='" + v_obj.CbteFch + "' , ImpTotal='" + v_obj.ImpTotal + "' , ImpTotConc='" + v_obj.ImpTotConc + "' , ImpNeto='" + v_obj.ImpNeto + "' , ImpOpEx='" + v_obj.ImpOpEx + "' , ImpTrib='" + v_obj.ImpTrib + "' , ImpIVA='" + v_obj.ImpIVA + "' , MonId='" + v_obj.MonId + "' , MonCotiz='" + v_obj.MonCotiz + "' , CAE='" + v_obj.CAE + "' , CAEFchVto='" + v_obj.CAEFchVto + "' , Observaciones='" + v_obj.Observaciones + "' where id ='" + v_obj.Id + "'   ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                cnn.ExecuteNonQuery(cmm);

            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }

        }

        public List<kx_cbtes> Listar()
        {

            List<kx_cbtes> lista = new List<kx_cbtes>();
            try
            {



                string cmdTxt = " select Id,CantReg, CbteTipo, PtoVta, Fecha, usuario, Resultado, Vendedor, Cliente, aud, Concepto, DocTipo, DocNro, CbteDesde, CbteHasta, CbteFch, ImpTotal, ImpTotConc, ImpNeto, ImpOpEx, ImpTrib, ImpIVA, MonId, MonCotiz, CAE, CAEFchVto, Observaciones from kx_cbtes  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cbtes entidad = new kx_cbtes();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CantReg = DalModelo.VerifStringMysql(lector, "CantReg");
                    entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "CbteTipo");
                    entidad.PtoVta = DalModelo.VerifStringMysql(lector, "PtoVta");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.usuario = DalModelo.VerifStringMysql(lector, "usuario");
                    entidad.Resultado = DalModelo.VerifStringMysql(lector, "Resultado");
                    entidad.Vendedor = DalModelo.VerifStringMysql(lector, "Vendedor");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.aud = DalModelo.VerifStringMysql(lector, "aud");
                    entidad.Concepto = DalModelo.VerifStringMysql(lector, "Concepto");
                    entidad.DocTipo = DalModelo.VerifStringMysql(lector, "DocTipo");
                    entidad.DocNro = DalModelo.VerifStringMysql(lector, "DocNro");
                    entidad.CbteDesde = DalModelo.VerifStringMysql(lector, "CbteDesde");
                    entidad.CbteHasta = DalModelo.VerifStringMysql(lector, "CbteHasta");
                    entidad.CbteFch = DalModelo.VerifStringMysql(lector, "CbteFch");
                    entidad.ImpTotal = DalModelo.VerifStringMysql(lector, "ImpTotal");
                    entidad.ImpTotConc = DalModelo.VerifStringMysql(lector, "ImpTotConc");
                    entidad.ImpNeto = DalModelo.VerifStringMysql(lector, "ImpNeto");
                    entidad.ImpOpEx = DalModelo.VerifStringMysql(lector, "ImpOpEx");
                    entidad.ImpTrib = DalModelo.VerifStringMysql(lector, "ImpTrib");
                    entidad.ImpIVA = DalModelo.VerifStringMysql(lector, "ImpIVA");
                    entidad.MonId = DalModelo.VerifStringMysql(lector, "MonId");
                    entidad.MonCotiz = DalModelo.VerifStringMysql(lector, "MonCotiz");
                    entidad.CAE = DalModelo.VerifStringMysql(lector, "CAE");
                    entidad.CAEFchVto = DalModelo.VerifStringMysql(lector, "CAEFchVto");
                    entidad.Observaciones = DalModelo.VerifStringMysql(lector, "Observaciones");
                    lista.Add(entidad);

                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }


            return lista;
        }


        public void Eliminar(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from kx_cbtes  where Id='" + v_id + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                cnn.ExecuteNonQuery(cmm);
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }

        }

        public string[] saldoXmesCompras(string v_anio, string cfg)
        {

            try
            {

                string query = "select   saldoXmesCompras('1','" + v_anio + "','" + cfg + "') as enero, ";
                query += " saldoXmesCompras('2','" + v_anio + "','" + cfg + "') as Febrero,";
                query += "   saldoXmesCompras('3','" + v_anio + "','" + cfg + "') as Marzo,";
                query += "    saldoXmesCompras('4','" + v_anio + "','" + cfg + "') as Abril, ";
                query += "  saldoXmesCompras('5','" + v_anio + "','" + cfg + "') as Mayo, ";
                query += "   saldoXmesCompras('6','" + v_anio + "','" + cfg + "') as Junio, ";
                query += "    saldoXmesCompras('7','" + v_anio + "','" + cfg + "') as Julio, ";
                query += "   saldoXmesCompras('8','" + v_anio + "','" + cfg + "') as Agosto, ";
                query += "   saldoXmesCompras('9','" + v_anio + "','" + cfg + "') as Septiembre, ";
                query += "   saldoXmesCompras('10','" + v_anio + "','" + cfg + "') as Octubre, ";
                query += "    saldoXmesCompras('11','" + v_anio + "','" + cfg + "') as Noviembre, ";
                query += "   saldoXmesCompras('12','" + v_anio + "','" + cfg + "') as Diciembre";

                cmm = cnn.MySqlCrearNuevoComando(query);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                string[] arr4 = new string[12];
                while (lector.Read())
                {
                    arr4[0] = VerifStringMysql33(lector, "Enero");
                    arr4[1] = VerifStringMysql33(lector, "Febrero");
                    arr4[2] = VerifStringMysql33(lector, "Marzo");
                    arr4[3] = VerifStringMysql33(lector, "Abril");
                    arr4[4] = VerifStringMysql33(lector, "Mayo");
                    arr4[5] = VerifStringMysql33(lector, "Junio");
                    arr4[6] = VerifStringMysql33(lector, "Julio");
                    arr4[7] = VerifStringMysql33(lector, "Agosto");
                    arr4[8] = VerifStringMysql33(lector, "Septiembre");
                    arr4[9] = VerifStringMysql33(lector, "Octubre");
                    arr4[10] = VerifStringMysql33(lector, "Noviembre");
                    arr4[11] = VerifStringMysql33(lector, "Diciembre");
                }

                return arr4;


            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }
        }

        public string[] saldoXmes(string v_anio,  string cfg) {

            try
            {

                string query = "select   saldoXmes('1','" + v_anio + "','" + cfg + "') as enero, ";
                query += " saldoXmes('2','" + v_anio + "','" + cfg + "') as Febrero,";
                query += "   saldoXmes('3','" + v_anio + "','" + cfg + "') as Marzo,";
                query += "     saldoXmes('4','" + v_anio + "','" + cfg + "') as Abril, ";
                query += "   saldoXmes('5','" + v_anio + "','" + cfg + "') as Mayo, ";
                query += "    saldoXmes('6','" + v_anio + "','" + cfg + "') as Junio, ";
                query += "     saldoXmes('7','" + v_anio + "','" + cfg + "') as Julio, ";
                query += "   saldoXmes('8','" + v_anio + "','" + cfg + "') as Agosto, ";
                query += "    saldoXmes('9','" + v_anio + "','" + cfg + "') as Septiembre, ";
                query += "    saldoXmes('10','" + v_anio + "','" + cfg + "') as Octubre, ";
                query += "     saldoXmes('11','" + v_anio + "','" + cfg + "') as Noviembre, ";
                query += "    saldoXmes('12','" + v_anio + "','" + cfg + "') as Diciembre";

                cmm = cnn.MySqlCrearNuevoComando(query);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                string[] arr4 = new string[12];
                while (lector.Read())
                {
                    arr4[0] = VerifStringMysql33(lector, "Enero");
                    arr4[1] = VerifStringMysql33(lector, "Febrero");
                    arr4[2] = VerifStringMysql33(lector, "Marzo");
                    arr4[3] = VerifStringMysql33(lector, "Abril");
                    arr4[4] = VerifStringMysql33(lector, "Mayo");
                    arr4[5] = VerifStringMysql33(lector, "Junio");
                    arr4[6] = VerifStringMysql33(lector, "Julio");
                    arr4[7] = VerifStringMysql33(lector, "Agosto");
                    arr4[8] = VerifStringMysql33(lector, "Septiembre");
                    arr4[9] = VerifStringMysql33(lector, "Octubre");
                    arr4[10] = VerifStringMysql33(lector, "Noviembre");
                    arr4[11] = VerifStringMysql33(lector, "Diciembre");
                }

                return arr4;


            }
            catch (Exception)
            {

                throw;
            }
            finally {
                cnn.Close(cmm);
            }
        }

        public string[] saldoXmesVtas(string v_anio, string cfg)
        {

            try
            {

                string query = "select   saldoXmesVtas('1','" + v_anio + "','" + cfg + "') as enero, ";
                query += " saldoXmesVtas('2','" + v_anio + "','" + cfg + "') as Febrero,";
                query += "  saldoXmesVtas('3','" + v_anio + "','" + cfg + "') as Marzo,";
                query += "     saldoXmesVtas('4','" + v_anio + "','" + cfg + "') as Abril, ";
                query += "   saldoXmesVtas('5','" + v_anio + "','" + cfg + "') as Mayo, ";
                query += "    saldoXmesVtas('6','" + v_anio + "','" + cfg + "') as Junio, ";
                query += "     saldoXmesVtas('7','" + v_anio + "','" + cfg + "') as Julio, ";
                query += "   saldoXmesVtas('8','" + v_anio + "','" + cfg + "') as Agosto, ";
                query += "   saldoXmesVtas('9','" + v_anio + "','" + cfg + "') as Septiembre, ";
                query += "   saldoXmesVtas('10','" + v_anio + "','" + cfg + "') as Octubre, ";
                query += "    saldoXmesVtas('11','" + v_anio + "','" + cfg + "') as Noviembre, ";
                query += "   saldoXmesVtas('12','" + v_anio + "','" + cfg + "') as Diciembre";

                cmm = cnn.MySqlCrearNuevoComando(query);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                string[] arr4 = new string[12];
                while (lector.Read())
                {
                    arr4[0] = VerifStringMysql33(lector, "Enero");
                    arr4[1] = VerifStringMysql33(lector, "Febrero");
                    arr4[2] = VerifStringMysql33(lector, "Marzo");
                    arr4[3] = VerifStringMysql33(lector, "Abril");
                    arr4[4] = VerifStringMysql33(lector, "Mayo");
                    arr4[5] = VerifStringMysql33(lector, "Junio");
                    arr4[6] = VerifStringMysql33(lector, "Julio");
                    arr4[7] = VerifStringMysql33(lector, "Agosto");
                    arr4[8] = VerifStringMysql33(lector, "Septiembre");
                    arr4[9] = VerifStringMysql33(lector, "Octubre");
                    arr4[10] = VerifStringMysql33(lector, "Noviembre");
                    arr4[11] = VerifStringMysql33(lector, "Diciembre");
                }

                return arr4;


            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }
        }

        public static string VerifStringMysql33(MySqlDataReader lector, string s)
        {

            if (lector[s] == DBNull.Value)
            {

                return "0";
            }
            else
            {

                return Convert.ToString(lector[s]);

            }


        }

        public Int32 maxCbtePruebas(string tipocbte, string id_config)
        {
            Int32 id = 0;

            try
            {
                string cmdTxt = " select (ifnull( max(CAST(CbteHasta AS SIGNED )),0)+1 ) as cant from kx_cbtes  where CbteTipo ='" + tipocbte + "' and Id_config ='" + id_config + "' ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    id = DalModelo.VeriIntMysql(lector, "cant");
                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }

            return id;
        }

        public Int32 maxId()
        {
            Int32 id = 0;

            try
            {
                string cmdTxt = " select max(Id) as cant from kx_cbtes  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    id = DalModelo.VeriIntMysql(lector, "cant");
                }

                lector.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                cnn.Close(cmm);
            }

            return id;
        }


        public List<string> serv_artXmes(string v_mes, string v_anio, string v_id_cfg)
        {   MySqlConnection         cnn2 = null ;
            try
            {
                List<string> lista = new List<string>();
                cmm = null;
           cnn2 = cnn.MySqlCrearNuevaConexion();
           cnn2.Open();
                string cmdTxt = "wi271852_kardex.sp_serv_artXmes";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_mes", v_mes);
                cnn.AgregarParametroAComando(cmm, "v_anio", v_anio);
                cnn.AgregarParametroAComando(cmm, "v_id_cfg", v_id_cfg);

                MySqlParameter outSalser = cnn.AgregarParametroAComandoOut(cmm, "sal_serv");
                MySqlParameter outSalart = cnn.AgregarParametroAComandoOut(cmm, "sal_art");
                MySqlParameter outSaliibb = cnn.AgregarParametroAComandoOut(cmm, "sal_iibb");

                cmm.ExecuteNonQuery();
                lista.Add(outSalser.Value.ToString());
                lista.Add(outSalart.Value.ToString());
                lista.Add(outSaliibb.Value.ToString());  

                cmm.ExecuteNonQuery();

                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally {
                cnn2.Close();
            
            }
    
    }
        public List<string> serv_artXmesCompras(string v_mes, string v_anio, string v_id_cfg)
        {
            MySqlConnection cnn2 = null;
            try
            {
                List<string> lista = new List<string>();
                cmm = null;
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "sp_serv_artXmesCompras";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_mes", v_mes);
                cnn.AgregarParametroAComando(cmm, "v_anio", v_anio);
                cnn.AgregarParametroAComando(cmm, "v_id_cfg", v_id_cfg);

                MySqlParameter outSalser = cnn.AgregarParametroAComandoOut(cmm, "sal_serv");
                MySqlParameter outSalart = cnn.AgregarParametroAComandoOut(cmm, "sal_art");
                MySqlParameter outSaliibb = cnn.AgregarParametroAComandoOut(cmm, "sal_iibb");

                cmm.ExecuteNonQuery();
                lista.Add(outSalser.Value.ToString());
                lista.Add(outSalart.Value.ToString());
                lista.Add(outSaliibb.Value.ToString());

                cmm.ExecuteNonQuery();

                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                cnn2.Close();

            }

        }

        public List<string> serv_artXmesVtas(string v_mes, string v_anio, string v_id_cfg)
        {
            MySqlConnection cnn2 = null;
            try
            {
                List<string> lista = new List<string>();
                cmm = null;
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "wi271852_kardex.sp_serv_artXmesVtas";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_mes", v_mes);
                cnn.AgregarParametroAComando(cmm, "v_anio", v_anio);
                cnn.AgregarParametroAComando(cmm, "v_id_cfg", v_id_cfg);

                MySqlParameter outSalser = cnn.AgregarParametroAComandoOut(cmm, "sal_serv");
                MySqlParameter outSalart = cnn.AgregarParametroAComandoOut(cmm, "sal_art");
                MySqlParameter outSaliibb = cnn.AgregarParametroAComandoOut(cmm, "sal_iibb");

                cmm.ExecuteNonQuery();
                lista.Add(outSalser.Value.ToString());
                lista.Add(outSalart.Value.ToString());
                lista.Add(outSaliibb.Value.ToString());

                cmm.ExecuteNonQuery();

                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                cnn2.Close();

            }

        }

    }

}
