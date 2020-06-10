using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AgregrarLimpieza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Entidades.Limpieza objEntidades = new Entidades.Limpieza();
            Logica.Limpieza objLogica = new Logica.Limpieza();

            objEntidades.Nombre = txtNombre.Text;
            objEntidades.Apellido = txtApellido.Text;
            objEntidades.FechaContratacion = FechaContratacion.SelectedDate;

            try
            {
                objLogica.Agregar(objEntidades);
            }
            catch (Exception)
            {

                throw new Exception("Error en la presentacion");
            }

            txtApellido.Text = "";
            txtNombre.Text = "";
            
        }
    }
}