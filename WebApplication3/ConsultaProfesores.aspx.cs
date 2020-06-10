using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class ConsultaProfesores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TraerTodos();
        }


        public void TraerTodos()
        {
            Logica.Profesor objLogica = new Logica.Profesor();
            gvProfesores.DataSource = objLogica.TraerTodos();
            gvProfesores.DataBind();
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(lblID.Text);
            Logica.Profesor objLogica = new Logica.Profesor();
            objLogica.Eliminar(Id);
            objLogica.TraerTodos();
        }

        protected void gvProfesores_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow filaSeleccionada = gvProfesores.SelectedRow;
            lblID.Text = filaSeleccionada.Cells[1].Text;
        }
    }
}