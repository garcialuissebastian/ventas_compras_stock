using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dal;
using Be;
namespace Bll
{

    public class BllKx_Deposito
    {
        private Dal.DalKx_Deposito _mapeador;

        public BllKx_Deposito()
        {
            _mapeador = new DalKx_Deposito();
        }

        private static BllKx_Deposito instancia = null;

        public static BllKx_Deposito DameInstancia()
        {
            if (instancia == null)
            {
                return new BllKx_Deposito();
            }
            else
            {
                return instancia;
            }
        }

        public void Alta(Kx_Deposito v_obj)
        {
            try
            {
                this._mapeador.Alta(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void Modificacion(Kx_Deposito v_obj)
        {
            try
            {
                this._mapeador.Modificacion(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
        

                 public List<Kx_Deposito> ListarFarmaciaDestino(string v_config, string v_user)
        {
            try
            {
                return this._mapeador.ListarFarmaciaDestino(v_config, v_user);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Kx_Deposito> Listar(string v_tipo, string v_valor, string v_user)
        {
            try
            {
                return this._mapeador.Listar(v_tipo, v_valor, v_user);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Kx_Deposito> Listar()
        {
            try
            {
                return this._mapeador.Listar();
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void Eliminar(Int32 v_id)
        {
            try
            {
                this._mapeador.Eliminar(v_id);
            }
            catch (Exception)
            {
                throw;
            }

        }

    }



    public class Bllkx_cajas
    {
        private Dal.Dalkx_cajas _mapeador;

        public Bllkx_cajas()
        {
            _mapeador = new Dalkx_cajas();
        }

        private static Bllkx_cajas instancia = null;

        public static Bllkx_cajas DameInstancia()
        {
            if (instancia == null)
            {
                return new Bllkx_cajas();
            }
            else
            {
                return instancia;
            }
        }

        public void Alta_kx_cajas(kx_cajas v_obj)

        {
            try
            {
                this._mapeador.Alta_kx_cajas(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Modificacion_kx_cajas(kx_cajas v_obj)

        {
            try
            {
                this._mapeador.Modificacion_kx_cajas(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<kx_cajas> Listar_kx_cajas(string v_tipo, string v_valor, string v_cong)


        {
            try
            {
                return this._mapeador.Listar_kx_cajas(v_tipo, v_valor, v_cong);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Eliminar_kx_cajas(Int32 v_id)

        {
            try
            {
                this._mapeador.Eliminar_kx_cajas(v_id);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }


}
