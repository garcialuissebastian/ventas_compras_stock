using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dal;
using Be;
using System.Data;

namespace Bll
{


    public class Bllsueldo
    {
        private Dal.Dalsueldo _mapeador;

        public Bllsueldo()
        {
            _mapeador = new Dalsueldo();
        }

        private static Bllsueldo instancia = null;

        public static Bllsueldo DameInstancia()
        {
            if (instancia == null)
            {
                return new Bllsueldo();
            }
            else
            {
                return instancia;
            }
        }

        public void Alta_sueldo(sueldo v_obj)

        {
            try
            {
                this._mapeador.Alta_sueldo(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Modificacion_sueldo(sueldo v_obj)

        {
            try
            {
                this._mapeador.Modificacion_sueldo(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataSet ReportSueldo(string ids)
        {
            try
            {
                return this._mapeador.ReportSueldo(  ids);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<sueldo> Listar_Benificiario(string v_valor)

        {

            try
            {
                return this._mapeador.Listar_Benificiario(  v_valor);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<sueldo> Listar_sueldo(string v_tipo, string v_valor)


        {
            try
            {
                return this._mapeador.Listar_sueldo(v_tipo, v_valor);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Eliminar_sueldo(Int32 v_id)

        {
            try
            {
                this._mapeador.Eliminar_sueldo(v_id);
            }
            catch (Exception)
            {
                throw;
            }
        }



        public void Alta_sueldo_conceptos(sueldo_conceptos v_obj)

        {
            try
            {
                this._mapeador.Alta_sueldo_conceptos(v_obj);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<sueldo_conceptos> Listar_sueldo_conceptos(string v_tipo, string v_valor)


        {
            try
            {
                return this._mapeador.Listar_sueldo_conceptos(v_tipo, v_valor);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Eliminar_sueldo_conceptos(Int32 v_id)

        {
            try
            {
                this._mapeador.Eliminar_sueldo_conceptos(v_id);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }



}

