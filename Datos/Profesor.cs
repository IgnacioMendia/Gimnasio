using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Profesor
    {

        public DataTable TraerTodos()
        {
            DataTable dt = new DataTable();
            string strSQL = "select*from VistaProfesores";
            SqlDataAdapter da = new SqlDataAdapter(strSQL, Conexion.strConexion);
            da.Fill(dt);
            return dt;
        }

        public void Agregar(Entidades.Profesor profesor)
        {
            string strSQL = @"insert into Profesores (Nombre,Apellido,FechaContratacion,Titulo,IdActividad) 
                            values (@Nombre,@Apellido,@FechaContratacion,@Titulo,@IdActividad)";

            SqlConnection objConexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objCom = new SqlCommand(strSQL, objConexion);

            //PARAMETROS
            objCom.Parameters.AddWithValue("@Nombre", profesor.Nombre);
            objCom.Parameters.AddWithValue("@Apellido", profesor.Apellido);
            objCom.Parameters.AddWithValue("@FechaContratacion", profesor.FechaContratacion);
            objCom.Parameters.AddWithValue("@Titulo", profesor.Titulo);
            objCom.Parameters.AddWithValue("@IdActividad", profesor.actividad.IdActividad);
            

            objConexion.Open();
            objCom.ExecuteNonQuery();
            objConexion.Close();
        }

        public void Eliminar(int Id)
        {
            string strSQL = @"Delete from Profesores where id=@Id";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL,objconexion);

            objcom.Parameters.AddWithValue("@id", Id);

            objconexion.Open();
            objcom.ExecuteNonQuery();
            objconexion.Close();
        }

        public void Modificar(Entidades.Profesor profesor)
        {
            string strSQL = "@ update profesores set Nombre=@Nombre, Apellido=@Apellido, FechaContratacion=@FechaContratacion, titulo=@Titulo," +
                            "IdActividad=@IdActividad, HorasTrabajadas=@HorasTrabajadas where id=@id";
            SqlConnection objConexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objCom = new SqlCommand(strSQL, objConexion);
            //PARAMETROS

            objCom.Parameters.Add("@Nombre", System.Data.SqlDbType.VarChar).Value = profesor.Nombre;
            objCom.Parameters.Add("@Apellido", System.Data.SqlDbType.VarChar).Value = profesor.Apellido;
            objCom.Parameters.Add("@FechaContratacion", System.Data.SqlDbType.VarChar).Value = profesor.FechaContratacion;
            objCom.Parameters.Add("@Titulo", System.Data.SqlDbType.VarChar).Value = profesor.Titulo;
            objCom.Parameters.Add("@ActividadPrincipal", System.Data.SqlDbType.VarChar).Value = profesor.actividad.NombreActividad;
            objCom.Parameters.Add("@HorasTrabajadas", System.Data.SqlDbType.VarChar).Value = profesor.HorasTrabajadas;


            objConexion.Open();
            objCom.ExecuteNonQuery();
            objConexion.Close();




        }



    }
}
