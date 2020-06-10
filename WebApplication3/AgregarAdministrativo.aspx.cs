using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AgregarAdministrativo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Logica.Administrativo objLogica = new Logica.Administrativo();
            Entidades.Administrativo objEntidades = new Entidades.Administrativo();
            objEntidades.Apellido = txtApellido.Text;
            objEntidades.Nombre = txtNombre.Text;
            objEntidades.FechaContratacion = FechaContratacion.SelectedDate;

            objLogica.Agregar(objEntidades);

            txtApellido.Text = "";
            txtNombre.Text = "";
        }
    }
}