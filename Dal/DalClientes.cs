using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using System.Data.SqlClient;
using System.Data;
namespace Dal
{
public    class DalClientes
    {
        private ConectarSqlDB cnn = new ConectarSqlDB();
        SqlConnection sqlcnn;
        SqlCommand cmm;

        public void Alta(Clientes v_obj)
        {
            try
            {
                if(string.IsNullOrEmpty(v_obj.Fecha_nac)){
                DateTime localDate = DateTime.Now;

                v_obj.Fecha_nac = localDate.ToString("dd/MM/yyyy");
                }



                string cmdTxt = " insert into Clientes (Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo) values ('" + v_obj.Nombre + "', '" + v_obj.Apellido + "', '" + v_obj.Doc_tipo + "', '" + v_obj.Doc_no + "', '" + v_obj.Domi_particular + "', '" + v_obj.Puerta_particular + "', '" + v_obj.Loc_particular + "', '" + v_obj.Dep_particular + "', '" + v_obj.Cp_particular + "', '" + v_obj.Prov_particular + "', '" + v_obj.Domi_comercial + "', '" + v_obj.Puerta_comercial + "', '" + v_obj.Loc_comercial + "', '" + v_obj.Dep_comercial + "', '" + v_obj.Cp_comercial + "', '" + v_obj.Prov_comercial + "', '" + v_obj.Tel + "', '" + v_obj.Cel + "', '" + v_obj.Fax + "', '" + v_obj.Mail + "', '" + v_obj.entre_particular + "', '" + v_obj.entre_comercial + "', '" + v_obj.Razon_social + "', '" + v_obj.Cuit + "', '" + v_obj.Lugar_nac + "', convert(datetime,'" + v_obj.Fecha_nac + "', 103), '" + v_obj.Estado_civil + "', '" + v_obj.Ramo + "')  ";

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


        public void Modificacion(Clientes v_obj)
        {
            try
            {
 

                string cmdTxt = "update Clientes set  Nombre='" + v_obj.Nombre + "' , Apellido='" + v_obj.Apellido + "' , Doc_tipo='" + v_obj.Doc_tipo + "' , Doc_no='" + v_obj.Doc_no + "' , Domi_particular='" + v_obj.Domi_particular + "' , Puerta_particular='" + v_obj.Puerta_particular + "' , Loc_particular='" + v_obj.Loc_particular + "' , Dep_particular='" + v_obj.Dep_particular + "' , Cp_particular='" + v_obj.Cp_particular + "' , Prov_particular='" + v_obj.Prov_particular + "' , Domi_comercial='" + v_obj.Domi_comercial + "' , Puerta_comercial='" + v_obj.Puerta_comercial + "' , Loc_comercial='" + v_obj.Loc_comercial + "' , Dep_comercial='" + v_obj.Dep_comercial + "' , Cp_comercial='" + v_obj.Cp_comercial + "' , Prov_comercial='" + v_obj.Prov_comercial + "' , Tel='" + v_obj.Tel + "' , Cel='" + v_obj.Cel + "' , Fax='" + v_obj.Fax + "' , Mail='" + v_obj.Mail + "' , entre_particular='" + v_obj.entre_particular + "' , entre_comercial='" + v_obj.entre_comercial + "' , Razon_social='" + v_obj.Razon_social + "' , Cuit='" + v_obj.Cuit + "' , Lugar_nac='" + v_obj.Lugar_nac + "' , Fecha_nac='" + v_obj.Fecha_nac + "' , Estado_civil='" + v_obj.Estado_civil + "' , Ramo='" + v_obj.Ramo + "'  where id ='" + v_obj.Id + "'   ";

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
        public DataSet Buscar_rep(string v_id, string v_nota)
        {

            DataSet ds = new DataSet();
            DataTable lector;
            try
            {
                sqlcnn = cnn.CrearNuevaConexion();

                string cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo from Clientes  where Id ='"+v_id+"'";

        

                cmm = cnn.CrearNuevoComando(cmdTxt, sqlcnn, "");

                ds.Tables.Add( cnn.ExecuteDataTable(cmm, "Clientes"));

                cmm = new SqlCommand();

                cmdTxt = " SELECT (SELECT  (Codigo +' '+Nombre)      FROM  PRODUCTOS p where  p.Id= Id_producto) Producto , Cantidad , CAST( Precio_unidad AS VARCHAR(10))  Precio_unidad , CAST( (Cantidad *  Precio_unidad) AS VARCHAR(10)) Precio  FROM  NOTA_VTA_DET  where Id_nota_vta  ='" + v_nota + "'";
                cmm = cnn.CrearNuevoComando(cmdTxt, sqlcnn, "");
                ds.Tables.Add(cnn.ExecuteDataTable(cmm, "Productos"));

                cmm = new SqlCommand();
                cmdTxt = "SELECT  Id , (SELECT  (Nombre + ' '+ Apellido) as personal FROM  PERSONAL where Id = Id_vendedor) personal ,CAST( Pago_efectivo AS VARCHAR(10)) Pago_efectivo ,CAST( Senia AS VARCHAR(10))  Senia ,Maquina,CAST( Anticipo AS VARCHAR(10)) Anticipo ,Coutas ,Coutas_tipo,CAST(Coutas_pesos AS VARCHAR(10)) Coutas_pesos ,CAST(Total_vta AS VARCHAR(10)) Total_vta,CAST( Deuda AS VARCHAR(10)) Deuda,Aud  ,Id_cliente, CONVERT(varchar, Vto, 103) Vto FROM  NOTA_VTA where Id  ='" + v_nota + "'";
                cmm = cnn.CrearNuevoComando(cmdTxt, sqlcnn, "");
                ds.Tables.Add(cnn.ExecuteDataTable(cmm, "Nota_vta"));


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
            return ds;
        }

        public List<Clientes> Listar()
        {

            List<Clientes> lista = new List<Clientes>();
            try
            {
                 
                string cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo from Clientes  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    Clientes entidad = new Clientes();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Apellido = DalModelo.VerifStringSql(lector, "Apellido");
                    entidad.Doc_tipo = DalModelo.VerifStringSql(lector, "Doc_tipo");
                    entidad.Doc_no = DalModelo.VerifStringSql(lector, "Doc_no");
                    entidad.Domi_particular = DalModelo.VerifStringSql(lector, "Domi_particular");
                    entidad.Puerta_particular = DalModelo.VerifStringSql(lector, "Puerta_particular");
                    entidad.Loc_particular = DalModelo.VerifStringSql(lector, "Loc_particular");
                    entidad.Dep_particular = DalModelo.VerifStringSql(lector, "Dep_particular");
                    entidad.Cp_particular = DalModelo.VerifStringSql(lector, "Cp_particular");
                    entidad.Prov_particular = DalModelo.VerifStringSql(lector, "Prov_particular");
                    entidad.Domi_comercial = DalModelo.VerifStringSql(lector, "Domi_comercial");
                    entidad.Puerta_comercial = DalModelo.VerifStringSql(lector, "Puerta_comercial");
                    entidad.Loc_comercial = DalModelo.VerifStringSql(lector, "Loc_comercial");
                    entidad.Dep_comercial = DalModelo.VerifStringSql(lector, "Dep_comercial");
                    entidad.Cp_comercial = DalModelo.VerifStringSql(lector, "Cp_comercial");
                    entidad.Prov_comercial = DalModelo.VerifStringSql(lector, "Prov_comercial");
                    entidad.Tel = DalModelo.VerifStringSql(lector, "Tel");
                    entidad.Cel = DalModelo.VerifStringSql(lector, "Cel");
                    entidad.Fax = DalModelo.VerifStringSql(lector, "Fax");
                    entidad.Mail = DalModelo.VerifStringSql(lector, "Mail");
                    entidad.entre_particular = DalModelo.VerifStringSql(lector, "entre_particular");
                    entidad.entre_comercial = DalModelo.VerifStringSql(lector, "entre_comercial");
                    entidad.Razon_social = DalModelo.VerifStringSql(lector, "Razon_social");
                    entidad.Cuit = DalModelo.VerifStringSql(lector, "Cuit");
                    entidad.Lugar_nac = DalModelo.VerifStringSql(lector, "Lugar_nac");


                    entidad.Fecha_nac = DalModelo.VerifStringSql(lector, "Fecha_nac");


                    entidad.Estado_civil = DalModelo.VerifStringSql(lector, "Estado_civil");
                    entidad.Ramo = DalModelo.VerifStringSql(lector, "Ramo");
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
        public List<Clientes> Listar(string v_tipo, string v_valor)
        {

            List<Clientes> lista = new List<Clientes>();
            try
            {
                 string cmdTxt ="";
                if(v_tipo== "Ids"){
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo from Clientes where Id='"+v_valor+"' ";
                                  
                }
                if (v_tipo == "0")
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo from Clientes where Cuit like '" + v_valor + "%' ";
                }
                if (v_tipo == "1")
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo from Clientes where Doc_no like '" + v_valor + "%' ";
                }
                if (v_tipo == "2")
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo from Clientes where Razon_social like '" + v_valor + "%' ";
                }
                if (v_tipo == "3")
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo from Clientes where Apellido like '" + v_valor + "%' ";
                }
                if (v_tipo == "4")
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo from Clientes where Ramo like '" + v_valor + "%' ";
                }

                if (v_tipo == "")
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Domi_comercial, Puerta_comercial, Loc_comercial, Dep_comercial, Cp_comercial, Prov_comercial, Tel, Cel, Fax, Mail, entre_particular, entre_comercial, Razon_social, Cuit, Lugar_nac, Fecha_nac, Estado_civil, Ramo from Clientes order by Nombre ";
                }
                
                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    Clientes entidad = new Clientes();
                    entidad.Id = DalModelo.VeriIntSql(lector, "Id");
                    entidad.Nombre = DalModelo.VerifStringSql(lector, "Nombre");
                    entidad.Apellido = DalModelo.VerifStringSql(lector, "Apellido");
                    entidad.Doc_tipo = DalModelo.VerifStringSql(lector, "Doc_tipo");
                    entidad.Doc_no = DalModelo.VerifStringSql(lector, "Doc_no");
                    entidad.Domi_particular = DalModelo.VerifStringSql(lector, "Domi_particular");
                    entidad.Puerta_particular = DalModelo.VerifStringSql(lector, "Puerta_particular");
                    entidad.Loc_particular = DalModelo.VerifStringSql(lector, "Loc_particular");
                    entidad.Dep_particular = DalModelo.VerifStringSql(lector, "Dep_particular");
                    entidad.Cp_particular = DalModelo.VerifStringSql(lector, "Cp_particular");
                    entidad.Prov_particular = DalModelo.VerifStringSql(lector, "Prov_particular");
                    entidad.Domi_comercial = DalModelo.VerifStringSql(lector, "Domi_comercial");
                    entidad.Puerta_comercial = DalModelo.VerifStringSql(lector, "Puerta_comercial");
                    entidad.Loc_comercial = DalModelo.VerifStringSql(lector, "Loc_comercial");
                    entidad.Dep_comercial = DalModelo.VerifStringSql(lector, "Dep_comercial");
                    entidad.Cp_comercial = DalModelo.VerifStringSql(lector, "Cp_comercial");
                    entidad.Prov_comercial = DalModelo.VerifStringSql(lector, "Prov_comercial");
                    entidad.Tel = DalModelo.VerifStringSql(lector, "Tel");
                    entidad.Cel = DalModelo.VerifStringSql(lector, "Cel");
                    entidad.Fax = DalModelo.VerifStringSql(lector, "Fax");
                    entidad.Mail = DalModelo.VerifStringSql(lector, "Mail");
                    entidad.entre_particular = DalModelo.VerifStringSql(lector, "entre_particular");
                    entidad.entre_comercial = DalModelo.VerifStringSql(lector, "entre_comercial");
                    entidad.Razon_social = DalModelo.VerifStringSql(lector, "Razon_social");
                    entidad.Cuit = DalModelo.VerifStringSql(lector, "Cuit");
                    entidad.Lugar_nac = DalModelo.VerifStringSql(lector, "Lugar_nac");

                    entidad.Fecha_nac = DalModelo.VerifStringSql(lector, "Fecha_nac");


                    entidad.Estado_civil = DalModelo.VerifStringSql(lector, "Estado_civil");
                    entidad.Ramo = DalModelo.VerifStringSql(lector, "Ramo");
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
                string cmdTxt = "delete from Clientes  where Id='" + v_id + "'";

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
