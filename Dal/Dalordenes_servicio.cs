using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using MySql.Data.MySqlClient;
using System.Data;
namespace Dal
{
    public class Dalordenes_servicio
    {

        private MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");


        MySqlCommand cmm;
        public void Alta(ordenes_servicio v_obj)
        {
            try
            {
                string cmdTxt = " insert into ordenes_servicio (Orden_No,CodMunual, Modelo, Equipo, Serie, Observacion, Motivo, Info_Tecnico, Clave, Tiempo, Valor, Id_cliente, Fecha,Pagado ,Tactil,Boton_Home,Camara_Tracera,Camara_Delantera,Sensor_Proximidad,Parlantes,Auricular,Boton_Power,Volumen) values ('" + v_obj.Orden_No + "','" + v_obj.CodMunual + "' ,'" + v_obj.Modelo + "', '" + v_obj.Equipo + "', '" + v_obj.Serie + "', '" + v_obj.Observacion + "', '" + v_obj.Motivo + "', '" + v_obj.Info_Tecnico + "', '" + v_obj.Clave + "', '" + v_obj.Tiempo + "', '" + v_obj.Valor + "', '" + v_obj.Id_cliente + "', NOW(), 'N' , '" + v_obj.Tactil + "' , '" + v_obj.Boton_Home + "' , '" + v_obj.Camara_Tracera + "' , '" + v_obj.Camara_Delantera + "' , '" + v_obj.Sensor_Proximidad + "' , '" + v_obj.Parlantes + "' , '" + v_obj.Auricular + "' , '" + v_obj.Boton_Power + "' , '" + v_obj.Volumen + "')  ";

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
        public List<ordenes_servicio> exec(string v_desde ,string v_hasta)
        {
             
                MySqlConnection cnn2 = new MySqlConnection();             
            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
       
               string      cmdTxt = "wi271852_kardex.Rp_OrdenServicios";
                  
                     cmm = cnn.MySqlCrearNuevoComando(cmdTxt,cnn2, "SP");
                     cnn.AgregarParametroAComando(cmm, "desde", v_desde);
                     cnn.AgregarParametroAComando(cmm, "hasta", v_hasta);
             
                     cmm.ExecuteNonQuery();
                     cmdTxt = " select  Orden_No,ContraOrden,Cliente_Doc,Cliente,Modelo,Equipo,Serie,Observacion,Motivo,Info_Tecnico,Clave,Valor,Fecha,Pagado,Tipo from  wi271852_kardex.ordenes_servicio_tmb  ";

                 cmm= null;
                  cmm = cnn.MySqlCrearNuevoComando(cmdTxt,cnn2,"");
                     MySqlDataReader lector =cmm.ExecuteReader() ;
                     List<ordenes_servicio> lista = new List<ordenes_servicio>();
                     while (lector.Read())
                     {

                         ordenes_servicio entidad = new ordenes_servicio();
                         entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                         entidad.Tipo = DalModelo.VerifStringMysql(lector, "Tipo");
           
                         entidad.Motivo = DalModelo.VerifStringMysql(lector, "Motivo");
                         entidad.Info_Tecnico = DalModelo.VerifStringMysql(lector, "Info_Tecnico");
                         entidad.Clave = DalModelo.VerifStringMysql(lector, "Clave");
                         entidad.Valor = DalModelo.VerifStringMysql(lector, "Valor");

                         entidad.Orden_No = DalModelo.VerifStringMysql(lector, "Orden_No");
                         entidad.ContraOrden = DalModelo.VerifStringMysql(lector, "ContraOrden");
                         entidad.Cliente_Doc = DalModelo.VerifStringMysql(lector, "Cliente_Doc");
                         entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                         entidad.Modelo = DalModelo.VerifStringMysql(lector, "Modelo");
                         entidad.Equipo = DalModelo.VerifStringMysql(lector, "Equipo");
                         entidad.Serie = DalModelo.VerifStringMysql(lector, "Serie");
                         entidad.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                          

                         entidad.Pagado = DalModelo.VerifStringMysql(lector, "Pagado");
                         lista.Add(entidad);

                     }

                     lector.Close();
                     return lista;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public void AltaContraOrden(contraordenes_servicio v_obj)
        {
            
                MySqlConnection cnn2 = new MySqlConnection();
             
            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = " select count(No) cant from contraordenes_servicio where Orden_Id ='" + v_obj.Orden_Id + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, ""); 
                 MySqlDataReader lector =cmm.ExecuteReader();
                 Int32 cc = 0;
                while (lector.Read())
                {
                    
                    cc = Convert.ToInt32(lector["cant"]);
                    cc++;
                }
                lector.Close();

             

                cmm = null;

                cmdTxt = " insert into contraordenes_servicio (Orden_Id, Observacion, Motivo, Info_Tecnico, Tiempo, Valor, Fecha, No,Pagado, Tactil,Boton_Home,Camara_Tracera,Camara_Delantera,Sensor_Proximidad,Parlantes,Auricular,Boton_Power,Volumen) values ('" + v_obj.Orden_Id + "', '" + v_obj.Observacion + "', '" + v_obj.Motivo + "', '" + v_obj.Info_Tecnico + "', '" + v_obj.Tiempo + "', '" + v_obj.Valor + "', now(), '" + cc.ToString() + "','N', '" + v_obj.Tactil + "', '" + v_obj.Boton_Home + "', '" + v_obj.Camara_Tracera + "', '" + v_obj.Camara_Delantera + "', '" + v_obj.Sensor_Proximidad + "', '" + v_obj.Parlantes + "','" + v_obj.Auricular + "','" + v_obj.Boton_Power + "','" + v_obj.Volumen + "')  ";

                 cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                 cmm.ExecuteNonQuery();

                 cmm = null;


                 cmdTxt = " select max(Id) cant from contraordenes_servicio where Orden_Id ='" + v_obj.Orden_Id + "'";

                 cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                 MySqlDataReader lector2 = cmm.ExecuteReader();
                 Int32 ids = 0;
                 while (lector2.Read())
                 {

                     ids = Convert.ToInt32(lector2["cant"]);

                 }
                 lector2.Close();


                 foreach (var item in v_obj.Repuestos)
                 {
                     cmm = null;
                     cmdTxt = " insert into contraordenes_articulo (Id_Articulo, Id_ContraOrd, Lista, Deposito, Cant, Total, Aud,Alic) values ('" + item.Id + "', '" + ids + "', '" + item.ListaSelect + "', '" + item.DepositoSelect + "', '" + item.Cant + "', '" + item.PrecioSelect + "', now(), '" + item.Iva_Venta + "' )  ";
                     cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                     cmm.ExecuteNonQuery();
                     cmm = null;
                   
                     
                     
                     cmdTxt = "wi271852_kardex.Stock_update";
                  
                     cmm = cnn.MySqlCrearNuevoComando(cmdTxt,cnn2, "SP");
                     cnn.AgregarParametroAComando(cmm, "v_tipo", "S");
                     cnn.AgregarParametroAComando(cmm, "v_art", item.Id);
                     cnn.AgregarParametroAComando(cmm, "v_cant", item.Cant);
                     cnn.AgregarParametroAComando(cmm, "v_dep", item.DepositoSelect);
                     cnn.AgregarParametroAComando(cmm, "v_motivo", "ContraOrden:"+ids);
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
                cnn2.Close();
            }

        }

        public void ModificacionContraOrden(contraordenes_servicio v_obj)
        {
            MySqlConnection cnn2 = new MySqlConnection();

            try
            {

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "update contraordenes_servicio set Observacion='" + v_obj.Observacion + "' , Motivo='" + v_obj.Motivo + "' , Info_Tecnico='" + v_obj.Info_Tecnico + "' , Tiempo='" + v_obj.Tiempo + "' , Valor='" + v_obj.Valor + "' ,Tactil='" + v_obj.Tactil + "' ,Boton_Home='" + v_obj.Boton_Home + "', Camara_Tracera='" + v_obj.Camara_Tracera + "' , Camara_Delantera='" + v_obj.Camara_Delantera + "', Sensor_Proximidad='" + v_obj.Sensor_Proximidad + "', Parlantes='" + v_obj.Parlantes + "' , Auricular='" + v_obj.Auricular + "' , Boton_Power='" + v_obj.Boton_Power + "',Volumen='" + v_obj.Volumen + "'   where id ='" + v_obj.Id + "'   ";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                cmm.ExecuteNonQuery(); 
                cmm = null;
                cmdTxt = "wi271852_kardex.Mod_ContraOrden";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_Id_ContraOrd", v_obj.Id);              
                cmm.ExecuteNonQuery();


                foreach (var item in v_obj.Repuestos)
                {
                    cmm = null;
                    cmdTxt = " insert into contraordenes_articulo (Id_Articulo, Id_ContraOrd, Lista, Deposito, Cant, Total, Aud,Alic) values ('" + item.Id + "', '" + v_obj.Id+ "', '" + item.ListaSelect + "', '" + item.DepositoSelect + "', '" + item.Cant + "', '" + item.PrecioSelect + "', now(), '" + item.Iva_Venta + "' )  ";
                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                    cmm.ExecuteNonQuery();


                    cmm = null;
                    cmdTxt = "wi271852_kardex.Stock_update";

                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                    cnn.AgregarParametroAComando(cmm, "v_tipo", "S");
                    cnn.AgregarParametroAComando(cmm, "v_art", item.Id);
                    cnn.AgregarParametroAComando(cmm, "v_cant", item.Cant);
                    cnn.AgregarParametroAComando(cmm, "v_dep", item.DepositoSelect);
                    cnn.AgregarParametroAComando(cmm, "v_motivo", "ContraOrden:" + v_obj.Id);
                    cmm.ExecuteNonQuery();
                }

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

        }

        public List<contraordenes_servicio> ListarContraOrdenListar(string v_tipo, string v_valor)
        {

            List<contraordenes_servicio> lista = new List<contraordenes_servicio>();
            try
            {

                string cmdTxt = " select Id,Orden_Id, Observacion, Motivo, Info_Tecnico, Tiempo, Valor, DATE_FORMAT(Fecha, '%m/%d/%Y') Fecha,  No,Pagado from contraordenes_servicio   ";

                  if (v_tipo=="0")
                  {
                      cmdTxt = " select Id,Orden_Id, Observacion, Motivo, Info_Tecnico, Tiempo, Valor,DATE_FORMAT(Fecha, '%m/%d/%Y') Fecha,   No,Pagado from contraordenes_servicio where Orden_Id ='" + v_valor + "'";
                }
                  if (v_tipo == "1")
                  {
                      cmdTxt = " select Id,Orden_Id, Observacion, Motivo, Info_Tecnico, Tiempo, Valor, DATE_FORMAT(Fecha, '%m/%d/%Y') Fecha, No,Pagado from contraordenes_servicio where Id ='" + v_valor + "'";
                  }
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    contraordenes_servicio entidad = new contraordenes_servicio();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Orden_Id = DalModelo.VerifStringMysql(lector, "Orden_Id");
                    entidad.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                    entidad.Motivo = DalModelo.VerifStringMysql(lector, "Motivo");
                    entidad.Info_Tecnico = DalModelo.VerifStringMysql(lector, "Info_Tecnico");
                    entidad.Tiempo = DalModelo.VerifStringMysql(lector, "Tiempo");
                    entidad.Valor = DalModelo.VerifStringMysql(lector, "Valor");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.No = DalModelo.VerifStringMysql(lector, "No");
                    entidad.Pagado = DalModelo.VerifStringMysql(lector, "Pagado");                    
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
        public void EliminarListarContraOrden(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from contraordenes_servicio  where Id='" + v_id + "'";

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
        
        
        
        
        public void Modificacion(ordenes_servicio v_obj)
        {
            try
            {
                string cmdTxt = "update ordenes_servicio set   Modelo='" + v_obj.Modelo + "' , Equipo='" + v_obj.Equipo + "' , Serie='" + v_obj.Serie + "' , Observacion='" + v_obj.Observacion + "' , Motivo='" + v_obj.Motivo + "' , Info_Tecnico='" + v_obj.Info_Tecnico + "' , Clave='" + v_obj.Clave + "' , Tiempo='" + v_obj.Tiempo + "', CodMunual='" + v_obj.CodMunual + "' , Valor='" + v_obj.Valor + "' , Id_cliente='" + v_obj.Id_cliente + "' , Tactil='" + v_obj.Tactil + "' , Boton_Home='" + v_obj.Boton_Home + "' , Camara_Tracera='" + v_obj.Camara_Tracera + "', Camara_Delantera='" + v_obj.Camara_Delantera + "' , Sensor_Proximidad='" + v_obj.Sensor_Proximidad + "' ,Parlantes='" + v_obj.Parlantes + "' ,Auricular='" + v_obj.Auricular + "',Boton_Power='" + v_obj.Boton_Power + "',Volumen='" + v_obj.Volumen + "'   where id ='" + v_obj.Id + "'   ";

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

        public Int32 WsExisteDocPersonas(string doc, string user)
        {
            Int32 sal = 0;

            try
            {
                string cmdTxt = "SELECT count(*) cant FROM kx_personas WHERE doc_no = '" + doc + "' and Id_Usuario= '" + user + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
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
                cnn.Close(cmm);
            }


            return sal;
        }


        public Int32 WsExisteDoc(string doc, string user)
        {
            Int32 sal = 0;
            
            try
            {
                string cmdTxt = "SELECT count(*) cant FROM kx_cliente WHERE doc_no = '" + doc + "' and Id_Usuario= '" + user + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                
                while (lector.Read())
                { 
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
                cnn.Close(cmm);
            }


            return sal;
        }
        public List<ordenes_servicio> Listar()
        {

            List<ordenes_servicio> lista = new List<ordenes_servicio>();
            try
            {



                string cmdTxt = " select Id,Orden_No, Modelo, Equipo, Serie, Observacion, Motivo, Info_Tecnico, Clave, Tiempo, Valor, Id_cliente, Fecha from ordenes_servicio  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    ordenes_servicio entidad = new ordenes_servicio();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Orden_No = DalModelo.VerifStringMysql(lector, "Orden_No");
                    entidad.Modelo = DalModelo.VerifStringMysql(lector, "Modelo");
                    entidad.Equipo = DalModelo.VerifStringMysql(lector, "Equipo");
                    entidad.Serie = DalModelo.VerifStringMysql(lector, "Serie");
                    entidad.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                    entidad.Motivo = DalModelo.VerifStringMysql(lector, "Motivo");
                    entidad.Info_Tecnico = DalModelo.VerifStringMysql(lector, "Info_Tecnico");
                    entidad.Clave = DalModelo.VerifStringMysql(lector, "Clave");
                    entidad.Tiempo = DalModelo.VerifStringMysql(lector, "Tiempo");
                    entidad.Valor = DalModelo.VerifStringMysql(lector, "Valor");
                    entidad.Id_cliente = DalModelo.VerifStringMysql(lector, "Id_cliente");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
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

        MySqlConnection cnn2 = new MySqlConnection();
        public  ordenes_servicio ListarId(string ids)
        {
            ordenes_servicio entidad = new ordenes_servicio();
            List<ordenes_servicio> lista = new List<ordenes_servicio>();
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = " select Id,Orden_No, Modelo, Equipo, Serie, Observacion, Motivo, Info_Tecnico, Clave, Tiempo, Valor, Id_cliente, Fecha  ,Tactil,Boton_Home,Camara_Tracera,Camara_Delantera,Sensor_Proximidad,Parlantes,Auricular,Boton_Power,Volumen from ordenes_servicio where Id='" + ids + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, ""); 
                MySqlDataReader lector = cmm.ExecuteReader();
                cmm = null;
                while (lector.Read())
                {

                    
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Orden_No = DalModelo.VerifStringMysql(lector, "Orden_No");
                    entidad.Modelo = DalModelo.VerifStringMysql(lector, "Modelo");
                    entidad.Equipo = DalModelo.VerifStringMysql(lector, "Equipo");
                    entidad.Serie = DalModelo.VerifStringMysql(lector, "Serie");
                    entidad.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                    entidad.Motivo = DalModelo.VerifStringMysql(lector, "Motivo");
                    entidad.Info_Tecnico = DalModelo.VerifStringMysql(lector, "Info_Tecnico");
                    entidad.Clave = DalModelo.VerifStringMysql(lector, "Clave");
                    entidad.Tiempo = DalModelo.VerifStringMysql(lector, "Tiempo");
                    entidad.Valor = DalModelo.VerifStringMysql(lector, "Valor");
                    entidad.Id_cliente = DalModelo.VerifStringMysql(lector, "Id_cliente");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");


                    entidad.Tactil = DalModelo.VerifStringMysql(lector, "Tactil");
                    entidad.Boton_Home = DalModelo.VerifStringMysql(lector, "Boton_Home");
                    entidad.Camara_Tracera = DalModelo.VerifStringMysql(lector, "Camara_Tracera");
                    entidad.Camara_Delantera = DalModelo.VerifStringMysql(lector, "Camara_Delantera");
                    entidad.Sensor_Proximidad = DalModelo.VerifStringMysql(lector, "Sensor_Proximidad");
                    entidad.Parlantes = DalModelo.VerifStringMysql(lector, "Parlantes");
                    entidad.Auricular = DalModelo.VerifStringMysql(lector, "Auricular");
                    entidad.Boton_Power = DalModelo.VerifStringMysql(lector, "Boton_Power");
                    entidad.Volumen = DalModelo.VerifStringMysql(lector, "Volumen");

                }

                lector.Close();
                cmm = null;

                cmdTxt = "select Id,Cod_Manual, Tipo_Doc, Doc_No, Iva, Nombre, Apellido, Observacion, Cta_contable, Calle, Numero, Dpto, Pais, Cp, Provincia, Departamento, Distrito, Contac_Nomb, Contac_Tel, Contac_Cel, Contac_Mail, Emp_Tel, Emp_Cel, Emp_Mail, Emp_Web from kx_cliente where Id like  '" + entidad.Id_cliente + "%'  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                lector = null;
                lector = cmm.ExecuteReader();
                kx_cliente entidad2 = new kx_cliente();
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

                    entidad.ClienteObj = entidad2;
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


            return entidad;
        }


        public contraordenes_servicio ListarIdContra(string ids)
        {
            contraordenes_servicio entidad = new contraordenes_servicio();
            List<kx_articulo> lista = new List<kx_articulo>();
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                string cmdTxt = " select Id,Orden_Id, Observacion, Motivo, Info_Tecnico, Tiempo, Valor,DATE_FORMAT(Fecha, '%m/%d/%Y') Fecha, No,  Tactil,Boton_Home,Camara_Tracera,Camara_Delantera,Sensor_Proximidad,Parlantes,Auricular,Boton_Power,Volumen from contraordenes_servicio where Id='" + ids + "'";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                MySqlDataReader lector = cmm.ExecuteReader();
                cmm = null;
                while (lector.Read())
                {


                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Orden_Id = DalModelo.VerifStringMysql(lector, "Orden_Id");
                    entidad.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                    entidad.Motivo = DalModelo.VerifStringMysql(lector, "Motivo");
                    entidad.Info_Tecnico = DalModelo.VerifStringMysql(lector, "Info_Tecnico");
                    entidad.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                                    
                    entidad.Valor = DalModelo.VerifStringMysql(lector, "Valor");
                    entidad.No = DalModelo.VerifStringMysql(lector, "No");
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");

                    entidad.Tactil = DalModelo.VerifStringMysql(lector, "Tactil");
                    entidad.Boton_Home = DalModelo.VerifStringMysql(lector, "Boton_Home");
                    entidad.Camara_Tracera = DalModelo.VerifStringMysql(lector, "Camara_Tracera");
                    entidad.Camara_Delantera = DalModelo.VerifStringMysql(lector, "Camara_Delantera");
                    entidad.Sensor_Proximidad = DalModelo.VerifStringMysql(lector, "Sensor_Proximidad");
                    entidad.Parlantes = DalModelo.VerifStringMysql(lector, "Parlantes");
                    entidad.Auricular = DalModelo.VerifStringMysql(lector, "Auricular");
                    entidad.Boton_Power = DalModelo.VerifStringMysql(lector, "Boton_Power");
                    entidad.Volumen = DalModelo.VerifStringMysql(lector, "Volumen");

                }

                lector.Close();
                cmm = null;

                cmdTxt = "select ka.Id,ca.Id_Articulo,ca.Id_ContraOrd,ca.Lista,Deposito,ca.Cant,ca.Total,ca.Alic, ka.Nombre Nombre,ka.Cod_Manual cm from contraordenes_articulo ca, kx_articulo ka   where  ca.Id_Articulo = ka.Id and ca.Id_ContraOrd =  '" + entidad.Id + "'  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                lector = null;
                lector = cmm.ExecuteReader();
               
                while (lector.Read())
                {
                    kx_articulo entidad2 = new kx_articulo();
                    entidad2.Iva_Venta = DalModelo.VerifStringMysql(lector, "Alic");
                    entidad2.Id = DalModelo.VeriIntMysql(lector, "Id");

                    entidad2.Nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad2.Cod_Manual = DalModelo.VerifStringMysql(lector, "cm");
                    entidad2.PrecioSelect = DalModelo.VerifStringMysql(lector, "Lista");
                    entidad2.DepositoSelect= DalModelo.VerifStringMysql(lector, "Deposito");
                    entidad2.Cant = DalModelo.VerifStringMysql(lector, "Cant");
                    entidad2.PrecioSelect = DalModelo.VerifStringMysql(lector, "Total");
                     
                  lista.Add(entidad2);
                }
                entidad.Repuestos = lista;
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


            return entidad;
        }
        public List<ordenes_servicio> Listar(string v_tipo, string v_valor)
        {

            List<ordenes_servicio> lista = new List<ordenes_servicio>();
            try
            {



                string cmdTxt = " SELECT CONCAT( kc.Emp_Tel, ' ', kc.Emp_Cel) Tel,    os.Id, os.CodMunual,   wi271852_kardex.CantOrdenes(os.id) as Orden_No, CONCAT( kc.Nombre, ' ', kc.Apellido, ' ', Doc_no ) AS Cliente, CONCAT( os.Equipo, ' ', os.Modelo ) Equipo, os.Motivo, os.Info_Tecnico,DATE_FORMAT(os.Fecha, '%m/%d/%Y') Fecha, os.Id_cliente, os.Pagado  FROM ordenes_servicio os, kx_cliente kc WHERE os.Id_cliente = kc.Id   order by  os.id desc";

                if (v_tipo == "0")
                {
                    if (v_valor =="") {
                        cmdTxt = "SELECT CONCAT( kc.Emp_Tel, ' ', kc.Emp_Cel) Tel, os.Id, os.CodMunual, wi271852_kardex.CantOrdenes(os.id) as Orden_No, CONCAT( kc.Nombre, ' ', kc.Apellido, ' ', Doc_no ) AS Cliente, CONCAT( os.Equipo, ' ', os.Modelo ) Equipo, os.Motivo, os.Info_Tecnico,DATE_FORMAT(os.Fecha, '%m/%d/%Y') Fecha, os.Id_cliente, os.Pagado FROM ordenes_servicio os, kx_cliente kc WHERE os.Id_cliente = kc.Id   order by  os.id desc ";

                    } else {
                        cmdTxt = "SELECT  CONCAT( kc.Emp_Tel, ' ', kc.Emp_Cel) Tel, os.Id, os.CodMunual,wi271852_kardex.CantOrdenes(os.id) as Orden_No, CONCAT( kc.Nombre, ' ', kc.Apellido, ' ', Doc_no ) AS Cliente, CONCAT( os.Equipo, ' ', os.Modelo ) Equipo, os.Motivo, os.Info_Tecnico, DATE_FORMAT(os.Fecha, '%m/%d/%Y') Fecha, os.Id_cliente, os.Pagado FROM ordenes_servicio os, kx_cliente kc WHERE os.Id_cliente = kc.Id AND os.Id =  '" + v_valor + "%'  order by id desc ";
                           }
                  
                }
                if (v_tipo == "1")
                {
                    cmdTxt = "SELECT CONCAT( kc.Emp_Tel, ' ', kc.Emp_Cel) Tel, os.Id, os.CodMunual, wi271852_kardex.CantOrdenes(os.id) as Orden_No, CONCAT( kc.Nombre, ' ', kc.Apellido, ' ', Doc_no ) AS Cliente, CONCAT( os.Equipo, ' ', os.Modelo ) Equipo, os.Motivo, os.Info_Tecnico, DATE_FORMAT(os.Fecha, '%m/%d/%Y') Fecha, os.Id_cliente, os.Pagado FROM ordenes_servicio os, kx_cliente kc WHERE os.Id_cliente = kc.Id AND os.CodMunual like  '" + v_valor + "%'  order by id desc ";

                }

                if (v_tipo == "2")
                {
                    cmdTxt = "SELECT CONCAT( kc.Emp_Tel, ' ', kc.Emp_Cel) Tel, os.Id, os.CodMunual, wi271852_kardex.CantOrdenes(os.id) as Orden_No, CONCAT( kc.Nombre, ' ', kc.Apellido, ' ', Doc_no ) AS Cliente, CONCAT( os.Equipo, ' ', os.Modelo ) Equipo, os.Motivo, os.Info_Tecnico, DATE_FORMAT(os.Fecha, '%m/%d/%Y') Fecha, os.Id_cliente, os.Pagado FROM ordenes_servicio os, kx_cliente kc WHERE os.Id_cliente = kc.Id AND kc.Doc_No LIKE '" + v_valor + "%' order by id desc ";

                }
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    ordenes_servicio entidad = new ordenes_servicio();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.CodMunual = DalModelo.VerifStringMysql(lector, "CodMunual");
                    entidad.Orden_No = DalModelo.VerifStringMysql(lector, "Orden_No");
                    entidad.Cliente = DalModelo.VerifStringMysql(lector, "Cliente");
                    entidad.Equipo = DalModelo.VerifStringMysql(lector, "Equipo");                    
                    entidad.Motivo = DalModelo.VerifStringMysql(lector, "Motivo");
                    entidad.Info_Tecnico = DalModelo.VerifStringMysql(lector, "Info_Tecnico");            
                    entidad.Fecha = DalModelo.VerifStringMysql(lector, "Fecha");
                    entidad.ClienteTel = DalModelo.VerifStringMysql(lector, "Tel");
                    entidad.Id_cliente = DalModelo.VerifStringMysql(lector, "Id_cliente");
                    entidad.Pagado = DalModelo.VerifStringMysql(lector, "Pagado");
                   
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
                string cmdTxt = "delete from ordenes_servicio  where Id='" + v_id + "'";

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
                string cmdTxt = " select max(Id) as cant from ordenes_servicio  ";

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
        public DataTable Rp(string ids) {
            try
            {

                string cmdTxt = " select   kc.Emp_Tel Tel, kc.Emp_Cel Cel, CONCAT( kc.Nombre, ' ', kc.Apellido, ' ', kc.Tipo_Doc, ':', kc.Doc_No )  AS Cliente , os.Id,os.Orden_No, os.Modelo, os.Equipo, os.Serie, os.Observacion, os.Motivo, os.Info_Tecnico, os.Clave, os.Tiempo, os.Valor , DATE_FORMAT(os.Fecha, '%m/%d/%Y') Fecha, '0' AS TITULO1, os.Tactil,os.Boton_Home,os.Camara_Tracera,os.Camara_Delantera,os.Sensor_Proximidad,os.Parlantes,os.Auricular,os.Boton_Power,os.Volumen  FROM ordenes_servicio os, kx_cliente kc WHERE os.Id_cliente = kc.Id and os.Id = '" + ids + "'";
 

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

              return  cnn.ExecuteDataTable(cmm,"Orden");
            }
            catch (Exception)
            {
                
                throw;
            }
        
        
        }

        public DataTable Rp2(string ids)
        {
            try
            {

                string cmdTxt = " select  kc.Emp_Tel Tel, kc.Emp_Cel Cel, concat( kc.Nombre, ' ', kc.Apellido, ' ', kc.Tipo_Doc, ':', kc.Doc_No ) AS Cliente , os.Id,os.Orden_No, os.Modelo, os.Equipo, os.Serie, cs.Observacion, cs.Motivo, cs.Info_Tecnico, os.Clave, cs.Tiempo, cs.Valor , DATE_FORMAT(cs.Fecha, '%m/%d/%Y') Fecha,  cs.No  as TITULO1,cs.Tactil,cs.Boton_Home,cs.Camara_Tracera,cs.Camara_Delantera,cs.Sensor_Proximidad,cs.Parlantes,cs.Auricular,cs.Boton_Power,cs.Volumen FROM ordenes_servicio os, kx_cliente kc, contraordenes_servicio cs WHERE cs.Orden_Id=os.Id and os.Id_cliente = kc.Id and cs.Id = '" + ids + "'";


                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                return cnn.ExecuteDataTable(cmm, "Orden");
            }
            catch (Exception)
            {

                throw;
            }


        }
    }
}
