using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Profesores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TraerActividad();
        }

        Logica.Profesor objLogica = new Logica.Profesor();
        
        Logica.Actividad objLogicaActividad = new Logica.Actividad();

        public void TraerActividad()
        {
            ddlActividad.DataSource = objLogicaActividad.TraerActividad();
            ddlActividad.DataTextField = "NombreActividad";
            ddlActividad.DataValueField = "IdActividad";
            ddlActividad.DataBind();
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Entidades.Profesor objEntidades = new Entidades.Profesor();

            objEntidades.Apellido = txtApellido.Text;
            objEntidades.Nombre = txtNombre.Text;
            objEntidades.FechaContratacion = FechaContratacion.SelectedDate;
            objEntidades.Titulo = txtTitulo.Text;
            Entidades.Actividad objEntidadesActividad = new Entidades.Actividad();
            objEntidadesActividad.IdActividad =Convert.ToInt32(ddlActividad.SelectedValue);
            objEntidades.actividad = objEntidadesActividad;
            
            

            objLogica.Agregar(objEntidades);
            lblMensaje.Text = "Profesor agregado";
            

            txtApellido.Text = "";
            txtNombre.Text = "";           
            txtTitulo.Text = "";
            
        }
    }
}