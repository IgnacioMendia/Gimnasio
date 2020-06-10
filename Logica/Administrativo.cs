using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class Administrativo
    {
        Datos.Administrativo objDatos = new Datos.Administrativo();
        public void Agregar(Entidades.Administrativo administrativo)
        {
            objDatos.Agregar(administrativo);
        }

        public void Eliminar(int intID)
        {
            objDatos.Eliminar(intID);
        }

        public DataTable TraerTodos()
        {
            return objDatos.TraerTodos();
        }







    }
}
