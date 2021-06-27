using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using Dal;
namespace Bll
{
    public class BllPRODUCTO_CATEGORIAS
    {
        private Dal.DalPRODUCTO_CATEGORIAS _mapeador;

        public BllPRODUCTO_CATEGORIAS()
        {
            _mapeador = new DalPRODUCTO_CATEGORIAS();
        }

        private static BllPRODUCTO_CATEGORIAS instancia = null;

        public static BllPRODUCTO_CATEGORIAS DameInstancia()
        {
            if (instancia == null)
            {
                return new BllPRODUCTO_CATEGORIAS();
            }
            else
            {
                return instancia;
            }
        }

        public void Alta(PRODUCTO_CATEGORIAS v_obj)
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
        public void Modificacion(PRODUCTO_CATEGORIAS v_obj)
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

        public List<PRODUCTO_CATEGORIAS> Listar()
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

        public List<PRODUCTO_CATEGORIAS> Listar(string v_tipo, string v_valor)
        {
            try
            {
                return this._mapeador.Listar( v_tipo,   v_valor);
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
