using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class MovimientoStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TraerTodos();
            }
        }

        Logica.Articulo objLogica = new Logica.Articulo();
        Entidades.Articulo objArticulo = new Entidades.Articulo();
        Entidades.Registro objRegistro = new Entidades.Registro();
        Logica.Registro objLogicaRegistro = new Logica.Registro();


        public void TraerTodos()
        {
            gvMovimiento.DataSource = objLogica.TraerTodos();
            gvMovimiento.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow filaseleccionada = gvMovimiento.SelectedRow;
            lblId.Text = filaseleccionada.Cells[1].Text;
            txtStock.Text = filaseleccionada.Cells[3].Text;
            txtPrecioUnitario.Text=filaseleccionada.Cells[4].Text;
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            txtCantidad.Enabled = true;
            txtCliente.Enabled = true;
            txtFormaPago.Enabled = true;
            lblOpcion.Text = "Agregar";
            btnConfirmar.Enabled = true;
        }
        protected void btnRetirar_Click(object sender, EventArgs e)
        {
            txtCantidad.Enabled = true;
            txtCliente.Enabled = true;
            txtFormaPago.Enabled = true;
            lblOpcion.Text = "Retirar";
            btnConfirmar.Enabled = true;
        }
        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            string strOpcion = lblOpcion.Text;
            int intId = Convert.ToInt32(lblId.Text);

            switch (strOpcion)
            {
                case "Agregar":
                    //COMPRA DE STOCK
                    objArticulo.intCantidadVendida = Convert.ToInt32(txtCantidad.Text);
                    objArticulo.intCantidadDeposito = Convert.ToInt32(txtStock.Text);
                    objLogica.SumaArticulo(objArticulo, intId);                                   
                        break;

                case "Retirar":

                    double dblPrecioUnidad = Convert.ToDouble(txtPrecioUnitario.Text);
                    double dblCantidad = Convert.ToDouble(txtCantidad.Text);
                    double dblPrecioFinal = (dblPrecioUnidad * dblCantidad);
                    txtPrecioFinal.Text = dblPrecioFinal.ToString();

                    //VENTA DE STOCK
                    objArticulo.intCantidadVendida = Convert.ToInt32(txtCantidad.Text);
                    objArticulo.intCantidadDeposito = Convert.ToInt32(txtStock.Text);
                    objLogica.RestaArticulo(objArticulo, intId);

                    //AGREGO REGISTRO
                    objRegistro.CantidadVendida = Convert.ToInt32(txtCantidad.Text);
                    objRegistro.strCliente = txtCliente.Text;
                    objRegistro.dtFecha = DateTime.Now;
                    objRegistro.strFormaPago = txtFormaPago.Text;
                    objRegistro.intIdProducto = Convert.ToInt32(lblId.Text);
                    objRegistro.dblPrecio =Convert.ToDouble(txtPrecioUnitario.Text);
                    objRegistro.dblPrecioFinal = Convert.ToDouble(txtPrecioFinal.Text);

                    

                    objLogicaRegistro.AgregarRegistro(objRegistro);
                        break;
                    //PRECIO FINAL
                    //double dblPrecioUnidad = Convert.ToDouble(txtPrecioUnitario.Text);
                    //double dblCantidad = Convert.ToDouble(txtCantidad.Text);
                    //double dblPrecioFinal =(dblPrecioUnidad*dblCantidad);
                    //objRegistro.dblPrecioFinal = dblPrecioFinal;
                    //objLogicaRegistro.PrecioFinal(objRegistro, intId);
                    //    break;
            }
            txtCantidad.Text = "";
            txtCliente.Text = "";
            txtFormaPago.Text = "";
            txtCliente.Text = "";
            txtPrecioFinal.Text = "";
            txtStock.Text = "";
            TraerTodos();
        }
    }
}