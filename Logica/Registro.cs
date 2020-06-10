using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class Registro
    {
        Datos.Registro objRegistro = new Datos.Registro();

        public void AgregarRegistro(Entidades.Registro registro)
        {
            objRegistro.AgregarRegistro(registro);
        }
        public void PrecioFinal(Entidades.Registro registro,int intId)
        {
            objRegistro.PrecioFinal(registro,intId);
        }
    }
}
