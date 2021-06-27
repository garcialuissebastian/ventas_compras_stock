using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using System.Data.SqlClient;

namespace Dal
{
    public class DalPERSONAL
    {

        private ConectarSqlDB cnn = new ConectarSqlDB();

        SqlCommand cmm;

        public void Alta(PERSONAL v_obj)
        {
            try
            {
                string cmdTxt = " insert into PERSONAL (Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil) values ('" + v_obj.Nombre + "', '" + v_obj.Apellido + "', '" + v_obj.Doc_tipo + "', '" + v_obj.Doc_no + "', '" + v_obj.Domi_particular + "', '" + v_obj.Puerta_particular + "', '" + v_obj.Loc_particular + "', '" + v_obj.Dep_particular + "', '" + v_obj.Cp_particular + "', '" + v_obj.Prov_particular + "', '" + v_obj.Tel + "', '" + v_obj.Cel + "', '" + v_obj.Fax + "', '" + v_obj.Mail + "', '" + v_obj.entre_particular + "', '" + v_obj.Puesto + "',   '" + v_obj.Lugar_nac + "', convert(datetime, '" + v_obj.Fecha_nac + "', 103), convert(datetime,'" + v_obj.Fecha_ing + "', 103), '" + v_obj.Estado_civil + "')  ";

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

        public List<PERSONAL> Listar(string v_tipo, string v_valor)
        {

            List<PERSONAL> lista = new List<PERSONAL>();
            try
            {
                string cmdTxt = "";
                if (v_tipo == "Ids")
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL where Id='" + v_valor + "' ";

                }

                if (v_tipo == "0")
                {
                    cmdTxt = "  select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL where Nombre like '" + v_valor + "%' ";

                }

                if (v_tipo == "1")
                {
                    cmdTxt = "  select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL where Apellido like '" + v_valor + "%' ";

                }

                if (v_tipo == "2")
                {
                    cmdTxt = "  select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL where Doc_no = '" + v_valor + "' ";

                }
                if (string.IsNullOrEmpty(v_tipo) && string.IsNullOrEmpty(v_valor))
                {
                    cmdTxt = "select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL order by Nombre ";

                }

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    PERSONAL entidad = new PERSONAL();
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
                    entidad.Tel = DalModelo.VerifStringSql(lector, "Tel");
                    entidad.Cel = DalModelo.VerifStringSql(lector, "Cel");
                    entidad.Fax = DalModelo.VerifStringSql(lector, "Fax");
                    entidad.Mail = DalModelo.VerifStringSql(lector, "Mail");
                    entidad.entre_particular = DalModelo.VerifStringSql(lector, "entre_particular");
                    entidad.Puesto = DalModelo.VerifStringSql(lector, "Puesto");
                    entidad.Lugar_nac = DalModelo.VerifStringSql(lector, "Lugar_nac");
                    entidad.Fecha_nac = (Convert.ToDateTime(lector[ "Fecha_nac"]).ToString("dd/MM/yyyy"));
                    entidad.Fecha_ing = (Convert.ToDateTime(lector["Fecha_ing"]).ToString("dd/MM/yyyy"));
                    entidad.Estado_civil = DalModelo.VerifStringSql(lector, "Estado_civil");
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

        public void Modificacion(PERSONAL v_obj)
        {
            try
            {
                string cmdTxt = "update PERSONAL set Nombre='" + v_obj.Nombre + "' , Apellido='" + v_obj.Apellido + "' , Doc_tipo='" + v_obj.Doc_tipo + "' , Doc_no='" + v_obj.Doc_no + "' , Domi_particular='" + v_obj.Domi_particular + "' , Puerta_particular='" + v_obj.Puerta_particular + "' , Loc_particular='" + v_obj.Loc_particular + "' , Dep_particular='" + v_obj.Dep_particular + "' , Cp_particular='" + v_obj.Cp_particular + "' , Prov_particular='" + v_obj.Prov_particular + "' , Tel='" + v_obj.Tel + "' , Cel='" + v_obj.Cel + "' , Fax='" + v_obj.Fax + "' , Mail='" + v_obj.Mail + "' , entre_particular='" + v_obj.entre_particular + "' , Puesto='" + v_obj.Puesto + "' , Lugar_nac='" + v_obj.Lugar_nac + "' , Fecha_nac='" + v_obj.Fecha_nac + "' , Fecha_ing='" + v_obj.Fecha_ing + "' , Estado_civil='" + v_obj.Estado_civil + "' where id ='" + v_obj.Id + "'   ";

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

        public List<PERSONAL> Listar()
        {

            List<PERSONAL> lista = new List<PERSONAL>();
            try
            {



                string cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL  ";

                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    PERSONAL entidad = new PERSONAL();
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
                    entidad.Tel = DalModelo.VerifStringSql(lector, "Tel");
                    entidad.Cel = DalModelo.VerifStringSql(lector, "Cel");
                    entidad.Fax = DalModelo.VerifStringSql(lector, "Fax");
                    entidad.Mail = DalModelo.VerifStringSql(lector, "Mail");
                    entidad.entre_particular = DalModelo.VerifStringSql(lector, "entre_particular");
                    entidad.Puesto = DalModelo.VerifStringSql(lector, "Puesto");
                    entidad.Lugar_nac = DalModelo.VerifStringSql(lector, "Lugar_nac");
                    entidad.Fecha_nac = DalModelo.VerifStringSql(lector, "Fecha_nac");
                    entidad.Fecha_ing = DalModelo.VerifStringSql(lector, "Fecha_ing");
                    entidad.Estado_civil = DalModelo.VerifStringSql(lector, "Estado_civil");
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

        public List<PERSONAL> ListarCobrador(string ids)
        {

            List<PERSONAL> lista = new List<PERSONAL>();
            try
            {
                string cmdTxt;

                if (!string.IsNullOrEmpty(ids))
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL    where Puesto = (SELECT Id FROM PUESTOS P where Nombre ='COBRADOR') and Id='" + ids + "'";


                }
                else
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL    where Puesto = (SELECT Id FROM PUESTOS P where Nombre ='COBRADOR') ";


                }


                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    PERSONAL entidad = new PERSONAL();
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
                    entidad.Tel = DalModelo.VerifStringSql(lector, "Tel");
                    entidad.Cel = DalModelo.VerifStringSql(lector, "Cel");
                    entidad.Fax = DalModelo.VerifStringSql(lector, "Fax");
                    entidad.Mail = DalModelo.VerifStringSql(lector, "Mail");
                    entidad.entre_particular = DalModelo.VerifStringSql(lector, "entre_particular");
                    entidad.Puesto = DalModelo.VerifStringSql(lector, "Puesto");
                    entidad.Lugar_nac = DalModelo.VerifStringSql(lector, "Lugar_nac");
                    entidad.Fecha_nac = DalModelo.VerifStringSql(lector, "Fecha_nac");
                    entidad.Fecha_ing = DalModelo.VerifStringSql(lector, "Fecha_ing");
                    entidad.Estado_civil = DalModelo.VerifStringSql(lector, "Estado_civil");
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

        public List<PERSONAL> ListarVendedores(  string ids)
        {

            List<PERSONAL> lista = new List<PERSONAL>();
            try
            {
                string cmdTxt;

                if (!string.IsNullOrEmpty(ids))
                {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL    where Puesto = (SELECT Id FROM PUESTOS P where Nombre ='VENDEDOR') and Id='"+ids+"'";


                }
                else {
                    cmdTxt = " select Id,Nombre, Apellido, Doc_tipo, Doc_no, Domi_particular, Puerta_particular, Loc_particular, Dep_particular, Cp_particular, Prov_particular, Tel, Cel, Fax, Mail, entre_particular, Puesto, Lugar_nac, Fecha_nac, Fecha_ing, Estado_civil from PERSONAL    where Puesto = (SELECT Id FROM PUESTOS P where Nombre ='VENDEDOR') ";

                
                }

               
                cmm = cnn.CrearNuevoComando(cmdTxt);

                SqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {

                    PERSONAL entidad = new PERSONAL();
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
                    entidad.Tel = DalModelo.VerifStringSql(lector, "Tel");
                    entidad.Cel = DalModelo.VerifStringSql(lector, "Cel");
                    entidad.Fax = DalModelo.VerifStringSql(lector, "Fax");
                    entidad.Mail = DalModelo.VerifStringSql(lector, "Mail");
                    entidad.entre_particular = DalModelo.VerifStringSql(lector, "entre_particular");
                    entidad.Puesto = DalModelo.VerifStringSql(lector, "Puesto");
                    entidad.Lugar_nac = DalModelo.VerifStringSql(lector, "Lugar_nac");
                    entidad.Fecha_nac = DalModelo.VerifStringSql(lector, "Fecha_nac");
                    entidad.Fecha_ing = DalModelo.VerifStringSql(lector, "Fecha_ing");
                    entidad.Estado_civil = DalModelo.VerifStringSql(lector, "Estado_civil");
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
                string cmdTxt = "delete from PERSONAL  where Id='" + v_id + "'";

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
