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
    public class Administrativo
    {
        public void Agregar(Entidades.Administrativo administrativo)
        {
            string strSQL = @"insert into Administrativos (Nombre,Apellido,FechaContratacion)
                            values (@Nombre,@Apellido,@FechaContratacion)";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);

            objcom.Parameters.AddWithValue("@Nombre", administrativo.Nombre);
            objcom.Parameters.AddWithValue("@Apellido", administrativo.Apellido);
            objcom.Parameters.AddWithValue("@FechaContratacion", administrativo.FechaContratacion);
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

        public void Eliminar(int intID)
        {
            string strSQL = @"delete from Administrativos where id=@id";
            SqlConnection objconexion = new SqlConnection(Conexion.strConexion);
            SqlCommand objcom = new SqlCommand(strSQL, objconexion);
            objcom.Parameters.AddWithValue("@id", intID);

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

        public DataTable TraerTodos()
        {
            DataTable dt = new DataTable();
            string strSQL = @"select * from Administrativos";
            SqlDataAdapter da = new SqlDataAdapter(strSQL, Conexion.strConexion);
            da.Fill(dt);
            return dt;
        }
     
            

     }


}




    

