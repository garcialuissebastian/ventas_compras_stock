using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dal;
using Be;
namespace Bll
{
    public class BllProductos
    {
        private Dal.DalProductos _mapeador;

        public BllProductos()
        {
            _mapeador = new DalProductos();
        }

        private static BllProductos instancia = null;

        public static BllProductos DameInstancia()
        {
            if (instancia == null)
            {
                return new BllProductos();
            }
            else
            {
                return instancia;
            }
        }

          public void Entrada(Int32 id_p, Int32 cant) {
              try
              {
                  this._mapeador. Entrada(id_p,  cant);
              }
              catch (Exception)
              {
                  throw;
              }

          }
        public void Alta(Be.Productos v_obj)
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
        public void Modificacion(Be.Productos v_obj)
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

            public List< Be.Productos> Listar(string v_tipo, string v_valor)
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
            public List<Be.Productos> Listar()
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
