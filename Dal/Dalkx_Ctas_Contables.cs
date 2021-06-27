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
 public   class Dalkx_Contable
    {
        MySqlConectarSqlDBVarias cnn = new MySqlConectarSqlDBVarias("kardex");

        MySqlCommand cmm;
        MySqlConnection cnn2 = new MySqlConnection();

        public List<Be.pais> ListarCtas(string v_conf)
        {

            List<pais> lista = new List<pais>();
            try
            {
                string cmdTxt = "";

               
                    cmdTxt = " select Id,concat( Codigo,' ',Nombre ,' (', ifnull(Tipo,'') ,')')  Nombre,esCuenta from kx_ctas_contables where   Estado=1 and Conf='" + v_conf + "' and esCuenta='SI' order by Id ";

               

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    pais entidad = new pais();
                    entidad.Id = Convert.ToInt32(DalModelo.VerifStringMysql(lector, "Id"));
                    entidad.nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.anulado = DalModelo.VerifStringMysql(lector, "esCuenta");
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

        public List<Be.pais> ListarCtasOrdenCodigo(string v_conf)
        {

            List<pais> lista = new List<pais>();
            try
            {
                string cmdTxt = "";


                cmdTxt = " select Codigo Id,concat( Codigo,' - ',Nombre ,' (', ifnull(Tipo,'') ,')')  Nombre,esCuenta from kx_ctas_contables where   Estado=1 and Conf='" + v_conf + "' and esCuenta='SI' order by cast( Codigo as UNSIGNED)";



                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    pais entidad = new pais();
                    entidad.Id = Convert.ToInt32(DalModelo.VerifStringMysql(lector, "Id"));
                    entidad.nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.anulado = DalModelo.VerifStringMysql(lector, "esCuenta");
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

        public List<Be.pais> ListarCtasOaa(string v_conf)
        {

            List<pais> lista = new List<pais>();
            try
            {
                string cmdTxt = "";


                cmdTxt = " select Id,concat( Codigo,' ',Nombre ,' (', ifnull(Tipo,'') ,')')  Nombre,esCuenta,ifnull(Tipo,'') Tipo from kx_ctas_contables where   Estado=1 and Conf='" + v_conf + "' and esCuenta='SI' order by Id ";



                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    pais entidad = new pais();
                    entidad.Id = Convert.ToInt32(DalModelo.VerifStringMysql(lector, "Id"));
                    entidad.nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.anulado = DalModelo.VerifStringMysql(lector, "Tipo");
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

        public List<Be.pais> ListarCtasOaaHijos(string v_conf, string v_padre)
        { 
            List<pais> lista = new List<pais>();
            try
            {
                string cmdTxt = ""; 
                cmdTxt = "";

                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                 
                cmm = null;
                cmdTxt = "Reporte_ctas_contables_hijas";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_conf", v_conf);
                cnn.AgregarParametroAComando(cmm, "v_Ctapadre", v_padre);

                cmm.ExecuteNonQuery();
                 
                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    pais entidad = new pais();
                    entidad.Id = Convert.ToInt32(DalModelo.VerifStringMysql(lector, "ID"));
                    entidad.nombre = DalModelo.VerifStringMysql(lector, "Codigo") +" "+  DalModelo.VerifStringMysql(lector, "NOMBRE");
                    entidad.anulado = DalModelo.VerifStringMysql(lector, "esCuenta");
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

        public List<pais> Listar_kx_percepciones(string v_conf)
  {

            List<pais> lista = new List<pais>();
            try
            { 
                string cmdTxt = " select Id,Nombre, Contable_Ventas,Contable_Compras, Tributo  from kx_percepciones where Id_config='"+ v_conf + "' order by Nombre ";
 
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                { 
                    pais entidad = new pais();
                    entidad.id_pais = DalModelo.VerifStringMysql(lector, "Id");
                    entidad.nombre = DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.anulado = DalModelo.VerifStringMysql(lector, "Tributo");

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

        public List<Be.pais> ListarCtas(string v_tipo, string v_valor, string v_conf)
        {

            List<pais> lista = new List<pais>();
            try
            {
                string cmdTxt = ""; 

                if (string.IsNullOrEmpty(v_valor))
                {
                    cmdTxt = " select Id, Nombre,esCuenta, Codigo from kx_ctas_contables where   Estado=1 and Conf='" + v_conf + "' order by Id ";

                }

                cmm = cnn.MySqlCrearNuevoComando(cmdTxt);

                MySqlDataReader lector = cnn.ExecuteReader(cmm);

                while (lector.Read())
                {
                    pais entidad = new pais();
                    entidad.Id = Convert.ToInt32(DalModelo.VerifStringMysql(lector, "Id"));
                    entidad.nombre = DalModelo.VerifStringMysql(lector, "Codigo") +" "+DalModelo.VerifStringMysql(lector, "Nombre");
                    entidad.anulado = DalModelo.VerifStringMysql(lector, "esCuenta");
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

        public void mod_cta(string id, string nombre, string idPadre,string esCuenta, string config, string codigo)
        {
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";

               
                    if (idPadre== id) {
                        idPadre = "0"; // Padre ='0' PASIVO,ACTIVO,RESULTADOS, PADRIMONIO NETO
                    }

                //if (esCuenta == "NO")
                //{
                //}

                cmdTxt = "update kx_ctas_contables set  Codigo= '" + codigo + "', Nombre= '" + nombre + "',Padre= '" + idPadre + "', esCuenta= '" + esCuenta + "' , Tipo=tipo_cta_contab('" + idPadre + "','" + config + "'), Aud=NOW() where Id= '" + id + "' and Conf='" + config + "' ";

                cmm = new MySqlCommand(cmdTxt, cnn2);

                cmm.ExecuteNonQuery();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                cnn2.Close();
            }


        }

        public void del_cta(string id, string conf)
        {
            try
            {
                string cmdTxt = "";
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();

                 
                cmdTxt = "SELECT  count(*) cant from kx_ctas_contables where Padre =  '" + id + "' and Estado='1' and Conf='" + conf + "' ";

                cmm = new MySqlCommand(cmdTxt, cnn2);
                PERS_DEPARTAMENTOS entidad = null;
                MySqlDataReader lector = cmm.ExecuteReader();
                while (lector.Read())
                {
                    if (DalModelo.VeriIntMysql(lector, "cant") > 0)
                    {
                        throw new Exception("hay cuentas que dependen de esta cuenta, para seguir, elimine las cuentas que dependan de este.");
                    }

                }
                lector.Close();
                cmm = null;


                //cmdTxt = "SELECT  count(*) cant  FROM  USERINFO  where DEFAULTDEPTID=  '" + id + "' ";

                //cmm = new SqlCommand(cmdTxt, cnn2);
                //lector = null;
                //lector = cmm.ExecuteReader();
                //while (lector.Read())
                //{
                //    if (DalModelo.VeriIntSql(lector, "cant") > 0)
                //    {
                //        throw new Exception("Contiene empleados que dependen de este de departamento, para seguir, cambie de departamento los empledos que dependan de este.");
                //    }

                //}



                lector.Close();
                cmm = null;

                cmdTxt = "update  kx_ctas_contables  set Estado= '0'   where Id= '" + id + "'";

                cmm = new MySqlCommand(cmdTxt, cnn2);

                cmm.ExecuteNonQuery();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                cnn2.Close();
            }


        }

        public void alta_ctas(string idPadre, string nombre, string conf, string esCuenta, string Codigo)
        {
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";

                cmdTxt = "SELECT  max(Id) cant from  kx_ctas_contables  ";

                cmm = new MySqlCommand(cmdTxt, cnn2);
                MySqlDataReader lector = cmm.ExecuteReader();
                int mid = 0;
                while (lector.Read())
                {
                    mid  = DalModelo.VeriIntMysql(lector, "cant") + 1;

                }

                lector.Close();
               


                cmdTxt = "insert into  kx_ctas_contables (Id, Nombre  ,Padre,Conf,esCuenta,Tipo,Codigo) values('" + mid + "','" + nombre + "','" + idPadre + "','" + conf + "','" + esCuenta + "', tipo_cta_contab('" + idPadre + "','" + conf + "'),'" + Codigo+ "' ) ";

                cmm = new MySqlCommand(cmdTxt, cnn2);

                cmm.ExecuteNonQuery();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                cnn2.Close();
            }


        }

        public List<PERS_DEPARTAMENTOS> Ctas_jerquia(string conf)
        {
            try
            {
                cnn2 = cnn.MySqlCrearNuevaConexion();
                cnn2.Open();
                string cmdTxt = "";
                Int32 niveles = 0;
                cmm = null;
                cmdTxt = "Reporte_ctas_contables";
                cmm = cnn.MySqlCrearNuevoComando(cmdTxt, cnn2, "SP");
                cnn.AgregarParametroAComando(cmm, "v_conf", conf);
                cmm.ExecuteNonQuery();
                cmm = null;


                List<PERS_DEPARTAMENTOS> listPrimero = new List<PERS_DEPARTAMENTOS>();
                List<PERS_DEPARTAMENTOS> listSegundo = new List<PERS_DEPARTAMENTOS>();

                cmdTxt = "SELECT  max(NIVEL) cant from Report_cta_contable ";

                cmm = new MySqlCommand(cmdTxt, cnn2);
                MySqlDataReader lector = cmm.ExecuteReader();
                while (lector.Read())
                {
                    niveles = DalModelo.VeriIntMysql(lector, "cant");

                }

                lector.Close();

                for (int i = niveles; i > -1; i--)   // hasta 6 niveles
                {
                    cmdTxt = "SELECT  ID,NOMBRE ,PADRE ,NIVEL, esCuenta, Codigo from Report_cta_contable where NIVEL =  '" + i + "'  ORDER BY  Codigo,NOMBRE  ";

                    if (i == 1)
                    {
                        cmdTxt = "SELECT   ID,NOMBRE ,PADRE ,NIVEL,esCuenta, Codigo from Report_cta_contable where NIVEL =  '" + i + "' ORDER BY  Codigo ,NOMBRE";
                    }
                    cmm = null;
                    cmm = new MySqlCommand(cmdTxt, cnn2);
                    DataSet ds = new DataSet();
                    MySqlDataAdapter  da = new MySqlDataAdapter(cmm);
                    da.Fill(ds);

                    foreach (DataRow dr in ds.Tables[0].Rows) // un nivel anterior
                    {
                        listSegundo.Add(inverter(dr));

                    }// fin forech dr 

                    foreach (var item in listPrimero) // 6      --     5 tiene hijos 6
                    {
                        foreach (var item1 in listSegundo) // 5
                        {
                            if (item.idPadre == item1.id)
                            {
                                // if (i == 0) // nro nivel la raiz 
                                if (item1.Auxiliar == "NO") 
                                    {
                                    item1.icon = " glyphicon glyphicon-triangle-right"; //ico hospi
                                }


                                item1.addHijos(item); // --     5 tiene hijos 6

                            }
                        }

                    }

                    listPrimero = new List<PERS_DEPARTAMENTOS>();
                    listPrimero = listSegundo; // 5 
                    listSegundo = new List<PERS_DEPARTAMENTOS>();
                } //  fin for niveles



                // listPrimero[0].children.Sort((x, y) => x.Codigo.CompareTo(y.Codigo));
                //listPrimero[1].children.Sort((x, y) => x.Codigo.CompareTo(y.Codigo));
                //listPrimero[2].children.Sort((x, y) => x.Codigo.CompareTo(y.Codigo));
                //listPrimero[3].children.Sort((x, y) => x.Codigo.CompareTo(y.Codigo));
                 listPrimero[0].children.OrderBy(p => p.text);
            
               // listPrimero[4].children.OrderBy(p => p.Nombre);
                return listPrimero;


            }
            catch
            {
                throw;
            }
            finally
            {
                cnn2.Close();

            }

        }

        public PERS_DEPARTAMENTOS inverter(DataRow ids)
        {
            try
            {
                PERS_DEPARTAMENTOS pp = new PERS_DEPARTAMENTOS();
                pp.id = Convert.ToInt32(ids["ID"]);
                pp.idPadre = Convert.ToInt32(ids["PADRE"]);
                pp.nivel = Convert.ToInt32(ids["NIVEL"]);
                pp.text = Convert.ToString(ids["Codigo"])+ " "+ Convert.ToString(ids["NOMBRE"]);
                pp.Auxiliar = Convert.ToString(ids["esCuenta"]);
                pp.Codigo = Convert.ToString(ids["Codigo"]);
                pp.Nombre= Convert.ToString(ids["NOMBRE"]);
                return pp;
            }
            catch (Exception)
            {

                throw;
            }

        }

    }
}
