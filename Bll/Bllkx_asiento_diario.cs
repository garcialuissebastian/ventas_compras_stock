using Dal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;

namespace Bll
{



    public class Bllkx_asiento_diario
    {
        private Dal.Dalkx_asiento_diario _mapeador;

        public Bllkx_asiento_diario()
        {
            _mapeador = new Dalkx_asiento_diario();
        }

        private static Bllkx_asiento_diario instancia = null;

        public static Bllkx_asiento_diario DameInstancia()
        {
            if (instancia == null)
            {
                return new Bllkx_asiento_diario();
            }
            else
            {
                return instancia;
            }
        }

        public List<kx_asiento_diario> Buscar_kx_asiento_items(string v_nro)
        {
            try
            {
              return  this._mapeador.Buscar_kx_asiento_items( v_nro);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Alta_kx_asiento_diario(kx_asiento_diario v_obj)

        {
            try
            {
                this._mapeador.Alta_kx_asiento_diario(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Alta_kx_asiento_manual(kx_asiento_diario v_obj)

        {
            try
            {
                this._mapeador.Alta_kx_asiento_manual(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Modificacion_kx_asiento_diario(kx_asiento_diario v_obj)

        {
            try
            {
                this._mapeador.Modificacion_kx_asiento_diario(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Boolean Existe_ctacte_compras(string v_pto, string v_cbte, string v_tipo, string v_config, string v_prov)
        {

            try
            {
                return this._mapeador.Existe_ctacte_compras( v_pto, v_cbte,  v_tipo,   v_config, v_prov);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<kx_CtaCte> Listar_kx_ctacte_compras(string v_tipo, string v_valor, string v_valor1, string v_config)
        {
            try
            {
                return this._mapeador.Listar_kx_ctacte_compras(v_tipo, v_valor, v_valor1, v_config);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<kx_CtaCte> Listar_kx_ctacte_vtas(string v_tipo, string v_valor, string v_valor1, string v_config)
        {
            try
            {
                return this._mapeador.Listar_kx_ctacte_vtas(v_tipo, v_valor, v_valor1, v_config);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<kx_asiento_diario> Listar_kx_asiento_diario(string v_tipo, string v_valor, string v_valor1, string v_conf)
        {
            try
            {
                return this._mapeador.Listar_kx_asiento_diario(v_tipo, v_valor, v_valor1, v_conf);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<kx_asiento_diario> Listar_kx_asiento_diario_MANUAL(string v_tipo, string v_valor, string v_valor1, string v_conf)
        {
            try
            {
                return this._mapeador.Listar_kx_asiento_diario_Manual(v_tipo, v_valor, v_valor1, v_conf);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<kx_asiento_diario> Buscar_Balance(string v_conf, string v_val, string v_val1)
        {
            try
            {
                return this._mapeador.Buscar_Balance(  v_conf, v_val,  v_val1);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Eliminar_kx_asiento_diario(Int32 v_id)

        {
            try
            {
                this._mapeador.Eliminar_kx_asiento_diario(v_id);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Eliminar_kx_asiento_diario_nro(Int32 v_id)

        {
            try
            {
                this._mapeador.Eliminar_kx_asiento_Nro(v_id);
            }
            catch (Exception)
            {
                throw;
            }
        }




    }





}
