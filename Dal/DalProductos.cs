using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using System.Data.SqlClient;
namespace Dal
{
    public class DalProductos
    {

        private ConectarSqlDB cnn = new ConectarSqlDB();

        SqlCommand cmm;

        public void Entrada(Int32 id_p, Int32 cant) {
            try
            {
                
                string cmdTxt = "SP_ENT"; 

                cmm = cnn.CrearNuevoComandoType(cmdTxt, "SP");

                cnn.AgregarParametroAComando(cmm, "p_prod", id_p);
                cnn.AgregarParametroAComando(cmm, "p_cant", cant); 
                  cnn.ExecuteNonQuery(cmm);
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

        public void Salida(Int32 id_p, Int32 cant)
        {
            try
            {

                string cmdTxt = "SP_SAL";

                cmm = cnn.CrearNuevoComandoType(cmdTxt, "SP");

                cnn.AgregarParametroAComando(cmm, "p_prod", id_p);
                cnn.AgregarParametroAComando(cmm, "p_cant", cant);
                cnn.ExecuteNonQuery(cmm);
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

        public void Alta(Productos v_obj)
        {
            try
            {
                string cmdTxt = " insert into Productos (Codigo, Nombre, Categoria, TasaIVA, Cant) values ('" + v_obj.Codigo + "', '" + v_obj.Nombre + "', '" + v_obj.Categoria + "', '" + v_obj.TasaIVA + "', '" + v_obj.Cant + "')  ";

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
        public List<Productos> Listar(string v_valor, SqlConnection sqlcnn)
        {

            List<Productos> lista = new List<Productos>();
            try
            {
                string cmdTxt = "";
               
                    cmdTxt = "   select Id,Codigo, Nombre, Categoria, TasaIVA, Cant from PRODUCTOS where Id='" + v_valor + "' ";
                    cmm = cnn.CrearNuevoComando(cmdTxt, sqlcnn, "");

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    Productos entidad = new Productos();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Codigo = DalModelo.VerifStringSql(lector, "Codigo");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Categoria = DalModelo.VerifStringSql(lector, "Categoria");
                    entidad.TasaIVA = DalModelo.VerifStringSql(lector, "TasaIVA");
                    entidad.Cant = DalModelo.VerifStringSql(lector, "Cant");
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
             //   cnn.Close(cmm);
            }


            return lista;
        }
        public List<Productos> Listar(string v_tipo, string v_valor)
        {

            List<Productos> lista = new List<Productos>();
            try
            {
                string cmdTxt = "";
                if (v_tipo == "Ids")
                {
                    cmdTxt = "   select Id,Codigo, Nombre, Categoria, TasaIVA, Cant from PRODUCTOS where Id='" + v_valor + "' ";

                }

                if (v_tipo == "0")
                {
                    cmdTxt = "   select Id,Codigo, Nombre, Categoria, TasaIVA, Cant from PRODUCTOS where Codigo like '" + v_valor + "%' ";

                }
                if (v_tipo == "1")
                {
                    cmdTxt = "   select Id,Codigo, Nombre, Categoria, TasaIVA, Cant from PRODUCTOS where Nombre like '" + v_valor + "%' ";

                }



                if (string.IsNullOrEmpty(v_tipo) && string.IsNullOrEmpty(v_valor))
                {
                    cmdTxt = "   select Id,Codigo, Nombre, Categoria, TasaIVA, Cant  from PRODUCTOS order by Nombre ";

                }

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    Productos entidad = new Productos();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Codigo = DalModelo.VerifStringSql(lector, "Codigo");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Categoria = DalModelo.VerifStringSql(lector, "Categoria");
                    entidad.TasaIVA = DalModelo.VerifStringSql(lector, "TasaIVA");
                    entidad.Cant = DalModelo.VerifStringSql(lector, "Cant");
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

        public void Modificacion(Productos v_obj)
        {
            try
            {
                string cmdTxt = "update Productos set Codigo='" + v_obj.Codigo + "' , Nombre='" + v_obj.Nombre + "' , Categoria='" + v_obj.Categoria + "' , TasaIVA='" + v_obj.TasaIVA + "' , Cant='" + v_obj.Cant + "' where id ='" + v_obj.Id + "'   ";

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

        public List<Be.Productos> Listar()
        {

            List<Productos> lista = new List<Productos>();
            try
            {



                string cmdTxt = " select Id,Codigo, Nombre, Categoria, TasaIVA, Cant from Productos  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    Productos entidad = new Productos();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Codigo = DalModelo.VerifStringSql(lector, "Codigo");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Categoria = DalModelo.VerifStringSql(lector, "Categoria");
                    entidad.TasaIVA = DalModelo.VerifStringSql(lector, "TasaIVA");
                    entidad.Cant = DalModelo.VerifStringSql(lector, "Cant");
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
                string cmdTxt = "delete from Productos  where Id='" + v_id + "'";

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

