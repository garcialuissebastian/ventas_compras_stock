using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using Dal;

namespace Bll
{
  public  class Bllkx_Contable
    {
        private Dal.Dalkx_Contable _mapeador;

        public Bllkx_Contable()
        {
            _mapeador = new Dalkx_Contable();
        }

        private static Bllkx_Contable instancia = null;

        public static Bllkx_Contable DameInstancia()
        {
            if (instancia == null)
            {
                return new Bllkx_Contable();
            }
            else
            {
                return instancia;
            }
        }

        public void mod_cta(string id, string nombre, string idPadre,string esCuenta, string config, string codigo)
        {
            try
            {
                this._mapeador.mod_cta(  id,   nombre,  idPadre,esCuenta,config, codigo);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void del_cta(string id, string conf)
        {
            try
            {
                this._mapeador.del_cta(  id,   conf);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void alta_ctas(string idPadre, string nombre, string conf, string es, string Codigo)
        {
            try
            {
                  this._mapeador.alta_ctas(  idPadre,  nombre, conf, es, Codigo);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.pais> ListarPerc(string conf)
        {
            try
            {
                return this._mapeador.Listar_kx_percepciones(conf);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.pais> ListarCtasHijos(string v_conf, string v_padre)
        {
            try
            {
                return this._mapeador.ListarCtasOaaHijos(v_conf, v_padre);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.pais> ListarCtasOaa(string v_conf)
        {
            try
            {
                return this._mapeador.ListarCtasOaa(v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.pais> ListarCtasOrdenCodigo(string v_conf)
        {
            try
            {
                return this._mapeador.ListarCtasOrdenCodigo(v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.pais> ListarCtas(string v_conf)
        {
            try
            {
                return this._mapeador.ListarCtas(  v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<Be.pais> ListarCtas(string v_tipo, string v_valor, string v_conf)
        {
            try
            {
                return this._mapeador.ListarCtas( v_tipo,   v_valor,  v_conf);
            }
            catch (Exception)
            {
                throw;
            }

        }



        public List<PERS_DEPARTAMENTOS> Ctas_jerquia(string conf)
        {
            try
            {
               return this._mapeador.Ctas_jerquia(conf);
            }
            catch (Exception)
            {
                throw;
            }

        }

    }
}
