using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Alumno
    {
        public DataTable TraerTodos()
        {
            DataTable dt = new DataTable();
            string strSQL = @"select * from VistaAlumnos";
            SqlDataAdapter da = new SqlDataAdapter(strSQL, Conexion.strConexion);
            da.Fill(dt);
            return dt;
        }

        public void Agregar(Entidades.Alumno alumno)
        {
            string strSQL = @"insert into Alumnos (Nombre,Apellido,FechaIngreso,IdActividad)
                            values (@Nombre,@Apellido,@FechaIngreso,@IdActividad)";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);

            objcom.Parameters.AddWithValue("@Nombre", alumno.Nombre);
            objcom.Parameters.AddWithValue("@Apellido", alumno.Apellido);
            objcom.Parameters.AddWithValue("@FechaIngreso", alumno.FechaIngreso);
            objcom.Parameters.AddWithValue("@IdActividad", alumno.Actividad.IdActividad);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }

        public void Eliminar(int intId)
        {
            string strSQL = @"Delete from Alumnos where id=@id";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);

            objcom.Parameters.AddWithValue("@id", intId);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }

        public void Modificar(int intId,string strNombre,string strApellido,DateTime FechaIngreso,string strActividad)
        {
            string strSQL = @"Update Alumnos set Nombre=@Nombre,Apellido=@Apellido,FechaIngreso=@FechaIngreso,IdActividad=@IdActividad where id=@id";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);

            objcom.Parameters.AddWithValue("@id", intId);
            objcom.Parameters.AddWithValue("@Nombre", strNombre);
            objcom.Parameters.AddWithValue("@Apellido", strApellido);
            objcom.Parameters.AddWithValue("@FechaIngreso", FechaIngreso);
            objcom.Parameters.AddWithValue("@IdActividad", strActividad);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }
    }
}
