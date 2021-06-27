using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Be;
using Dal;
using System.Data;
namespace Bll
{
    public class Bllordenes_servicio
    {
        private Dal.Dalordenes_servicio _mapeador;

        public Bllordenes_servicio()
        {
            _mapeador = new Dalordenes_servicio();
        }

        private static Bllordenes_servicio instancia = null;

        public static Bllordenes_servicio DameInstancia()
        {
            if (instancia == null)
            {
                return new Bllordenes_servicio();
            }
            else
            {
                return instancia;
            }
        }



        public void AltaContraOrden(contraordenes_servicio v_obj)
        {
            try
            {
                this._mapeador.AltaContraOrden(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
          public List<ordenes_servicio> exec(string v_desde ,string v_hasta)
        {
            try
            {
               return this._mapeador.exec(  v_desde , v_hasta);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public contraordenes_servicio ListarIdContra(string ids)
        {
            try
            {
                return this._mapeador.ListarIdContra(ids);
            }
            catch (Exception)
            {
                throw;
            }

        }
         public  ordenes_servicio ListarId(string ids)
        {
            try
            {
               return this._mapeador.ListarId(ids);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void ModificacionContraOrden(contraordenes_servicio v_obj)
        {
            try
            {
                this._mapeador.ModificacionContraOrden(v_obj);
            }
            catch (Exception)
            {
                throw;
            }

        }
         public DataTable Rp(string ids) {

             try
             {
                return this._mapeador.Rp(ids);
             }
             catch (Exception)
             {
                 throw;
             }

         }
         public DataTable Rp2(string ids)
         {

             try
             {
                 return this._mapeador.Rp2(ids);
             }
             catch (Exception)
             {
                 throw;
             }

         }
        public void EliminarListarContraOrden(Int32 v_id)
        {
            try
            {
                this._mapeador.EliminarListarContraOrden( v_id);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<contraordenes_servicio> ListarContraOrdenListar(string v_tipo, string v_valor)
       
        {
            try
            {
           
        return     this._mapeador.ListarContraOrdenListar(  v_tipo,  v_valor);
          
    }
            catch (Exception)
            {
                throw;
            }

        }
        public   void Alta(ordenes_servicio v_obj)
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

        public Int32 WsExisteDocPersonas(string doc, string user)
        {
            try
            {
                return this._mapeador.WsExisteDocPersonas(doc, user);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public Int32 WsExisteDoc(string doc, string user)
        {
            try
            {
              return  this._mapeador.WsExisteDoc(doc,user);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public void Modificacion(ordenes_servicio v_obj)
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

        public List<ordenes_servicio> Listar()
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
    
        
         public List<ordenes_servicio> Listar(string v_tipo, string v_valor)
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
