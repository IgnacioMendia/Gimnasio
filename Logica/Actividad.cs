using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class Actividad
    {
        Datos.Actividad objDatos = new Datos.Actividad();
        public DataTable TraerActividad()
        {
            return objDatos.TraerActividad();
        }
        public void Agregar(Entidades.Actividad actividad)
        {
            objDatos.Agregar(actividad);
        }
        public void Eliminar(int intId)
        {
            objDatos.Eliminar(intId);
        }
        public void Modificar(int intId,string strNombreActividad, int intPrecio)
        {
            objDatos.Modificar(intId,strNombreActividad,intPrecio);
        }
    }
}
