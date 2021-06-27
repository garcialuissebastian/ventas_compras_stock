using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Be;
using MySql.Data.MySqlClient;
namespace Dal
{

    public class Dalsueldo
    {
        MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");

        MySqlCommand cmm;

        public void Alta_sueldo(sueldo v_obj)

        {
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = " insert into sueldo (Empleador, Dominicilio, Cuit, Beneficiario, Clasificacion, Periodo_mes, Periodo_anio, Importe_letra, Lugar, Fecha, Total_haberes, Importe_liquido, Importe_cobrar, Aud,FechaIng,Tarea,Fecha_cobro,Banco_cobro,Jornal) values ('" + v_obj.Empleador.ToUpper() + "', '" + v_obj.Dominicilio.ToUpper() + "', '" + v_obj.Cuit.ToUpper() + "', '" + v_obj.Beneficiario.ToUpper() + "', '" + v_obj.Clasificacion.ToUpper() + "', '" + v_obj.Periodo_mes.ToUpper() + "', '" + v_obj.Periodo_anio.ToUpper() + "', '" + v_obj.Importe_letra.ToUpper() + "', '" + v_obj.Lugar.ToUpper() + "', '" + v_obj.Fecha.ToUpper() + "', '" + v_obj.Total_haberes.ToUpper() + "', '" + v_obj.Importe_liquido.ToUpper() + "', '" + v_obj.Importe_cobrar.ToUpper() + "', NOW(), '" + v_obj.FechaIng.ToUpper() + "', '" + v_obj.Tarea.ToUpper() + "', '" + v_obj.Banco_cobro.ToUpper() + "', '" + v_obj.Fecha_cobro.ToUpper() + "', '" + v_obj.Jornal.ToUpper() + "')  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                cmm.ExecuteNonQuery();

                cmm = null;
                 
                 cmdTxt = " select max(Id) cant from sueldo   ";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataReader lector = cmm.ExecuteReader();
                string idmax = "0";
                while (lector.Read())
                {

                    idmax  = ( DalModelo.VeriIntMysql(lector, "cant")  ).ToString();

                }
                lector.Close();

                    foreach (var item2 in v_obj.Haber)
                {
                    cmm = null;
                     cmdTxt = " insert into sueldo_concep_items (Id_sueldo, Id_concepto,Importe, Nombre_concepto,Tipo) values ('" + idmax + "', '" +item2.Id.ToUpper() + "', '" + item2.Importe + "', '" + item2.Nombre.ToUpper() + "','HABERES')  ";

                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                    cmm.ExecuteNonQuery();

                }

                foreach (var item2 in v_obj.Deducion)
                {
                    cmm = null;
                    cmdTxt = " insert into sueldo_concep_items (Id_sueldo, Id_concepto,Importe, Nombre_concepto,Tipo) values ('" + idmax + "', '" + item2.Id.ToUpper() + "', '" + item2.Importe + "', '" + item2.Nombre.ToUpper() + "','DEDUCION')  ";

                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                    cmm.ExecuteNonQuery();

                }








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


        public void Modificacion_sueldo(sueldo v_obj)

        {
            try
            {
                string cmdTxt = "update sueldo set Empleador='" + v_obj.Empleador.ToUpper() + "' , Dominicilio='" + v_obj.Dominicilio.ToUpper() + "' , Cuit='" + v_obj.Cuit.ToUpper() + "' , Beneficiario='" + v_obj.Beneficiario.ToUpper() + "' , Clasificacion='" + v_obj.Clasificacion.ToUpper() + "' , Periodo_mes='" + v_obj.Periodo_mes.ToUpper() + "' , Periodo_anio='" + v_obj.Periodo_anio.ToUpper() + "' , Importe_letra='" + v_obj.Importe_letra.ToUpper() + "' , Lugar='" + v_obj.Lugar.ToUpper() + "' , Fecha='" + v_obj.Fecha.ToUpper() + "' , Total_haberes='" + v_obj.Total_haberes.ToUpper() + "' , Importe_liquido='" + v_obj.Importe_liquido.ToUpper() + "' , Importe_cobrar='" + v_obj.Importe_cobrar.ToUpper() + "' , Aud='" + v_obj.Aud.ToUpper() + "' where id ='" + v_obj.Id + "'   ";

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


        public DataSet ReportSueldo(string ids)
        {
            MySqlConnection cnn2 = new MySqlConnection();
            DataSet ds = new DataSet();
            try
            {
                 

                string cmdTxt = " select Id, Empleador, Dominicilio, Cuit, Beneficiario, Clasificacion, Periodo_mes, Periodo_anio,CONCAT( Importe_letra,'.-') Importe_letra, Lugar, Fecha, Total_haberes, Importe_liquido, Importe_cobrar, Aud,FechaIng,Tarea,Fecha_cobro,Banco_cobro,Jornal from sueldo  where Id='" + ids + "'";

                 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                ds.Tables.Add(cnn.ExecuteDataTable(cmm, "Sueldo"));
                cmm = null;
                cmdTxt = "delete from sueldo_items ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                cnn.ExecuteNonQuery(cmm);
                cmm = null; 

                cmdTxt = " insert into sueldo_items (Nombre_concepto,Deduciones,Haberes) select ll.* from  (select Nombre_concepto,null Deduciones,Importe Haberes from sueldo_concep_items    where Tipo='HABERES'  and  Id_sueldo='" + ids + "'";
                cmdTxt += "  union all select Nombre_concepto, Importe Deduciones,null Haberes from sueldo_concep_items where Tipo = 'DEDUCION'  and Id_sueldo = '" + ids + "')  ll";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                cnn.ExecuteNonQuery(cmm);
             
                cmm = null;
                cmdTxt = " select Nombre_concepto,Deduciones,Haberes from sueldo_items";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);
                ds.Tables.Add(cnn.ExecuteDataTable(cmm, "Items"));

                return ds;
            }
            catch (Exception)
            {

                throw;
            }finally
            {
                cnn2.Clone();
            }



        }


        public List<sueldo> Listar_sueldo(string v_tipo, string v_valor)

        {

            List<sueldo> lista = new List<sueldo>();
            try
            {



                string cmdTxt = " select Id,Empleador, Dominicilio, Cuit, Beneficiario, Clasificacion, Periodo_mes, Periodo_anio, Importe_letra, Lugar, Fecha, Total_haberes, Importe_liquido, Importe_cobrar, Aud from sueldo  ";

                if (v_tipo == "99")
                {
                    cmdTxt = " select Id,Empleador, Dominicilio, Cuit, Beneficiario, Clasificacion, Periodo_mes, Periodo_anio, Importe_letra, Lugar, Fecha, Total_haberes, Importe_liquido, Importe_cobrar, Aud from sueldo  where   Id='" + v_valor + "' ";
                }
                if (v_tipo == "0")
                {
                    cmdTxt = " select Id,Empleador, Dominicilio, Cuit, Beneficiario, Clasificacion, Periodo_mes, Periodo_anio, Importe_letra, Lugar, Fecha, Total_haberes, Importe_liquido, Importe_cobrar, Aud from sueldo where   Beneficiario like '%" + v_valor + "%' ";
                }
                if (string.IsNullOrEmpty(v_valor))
                {
                    cmdTxt = " select Id,Empleador, Dominicilio, Cuit, Beneficiario, Clasificacion, Periodo_mes, Periodo_anio, Importe_letra, Lugar, Fecha, Total_haberes, Importe_liquido, Importe_cobrar, Aud from sueldo  ";
                }
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt + " order by  Periodo_anio, Periodo_mes desc limit 200 ");

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    sueldo entidad = new sueldo();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Empleador = DalModelo.VerifStringMysql(lector, "Empleador");
                    entidad.Dominicilio = DalModelo.VerifStringMysql(lector, "Dominicilio");
                    entidad.Cuit = DalModelo.VerifStringMysql(lector, "Cuit");
                    entidad.Beneficiario = DalModelo.VerifStringMysql(lector, "Beneficiario");
                    entidad.Clasificacion = DalModelo.VerifStringMysql(lector, "Clasificacion");
                    entidad.Periodo_mes = DalModelo.VerifStringMysql(lector, "Periodo_mes");
                    entidad.Periodo_anio = DalModelo.VerifStringMysql(lector, "Periodo_anio");
                    entidad.Importe_letra = DalModelo.VerifStringMysql(lector, "Importe_letra");
                    entidad.Lugar = DalModelo.VerifStringMysql(lector, "Lugar");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Total_haberes = DalModelo.VerifStringMysql(lector, "Total_haberes");
                    entidad.Importe_liquido = DalModelo.VerifStringMysql(lector, "Importe_liquido");
                    entidad.Importe_cobrar = DalModelo.VerifStringMysql(lector, "Importe_cobrar");
                     
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

        public List<sueldo> Listar_Benificiario(  string v_valor)

        {

            List<sueldo> lista = new List<sueldo>();
            try
            { 
                string cmdTxt = " select Id,Empleador, Tarea,FechaIng, Dominicilio, Cuit, Beneficiario, Clasificacion, Periodo_mes, Periodo_anio, Importe_letra, Lugar, Fecha, Total_haberes, Importe_liquido, Importe_cobrar, Aud from sueldo where Id = (select max(Id) from sueldo where Beneficiario= '" + v_valor + "' )  ";
 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    sueldo entidad = new sueldo();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Empleador = DalModelo.VerifStringMysql(lector, "Empleador");
                    entidad.Dominicilio = DalModelo.VerifStringMysql(lector, "Dominicilio");
                    entidad.Cuit = DalModelo.VerifStringMysql(lector, "Cuit");
                    entidad.Beneficiario = DalModelo.VerifStringMysql(lector, "Beneficiario");
                    entidad.Clasificacion = DalModelo.VerifStringMysql(lector, "Clasificacion");
                    entidad.Periodo_mes = DalModelo.VerifStringMysql(lector, "Periodo_mes");
                    entidad.Periodo_anio = DalModelo.VerifStringMysql(lector, "Periodo_anio");
                    entidad.Importe_letra = DalModelo.VerifStringMysql(lector, "Importe_letra");
                    entidad.Lugar = DalModelo.VerifStringMysql(lector, "Lugar");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.Total_haberes = DalModelo.VerifStringMysql(lector, "Total_haberes");
                    entidad.Importe_liquido = DalModelo.VerifStringMysql(lector, "Importe_liquido");
                    entidad.Importe_cobrar = DalModelo.VerifStringMysql(lector, "Importe_cobrar");
                    entidad.FechaIng = DalModelo.VerifStringMysql(lector, "FechaIng");
                    entidad.Tarea= DalModelo.VerifStringMysql(lector, "Tarea");
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


        public void Eliminar_sueldo(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from sueldo  where Id='" + v_id + "'";

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

        public Int32 maxId_sueldo()

        {
            Int32 id = 0;

            try
            {
                string cmdTxt = " select max(Id) as cant from sueldo  ";

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







        public void Alta_sueldo_conceptos(sueldo_conceptos v_obj)

        {
            try
            {
                string cmdTxt = " insert into sueldo_conceptos (Nombre, Tipo) values ('" + v_obj.Nombre.ToUpper() + "', '" + v_obj.Tipo.ToUpper() + "')  ";

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



        public List<sueldo_conceptos> Listar_sueldo_conceptos(string v_tipo, string v_valor)

        {

            List<sueldo_conceptos> lista = new List<sueldo_conceptos>();
            try
            {



                string cmdTxt = "    ";

                if (v_tipo == "99")
                {
                    cmdTxt = " select Id,Nombre, Tipo  from sueldo_conceptos  where  Estado = 1 and Tipo='" + v_valor + "' ORDER BY Nombre ";
                }
              
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    sueldo_conceptos entidad = new sueldo_conceptos();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
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


        public void Eliminar_sueldo_conceptos(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from sueldo_conceptos  where Id='" + v_id + "'";

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
