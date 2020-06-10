using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class ConsultaLimpieza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TraerTodos();
            }
        }

        public void TraerTodos()
        {
            Logica.Limpieza objLogica = new Logica.Limpieza();

            gvLimpieza.DataSource=objLogica.TraerTodos();
            gvLimpieza.DataBind();
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            Logica.Limpieza objLogica = new Logica.Limpieza();

            int id =Convert.ToInt32(lblID.Text);
            objLogica.Eliminar(id);
            TraerTodos();
        }

        protected void gvProfesores_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow filaseleccionada = gvLimpieza.SelectedRow;
            lblID.Text = filaseleccionada.Cells[1].Text;
        }
    }
}