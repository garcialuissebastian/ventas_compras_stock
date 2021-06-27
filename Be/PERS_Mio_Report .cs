using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Be
{
  public  class PERS_Mio_Report
  {
   //
      public Int32 Id { get; set; }
      public string Nombre { get; set; }
      public string Fecha { get; set; }
      public string Entrada { get; set; }
      public string Salida { get; set; }
      public string Entro { get; set; }
      public string Salio { get; set; }
      public string Horario { get; set; }
      public string Tarde { get; set; }
      public string Temprano { get; set; }
      public string HsExt { get; set; }
      public string DebeEnt { get; set; }
      public string DebeSal { get; set; }
      public string Falta { get; set; }
      public string TieTrabajado { get; set; }
      public string Lugar { get; set; }
      public string Jornada { get; set; }
      public string Empleado { get; set; }

      public string Incidencia{ get; set; }
    }

  public class PERS_DEPARTAMENTOS {
      public Int32 id { get; set; }
      public Int32 nivel { get; set; }

      public Int32 idPadre{ get; set; }
      public string text { get; set; }

        public string Auxiliar { get; set; }

        public string  Codigo { get; set; }
        public string Nombre { get; set; }

        string v_icon = "glyphicon glyphicon-minus";

      public string  icon
      {
          get { return v_icon; }
          set { v_icon = value; }
      }
    

      List<Be.PERS_DEPARTAMENTOS> Item1 = new List<Be.PERS_DEPARTAMENTOS>();

      public List<Be.PERS_DEPARTAMENTOS> children
      {
          get { return Item1; }
          set { Item1 = value; }
      }


      state Item2 = new state();

      public state state
      {
          get { return Item2; }
          set { Item2 = value; }
      }


      public void addHijos(Be.PERS_DEPARTAMENTOS v_dep) {
          Item1.Add(v_dep);
      }

    

      public PERS_DEPARTAMENTOS inverter(DataRow ids)
      {
          try
          {
              PERS_DEPARTAMENTOS pp = new PERS_DEPARTAMENTOS();
              pp.id = Convert.ToInt32(ids["DEPTID"]);

              pp.nivel = Convert.ToInt32(ids["NIVEL"]);
              pp.text = Convert.ToString(ids["DEPTNAME"]);
              return pp;
          }
          catch (Exception)
          {

              throw;
          }

      }
      
  }

  public class state
  {

      bool v_text =false;

      public bool selected
      {
          get { return v_text; }
          set { v_text = value; }
      }
      bool v_opened = true;

      public bool opened
      {
          get { return v_opened; }
          set { v_opened = value; }
      }

     
  }
}
