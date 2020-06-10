using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Actividad
    {
        public DataTable TraerActividad()
        {
            DataTable dt = new DataTable();
            string strSQL = "select * from actividades";
            SqlDataAdapter da = new SqlDataAdapter(strSQL, Conexion.strConexion);
            da.Fill(dt);
            return dt;
        }
        public void Agregar(Entidades.Actividad actividad)
        {
            string strSQL = @"insert into Actividades (NombreActividad,Precio)
                            values(@NombreActividad,@Precio)";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);

            objcom.Parameters.AddWithValue("@NombreActividad", actividad.NombreActividad);
            objcom.Parameters.AddWithValue("@Precio", actividad.Precio);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }
        public void Eliminar(int intId)
        {
            string strSQL = @"delete from Actividades where IdActividad=@IdActividad";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL,objconexion);

            objcom.Parameters.AddWithValue("@IdActividad", intId);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }
        public void Modificar(int intId, string strNombreActividad, int intPrecio)
        {
            string strSQL = @"update Actividades set NombreActividad=@NombreActividad,Precio=@Precio where IdActividad=@IdActividad";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);

            objcom.Parameters.AddWithValue("@idActividad", intId);
            objcom.Parameters.AddWithValue("@NombreActividad", strNombreActividad);
            objcom.Parameters.AddWithValue("@Precio", intPrecio);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }

    }
}
