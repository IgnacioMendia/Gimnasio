using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Articulo
    {
        public int Id { get; set; }
        
        public string strDescripcionArticulo { get; set; }
        public int intCantidadDeposito { get; set; }
        public int intCantidadVendida { get; set; }
        public Registro Registro { get; set; }

    }
}
