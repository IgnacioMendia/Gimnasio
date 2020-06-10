using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Limpieza
    {
        public void Agregar(Entidades.Limpieza limpieza)
        {
            string strSQL = @"insert into Limpieza (Nombre,Apellido,FechaContratacion)
                            values (@Nombre,@Apellido,@FechaContratacion)";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL,objconexion);

            objcom.Parameters.AddWithValue("@Nombre", limpieza.Nombre);
            objcom.Parameters.AddWithValue("@Apellido", limpieza.Apellido);
            objcom.Parameters.AddWithValue("@FechaContratacion", limpieza.FechaContratacion);

            try
            {
                objconexion.Open();
                objcom.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la capa de datos");
            }
            finally
            {
                objconexion.Close();
            }
            

        }
        public void Eliminar(int id)
        {
            string strSQL = @"Delete from Limpieza where id=@Id";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);

            objcom.Parameters.AddWithValue("@id", id);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }
        public DataTable TraerTodos()
        {
            DataTable dt = new DataTable();
            string strSQL = "select * from Limpieza";
            SqlDataAdapter da = new SqlDataAdapter(strSQL, Conexion.strConexion);
            da.Fill(dt);
            return dt;
        }
    }
}
