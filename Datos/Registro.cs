using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Registro
    {
        public DataTable TraerTodos()
        {
            DataTable dt = new DataTable();
            string strSQL = @"select * from Registros";
            SqlDataAdapter da = new SqlDataAdapter(strSQL, Conexion.strConexion);
            da.Fill(dt);
            return dt;
        }
        public void AgregarRegistro(Entidades.Registro registro)
        {
            string strSQL = @"insert into Registros (CantidadVendida,Fecha,Cliente,FormaPago,IdProducto,Precio,PrecioFinal)
                            values (@CantidadVendida,@Fecha,@Cliente,@FormaPago,@IdProducto,@Precio,@PrecioFinal)";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);

            objcom.Parameters.AddWithValue("@CantidadVendida", registro.CantidadVendida);            
            objcom.Parameters.AddWithValue("@Fecha", registro.dtFecha);
            objcom.Parameters.AddWithValue("@Cliente", registro.strCliente);
            objcom.Parameters.AddWithValue("@FormaPago", registro.strFormaPago);
            objcom.Parameters.AddWithValue("@IdProducto", registro.intIdProducto);
            objcom.Parameters.AddWithValue("@Precio", registro.dblPrecio);
            objcom.Parameters.AddWithValue("@PrecioFinal", registro.dblPrecioFinal);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }

        public void PrecioFinal(Entidades.Registro registro,int intId)
        {
            string strSQL = @"update Registros set PrecioFinal=(@Precio+@CantidadVendida) where id=@id";

            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);

            objcom.Parameters.AddWithValue("@id", intId);
            objcom.Parameters.AddWithValue("@PrecioFinal", registro.dblPrecioFinal);
            objcom.Parameters.AddWithValue("@Precio", registro.dblPrecio);
            objcom.Parameters.AddWithValue("@CantidadVendida", registro.CantidadVendida);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }




    }
}
