using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Articulo
    {
        public DataTable traerTodos()
        {
            DataTable dt = new DataTable();
            String strSQL = @"select * from VistaArticulos";
            SqlDataAdapter da = new SqlDataAdapter(strSQL, Conexion.strConexion);
            da.Fill(dt);
            return dt;
        }
        public void SumaArticulo(Entidades.Articulo articulo, int intId)
        {
            string strSQL="update Articulos set CantidadDeposito=(@CantidadDeposito+@CantidadVendida) where id=@id";
            SqlConnection objConexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objConexion);

            objcom.Parameters.AddWithValue("@id", intId);
            objcom.Parameters.AddWithValue("@CantidadDeposito", articulo.intCantidadDeposito);
            objcom.Parameters.AddWithValue("@CantidadVendida", articulo.intCantidadVendida);        

            objConexion.Open();
            objcom.ExecuteNonQuery();
            objConexion.Close();
        }
        public void RestaArticulo(Entidades.Articulo articulo, int intId)
        {
            string strSQL = "update Articulos set CantidadDeposito=(@CantidadDeposito-@CantidadVendida) where id=@id";
            SqlConnection objConexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objConexion);

            objcom.Parameters.AddWithValue("@id", intId);
            objcom.Parameters.AddWithValue("@CantidadDeposito", articulo.intCantidadDeposito);
            objcom.Parameters.AddWithValue("@CantidadVendida", articulo.intCantidadVendida);

            objConexion.Open();
            objcom.ExecuteNonQuery();
            objConexion.Close();
        }
    }
}
