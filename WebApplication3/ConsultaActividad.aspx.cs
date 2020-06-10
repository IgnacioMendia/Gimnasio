using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class ConsultaActividad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TraerActividad();
            }
            
        }

        Logica.Actividad objLogica = new Logica.Actividad();
        Entidades.Actividad objEntidades = new Entidades.Actividad();
        public void TraerActividad()
        {
            gvActividades.DataSource=objLogica.TraerActividad();
            gvActividades.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow FilaSeleccionada = gvActividades.SelectedRow;
            lblId.Text = FilaSeleccionada.Cells[1].Text;
            txtActividad.Text = FilaSeleccionada.Cells[2].Text;
            txtPrecio.Text = FilaSeleccionada.Cells[3].Text;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            txtActividad.Enabled = true;
            txtPrecio.Enabled = true;
            lblOpcion.Text = "Agregar";
            txtActividad.Focus();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            txtActividad.Enabled = true;
            txtPrecio.Enabled = true;
            lblOpcion.Text = "Modificar";
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            lblOpcion.Text = "Eliminar";
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            string strOpcion = lblOpcion.Text;

            switch (strOpcion)
            {
                case "Agregar":
                    objEntidades.NombreActividad = txtActividad.Text;
                    objEntidades.Precio = Convert.ToInt32(txtPrecio.Text);

                    objLogica.Agregar(objEntidades);
                   
                    txtActividad.Text = "";
                    txtPrecio.Text = "";
                    txtActividad.Enabled = false;
                    txtPrecio.Enabled = false;
                   
                    TraerActividad();
                    break;

                case "Modificar":
                    string strNombreActividad = txtActividad.Text;
                    int intPrecio = Convert.ToInt32(txtPrecio.Text);
                    int intId = Convert.ToInt32(lblId.Text);
                   
                    objLogica.Modificar(intId,strNombreActividad,intPrecio);
                   
                    txtActividad.Text = "";
                    txtPrecio.Text = "";
                    txtActividad.Enabled = false;
                    txtPrecio.Enabled = false;
                    
                    TraerActividad();
                    break;

                case "Eliminar":
                    int intId1 = Convert.ToInt32(lblId.Text);
                   
                    objLogica.Eliminar(intId1);
                   
                    txtActividad.Text = "";
                    txtPrecio.Text = "";
                    txtActividad.Enabled = false;
                    txtPrecio.Enabled = false;
                   
                    TraerActividad();
                    break;

                default:
                    break;
            }
        }
    }
}