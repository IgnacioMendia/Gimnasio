using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Resources;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class Alumno
    {
        Datos.Alumno objDatos = new Datos.Alumno();

        public DataTable TraerTodos()

        {
            return objDatos.TraerTodos();
        }

        public void Agregar(Entidades.Alumno alumno)
        {
            objDatos.Agregar(alumno);
        }

        public void Eliminar(int intId)
        {
            objDatos.Eliminar(intId);
        }

        public void Modificar(int intId, string strNombre, string strApellido, DateTime FechaIngreso, string strActividad)
        {
            objDatos.Modificar(intId,strNombre,strApellido,FechaIngreso,strActividad);
        }
        


    }
}
