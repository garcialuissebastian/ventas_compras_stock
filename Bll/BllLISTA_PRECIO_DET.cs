using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using Dal;

namespace Bll
{
    public class BllLISTA_PRECIO_DET
    {
        private Dal.DalLISTA_PRECIO_DET _mapeador;

        public BllLISTA_PRECIO_DET()
        {
            _mapeador = new DalLISTA_PRECIO_DET();
        }

        private static BllLISTA_PRECIO_DET instancia = null;

        public static BllLISTA_PRECIO_DET DameInstancia()
        {
            if (instancia == null)
            {
                return new BllLISTA_PRECIO_DET();
            }
            else
            {
                return instancia;
            }
        }

        public void Alta(LISTA_PRECIO_DET v_obj)
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
        public void Modificacion(LISTA_PRECIO_DET v_obj)
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

        public List<LISTA_PRECIO_DET> Listar()
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
