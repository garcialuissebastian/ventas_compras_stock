using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using MySql.Data.MySqlClient;
using System.Data;
using System.Globalization;
using System.Threading;
namespace Dal
{

    public class Dalkx_cajas_mov
    {
        MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");

        MySqlCommand cmm;

        public void Alta_kx_cajas_mov(kx_cajas_mov v_obj)

        {
            try
            {

                string cmdTxt = " select  id  from  kx_cajas_mov    where id = (select max(id)  from kx_cajas_mov where id_usuario ='" + v_obj.id_usuario  + "'  and tipo = 'APERTURA DE CAJA' and DATE(fecha) = CURDATE()  ) ";


                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                string id_aper = "0";
                while (lector.Read())
                {
                    id_aper = DalModelo.VerifStringMysql(lector, "id");
                   
                }

                lector.Close();


                 cmdTxt = " insert into kx_cajas_mov (id,   caja, ingreso, agreso, tipo, id_usuario, id_config, nro_cbte, destino_cbte,monto_conteo,id_aper) values ('" + v_obj.id.ToUpper() + "' , '" + v_obj.caja.ToUpper() + "', '" + v_obj.ingreso.ToUpper() + "', '" + v_obj.agreso.ToUpper() + "', '" + v_obj.tipo.ToUpper() + "', '" + v_obj.id_usuario.ToUpper() + "', '" + v_obj.id_config.ToUpper() + "', '" + v_obj.nro_cbte.ToUpper() + "', '" + v_obj.destino_cbte.ToUpper() + "', '" + v_obj.monto_conteo+ "', '"+ id_aper + "')  ";

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



        public void Modificacion_kx_cajas_mov(kx_cajas_mov v_obj)

        {
            try
            {
                string cmdTxt = "update kx_cajas_mov set  fecha='" + v_obj.fecha.ToUpper() + "' , caja='" + v_obj.caja.ToUpper() + "' , ingreso='" + v_obj.ingreso.ToUpper() + "' , agreso='" + v_obj.agreso.ToUpper() + "' , tipo='" + v_obj.tipo.ToUpper() + "' , id_usuario='" + v_obj.id_usuario.ToUpper() + "' , id_config='" + v_obj.id_config.ToUpper() + "' , nro_cbte='" + v_obj.nro_cbte.ToUpper() + "' , destino_cbte='" + v_obj.destino_cbte.ToUpper() + "' where id ='" + v_obj.id + "'   ";

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
        public List<kx_cajas_mov> Listar_kx_cajas_mov(string v_mes, string v_anio, string v_conf) 
        {

            List<kx_cajas_mov> lista = new List<kx_cajas_mov>();
            try
            { 

                string cmdTxt = " select  id, fecha,CONCAT(getCajaNombre(caja),' (' ,getUsuarioNombre(id_usuario),')') caja, ingreso, agreso, tipo, id_usuario, id_config, nro_cbte, destino_cbte from kx_cajas_mov  where month(fecha)='" + v_mes + "' and year(fecha)='" + v_anio + "'  and id_config='" + v_conf + "'  order by id desc  ";

                
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cajas_mov entidad = new kx_cajas_mov();
                
                    entidad.id = DalModelo.VerifStringMysql(lector, "id");
                    entidad.fecha = DalModelo.VerifStringMysql(lector, "fecha");
                    entidad.caja = DalModelo.VerifStringMysql(lector, "caja");
                    entidad.ingreso = DalModelo.VerifStringMysql(lector, "ingreso");
                    entidad.agreso = DalModelo.VerifStringMysql(lector, "agreso");
                    entidad.tipo = DalModelo.VerifStringMysql(lector, "tipo");
                    entidad.id_usuario = DalModelo.VerifStringMysql(lector, "id_usuario");
                    entidad.id_config = DalModelo.VerifStringMysql(lector, "id_config");
                    entidad.nro_cbte = DalModelo.VerifStringMysql(lector, "nro_cbte");
                    entidad.destino_cbte = DalModelo.VerifStringMysql(lector, "destino_cbte");
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


        public List<kx_cajas_mov> Listar_kx_cajas_mov(string v_id , string v_conf)
        {

            List<kx_cajas_mov> lista = new List<kx_cajas_mov>();
            try
            {

                string cmdTxt = " select  id, fecha,CONCAT(getCajaNombre(caja),' (' ,getUsuarioNombre(id_usuario),')') caja, ingreso, agreso, tipo, id_usuario, id_config, nro_cbte, destino_cbte from kx_cajas_mov  where  (id ='" + v_id + "' or id_aper='" + v_id + "' )  and id_config='" + v_conf + "'  order by id asc  ";


                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_cajas_mov entidad = new kx_cajas_mov();

                    entidad.id = DalModelo.VerifStringMysql(lector, "id");
                    entidad.fecha = DalModelo.VerifStringMysql(lector, "fecha");
                    entidad.caja = DalModelo.VerifStringMysql(lector, "caja");
                    entidad.ingreso = DalModelo.VerifStringMysql(lector, "ingreso");
                    entidad.agreso = DalModelo.VerifStringMysql(lector, "agreso");
                    entidad.tipo = DalModelo.VerifStringMysql(lector, "tipo");
                    entidad.id_usuario = DalModelo.VerifStringMysql(lector, "id_usuario");
                    entidad.id_config = DalModelo.VerifStringMysql(lector, "id_config");
                    entidad.nro_cbte = DalModelo.VerifStringMysql(lector, "nro_cbte");
                    entidad.destino_cbte = DalModelo.VerifStringMysql(lector, "destino_cbte");
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

        public List<kx_cajas_ver> Listar_kx_cajas_mov2(string v_mes, string v_anio, string v_conf)
        { 
                MySqlConnection cnn2 = new MySqlConnection();
                List<kx_cajas_ver> lista = new List<kx_cajas_ver>();
                try
                {
                    cnn2 = cnn.MySqlCrearNuevaConexion();
                    cnn2.Open();


                    string cmdTxt = "";

                    cmdTxt = "sp_ver_cajas"; 
                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                    cnn.AgregarParametroAComando(cmm, "v_mes", v_mes);
                cnn.AgregarParametroAComando(cmm, "v_anio", v_anio);
                cnn.AgregarParametroAComando(cmm, "v_config", v_conf);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                    while (lector.Read())
                { 
                    kx_cajas_ver entidad = new kx_cajas_ver();

                    entidad.id = DalModelo.VerifStringMysql(lector, "id");
                    entidad.USUARIO = DalModelo.VerifStringMysql(lector, "USUARIO");
                    entidad.CAJA = DalModelo.VerifStringMysql(lector, "CAJA");
                    entidad.APERTURA = DalModelo.VerifStringMysql(lector, "APERTURA");
                    entidad.CIERRE = DalModelo.VerifStringMysql(lector, "CIERRE") == ""? "-" : DalModelo.VerifStringMysql(lector, "CIERRE")  ;
                    entidad.EFECTIVO_APERTURA = DalModelo.VerifStringMysql(lector, "EFECTIVO_APERTURA").Replace(",", "."); ;
                    entidad.EFECTIVO_AL_CIERRE = DalModelo.VerifStringMysql(lector, "EFECTIVO_AL_CIERRE") ==""?"0": DalModelo.VerifStringMysql(lector, "EFECTIVO_AL_CIERRE").Replace(",", "."); ;
                    entidad.Pago_Tarjetas = DalModelo.VerifStringMysql(lector, "Pago_Tarjetas").Replace(",",".");
                    entidad.Pago_Efectivo = DalModelo.VerifStringMysql(lector, "Pago_Efectivo").Replace(",", ".");
                    entidad.Pago_Cheques = DalModelo.VerifStringMysql(lector, "Pago_Cheques").Replace(",", ".");
                    entidad.Pago_Ctacte = DalModelo.VerifStringMysql(lector, "Pago_Ctacte").Replace(",", ".");
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

        public List<string> totalCajaCierre(string v_user )

        {
            List<string> sal = new List<string>();
            MySqlConnection cnn2 = new MySqlConnection();
            List<kx_cajas_mov> lista = new List<kx_cajas_mov>();
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                string cmdTxt = "";

                cmdTxt = "sp_totalCajaCierre";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_id", v_user);

 

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

            

                while (lector.Read())
                {

                    kx_cajas_mov entidad = new kx_cajas_mov();

                    sal.Add(DalModelo.VerifStringMysql(lector, "v_sal_efectivo"));//0
                    sal.Add(DalModelo.VerifStringMysql(lector, "v_sal_Tarjetas"));//1
                    sal.Add(DalModelo.VerifStringMysql(lector, "v_Pago_Cheques"));//2
                    sal.Add(DalModelo.VerifStringMysql(lector, "v_Pago_Ctacte"));//3
                    sal.Add(DalModelo.VerifStringMysql(lector, "v_MONTO_INI"));//4
                    sal.Add(DalModelo.VerifStringMysql(lector, "v_fecha"));//5
                    sal.Add(DalModelo.VerifStringMysql(lector, "v_caja"));//6
                    sal.Add(DalModelo.VerifStringMysql(lector, "v_aper"));//7






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


        public  string UltimoCierre(string v_user)

        {
            string sal ="" ;
            MySqlConnection cnn2 = new MySqlConnection();
            List<kx_cajas_mov> lista = new List<kx_cajas_mov>();
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                string cmdTxt = " select    (IFNULL(sum(ingreso ) ,0) - IFNULL(sum(agreso ) ,0) ) cant from kx_cajas_mov where fecha  >=  (	select fecha   from  kx_cajas_mov ";
                cmdTxt += "  where id = (select max(id_aper)  from kx_cajas_mov where id_usuario = '" + v_user + "'  and tipo = 'CIERRE DE CAJA' ) ) ";
                cmdTxt += " and id_usuario = '"+ v_user + "' ";
                 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");
                
                MySqlDataReader lector = cnn.ExecuteReader(cmm);



                while (lector.Read())
                {
                    sal = DalModelo.VerifStringMysql(lector, "cant").Replace(",",".") ;  
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
        public void Eliminar_kx_cajas_mov(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from kx_cajas_mov  where Id='" + v_id + "'";

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

        public  string TieneCajaCerrada(string id)

        {
          
            try
            {
                string cmdTxt = " select getTieneCierreCaja('"+id+"')  cant ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    id = DalModelo.VerifStringMysql(lector, "cant");
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
        public Int32 maxId_kx_cajas_mov()

        {
            Int32 id = 0;

            try
            {
                string cmdTxt = " select max(Id) as cant from kx_cajas_mov  ";

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
