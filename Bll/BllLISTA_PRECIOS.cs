using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using Dal;
namespace Bll
{
    public class BllLISTA_PRECIOS
    {
        private Dal.DalLISTA_PRECIOS _mapeador;

        public BllLISTA_PRECIOS()
        {
            _mapeador = new DalLISTA_PRECIOS();
        }

        private static BllLISTA_PRECIOS instancia = null;

        public static BllLISTA_PRECIOS DameInstancia()
        {
            if (instancia == null)
            {
                return new BllLISTA_PRECIOS();
            }
            else
            {
                return instancia;
            }
        }

        public void Actividad(string v_id, string v_tipo)
        {
            try
            {
                this._mapeador.Actividad(  v_id,  v_tipo);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public string Stock_p(string Ids)
        {

            try
            {
                return this._mapeador.Stock_p(Ids);
            }
            catch (Exception)
            {
                throw;
            }

        }
        
          public double Precio(string Ids)
        {

            try
            {
              return  this._mapeador. Precio( Ids);
            }
            catch (Exception)
            {
                throw;
            }

        }
           
        public void Alta(LISTA_PRECIOS v_obj)
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
        public void Modificacion(LISTA_PRECIOS v_obj)
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
          public LISTA_PRECIOS Listar(string v_valor)
        {
            try
            {
                return this._mapeador.Listar(  v_valor);
            }
            catch (Exception)
            {
                throw;
            }

        }
            public List<LISTA_PRECIOS> Listar(string v_tipo, string v_valor)
        {
            try
            {
                return this._mapeador.Listar (  v_tipo,   v_valor);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<LISTA_PRECIOS> Listar()
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
