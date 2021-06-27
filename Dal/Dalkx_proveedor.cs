using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using MySql.Data.MySqlClient;
namespace Dal
{
    public class Dalkx_proveedor
    {
        private MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");


        MySqlCommand cmm;


        public Int32 AltaId(kx_cliente v_obj)
        {
            MySqlConnection cnn2 = new MySqlConnection();
            Int32 id = 0;

            try
            {



                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();


                string cmdTxt = " insert into kx_proveedor (Cod_Manual, Cuit, Iva, Denominacion  , Observacion, Cta_contable, Calle, Numero, Dpto, Pais, Cp, Provincia, Departamento, Distrito, Contac_Nomb, Contac_Tel, Contac_Cel, Contac_Mail, Contac_Mail1, Contac_Mail2, Emp_Tel, Emp_Cel, Emp_Mail, Emp_Web,Id_Usuario,Habilitado,Tipo) values ('" + v_obj.Cod_Manual + "',   '" + v_obj.Doc_No + "', '" + v_obj.Iva + "', concat( '" + v_obj.Nombre + "',' ', '" + v_obj.Apellido + "') , '" + v_obj.Observacion + "', '" + v_obj.Cta_contable + "', '" + v_obj.Calle + "', '" + v_obj.Numero + "', '" + v_obj.Dpto + "', '" + v_obj.Pais + "', '" + v_obj.Cp + "', '" + v_obj.Provincia + "', '" + v_obj.Departamento + "', '" + v_obj.Distrito + "', '" + v_obj.Contac_Nomb + "', '" + v_obj.Contac_Tel + "', '" + v_obj.Contac_Cel + "', '" + v_obj.Contac_Mail + "', '" + v_obj.Contac_Mail1 + "', '" + v_obj.Contac_Mail2 + "', '" + v_obj.Emp_Tel + "', '" + v_obj.Emp_Cel + "', '" + v_obj.Emp_Mail + "', '" + v_obj.Emp_Web + "', '" + v_obj.Id_Usuario + "','SI', '" + v_obj.Tipo_Doc + "')  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                cmm.ExecuteNonQuery();

                cmm = null;
                cmdTxt = " select max(Id) as cant from kx_proveedor ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "");

                MySqlDataReader lector = cmm.ExecuteReader();

                while (lector.Read())
                {
                    id = DalModelo.VeriIntMysql(lector, "cant");
                }

                lector.Close();

                foreach (var v_obj1 in v_obj.Bancos)
                {
                    cmm = null;
                    cmdTxt = " insert into kx_proveedor_bcos (Banco, Cbu, Alias, NroCuenta, Otros, Id_Proveedor,Tipo) values ('" + v_obj1.Banco.ToUpper() + "', '" + v_obj1.Cbu.ToUpper() + "', '" + v_obj1.Alias.ToUpper() + "', '" + v_obj1.NroCuenta.ToUpper() + "', '" + v_obj1.Otros.ToUpper() + "', '" + id+ "', '" + v_obj1.Tipo + "')  ";

                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                    cnn.ExecuteNonQuery(cmm);
                }

                return id;
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

        public Int32 WsExisteDoc(string doc, string user)
        {
            Int32 sal = 0;

            try
            {
                string cmdTxt = "SELECT count(*) cant FROM kx_proveedor WHERE Cuit = '" + doc + "' and Id_Usuario= '" + user + "'";

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
        public void Alta(kx_proveedor v_obj)
        {
            try
            {
                string cmdTxt = " insert into kx_proveedor (Cod_Manual, Cuit, Iva, Tipo, Denominacion, Observacion, Cta_contable, Calle, Numero, Dpto, Pais, Cp, Provincia, Departamento, Distrito, Contac_Nomb, Contac_Tel, Contac_Cel, Contac_Mail,Contac_Mail1,Contac_Mail2, Emp_Tel, Emp_Cel, Emp_Mail, Emp_Web, Id_Usuario) values ('" + v_obj.Cod_Manual + "', '" + v_obj.Cuit + "', '" + v_obj.Iva + "', '" + v_obj.Tipo + "', '" + v_obj.Denominacion + "', '" + v_obj.Observacion + "', '" + v_obj.Cta_contable + "', '" + v_obj.Calle + "', '" + v_obj.Numero + "', '" + v_obj.Dpto + "', '" + v_obj.Pais + "', '" + v_obj.Cp + "', '" + v_obj.Provincia + "', '" + v_obj.Departamento + "', '" + v_obj.Distrito + "', '" + v_obj.Contac_Nomb + "', '" + v_obj.Contac_Tel + "', '" + v_obj.Contac_Cel + "', '" + v_obj.Contac_Mail + "', '" + v_obj.Contac_Mail1 + "', '" + v_obj.Contac_Mail2 + "', '" + v_obj.Emp_Tel + "', '" + v_obj.Emp_Cel + "', '" + v_obj.Emp_Mail + "', '" + v_obj.Emp_Web + "', '" + v_obj.Id_Usuario + "')  ";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                cnn.ExecuteNonQuery(cmm);

                  cmdTxt = " select max(Id) as cant from kx_proveedor";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);
                string mId = "";
                while (lector.Read())
                {  
                    mId =  DalModelo.VerifStringMysql(lector, "cant"); 
                }

                foreach (var v_obj1 in v_obj.Bancos)
                {
                    cmm = null;
                    cmdTxt = " insert into kx_proveedor_bcos (Banco, Cbu, Alias, NroCuenta, Otros, Id_Proveedor,Tipo) values ('" + v_obj1. Banco.ToUpper() + "', '" + v_obj1.Cbu.ToUpper() + "', '" + v_obj1.Alias.ToUpper() + "', '" + v_obj1.NroCuenta.ToUpper() + "', '" + v_obj1.Otros.ToUpper() + "', '" + mId + "', '" + v_obj1.Tipo + "')  ";

                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                    cnn.ExecuteNonQuery(cmm);
                }

            

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
        public List<kx_proveedor> Listar()
        {

            List<kx_proveedor> lista = new List<kx_proveedor>();
            try
            {



                string cmdTxt = " select Id,Cod_Manual, Cuit, Iva, Tipo, Denominacion, Observacion, Cta_contable, Calle, Numero, Dpto, Pais, Cp, Provincia, Departamento, Distrito, Contac_Nomb, Contac_Tel, Contac_Cel, Contac_Mail, Emp_Tel, Emp_Cel, Emp_Mail, Emp_Web from kx_proveedor  ";

 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_proveedor entidad = new kx_proveedor();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Cod_Manual = DalModelo.VerifStringMysql(lector, "Cod_Manual");
                    entidad.Cuit = DalModelo.VerifStringMysql(lector, "Cuit");
                    entidad.Iva = DalModelo.VerifStringMysql(lector, "Iva");
                    entidad.Tipo = DalModelo.VerifStringMysql(lector, "Tipo");
                    entidad.Denominacion = DalModelo.VerifStringMysql(lector, "Denominacion");
                    entidad.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                    entidad.Cta_contable = DalModelo.VerifStringMysql(lector, "Cta_contable");
                    entidad.Calle = DalModelo.VerifStringMysql(lector, "Calle");
                    entidad.Numero = DalModelo.VerifStringMysql(lector, "Numero");
                    entidad.Dpto = DalModelo.VerifStringMysql(lector, "Dpto");
                    entidad.Pais = DalModelo.VerifStringMysql(lector, "Pais");
                    entidad.Cp = DalModelo.VerifStringMysql(lector, "Cp");
                    entidad.Provincia = DalModelo.VerifStringMysql(lector, "Provincia");
                    entidad.Departamento = DalModelo.VerifStringMysql(lector, "Departamento");
                    entidad.Distrito = DalModelo.VerifStringMysql(lector, "Distrito");
                    entidad.Contac_Nomb = DalModelo.VerifStringMysql(lector, "Contac_Nomb");
                    entidad.Contac_Tel = DalModelo.VerifStringMysql(lector, "Contac_Tel");
                    entidad.Contac_Cel = DalModelo.VerifStringMysql(lector, "Contac_Cel");
                    entidad.Contac_Mail = DalModelo.VerifStringMysql(lector, "Contac_Mail");
                    entidad.Emp_Tel = DalModelo.VerifStringMysql(lector, "Emp_Tel");
                    entidad.Emp_Cel = DalModelo.VerifStringMysql(lector, "Emp_Cel");
                    entidad.Emp_Mail = DalModelo.VerifStringMysql(lector, "Emp_Mail");
                    entidad.Emp_Web = DalModelo.VerifStringMysql(lector, "Emp_Web");
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

         
        public List<kx_proveedor> Listar(string v_tipo, string v_valor, string user)
        {

            List<kx_proveedor> lista = new List<kx_proveedor>();
            try
            {
                string cmdTxt = " select Id,Cod_Manual, Cuit, Iva, Tipo, Denominacion, Observacion, Cta_contable, Calle, Numero, Dpto, Pais, Cp, Provincia, Departamento, Distrito, Contac_Nomb, Contac_Tel, Contac_Cel, Contac_Mail,Contac_Mail1,Contac_Mail2, Emp_Tel, Emp_Cel, Emp_Mail, Emp_Web from kx_proveedor   ";

                if (v_tipo == "0")
                {
                    cmdTxt += "  where Denominacion like  '%" + v_valor + "%'  and Id_Usuario ='" + user + "'  AND Habilitado = 'SI'  order by Denominacion";

                }
                if (v_tipo == "1")
                {
                    cmdTxt += "  where Id =  '" + v_valor + "'  and Id_Usuario ='" + user + "'  AND Habilitado = 'SI' ";

                }
                if (v_tipo == "2")
                {
                    cmdTxt += "  where Cod_Manual like  '%" + v_valor + "%'  and Id_Usuario ='" + user + "'  AND Habilitado   = 'SI' ";

                }
                if (v_tipo == "3")
                {
                    cmdTxt += "  where Cuit like  '%" + v_valor + "%' and Id_Usuario ='" + user + "'  AND Habilitado='SI' ";

                }


                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_proveedor entidad = new kx_proveedor();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.Cod_Manual = DalModelo.VerifStringMysql(lector, "Cod_Manual");
                    entidad.Cuit = DalModelo.VerifStringMysql(lector, "Cuit");
                    entidad.Iva = DalModelo.VerifStringMysql(lector, "Iva");
                    entidad.Tipo = DalModelo.VerifStringMysql(lector, "Tipo");
                    entidad.Denominacion = DalModelo.VerifStringMysql(lector, "Denominacion");
                    entidad.Observacion = DalModelo.VerifStringMysql(lector, "Observacion");
                    entidad.Cta_contable = DalModelo.VerifStringMysql(lector, "Cta_contable");
                    entidad.Calle = DalModelo.VerifStringMysql(lector, "Calle");
                    entidad.Numero = DalModelo.VerifStringMysql(lector, "Numero");
                    entidad.Dpto = DalModelo.VerifStringMysql(lector, "Dpto");
                    entidad.Pais = DalModelo.VerifStringMysql(lector, "Pais");
                    entidad.Cp = DalModelo.VerifStringMysql(lector, "Cp");
                    entidad.Provincia = DalModelo.VerifStringMysql(lector, "Provincia");
                    entidad.Departamento = DalModelo.VerifStringMysql(lector, "Departamento");
                    entidad.Distrito = DalModelo.VerifStringMysql(lector, "Distrito");
                    entidad.Contac_Nomb = DalModelo.VerifStringMysql(lector, "Contac_Nomb");
                    entidad.Contac_Tel = DalModelo.VerifStringMysql(lector, "Contac_Tel");
                    entidad.Contac_Cel = DalModelo.VerifStringMysql(lector, "Contac_Cel");
                    entidad.Contac_Mail = DalModelo.VerifStringMysql(lector, "Contac_Mail");
                    entidad.Contac_Mail1 = DalModelo.VerifStringMysql(lector, "Contac_Mail1");
                    entidad.Contac_Mail2 = DalModelo.VerifStringMysql(lector, "Contac_Mail2");
                    entidad.Emp_Tel = DalModelo.VerifStringMysql(lector, "Emp_Tel");
                    entidad.Emp_Cel = DalModelo.VerifStringMysql(lector, "Emp_Cel");
                    entidad.Emp_Mail = DalModelo.VerifStringMysql(lector, "Emp_Mail");
                    entidad.Emp_Web = DalModelo.VerifStringMysql(lector, "Emp_Web");
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


        public List<pais> ListarCmbProveedor( string user)
        {

            List<pais> lista = new List<pais>();
            try
            {
                string cmdTxt = " select  concat(Denominacion,'  CUIT ',Cuit ) CUIT , Id from kx_proveedor   ";
 
                    cmdTxt += "  where   Id_Usuario ='" + user + "'  AND Habilitado = 'SI'  order by Denominacion ";
                 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    pais entidad = new pais();
                    entidad.id_pais = DalModelo.VeriIntMysql(lector, "Id").ToString();
                    entidad.Id = DalModelo.VeriIntMysql(lector, "Id");
                    entidad.nombre = DalModelo.VerifStringMysql(lector, "CUIT").ToUpper();
                    
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

        public List<kx_proveedor_bcos> Listar_kx_proveedor_bcos(  string v_valor)

        {

            List<kx_proveedor_bcos> lista = new List<kx_proveedor_bcos>();
            try
            {



                string cmdTxt = " select Id,Banco, Cbu, Alias, NroCuenta, Otros, Id_Proveedor, Tipo from kx_proveedor_bcos where  Id_Proveedor= '"+ v_valor + "' ";

               
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    kx_proveedor_bcos entidad = new kx_proveedor_bcos();
                    entidad.Id = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.Banco = DalModelo.VerifStringMysql(lector, "Banco");
                    entidad.Cbu = DalModelo.VerifStringMysql(lector, "Cbu");
                    entidad.Alias = DalModelo.VerifStringMysql(lector, "Alias");
                    entidad.NroCuenta = DalModelo.VerifStringMysql(lector, "NroCuenta");
                    entidad.Otros = DalModelo.VerifStringMysql(lector, "Otros");
                    entidad.Id_Proveedor = DalModelo.VerifStringMysql(lector, "Id_Proveedor");
                    entidad.Tipo = DalModelo.VerifStringMysql(lector, "Tipo");
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
        public void Modificacion(kx_proveedor v_obj)
        {
            try
            {
                string cmdTxt = "update kx_proveedor set Cod_Manual='" + v_obj.Cod_Manual + "' , Cuit='" + v_obj.Cuit + "' , Iva='" + v_obj.Iva + "' , Tipo='" + v_obj.Tipo + "' , Denominacion='" + v_obj.Denominacion + "' , Observacion='" + v_obj.Observacion + "' , Cta_contable='" + v_obj.Cta_contable + "' , Calle='" + v_obj.Calle + "' , Numero='" + v_obj.Numero + "' , Dpto='" + v_obj.Dpto + "' , Pais='" + v_obj.Pais + "' , Cp='" + v_obj.Cp + "' , Provincia='" + v_obj.Provincia + "' , Departamento='" + v_obj.Departamento + "' , Distrito='" + v_obj.Distrito + "' , Contac_Nomb='" + v_obj.Contac_Nomb + "' , Contac_Tel='" + v_obj.Contac_Tel + "' , Contac_Cel='" + v_obj.Contac_Cel + "' , Contac_Mail='" + v_obj.Contac_Mail + "', Contac_Mail1='" + v_obj.Contac_Mail1 + "', Contac_Mail2='" + v_obj.Contac_Mail2 + "' , Emp_Tel='" + v_obj.Emp_Tel + "' , Emp_Cel='" + v_obj.Emp_Cel + "' , Emp_Mail='" + v_obj.Emp_Mail + "' , Emp_Web='" + v_obj.Emp_Web + "' where  id ='" + v_obj.Id + "'   ";


                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                cnn.ExecuteNonQuery(cmm);
                cmm = null;

                cmdTxt = "delete from kx_proveedor_bcos  where Id_Proveedor='" + v_obj.Id + "'";

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                cnn.ExecuteNonQuery(cmm);



                foreach (var v_obj1 in v_obj.Bancos)
                {
                    cmm = null;
                    cmdTxt = " insert into kx_proveedor_bcos (Banco, Cbu, Alias, NroCuenta, Otros, Id_Proveedor,Tipo) values ('" + v_obj1.Banco.ToUpper() + "', '" + v_obj1.Cbu.ToUpper() + "', '" + v_obj1.Alias.ToUpper() + "', '" + v_obj1.NroCuenta.ToUpper() + "', '" + v_obj1.Otros.ToUpper() + "', '" + v_obj.Id + "', '" + v_obj1.Tipo + "')  ";

                    cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                    cnn.ExecuteNonQuery(cmm);
                }


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


        public void Modificacion_kx_proveedor_bcos(kx_proveedor_bcos v_obj)

        {
            try
            {
                string cmdTxt = "update kx_proveedor_bcos set Banco='" + v_obj.Banco.ToUpper() + "' , Cbu='" + v_obj.Cbu.ToUpper() + "' , Alias='" + v_obj.Alias.ToUpper() + "' , NroCuenta='" + v_obj.NroCuenta.ToUpper() + "' , Otros='" + v_obj.Otros.ToUpper() + "' , Id_Proveedor='" + v_obj.Id_Proveedor.ToUpper() + "' where id ='" + v_obj.Id + "'   ";

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
        public void Eliminar_kx_proveedor_bcos(Int32 v_id)
        {
            try
            {
                string cmdTxt = "delete from kx_proveedor_bcos  where Id='" + v_id + "'";

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

        public void Eliminar(Int32 v_id)
        {
            try
            {
               // string cmdTxt = "delete from kx_proveedor  where Id='" + v_id + "'   ";

                string cmdTxt = "update kx_proveedor  set Habilitado ='N' where Id='" + v_id + "'   ";

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
                string cmdTxt = " select max(Id) as cant from kx_proveedor  ";

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
