﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace Dal
{
    interface IMapeadorCRUD<T, F>
    {
      
        bool Agregar(T valor);
        bool Modificar(T valor);
        bool Eliminar(T valor);
        List<T> Listar(F filtro);
        T ConsultarUno(F filtro);
    }
}
