using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Be;
namespace Dal
{
    public class DalLISTA_PRECIO_DET
    {

        private ConectarSqlDB cnn = new ConectarSqlDB();

        SqlCommand cmm;

        public void Alta(LISTA_PRECIO_DET v_obj)
        {
            try
            {
                string cmdTxt = " insert into LISTA_PRECIO_DET (Id_Producto, Id_Lista, Precio) values ('" + v_obj.Id_Producto + "', '" + v_obj.Id_Lista + "', '" + v_obj.Precio + "')  ";

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

        public void Alta(List<Be.NOTA_VTA_DET> v_list) {
            try
            {

            }
            catch (Exception)
            {
                
                throw;
            }
        
        
        }
        public void Modificacion(LISTA_PRECIO_DET v_obj)
        {
            try
            {
                string cmdTxt = "update LISTA_PRECIO_DET set Id_Producto='" + v_obj.Id_Producto + "' , Id_Lista='" + v_obj.Id_Lista + "' , Precio='" + v_obj.Precio + "' where id ='" + v_obj.Id + "'   ";

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

        public List<LISTA_PRECIO_DET> Listar()
        {

            List<LISTA_PRECIO_DET> lista = new List<LISTA_PRECIO_DET>();
            try
            {



                string cmdTxt = " select Id,Id_Producto, Id_Lista, Precio from LISTA_PRECIO_DET  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    LISTA_PRECIO_DET entidad = new LISTA_PRECIO_DET();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Id_Producto = DalModelo.VerifStringSql(lector, "Id_Producto");
                    entidad.Id_Lista = DalModelo.VerifStringSql(lector, "Id_Lista");
                    entidad.Precio = DalModelo.VerifStringSql(lector, "Precio");
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

        public List<LISTA_PRECIO_DET> Listar(string Ids, SqlConnection sqlcnn)
        {

            List<LISTA_PRECIO_DET> lista = new List<LISTA_PRECIO_DET>();
            try
            {



                string cmdTxt = " select d.Id,Id_Producto, Id_Lista, Precio, p.Nombre,p.Codigo from PRODUCTOS p, LISTA_PRECIO_DET  d where p.Id=d.Id_Producto and Id_Lista='"+Ids+"'"  ;

                  cmm = cnn.CrearNuevoComando(cmdTxt, sqlcnn, "");

                SqlDataReader lector2 = cnn.ExecuteReader(cmm);

                while (lector2.Read())
                {
                    Dal.DalProductos pp= new DalProductos();
                    LISTA_PRECIO_DET entidad = new LISTA_PRECIO_DET();
                    entidad.Id = DalModelo.VeriIntSql(lector2, "Id");
                    entidad.Id_Producto = DalModelo.VerifStringSql(lector2, "Id_Producto");
                    entidad.Id_Lista = DalModelo.VerifStringSql(lector2, "Id_Lista");
                    entidad.Precio = DalModelo.VerifStringSql(lector2, "Precio");
                    entidad.Producto.Nombre = DalModelo.VerifStringSql(lector2, "Nombre");
                    entidad.Producto.Codigo = DalModelo.VerifStringSql(lector2, "Codigo");

                    lista.Add(entidad);

                }

                lector2.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
              //  cnn.Close(cmm);
            }


            return lista;
        }
        public void Eliminar(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from LISTA_PRECIO_DET  where Id='" + v_id + "'";

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
