using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dal;
using Be;
namespace Bll
{
    public class Bllkx_cajas_mov
    {
        private Dal.Dalkx_cajas_mov _mapeador;

        public Bllkx_cajas_mov()
        {
            _mapeador = new Dalkx_cajas_mov();
        }

        private static Bllkx_cajas_mov instancia = null;

        public static Bllkx_cajas_mov DameInstancia()
        {
            if (instancia == null)
            {
                return new Bllkx_cajas_mov();
            }
            else
            {
                return instancia;
            }
        }

        public string TieneCajaCerrada(string id)

        {
            try
            {
               return this._mapeador.TieneCajaCerrada(  id);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<string> totalCajaCierre(string v_user)

        {
            try
            {
             return   this._mapeador.totalCajaCierre(  v_user);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public string UltimoCierre(string v_user)
        {
            try
            {
               return this._mapeador.UltimoCierre(v_user);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Alta_kx_cajas_mov(kx_cajas_mov v_obj)

        {
            try
            {
                this._mapeador.Alta_kx_cajas_mov(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Modificacion_kx_cajas_mov(kx_cajas_mov v_obj)

        {
            try
            {
                this._mapeador.Modificacion_kx_cajas_mov(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<kx_cajas_ver> Listar_kx_cajas_mov2(string v_mes, string v_anio, string v_conf)


        {
            try
            {


                return this._mapeador.Listar_kx_cajas_mov2(v_mes, v_anio, v_conf);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<kx_cajas_mov> Listar_kx_cajas_mov(string v_id, string v_conf)
        {
            try
            {
                return this._mapeador.Listar_kx_cajas_mov(v_id,  v_conf);
            }
            catch (Exception)
            {
                throw;
            }
        }


        public List<kx_cajas_mov> Listar_kx_cajas_mov(string v_mes, string v_anio, string v_conf)


        {
            try
            {
                return this._mapeador.Listar_kx_cajas_mov(v_mes, v_anio, v_conf);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Eliminar_kx_cajas_mov(Int32 v_id)

        {
            try
            {
                this._mapeador.Eliminar_kx_cajas_mov(v_id);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
