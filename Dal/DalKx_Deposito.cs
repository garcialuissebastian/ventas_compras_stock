﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Be;
using MySql.Data.MySqlClient;
namespace Dal
{
    public class DalKx_Deposito
    {

        private MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");


        MySqlCommand cmm;
        public List<Kx_Deposito> ListarSub(string id_sub)
        {

            List<Kx_Deposito> lista = new List<Kx_Deposito>();
            try
            {



                string cmdTxt = " select Id,Nombre, Id_Marca, Anulado,Descripcion from Kx_Deposito where Id_Marca ='" + id_sub + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

               MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    Kx_Deposito entidad = new Kx_Deposito();
                    entidad.Id = Dal.DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Nombre = Dal.DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.Anulado = Dal.DalModelo.VerifStringMysql(lector, "Anulado");
                    entidad.Descripcion = Dal.DalModelo.VerifStringMysql(lector, "Descripcion");
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

        public void Alta(Kx_Deposito v_obj)
        {
            try
            {
                string cmdTxt = " insert into Kx_Deposito (Nombre,Descripcion, Anulado, Id_Usuario) values ('" + v_obj.Nombre + "', '" + v_obj.Descripcion + "', '" + v_obj.Anulado + "' , '" + v_obj.Id_Usuario + "')  ";

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


        public void Modificacion(Kx_Deposito v_obj)
        {
            try
            {
                string cmdTxt = "update Kx_Deposito set Nombre='" + v_obj.Nombre + "' , Descripcion='" + v_obj.Descripcion + "'  , Anulado='" + v_obj.Anulado + "' where id ='" + v_obj.Id + "'   ";

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

        public List<Kx_Deposito> ListarFarmaciaDestino(   string v_config, string v_user)
        {

            List<Kx_Deposito> lista = new List<Kx_Deposito>();
            try
            {
                string cmdTxt = "  ";
               
                    cmdTxt = "select Id,Nombre, Anulado, Descripcion from Kx_Deposito where   Anulado= 'NO' and id_usuario ='" + v_config + "'  and Id not in ( select  id_dep from kx_deposito_usuario kd where      kd.id_usuario ='" + v_user + "' )  order by Nombre ";
                 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    Kx_Deposito entidad = new Kx_Deposito();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.Anulado = DalModelo.VerifStringMysql(lector, "Anulado");
                    entidad.Descripcion = DalModelo.VerifStringMysql(lector, "Descripcion");
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

        public List<Kx_Deposito> Listar(string v_tipo, string v_valor, string v_user)
        {

            List<Kx_Deposito> lista = new List<Kx_Deposito>();
            try
            {
                string cmdTxt = " select Id,Nombre, Anulado, Descripcion from Kx_Deposito where Id_Usuario ='" + v_user + "' and Anulado= 'NO' ";
                if (v_tipo == "0")
                {
                    cmdTxt = " select Id,Nombre, Anulado, Descripcion from Kx_Deposito where Nombre like '" + v_valor + "%'  AND   Id_Usuario ='" + v_user + "' and Anulado= 'NO' ";

                }

                 if (v_tipo == "89")
                {
                    cmdTxt = "select Id,Nombre, Anulado, Descripcion from Kx_Deposito where   Anulado= 'NO' and Id in ( select  id_dep from kx_deposito_usuario kd where      kd.id_usuario ='" + v_user + "' )  ";

                }


                if (v_tipo == "88") 
                {
                    cmdTxt = "select Id,Nombre, Anulado, Descripcion from Kx_Deposito where   Anulado= 'NO' and (Id in ( select  id_dep from kx_deposito_usuario kd where      kd.id_usuario ='" + v_user + "' )  or  ('10'= ( select  id_dep from kx_deposito_usuario kd where      kd.id_usuario ='" + v_user + "') and Id > 9 )) order by Id,Nombre  ";

                }

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    Kx_Deposito entidad = new Kx_Deposito();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.Anulado = DalModelo.VerifStringMysql(lector, "Anulado");
                    entidad.Descripcion = DalModelo.VerifStringMysql(lector, "Descripcion");
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


        public List<Kx_Deposito> Listar()
        {

            List<Kx_Deposito> lista = new List<Kx_Deposito>();
            try
            {



                string cmdTxt = " select Id,Nombre, Descripcion, Anulado from Kx_Deposito  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    Kx_Deposito entidad = new Kx_Deposito();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.Descripcion = DalModelo.VerifStringMysql(lector, " Descripcion");
                    entidad.Anulado = DalModelo.VerifStringMysql(lector, "Anulado");
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
                string cmdTxt = "delete from Kx_Deposito  where Id='" + v_id + "'";

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

        public Int32 maxId()
        {
            Int32 id = 0;

            try
            {
                string cmdTxt = " select max(Id) as cant from Kx_Deposito  ";

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

    }



    public class Dalkx_cajas
    {
        MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");

        MySqlCommand cmm;

        public void Alta_kx_cajas(kx_cajas v_obj)

        {
            try
            {
                string cmdTxt = " insert into kx_cajas (id, nombre, id_config, habilitada) values ('" + v_obj.id.ToUpper() + "', '" + v_obj.nombre.ToUpper() + "', '" + v_obj.id_config.ToUpper() + "', '" + v_obj.habilitada.ToUpper() + "')  ";

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


        public void Modificacion_kx_cajas(kx_cajas v_obj)

        {
            try
            {
                string cmdTxt = "update kx_cajas set id='" + v_obj.id.ToUpper() + "' , nombre='" + v_obj.nombre.ToUpper() + "' , id_config='" + v_obj.id_config.ToUpper() + "' , habilitada='" + v_obj.habilitada.ToUpper() + "' where id ='" + v_obj.id + "'   ";

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
        public List<kx_cajas> Listar_kx_cajas(string v_tipo, string v_valor, string v_conf)

        {

            List<kx_cajas> lista = new List<kx_cajas>();
            try
            {



                string cmdTxt = " select  id, nombre, id_config, habilitada from kx_cajas  where id_config = '" + v_conf + "' ";

                if (v_tipo == "99")
                {
                    cmdTxt = " select id, nombre, id_config, habilitada from kx_cajas  where   Id='" + v_valor + "' and id_config = '" + v_conf + "' ";
                }
                if (v_tipo == "0")
                {
                    cmdTxt = " select  id, nombre, id_config, habilitada from kx_cajas  where  id_config = '" + v_conf + "' ";
                }
                if (string.IsNullOrEmpty(v_valor))
                {
                    cmdTxt = " select  id, nombre, id_config, habilitada from kx_cajas where  id_config = '" + v_conf + "' ";
                }
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt+ "   order by nombre");

                MySqlDataReader lector = cnn.ExecuteReader(cmm   );

                while (lector.Read())
                {

                    kx_cajas entidad = new kx_cajas();
                
                    entidad.id = DalModelo.VerifStringMysql(lector, "id");
                    entidad.nombre = DalModelo.VerifStringMysql(lector, "nombre");
                    entidad.id_config = DalModelo.VerifStringMysql(lector, "id_config");
                    entidad.habilitada = DalModelo.VerifStringMysql(lector, "habilitada");
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


        public void Eliminar_kx_cajas(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from kx_cajas  where Id='" + v_id + "'";

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

        public Int32 maxId_kx_cajas()

        {
            Int32 id = 0;

            try
            {
                string cmdTxt = " select max(Id) as cant from kx_cajas  ";

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

    }

}
