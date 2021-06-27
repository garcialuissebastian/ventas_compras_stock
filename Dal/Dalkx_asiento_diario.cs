using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using Be;
using MySql.Data.MySqlClient;
namespace Dal
{

    public class Dalkx_asiento_diario
    {
        MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");

        MySqlCommand cmm;

        public void Alta_kx_asiento_diario(kx_asiento_diario v_obj)
  {
            MySqlConnection cnn2 = new MySqlConnection();
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = "";


                if (v_obj.ITEMS !=null) {
                    foreach (var item in v_obj.ITEMS)
                    {
                        cmm = null;
                         cmdTxt = " insert into kx_asiento_diario (Nro, Fecha, Codigo, Id_cta, Anio, mes, Documento_concepto, Debe, Haber, Config) " +
                            "values (getMaxSientoNro('" + v_obj.Config.ToUpper() + "') , '" +  v_obj.Fecha.ToUpper() + "', '" + item.Codigo.ToUpper() + "', '" + item.Id_cta.ToUpper() + "', '" + v_obj.Anio.ToUpper() + "', '" + v_obj.mes.ToUpper() + "', '" + v_obj.Documento_concepto.ToUpper() + "', '" + item.Debe.ToUpper() + "', '" + item.Haber.ToUpper() + "', '" + v_obj.Config.ToUpper() + "')  ";
                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
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
        public List<kx_asiento_diario> Buscar_kx_asiento_items(string v_nro)
        {

            List<kx_asiento_diario> lista = new List<kx_asiento_diario>();
            try
            { 
                string cmdTxt = " select Id,Nro,DATE_FORMAT(Fecha, '%d/%m/%Y')  Fecha, Codigo,getCtaNombre( Id_cta,Config)  Id_cta_nombre,    Id_cta, Anio, mes, Documento_concepto,   Debe Debe ,  Haber Haber, Config, Id_Cbte,Tipo, getOrganizacionNombre( Organizacion,Organizacion_tipo) Org_nombre,Organizacion ,Organizacion_tipo from kx_asiento_diario where Nro='"+ v_nro + "'  ";
 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_asiento_diario item = new kx_asiento_diario(); 

                    kx_asiento_diario entidad = new kx_asiento_diario();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Nro = DalModelo.VerifStringMysql(lector, "Nro");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Codigo = DalModelo.VerifStringMysql(lector, "Id_cta_nombre");
                   
                    entidad.Id_cta = DalModelo.VerifStringMysql(lector, "Id_cta");
                    entidad.Anio = DalModelo.VerifStringMysql(lector, "Anio");
                    entidad.mes = DalModelo.VerifStringMysql(lector, "mes");
                    entidad.Documento_concepto = DalModelo.VerifStringMysql(lector, "Documento_concepto");
                    entidad.Debe = DalModelo.VerifStringMysql(lector, "Debe");
                    entidad.Haber = DalModelo.VerifStringMysql(lector, "Haber");
                   
                    entidad.Id_Cbte = DalModelo.VerifStringMysql(lector, "Organizacion");
                    
                        entidad.CbteTipo = DalModelo.VerifStringMysql(lector, "Tipo");
                    entidad.Cbte = DalModelo.VerifStringMysql(lector, "Id_Cbte");
                    entidad.Tipo = DalModelo.VerifStringMysql(lector, "Organizacion_tipo");
                    entidad.Config = DalModelo.VerifStringMysql(lector, "Org_nombre");

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
        public List<kx_asiento_diario> Buscar_Balance(string v_conf,string v_val,string v_val1)
        {
            MySqlConnection cnn2 = new MySqlConnection();
          
            List<kx_asiento_diario> lista = new List<kx_asiento_diario>();
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "sp_temp_balance_general";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_conf", v_conf);
                cnn.AgregarParametroAComando(cmm, "v_valor", v_val);
                cnn.AgregarParametroAComando(cmm, "v_valor1", v_val1); 

                MySqlDataReader lector =cmm.ExecuteReader();

                while (lector.Read())
                {

                    kx_asiento_diario item = new kx_asiento_diario();

                    kx_asiento_diario entidad = new kx_asiento_diario();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id_cta"); 
                    entidad.Codigo = DalModelo.VerifStringMysql(lector, "Cuenta"); 
                    entidad.Debe = DalModelo.VerifStringMysql(lector, "Debe");
                    entidad.Haber = DalModelo.VerifStringMysql(lector, "Haber"); 
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
                cnn2.Close();
            }


            return lista;
        }

        public void Alta_kx_asiento_manual(kx_asiento_diario v_obj)
        {
            MySqlConnection cnn2 = new MySqlConnection();
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = "";


                cmm = null;
                cmdTxt = " select  getMaxSientoNro('" + v_obj.Config.ToUpper() + "')  cant ";
                 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector = cmm.ExecuteReader();
                Int32 asiento = 0;
                while (lector.Read())
                {
                    asiento = DalModelo.VeriIntMysql(lector, "cant"); 
                }

                lector.Close(); 
                v_obj.Nro = (asiento ).ToString();
                int ini = 0;

                if (v_obj.ITEMS != null)
                {
                    foreach (var item in v_obj.ITEMS)
                    {
                        if (ini != 0)
                        {
                           // v_obj.Nro = "";
                            v_obj.Documento_concepto = "";
                        }
                        cmm = null;
                        cmdTxt = " insert into kx_asiento_diario (Nro, Fecha, Codigo, Id_cta, Anio, mes, Documento_concepto, Debe, Haber, Config, Tipo,Organizacion_tipo,Organizacion,Id_Cbte) " +
                           "values ( '" + v_obj.Nro + "' , STR_TO_DATE( '" + v_obj.Fecha + "','%Y-%m-%d') , '', '" + item.Id_cta.ToUpper() + "',year ( STR_TO_DATE( '" + v_obj.Fecha + "','%Y-%m-%d') ) ,Month ( STR_TO_DATE( '" + v_obj.Fecha + "','%Y-%m-%d') ) , '" + v_obj.Documento_concepto.ToUpper() + "', '" + item.Debe.ToUpper() + "', '" + item.Haber.ToUpper() + "', '" + v_obj.Config.ToUpper() + "','MANUAL','" + item.Tipo + "','" + item.Id_Cbte + "','" + v_obj.Nro + "')  "; //tipo 0 es provedore y 1 cliente
                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                        ini++;

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

        public void Modificacion_kx_asiento_diario(kx_asiento_diario v_obj)

        {
            MySqlConnection cnn2 = new MySqlConnection();
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = "";

                cmm = null;
                cmdTxt = " delete from  kx_asiento_diario where Nro='" + v_obj.Nro + "' and Config= '" + v_obj.Config.ToUpper() + "'  ";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                cmm.ExecuteNonQuery();

                int ini = 0;
                Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
                var numberFormatInfo = new NumberFormatInfo();
                numberFormatInfo.NumberDecimalSeparator = ".";

                if (v_obj.ITEMS != null)
                {
                    foreach (var item in v_obj.ITEMS)
                    {
                        if (ini != 0)
                        {
                           // v_obj.Nro = "";
                            v_obj.Documento_concepto = "";
                        }
                        cmm = null;
                        cmdTxt = " insert into kx_asiento_diario (Nro, Fecha, Codigo, Id_cta, Anio, mes, Documento_concepto, Debe, Haber, Config, Tipo,Organizacion_tipo,Organizacion,Id_Cbte,Modificado) " +
                           "values ( '" + v_obj.Nro + "' , STR_TO_DATE( '" + v_obj.Fecha + "','%Y-%m-%d') , '', '" + item.Id_cta.ToUpper() + "',year ( STR_TO_DATE( '" + v_obj.Fecha + "','%Y-%m-%d') ) ,Month ( STR_TO_DATE( '" + v_obj.Fecha + "','%Y-%m-%d') ) , '" + v_obj.Documento_concepto.ToUpper() + "', '" +   Math.Round(Double.Parse(item.Debe.Replace(",", "."), numberFormatInfo), 2) + "', '" + Math.Round(Double.Parse(item.Haber.Replace(",", "."), numberFormatInfo), 2) + "', '" + v_obj.Config.ToUpper() + "','" + v_obj.Tipo + "','" + item.Tipo + "','" + item.Id_Cbte + "','" + v_obj.Id_Cbte + "', Now())  "; //tipo 0 es provedore y 1 cliente
                        cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                        cmm.ExecuteNonQuery();
                        ini++;

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
        public List<kx_asiento_diario> Listar_kx_asiento_diario(string v_tipo, string v_valor, string v_valor1, string v_config) 
        {

            List<kx_asiento_diario> lista = new List<kx_asiento_diario>();
            try
            {



                string cmdTxt = " select Id,Nro,DATE_FORMAT(Fecha, '%d/%m/%Y')  Fecha, getCtaCodigo( Id_cta,Config) Codigo, getCtaNombre( Id_cta,Config)  Id_cta, Anio, mes, Documento_concepto, FormaPrecio(  Debe) Debe ,FormaPrecio( Haber) Haber, Config, Id_Cbte,Tipo from kx_asiento_diario  ";
 
                if (v_tipo == "0")
                {
                    cmdTxt += "  where  Fecha between STR_TO_DATE( '" + v_valor + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' )  and Config='" + v_config+ "'    order by  Id,year(Fecha),Month(Fecha), day(Fecha)  , Documento_concepto     ";
                       
                }
              
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_asiento_diario entidad = new kx_asiento_diario();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Nro = DalModelo.VerifStringMysql(lector, "Nro");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Codigo = DalModelo.VerifStringMysql(lector, "Codigo");
                    entidad.Id_cta = DalModelo.VerifStringMysql(lector, "Id_cta");
                    entidad.Anio = DalModelo.VerifStringMysql(lector, "Anio");
                    entidad.mes = DalModelo.VerifStringMysql(lector, "mes");
                    entidad.Documento_concepto = DalModelo.VerifStringMysql(lector, "Documento_concepto");
                    entidad.Debe = DalModelo.VerifStringMysql(lector, "Debe");
                    entidad.Haber = DalModelo.VerifStringMysql(lector, "Haber");
                    entidad.Config = DalModelo.VerifStringMysql(lector, "Config");
                    entidad.Id_Cbte = DalModelo.VerifStringMysql(lector, "Id_Cbte");
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

        public List<kx_CtaCte> Listar_kx_ctacte_vtas(string v_tipo, string v_valor, string v_valor1, string v_config)
        {
            MySqlConnection cnn2 = null;
            List<kx_CtaCte> lista = new List<kx_CtaCte>();
            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = "sp_CtaCteCliente";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_fecha1", v_valor);
                cnn.AgregarParametroAComando(cmm, "v_fecha2", v_valor1);
                cnn.AgregarParametroAComando(cmm, "v_config", v_config);
                cnn.AgregarParametroAComando(cmm, "v_tipo", v_tipo);
                MySqlDataReader lector =cmm.ExecuteReader();

                while (lector.Read())
                {

                    kx_CtaCte entidad = new kx_CtaCte();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Documento = DalModelo.VerifStringMysql(lector, "Documento");
                    entidad.Fecha= DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Haber = DalModelo.VerifStringMysql(lector, "Haber");
                    entidad.Persona = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");
                    entidad.Debe = DalModelo.VerifStringMysql(lector, "Debe");
                    entidad.id_cbte = DalModelo.VerifStringMysql(lector, "id_cbte");
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
        public List<kx_CtaCte> Listar_kx_ctacte_compras(string v_tipo, string v_valor, string v_valor1, string v_config)
        {
            MySqlConnection cnn2 = null;
            List<kx_CtaCte> lista = new List<kx_CtaCte>();
            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = "sp_CtaCteProveedor";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_fecha1", v_valor);
                cnn.AgregarParametroAComando(cmm, "v_fecha2", v_valor1);
                cnn.AgregarParametroAComando(cmm, "v_config", v_config);
                cnn.AgregarParametroAComando(cmm, "v_tipo", v_tipo);
                MySqlDataReader lector = cmm.ExecuteReader();

                while (lector.Read())
                {

                    kx_CtaCte entidad = new kx_CtaCte();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Documento = DalModelo.VerifStringMysql(lector, "Documento");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Haber = DalModelo.VerifStringMysql(lector, "Haber");
                    entidad.Persona = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.Saldo = DalModelo.VerifStringMysql(lector, "Saldo");
                    entidad.Debe = DalModelo.VerifStringMysql(lector, "Debe");
                    entidad.id_cbte = DalModelo.VerifStringMysql(lector, "id_cbte");
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

        public Boolean Existe_ctacte_compras(string v_pto, string v_cbte, string v_tipo, string v_config, string v_prov)
        {
            MySqlConnection cnn2 = null;
            List<kx_CtaCte> lista = new List<kx_CtaCte>();
            int sal = 0;
            try
            { 
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = "select count(*) cant  from kx_compras_cbtes where PtoVta=CAST( '" + v_pto + "' AS SIGNED)    and   CAST( CbteDesde  AS SIGNED)=  CAST( '" + v_cbte+ "' AS SIGNED)   and CbteTipo='" + v_tipo+ "'  and Id_config='" + v_config + "'  and Proveedor='" + v_prov + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                
                MySqlDataReader lector = cmm.ExecuteReader();
              
                while (lector.Read())
                {

                    kx_CtaCte entidad = new kx_CtaCte();
                    sal = DalModelo.VeriIntMysql(lector, "cant");
                   
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
                cnn.Close(cmm);
            }
             
            return sal>0;
        }
        public void Eliminar_kx_asiento_diario(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from kx_asiento_diario  where Id='" + v_id + "'";

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


        public void Eliminar_kx_asiento_Nro(Int32 v_nro)
        {
            try
            {
                string cmdTxt = "delete from kx_asiento_diario  where Nro='" + v_nro + "'";

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

        public Int32 maxId_kx_asiento_diario()

        {
            Int32 id = 0;

            try
            {
                string cmdTxt = " select max(Id) as cant from kx_asiento_diario  ";

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



        // manual

        public void Alta_kx_asiento_diario_Manual(kx_asiento_diario v_obj)

        {
            try
            {
                string cmdTxt = " insert into kx_asiento_diario (Nro, Fecha, Codigo, Id_cta, Anio, mes, Documento_concepto, Debe, Haber, Config, Id_Cbte, Tipo) values ('" + v_obj.Nro.ToUpper() + "', '" + v_obj.Fecha.ToUpper() + "', '" + v_obj.Codigo.ToUpper() + "', '" + v_obj.Id_cta.ToUpper() + "', '" + v_obj.Anio.ToUpper() + "', '" + v_obj.mes.ToUpper() + "', '" + v_obj.Documento_concepto.ToUpper() + "', '" + v_obj.Debe.ToUpper() + "', '" + v_obj.Haber.ToUpper() + "', '" + v_obj.Config.ToUpper() + "', '" + v_obj.Id_Cbte.ToUpper() + "', 'MANUAL')  ";

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


        public void Modificacion_kx_asiento_diario_Manual(kx_asiento_diario v_obj)

        {
            try
            {
                string cmdTxt = "update kx_asiento_diario set Nro='" + v_obj.Nro.ToUpper() + "' , Fecha='" + v_obj.Fecha.ToUpper() + "' , Codigo='" + v_obj.Codigo.ToUpper() + "' , Id_cta='" + v_obj.Id_cta.ToUpper() + "' , Anio='" + v_obj.Anio.ToUpper() + "' , mes='" + v_obj.mes.ToUpper() + "' , Documento_concepto='" + v_obj.Documento_concepto.ToUpper() + "' , Debe='" + v_obj.Debe.ToUpper() + "' , Haber='" + v_obj.Haber.ToUpper() + "' , Config='" + v_obj.Config.ToUpper() + "' , Id_Cbte='" + v_obj.Id_Cbte.ToUpper() + "'  where id ='" + v_obj.Id + "'   ";

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
        public List<kx_asiento_diario> Listar_kx_asiento_diario_Manual(string v_tipo, string v_valor, string v_valor1, string v_conf)

        { 
            List<kx_asiento_diario> lista = new List<kx_asiento_diario>();
            try
            {
                string cmdTxt = " select Id,Nro,DATE_FORMAT(Fecha, '%d/%m/%Y')  Fecha,  getCtaCodigo( Id_cta,Config)   Codigo, getCtaNombre( Id_cta,Config)  Id_cta, Anio, mes, Documento_concepto, FormaPrecio(  Debe) Debe ,FormaPrecio( Haber) Haber, Config, Id_Cbte,Tipo from kx_asiento_diario  ";
                cmdTxt += "  where  Fecha between STR_TO_DATE( '" + v_valor + "', '%d/%m/%Y' ) AND STR_TO_DATE( '" + v_valor1 + "', '%d/%m/%Y' )  and Config='" + v_conf + "' and Tipo='MANUAL' order by Nro,Id  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_asiento_diario entidad = new kx_asiento_diario();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Nro = DalModelo.VerifStringMysql(lector, "Nro");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Codigo = DalModelo.VerifStringMysql(lector, "Codigo");
                    entidad.Id_cta = DalModelo.VerifStringMysql(lector, "Id_cta");
                    entidad.Anio = DalModelo.VerifStringMysql(lector, "Anio");
                    entidad.mes = DalModelo.VerifStringMysql(lector, "mes");
                    entidad.Documento_concepto = DalModelo.VerifStringMysql(lector, "Documento_concepto");
                    entidad.Debe = DalModelo.VerifStringMysql(lector, "Debe");
                    entidad.Haber = DalModelo.VerifStringMysql(lector, "Haber");
                    entidad.Config = DalModelo.VerifStringMysql(lector, "Config");
                    entidad.Id_Cbte = DalModelo.VerifStringMysql(lector, "Id_Cbte");
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


        public void Eliminar_kx_asiento_diario_Manual(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from kx_asiento_diario  where Id='" + v_id + "'";

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

    }

}
