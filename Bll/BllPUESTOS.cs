using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using Dal;
namespace Bll
{
    public class BllPUESTOS
    {
        private Dal.DalPUESTOS _mapeador;

        public BllPUESTOS()
        {
            _mapeador = new DalPUESTOS();
        }

        private static BllPUESTOS instancia = null;

        public static BllPUESTOS DameInstancia()
        {
            if (instancia == null)
            {
                return new BllPUESTOS();
            }
            else
            {
                return instancia;
            }
        }

        public List<PUESTOS> Listar(string v_tipo, string v_valor)
        {
            try
            {
                return this._mapeador.Listar(v_tipo, v_valor);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void Alta(PUESTOS v_obj)
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
        public void Modificacion(PUESTOS v_obj)
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

        public List<PUESTOS> Listar()
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
}
