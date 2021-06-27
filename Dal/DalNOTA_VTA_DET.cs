using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using System.Data.SqlClient;
namespace Dal
{
    public class DalNOTA_VTA_DET
    {
        SqlConnection sqlcnn;

        private ConectarSqlDB cnn = new ConectarSqlDB();

        SqlCommand cmm;

        public void Alta(NOTA_VTA_DET v_obj)
        {
            try
            {
                string cmdTxt = " insert into NOTA_VTA_DET (ID, Id_producto, Id_lista, Cantidad, Precio_unidad, Id_nota_vta) values ('" + v_obj.ID + "', '" + v_obj.Id_producto + "', '" + v_obj.Id_lista + "', '" + v_obj.Cantidad + "', '" + v_obj.Precio_unidad + "', '" + v_obj.Id_nota_vta + "')  ";

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

        public void Alta(List<Be.Productos> v_list)
        {
            try
            {

                DalNOTA_VTA nta= new DalNOTA_VTA();
                DalLISTA_PRECIOS lt = new DalLISTA_PRECIOS();
                sqlcnn = cnn.CrearNuevaConexion();
                
                Int32 ids = nta.maxId();
                Int32 Ids_lt = lt.Id_lista();

                sqlcnn.Open();
                NOTA_VTA_DET v_obj  = new NOTA_VTA_DET();

                foreach (Be.Productos pp in v_list)
                {

                    v_obj.Id_nota_vta = ids.ToString();
                    v_obj.Id_lista = Ids_lt.ToString();
                    v_obj.Id_producto = pp.Id.ToString();
                    v_obj.Precio_unidad = pp.Precio.ToString();
                    v_obj.Cantidad = pp.Cant.ToString();

                    string cmdTxt = "exec SP_SAL " + v_obj.Id_producto + ", " + v_obj.Cantidad + "; insert into NOTA_VTA_DET ( Id_producto, Id_lista, Cantidad, Precio_unidad, Id_nota_vta) values (  '" + v_obj.Id_producto + "', '" + v_obj.Id_lista + "', '" + v_obj.Cantidad + "', '" + v_obj.Precio_unidad + "', '" + v_obj.Id_nota_vta + "')  ";

                    cmm = cnn.CrearNuevoComando(cmdTxt, sqlcnn, "");

                    cnn.ExecuteNonQuery(cmm);

                }

            }
            catch (Exception)
            {

                throw;
            }
            finally {
                sqlcnn.Close();
            
            }


        }
        public void Modificacion(NOTA_VTA_DET v_obj)
        {
            try
            {
                string cmdTxt = "update NOTA_VTA_DET set   Id_producto='" + v_obj.Id_producto + "' , Id_lista='" + v_obj.Id_lista + "' , Cantidad='" + v_obj.Cantidad + "' , Precio_unidad='" + v_obj.Precio_unidad + "' , Id_nota_vta='" + v_obj.Id_nota_vta + "' where id ='" + v_obj.Id + "'   ";

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

        public List<NOTA_VTA_DET> Listar()
        {

            List<NOTA_VTA_DET> lista = new List<NOTA_VTA_DET>();
            try
            {



                string cmdTxt = " select Id,  Id_producto, Id_lista, Cantidad, Precio_unidad, Id_nota_vta from NOTA_VTA_DET  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    NOTA_VTA_DET entidad = new NOTA_VTA_DET();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.ID = DalModelo.VerifStringSql(lector, "ID");
                    entidad.Id_producto = DalModelo.VerifStringSql(lector, "Id_producto");
                    entidad.Id_lista = DalModelo.VerifStringSql(lector, "Id_lista");
                    entidad.Cantidad = DalModelo.VerifStringSql(lector, "Cantidad");
                    entidad.Precio_unidad = DalModelo.VerifStringSql(lector, "Precio_unidad");
                    entidad.Id_nota_vta = DalModelo.VerifStringSql(lector, "Id_nota_vta");
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
                string cmdTxt = "delete from NOTA_VTA_DET  where Id='" + v_id + "'";

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
