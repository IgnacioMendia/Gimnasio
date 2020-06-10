using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Registro
    {
        public int intId { get; set; }
        public int intIdProducto { get; set; }
        public int CantidadVendida { get; set; }
        public double dblPrecio { get; set; }
        public DateTime dtFecha { get; set; }
        public string strCliente { get; set; }
        public string strFormaPago { get; set; }
        public Articulo articulo { get; set; }
        public double dblPrecioFinal { get; set; }
    }
}
