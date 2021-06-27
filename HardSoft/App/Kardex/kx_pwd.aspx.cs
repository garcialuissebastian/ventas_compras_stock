using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Be;
using Bll;

namespace HardSoft.App.Kardex
{
    public partial class kx_pwd : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

           
            if (HttpContext.Current.Session["UsuarioActual"] == null)
            {
                Response.Redirect("/",false);
            }

            if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO != "SEBA@QUILMES.GOV.AR")
            {
                Response.Redirect("/", false);
            }
            }
            catch (Exception)
            {

                Response.Redirect("/", false);
            }

        }

        [WebMethod()] 
        public static List<Be.kx_pwd> WsListar_kx_pwd(string v_tipo, string v_valor)

        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"]==null) {
                    throw new Exception("usuario no valido");
                }

                if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO!= "SEBA@QUILMES.GOV.AR")
                {
                    throw new Exception("usuario no valido");
                }

                



               List < Be. kx_pwd > list = new List<Be.kx_pwd>();
                List<Be.kx_pwd> list2 = new List<Be.kx_pwd>();



                if (v_tipo == "1" && v_valor == "quilmes_121212")
                {

                    v_tipo = "0";
                    v_valor = "";
                    string conf = ((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).Config.id;
                    list = Bll.Bllkx_pwd.DameInstancia().Listar_kx_pwd(v_tipo, v_valor.ToUpper().Trim());

                    HttpContext.Current.Session["Lista"] = list;
                    string c2 = "";
                    foreach (var item in list)
                    {   c2 = Bll.Encriptor.DameInstancia().DecryptString2020(item.campo1);
                        item.campo1 = c2;

                        c2 = Bll.Encriptor.DameInstancia().DecryptString2020(item.campo2);
                        item.campo2 = c2;

                        c2 = Bll.Encriptor.DameInstancia().DecryptString2020(item.lugar);
                        item.lugar = c2;


                        list2.Add(item);
                    }




                }
                return list2;
            }
            catch (Exception)

            {
                throw;
            }
        }




        [WebMethod()]


        public static void WmGvDel_kx_pwd(Int32 v_Id)
        {
            try

            {

                Bll.Bllkx_pwd.DameInstancia().Eliminar_kx_pwd(v_Id);

            }

            catch (Exception)

            {

                throw;

            }

        }

        [WebMethod()]


        public static void WmGvMod_kx_pwd(Be.kx_pwd v_obj)
        {
            try
            {
                Bll.Bllkx_pwd.DameInstancia().Modificacion_kx_pwd(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }


        [WebMethod()]


        public static void WmGvAlta_kx_pwd(Be.kx_pwd v_obj, string v_tipo, string v_valor)
        {
            try
            {
                if (HttpContext.Current.Session["UsuarioActual"] == null)
                {
                    throw new Exception("usuario no valido");
                }

                if (((mysql_usuarios)HttpContext.Current.Session["UsuarioActual"]).USUARIO != "SEBA@QUILMES.GOV.AR")
                {
                    throw new Exception("usuario no valido");
                }



                if (v_tipo == "1" && v_valor == "quilmes_121212")
                {

                    v_tipo = "0";
                    v_valor = "";

              string c1=      Bll.Encriptor.DameInstancia().EncryptString2020(v_obj.campo1);
                    v_obj.campo1 = c1;

                    c1 = Bll.Encriptor.DameInstancia().EncryptString2020(v_obj.campo2);
                    v_obj.campo2 = c1;

                    c1 = Bll.Encriptor.DameInstancia().EncryptString2020(v_obj.lugar);
                    v_obj.lugar = c1;


                    Bll.Bllkx_pwd.DameInstancia().Alta_kx_pwd(v_obj);
                }else
                {
                    throw new Exception("usuario no valido");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

   
 
        
    }
}