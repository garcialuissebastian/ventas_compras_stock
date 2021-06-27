using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using System.Data.SqlClient;
using System.Data;
namespace Dal
{
    public class DalNOTA_VTA
    {

        private ConectarSqlDB cnn = new ConectarSqlDB();

        SqlCommand cmm;

        public void Alta(NOTA_VTA v_obj)
        {
            try
            {
                string cmdTxt = " insert into NOTA_VTA (Id_vendedor, Pago_efectivo, Senia, Maquina, Anticipo, Coutas, Coutas_tipo, Coutas_pesos, Total_vta, Deuda, Aud, Id_cliente, Vto) values ('" + v_obj.Id_vendedor + "', '" + v_obj.Pago_efectivo + "', '" + v_obj.Senia + "', '" + v_obj.Maquina + "', '" + v_obj.Anticipo + "', '" + v_obj.Coutas + "', '" + v_obj.Coutas_tipo + "', '" + v_obj.Coutas_pesos + "', '" + v_obj.Total_vta + "', '" + v_obj.Deuda + "', GETDATE(),'" + v_obj.Id_cliente + "', convert(date, '" + v_obj.Vto + "', 103))  ";

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
        public void Pagar(string Id_nota, string Cuota)
        {
            try
            {
                string cmdTxt = " insert into PAGOS (Id_nota, Couta, Aud) values ('" + Id_nota + "', '" + Cuota + "',  GETDATE())  ";

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

        public void ASIGNAR_COBRADOR(string ID_COBRA, string ID_NOTA)
        {
            try
            {
                string cmdTxt = " UPDATE ASIGNACION_COBRADOR SET Activo='NO' WHERE Id_Nota='" + ID_NOTA + "';  insert into ASIGNACION_COBRADOR (Id_Nota,Id_Personal,Fecha, Activo) values ('" + ID_NOTA + "', '" + ID_COBRA + "',  GETDATE(),'SI')  ";

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

        public void Modificacion(NOTA_VTA v_obj)
        {
            try
            {
                string cmdTxt = "update NOTA_VTA set Id_vendedor='" + v_obj.Id_vendedor + "' , Pago_efectivo='" + v_obj.Pago_efectivo + "' , Senia='" + v_obj.Senia + "' , Maquina='" + v_obj.Maquina + "' , Anticipo='" + v_obj.Anticipo + "' , Coutas='" + v_obj.Coutas + "' , Coutas_tipo='" + v_obj.Coutas_tipo + "' , Coutas_pesos='" + v_obj.Coutas_pesos + "' , Total_vta='" + v_obj.Total_vta + "' , Deuda='" + v_obj.Deuda + "' , Aud='" + v_obj.Aud + "',  Id_cliente = '" + v_obj.Id_cliente + "' where id ='" + v_obj.Id + "'   ";

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

        public NOTA_VTA Ultima_nota()
        {
            NOTA_VTA entidad = new NOTA_VTA();

            try
            { 

                string cmdTxt = " select Id,Id_vendedor, Pago_efectivo, Senia, Maquina, Anticipo, Coutas, Coutas_tipo, Coutas_pesos, Total_vta, Deuda, Aud , Id_cliente from NOTA_VTA  where Id = ( select max(Id) from NOTA_VTA ) ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                   
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Id_vendedor = DalModelo.VerifStringSql(lector, "Id_vendedor");
                    entidad.Pago_efectivo = DalModelo.VerifStringSql(lector, "Pago_efectivo");
                    entidad.Senia = DalModelo.VerifStringSql(lector, "Senia");
                    entidad.Maquina = DalModelo.VerifStringSql(lector, "Maquina");
                    entidad.Anticipo = DalModelo.VerifStringSql(lector, "Anticipo");
                    entidad.Coutas = DalModelo.VerifStringSql(lector, "Coutas");
                    entidad.Coutas_tipo = DalModelo.VerifStringSql(lector, "Coutas_tipo");
                    entidad.Coutas_pesos = DalModelo.VerifStringSql(lector, "Coutas_pesos");
                    entidad.Total_vta = DalModelo.VerifStringSql(lector, "Total_vta");
                    entidad.Deuda = DalModelo.VerifStringSql(lector, "Deuda");
                    entidad.Aud = DalModelo.VerifStringSql(lector, "Aud");
                    entidad.Id_cliente = DalModelo.VerifStringSql(lector, "Id_cliente");
                  
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

            return entidad;
        }
        public List<NOTA_VTA> Listar(string v_tipo, string v_valor)
        {

            List<NOTA_VTA> lista = new List<NOTA_VTA>();
            try
            {



                string cmdTxt = " select Id,Id_vendedor, Pago_efectivo, Senia, Maquina, Anticipo, Coutas, Coutas_tipo, Coutas_pesos, Total_vta, Deuda, Aud , Id_cliente from NOTA_VTA  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    NOTA_VTA entidad = new NOTA_VTA();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Id_vendedor = DalModelo.VerifStringSql(lector, "Id_vendedor");
                    entidad.Pago_efectivo = DalModelo.VerifStringSql(lector, "Pago_efectivo");
                    entidad.Senia = DalModelo.VerifStringSql(lector, "Senia");
                    entidad.Maquina = DalModelo.VerifStringSql(lector, "Maquina");
                    entidad.Anticipo = DalModelo.VerifStringSql(lector, "Anticipo");
                    entidad.Coutas = DalModelo.VerifStringSql(lector, "Coutas");
                    entidad.Coutas_tipo = DalModelo.VerifStringSql(lector, "Coutas_tipo");
                    entidad.Coutas_pesos = DalModelo.VerifStringSql(lector, "Coutas_pesos");
                    entidad.Total_vta = DalModelo.VerifStringSql(lector, "Total_vta");
                    entidad.Deuda = DalModelo.VerifStringSql(lector, "Deuda");
                    entidad.Aud = DalModelo.VerifStringSql(lector, "Aud");
                    entidad.Id_cliente = DalModelo.VerifStringSql(lector, "Id_cliente");
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

        public List<NOTA_VTA_TMP> SP_Listar(string v_id)
        {

            List<NOTA_VTA_TMP> lista = new List<NOTA_VTA_TMP>();
            try
            {


                string cmdTxt = "ver_nota"; 

                cmm = cnn.CrearNuevoComandoType(cmdTxt, "SP");

                cnn.AgregarParametroAComando(cmm, "p_id", ""); 
                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    NOTA_VTA_TMP entidad = new NOTA_VTA_TMP();

                    entidad.ID_NOTA = DalModelo.VerifStringSql(lector, "ID_NOTA");
                    entidad.COBRADOR = DalModelo.VerifStringSql(lector, "COBRADOR");
                    entidad.CLIENTE_NOMBRE = DalModelo.VerifStringSql(lector, "CLIENTE_NOMBRE");
                    entidad.CLIENTE_NOMBRE_RAZON = DalModelo.VerifStringSql(lector, "CLIENTE_NOMBRE_RAZON");
                    entidad.ESTADO = DalModelo.VerifStringSql(lector, "ESTADO");
                    entidad.ID_NOTA = DalModelo.VerifStringSql(lector, "ID_NOTA");
                    entidad.MONTO = DalModelo.VerifStringSql(lector, "MONTO");
                    entidad.VENDEDOR = DalModelo.VerifStringSql(lector, "VENDEDOR");
                    entidad.ID_CLIENTE = DalModelo.VerifStringSql(lector, "ID_CLIENTE");
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

        public List<Be.Pagos_tmp> SP_ListarCobros(string v_id)
        {

            List<Pagos_tmp> lista = new List<Pagos_tmp>();
            try
            {


                string cmdTxt = "SP_COUTAS";

                cmm = cnn.CrearNuevoComandoType(cmdTxt, "SP");

                cnn.AgregarParametroAComando(cmm, "p_id", v_id);
                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    Pagos_tmp entidad = new Pagos_tmp();

                    entidad.Estado = DalModelo.VerifStringSql(lector, "Estado");
                    entidad.Cuota = DalModelo.VerifStringSql(lector, "Cuota");
                    entidad.Monto = DalModelo.VerifStringSql(lector, "Monto");
                    entidad.Vto = Convert.ToDateTime(lector["Vto"]).ToString("dd/MM/yyyy");
                   // entidad.Vto = DalModelo.VerifStringSql(lector, "Vto");
                
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

        public DataTable SP_ListarCobros_RP(string v_id)
        {

            List<Pagos_tmp> lista = new List<Pagos_tmp>();
            try
            { 

                string cmdTxt = "SP_COUTAS_RP";

                cmm = cnn.CrearNuevoComandoType(cmdTxt, "SP");

                cnn.AgregarParametroAComando(cmm, "p_id", v_id);
               
                
                DataTable   dt  = cnn.ExecuteDataTable(cmm,"Cuotas");

                return dt;
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
        public List<NOTA_VTA> Listar()
        {

            List<NOTA_VTA> lista = new List<NOTA_VTA>();
            try
            {



                string cmdTxt = " select Id,Id_vendedor, Pago_efectivo, Senia, Maquina, Anticipo, Coutas, Coutas_tipo, Coutas_pesos, Total_vta, Deuda, Aud , Id_cliente from NOTA_VTA  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    NOTA_VTA entidad = new NOTA_VTA();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Id_vendedor = DalModelo.VerifStringSql(lector, "Id_vendedor");
                    entidad.Pago_efectivo = DalModelo.VerifStringSql(lector, "Pago_efectivo");
                    entidad.Senia = DalModelo.VerifStringSql(lector, "Senia");
                    entidad.Maquina = DalModelo.VerifStringSql(lector, "Maquina");
                    entidad.Anticipo = DalModelo.VerifStringSql(lector, "Anticipo");
                    entidad.Coutas = DalModelo.VerifStringSql(lector, "Coutas");
                    entidad.Coutas_tipo = DalModelo.VerifStringSql(lector, "Coutas_tipo");
                    entidad.Coutas_pesos = DalModelo.VerifStringSql(lector, "Coutas_pesos");
                    entidad.Total_vta = DalModelo.VerifStringSql(lector, "Total_vta");
                    entidad.Deuda = DalModelo.VerifStringSql(lector, "Deuda");
                    entidad.Aud = DalModelo.VerifStringSql(lector, "Aud");
                    entidad.Id_cliente = DalModelo.VerifStringSql(lector, "Id_cliente");
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
                string cmdTxt = " select max(Id) as cant from NOTA_VTA  ";

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


        public void Eliminar(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from NOTA_VTA  where Id='" + v_id + "'";

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
