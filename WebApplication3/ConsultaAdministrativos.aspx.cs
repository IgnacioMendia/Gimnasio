using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class ConsultaAdministrativos : System.Web.UI.Page
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
            Logica.Administrativo objLogica = new Logica.Administrativo();
            gvAdministrativos.DataSource=objLogica.TraerTodos();
            gvAdministrativos.DataBind();
        }
        protected void gvAdministrativos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow filaseleccionada = gvAdministrativos.SelectedRow;
            lblId.Text = filaseleccionada.Cells[1].Text;
        }
        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            Logica.Administrativo objLogica = new Logica.Administrativo();
            int intId =Convert.ToInt32(lblId.Text);
            objLogica.Eliminar(intId);
            TraerTodos();
        }
    }
}