using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dal;
using Be;
using System.Data;
 
namespace Bll
{
  public  class BllClientes
    {
        private Dal.DalClientes _mapeador;

        public BllClientes()
        {
            _mapeador = new DalClientes();
        }

        private static BllClientes instancia = null;

        public static BllClientes DameInstancia()
        {
            if (instancia == null)
            {
                return new BllClientes();
            }
            else
            {
                return instancia;
            }
        }


   public DataSet Buscar_rep(string v_id, string v_nota)
        {
            try
            {
              return  this._mapeador.Buscar_rep(v_id, v_nota);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void Alta(Clientes v_obj)
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
        public void Modificacion(Clientes v_obj)
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

        public List<Clientes> Listar(string v_tipo, string v_valor)
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
        public List<Clientes> Listar()
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
