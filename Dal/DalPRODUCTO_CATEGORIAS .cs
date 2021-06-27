using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using System.Data.SqlClient;
namespace Dal
{
    public class DalPRODUCTO_CATEGORIAS
    {

        private ConectarSqlDB cnn = new ConectarSqlDB();

        SqlCommand cmm;

        public void Alta(PRODUCTO_CATEGORIAS v_obj)
        {
            try
            {
                string cmdTxt = " insert into PRODUCTO_CATEGORIAS (Nombre, Descripcion) values ('" + v_obj.Nombre + "', '" + v_obj.Descripcion + "')  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

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


        public void Modificacion(PRODUCTO_CATEGORIAS v_obj)
        {
            try
            {
                string cmdTxt = "update PRODUCTO_CATEGORIAS set Nombre='" + v_obj.Nombre + "' , Descripcion='" + v_obj.Descripcion + "' where id ='" + v_obj.Id + "'   ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

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

        public List<PRODUCTO_CATEGORIAS> Listar()
        {

            List<PRODUCTO_CATEGORIAS> lista = new List<PRODUCTO_CATEGORIAS>();
            try
            {



                string cmdTxt = " select Id,Nombre, Descripcion from PRODUCTO_CATEGORIAS  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    PRODUCTO_CATEGORIAS entidad = new PRODUCTO_CATEGORIAS();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Descripcion = DalModelo.VerifStringSql(lector, "Descripcion");
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

        public List<PRODUCTO_CATEGORIAS> Listar(string v_tipo, string v_valor)
        {

            List<PRODUCTO_CATEGORIAS> lista = new List<PRODUCTO_CATEGORIAS>();
            try
            { 
                string cmdTxt = "";
                if (v_tipo == "Ids")
                {
                    cmdTxt = "   select Id,Nombre, Descripcion from PRODUCTO_CATEGORIAS where Id='" + v_valor + "' ";

                }

                if (v_tipo == "0")
                {
                    cmdTxt = "   select Id,Nombre, Descripcion from PRODUCTO_CATEGORIAS where Nombre like '%" + v_valor + "%' ";

                }
                if (string.IsNullOrEmpty(v_tipo) && string.IsNullOrEmpty(v_valor))
                {
                    cmdTxt = "   select Id,Nombre, Descripcion from PRODUCTO_CATEGORIAS order by Nombre ";

                }

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    PRODUCTO_CATEGORIAS entidad = new PRODUCTO_CATEGORIAS();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Descripcion = DalModelo.VerifStringSql(lector, "Descripcion");
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
                string cmdTxt = "delete from PRODUCTO_CATEGORIAS  where Id='" + v_id + "'";

                cmm = cnn.CrearNuevoComando(cmdTxt);

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
