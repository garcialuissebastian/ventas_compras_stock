using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Be;
using MySql.Data.MySqlClient;

namespace Dal
{
 public   class Dalkx_pwd
    {

        private MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");
        MySqlCommand cmm;
        MySqlCommand cmm2;

        public void Modificacion_kx_pwd(kx_pwd v_obj)

        {
            try
            {
                string cmdTxt = "update kx_pwd set id='" + v_obj.id.ToUpper() + "' , lugar='" + v_obj.lugar.ToUpper() + "' , campo1='" + v_obj.campo1.ToUpper() + "' , campo2='" + v_obj.campo2.ToUpper() + "' where id ='" + v_obj.id + "'   ";

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
        public List<kx_pwd> Listar_kx_pwd(string v_tipo, string v_valor)

        {

            List<kx_pwd> lista = new List<kx_pwd>();
            try
            {



                string cmdTxt = " select Id,id, lugar, campo1, campo2 from kx_pwd  ";

                if (v_tipo == "99")
                {
                    cmdTxt = " select Id,id, lugar, campo1, campo2 from kx_pwd  where   Id='" + v_valor + "' ";
                }
                if (v_tipo == "0")
                {
                    cmdTxt = " select Id,id, lugar, campo1, campo2 from kx_pwd  ";
                }
                if (string.IsNullOrEmpty(v_valor))
                {
                    cmdTxt = " select Id,id, lugar, campo1, campo2 from kx_pwd  ";
                }
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_pwd entidad = new kx_pwd();
               
                    entidad.id = DalModelo.VerifStringMysql(lector, "id");
                    entidad.lugar = DalModelo.VerifStringMysql(lector, "lugar");
                    entidad.campo1 = DalModelo.VerifStringMysql(lector, "campo1");
                    entidad.campo2 = DalModelo.VerifStringMysql(lector, "campo2");
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


        public void Eliminar_kx_pwd(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from kx_pwd  where Id='" + v_id + "'";

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

        public Int32 maxId_kx_pwd()

        {
            Int32 id = 0;

            try
            {
                string cmdTxt = " select max(Id) as cant from kx_pwd  ";

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

        public void Alta_kx_pwd(kx_pwd v_obj)

        {
            try
            {
                string cmdTxt = " insert into kx_pwd (id, lugar, campo1, campo2) values ('" + v_obj.id.ToUpper() + "', '" + v_obj.lugar.ToUpper() + "', '" + v_obj.campo1.ToUpper() + "', '" + v_obj.campo2.ToUpper() + "')  ";

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
