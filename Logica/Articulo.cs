using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class Articulo
    {
        Datos.Articulo objDatos = new Datos.Articulo();

        public DataTable TraerTodos()
        {
            return objDatos.traerTodos();
        }
        public void SumaArticulo(Entidades.Articulo articulo, int intId)
        {
            objDatos.SumaArticulo(articulo, intId);
        }
        public void RestaArticulo(Entidades.Articulo articulo, int intId)
        {
            objDatos.RestaArticulo(articulo, intId);
        }


    }
}
