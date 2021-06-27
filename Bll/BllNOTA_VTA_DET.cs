using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using Dal;
namespace Bll
{
    public class BllNOTA_VTA_DET
    {
        private Dal.DalNOTA_VTA_DET _mapeador;

        public BllNOTA_VTA_DET()
        {
            _mapeador = new DalNOTA_VTA_DET();
        }

        private static BllNOTA_VTA_DET instancia = null;

        public static BllNOTA_VTA_DET DameInstancia()
        {
            if (instancia == null)
            {
                return new BllNOTA_VTA_DET();
            }
            else
            {
                return instancia;
            }
        }

        public void Alta(NOTA_VTA_DET v_obj)
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
        public void Modificacion(NOTA_VTA_DET v_obj)
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

        public void Alta(List<Be.Productos>  v_list)
        {
            try
            {
                this._mapeador.Alta(v_list);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<NOTA_VTA_DET> Listar()
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
