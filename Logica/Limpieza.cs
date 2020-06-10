using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class Limpieza
    {

        Datos.Limpieza objDatos = new Datos.Limpieza();
        
        public void Agregar(Entidades.Limpieza limpieza)
        {
            objDatos.Agregar(limpieza);
        }
        public void Eliminar(int id)
        {
            objDatos.Eliminar(id);
        }
        public DataTable TraerTodos()
        {
            return objDatos.TraerTodos();
        }



    }
}
