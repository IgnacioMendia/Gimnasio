using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class ConsultaStock : System.Web.UI.Page
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
            Logica.Articulo objLogica = new Logica.Articulo();
            gvStock.DataSource = objLogica.TraerTodos();
            gvStock.DataBind();
        }





    }
}