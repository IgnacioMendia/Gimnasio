using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TraerTodos();
                TraerActividades();
            }
        }

        Logica.Alumno objLogica = new Logica.Alumno();
        Logica.Actividad objLogicaActividad = new Logica.Actividad();
        Entidades.Alumno objEntidadesAlumno = new Entidades.Alumno();
        Entidades.Actividad objEntidadActividad = new Entidades.Actividad();

        public void TraerActividades()
        {
            ddlActividad.DataSource = objLogicaActividad.TraerActividad();
            ddlActividad.DataTextField = "NombreActividad";
            ddlActividad.DataValueField = "IdActividad";
            ddlActividad.DataBind();
        }

        public void TraerTodos()
        {           
            gvAlumnos.DataSource = objLogica.TraerTodos();
            gvAlumnos.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            txtNombre.Enabled = true;
            txtApellido.Enabled = true;
            txtFechaIngreso.Enabled = true;
            ddlActividad.Enabled = true;
            lblOpcion.Text = "Nuevo";
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            txtNombre.Enabled = true;
            txtApellido.Enabled = true;
            txtFechaIngreso.Enabled = true;
            ddlActividad.Enabled = true;
            lblOpcion.Text = "Modificar";
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            lblOpcion.Text = "Borrar";
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
             
            string strOpcion = lblOpcion.Text;

            switch (strOpcion)
            {
                case "Nuevo":
                    objEntidadesAlumno.Nombre = txtNombre.Text;
                    objEntidadesAlumno.Apellido = txtApellido.Text;
                    objEntidadesAlumno.FechaIngreso = Convert.ToDateTime(txtFechaIngreso.Text);
                    objEntidadActividad.IdActividad = Convert.ToInt32(ddlActividad.SelectedValue);
                    objEntidadesAlumno.Actividad = objEntidadActividad;

                    objLogica.Agregar(objEntidadesAlumno);
                    txtNombre.Text = "";
                    txtApellido.Text = "";
                    txtFechaIngreso.Text = "";
                    
                    TraerTodos();
                        break;

                case "Modificar":
                    int intId = Convert.ToInt32(lblId.Text);
                    string strNombre = txtNombre.Text;
                    string strApellido = txtApellido.Text;
                    DateTime FechaIngreso = Convert.ToDateTime(txtFechaIngreso.Text);
                    string strActividad = ddlActividad.SelectedValue;
                    objLogica.Modificar(intId,strNombre, strApellido, FechaIngreso, strActividad);
                    txtNombre.Text = "";
                    txtApellido.Text = "";
                    txtFechaIngreso.Text = "";
                   
                    TraerTodos();
                        break;

                case "Borrar":
                    int intId1 = Convert.ToInt32(lblId.Text);
                    objLogica.Eliminar(intId1);
                    txtNombre.Text = "";
                    txtApellido.Text = "";
                    txtFechaIngreso.Text = "";
                    
                    TraerTodos();
                        break;
            }
        }

        protected void gvAlumnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow FilaSeleccionada = gvAlumnos.SelectedRow;
            lblId.Text = FilaSeleccionada.Cells[1].Text;
            txtNombre.Text= FilaSeleccionada.Cells[2].Text;
            txtApellido.Text= FilaSeleccionada.Cells[3].Text;
            txtFechaIngreso.Text = FilaSeleccionada.Cells[4].Text;
            ddlActividad.Text = FilaSeleccionada.Cells[5].Text;
        }
    }
}