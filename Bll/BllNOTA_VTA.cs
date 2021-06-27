using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using Dal;
using System.Data;

namespace Bll
{
    public class BllNOTA_VTA
    {
        private Dal.DalNOTA_VTA _mapeador;

        public BllNOTA_VTA()
        {
            _mapeador = new DalNOTA_VTA();
        }

        private static BllNOTA_VTA instancia = null;

        public static BllNOTA_VTA DameInstancia()
        {
            if (instancia == null)
            {
                return new BllNOTA_VTA();
            }
            else
            {
                return instancia;
            }
        }


           public DataTable SP_ListarCobros_RP(string v_id)
        {
            try
            {
             return   this._mapeador.SP_ListarCobros_RP(v_id);
            }
            catch (Exception)
            {
                throw;
            }

        }
         public void ASIGNAR_COBRADOR(string ID_COBRA, string ID_NOTA)
        {
            try
            {
                this._mapeador.ASIGNAR_COBRADOR( ID_COBRA,  ID_NOTA);
            }
            catch (Exception)
            {
                throw;
            }

        }
          public NOTA_VTA Ultima_nota()
        {
            try
            {
            return    this._mapeador.Ultima_nota();
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Be.Pagos_tmp> SP_ListarCobros(string v_id)
        {
            try
            {
                return this._mapeador.SP_ListarCobros( v_id);
            }
            catch (Exception)
            {
                throw;
            }

        }
           public List<NOTA_VTA_TMP> SP_Listar(string v_id)
        {
            try
            {
                return this._mapeador.SP_Listar(v_id);
            }
            catch (Exception)
            {
                throw;
            }

        }
          public void Pagar(string Id_nota, string Cuota)
        {
            try
            {
                this._mapeador.Pagar( Id_nota,   Cuota);
            }
            catch (Exception)
            {
                throw;
            }

        }
           
        public void Alta(NOTA_VTA v_obj)
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
        public void Modificacion(NOTA_VTA v_obj)
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
        
        public List<NOTA_VTA> Listar(string v_tipo, string v_valor)
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
        public List<NOTA_VTA> Listar()
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
