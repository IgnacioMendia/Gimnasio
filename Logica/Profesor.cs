using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class Profesor
    {
        Datos.Profesor objDatos = new Datos.Profesor();
        public DataTable TraerTodos()
        {
            return objDatos.TraerTodos();
        }

        public void Agregar(Entidades.Profesor profesor)
        {
            objDatos.Agregar(profesor);
        }

        public void Eliminar(int Id)
        {
            objDatos.Eliminar(Id);
        }

        public void Modificar(Entidades.Profesor profesor)
        {
            objDatos.Modificar(profesor);
        }
    }
}
