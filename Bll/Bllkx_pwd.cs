using Be;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dal;

namespace Bll
{
 
        public class Bllkx_pwd
        {
            private Dal.Dalkx_pwd _mapeador;

            public Bllkx_pwd()
            {
                _mapeador = new Dalkx_pwd();
            }

            private static Bllkx_pwd instancia = null;

            public static Bllkx_pwd DameInstancia()
            {
                if (instancia == null)
                {
                    return new Bllkx_pwd();
                }
                else
                {
                    return instancia;
                }
            }

            public void Alta_kx_pwd(kx_pwd v_obj)

            {
                try
                {
                    this._mapeador.Alta_kx_pwd(v_obj);
                }
                catch (Exception)
                {
                    throw;
                }
            }

            public void Modificacion_kx_pwd(kx_pwd v_obj)

            {
                try
                {
                    this._mapeador.Modificacion_kx_pwd(v_obj);
                }
                catch (Exception)
                {
                    throw;
                }
            }

            public List<kx_pwd> Listar_kx_pwd(string v_tipo, string v_valor)


            {
                try
                {
                    return this._mapeador.Listar_kx_pwd(v_tipo, v_valor);
                }
                catch (Exception)
                {
                    throw;
                }
            }

            public void Eliminar_kx_pwd(Int32 v_id)

            {
                try
                {
                    this._mapeador.Eliminar_kx_pwd(v_id);
                }
                catch (Exception)
                {
                    throw;
                }
            }

        }



 
}
