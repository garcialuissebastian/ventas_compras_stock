using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using System.Data.SqlClient;
namespace Dal
{

    public class DalLISTA_PRECIOS
    {

        private ConectarSqlDB cnn = new ConectarSqlDB();
        SqlConnection sqlcnn;
        SqlCommand cmm;

        public void Alta(LISTA_PRECIOS v_obj)
        {
            try
            {

                sqlcnn = cnn.CrearNuevaConexion();
                //sqlcnn.Open();
                string cmdTxt = "";
                if (v_obj.Activa =="1") {

                    cmdTxt = "update LISTA_PRECIOS set Activa='0';  insert into LISTA_PRECIOS (Nombre, Descripcion, Activa) values ('" + v_obj.Nombre + "', '" + v_obj.Descripcion + "', '" + v_obj.Activa + "')  ";
               
                
                } else {


                    cmdTxt = " insert into LISTA_PRECIOS (Nombre, Descripcion, Activa) values ('" + v_obj.Nombre + "', '" + v_obj.Descripcion + "', '" + v_obj.Activa + "')  ";
               
                }


                cmm = cnn.CrearNuevoComando(cmdTxt, sqlcnn, "");
                
                cnn.ExecuteNonQuery(cmm);

                Int32 Ids = maxId();
                foreach (Be.LISTA_PRECIO_DET item in v_obj.Detalle)
                {
                    item.Id_Lista = Ids.ToString();
                    cmdTxt = " insert into LISTA_PRECIO_DET (Id_Producto, Id_Lista, Precio) values ('" + item.Id_Producto + "', '" + item.Id_Lista + "', '" + item.Precio + "')  ";
                    cmm = cnn.CrearNuevoComando(cmdTxt, sqlcnn, "");

                    cnn.ExecuteNonQuery(cmm);

                    
                }



            }
            catch
            {
                throw;
            }
            finally
            {
                sqlcnn.Close();
                cnn.Close(cmm);
            }

        }


        public void Modificacion(LISTA_PRECIOS v_obj)
        {
            try
            {
                string cmdTxt = "update LISTA_PRECIOS set Nombre='" + v_obj.Nombre + "' , Descripcion='" + v_obj.Descripcion + "' , Activa='" + v_obj.Activa + "' where id ='" + v_obj. Id + "'   ";

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

        public void Actividad(string v_id, string v_tipo)
        {
            try
            {
                string cmdTxt ="";
                if (v_tipo == "0")
                {
                    cmdTxt = " update LISTA_PRECIOS set  Activa='false'  where id ='" + v_id + "'   ";

                }else{
                
                  cmdTxt = " update LISTA_PRECIOS set  Activa='false';   update LISTA_PRECIOS set  Activa='true' where id ='" + v_id + "'   ";

                }
               
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
  
        public List<LISTA_PRECIOS> Listar(string v_tipo, string v_valor)
        {

            List<LISTA_PRECIOS> lista = new List<LISTA_PRECIOS>();
            try
            {
                string cmdTxt = "";
                if (v_tipo == "Ids")
                {
                    cmdTxt = "   select Id,Nombre, Descripcion, Activa from LISTA_PRECIOS where Id='" + v_valor + "' ";

                }

                if (v_tipo == "0")
                {
                    cmdTxt = "   select Id,Nombre, Descripcion, Activa from LISTA_PRECIOS where Nombre like '%" + v_valor + "%' ";

                }
                if (string.IsNullOrEmpty(v_tipo) && string.IsNullOrEmpty(v_valor))
                {
                    cmdTxt = "  select Id,Nombre, Descripcion, Activa from LISTA_PRECIOS order by Nombre ";

                }


               

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    LISTA_PRECIOS entidad = new LISTA_PRECIOS();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Descripcion = DalModelo.VerifStringSql(lector, "Descripcion");
                    entidad.Activa = DalModelo.VerifStringSql(lector, "Activa");
                    
             
                    
                    lista.Add(entidad);

                }

                lector.Close();
                cnn.Close(cmm);
                List<LISTA_PRECIO_DET> Det = new List<LISTA_PRECIO_DET>();
               

              
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
 
       

        public  LISTA_PRECIOS Listar(string v_valor)
        {
            sqlcnn = cnn.CrearNuevaConexion();
            LISTA_PRECIOS entidad = new LISTA_PRECIOS();
            List<LISTA_PRECIOS> lista = new List<LISTA_PRECIOS>();
            try
            {
                
                string cmdTxt = "";
            
               
                    cmdTxt = "   select Id,Nombre, Descripcion, Activa from LISTA_PRECIOS where Id='" + v_valor + "' ";


                    cmm = cnn.CrearNuevoComando(cmdTxt, sqlcnn, "");
                 
                SqlDataReader lector = cnn.ExecuteReader(cmm);
               
                while (lector.Read())
                {

                  
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Descripcion = DalModelo.VerifStringSql(lector, "Descripcion");
                    entidad.Activa = DalModelo.VerifStringSql(lector, "Activa");

                    
                      
              
                }

                lector.Close();
               
                DalLISTA_PRECIO_DET dalDet = new DalLISTA_PRECIO_DET();
                entidad.Detalle = dalDet.Listar(v_valor, sqlcnn);

                cnn.Close(cmm);
             



            }
            catch
            {
                throw;
            }
            finally
            {
                sqlcnn.Close();
                cnn.Close(cmm);
            }


            return entidad;
        }



        public List<LISTA_PRECIOS> Listar()
        {

            List<LISTA_PRECIOS> lista = new List<LISTA_PRECIOS>();
            try
            {



                string cmdTxt = " select Id,Nombre, Descripcion, Activa from LISTA_PRECIOS  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    LISTA_PRECIOS entidad = new LISTA_PRECIOS();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Descripcion = DalModelo.VerifStringSql(lector, "Descripcion");
                    entidad.Activa = DalModelo.VerifStringSql(lector, "Activa");
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

        public Int32 maxId()
        {
            Int32 id = 0;
            
            try
            { 
                string cmdTxt = " select max(Id) as cant from LISTA_PRECIOS  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                   
                   id = DalModelo.VeriIntSql(lector, "cant");
                    
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

        public Int32 Id_lista()
        {
            Int32 id = 0;

            try
            {
                string cmdTxt = "SELECT Id  as cant FROM  LISTA_PRECIOS WHERE Activa ='1' ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                { 
                    id = DalModelo.VeriIntSql(lector, "cant");
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
        public double Precio(string Ids)
        {
            double sal = 0;
            try
            { 
                string cmdTxt = "SELECT  Precio   FROM  LISTA_PRECIO_DET where Id_Lista = (SELECT Id FROM  LISTA_PRECIOS WHERE Activa ='1') and Id_Producto= '"+Ids+"'" ;

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    if (lector["Precio"] != null) { 
                    sal =Convert.ToDouble( lector["Precio"]);
                    }
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


            return sal;
        }


        public string Stock_p(string Ids)
        {
            string sal ="0";
            try
            {
                string cmdTxt = "select  saldo from  [dbo].[STOCK] where  id = ( select MAX(Id)  from  [dbo].[STOCK] where Id_Producto ='" + Ids + "')";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    if (lector["saldo"] != null)
                    {
                        sal = Convert.ToString(lector["saldo"]);
                    }
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


            return sal;
        }
        public void Eliminar(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from LISTA_PRECIOS  where Id='" + v_id + "'";

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
