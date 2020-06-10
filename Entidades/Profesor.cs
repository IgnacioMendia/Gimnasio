using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Profesor
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime FechaContratacion { get; set; }
        public string Titulo { get; set; }       
        public int HorasTrabajadas { get; set; }
        public string ActividadPrincipal { get; set; }
        public Actividad actividad { get; set; }
    }
}
