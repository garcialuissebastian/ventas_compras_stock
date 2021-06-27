using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using Dal;

namespace Bll
{
    public class BllPERSONAL
    {
        private Dal.DalPERSONAL _mapeador;

        public BllPERSONAL()
        {
            _mapeador = new DalPERSONAL();
        }

        private static BllPERSONAL instancia = null;

        public static BllPERSONAL DameInstancia()
        {
            if (instancia == null)
            {
                return new BllPERSONAL();
            }
            else
            {
                return instancia;
            }
        }



        public void prueba() {


            int i = 0;

            int b = 0;

            int s = i / b;
        
        
        }
        
        
        
        
        public List<PERSONAL> ListarCobrador(string ids)
        {
            try
            {
               return this._mapeador.ListarCobrador(ids);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void Alta(PERSONAL v_obj)
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
        public void Modificacion(PERSONAL v_obj)
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

            public List<PERSONAL> ListarVendedores(  string ids)
        {
            try
            {
                return this._mapeador.ListarVendedores(   ids);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<PERSONAL> Listar(string v_tipo, string v_valor)
        {
            try
            {
                return this._mapeador. Listar(  v_tipo, v_valor);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<PERSONAL> Listar()
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
