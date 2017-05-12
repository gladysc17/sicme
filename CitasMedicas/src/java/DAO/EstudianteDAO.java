    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.EstudianteDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Gladys M
 * @version 1.0
 */
public class EstudianteDAO {

    private Connection con;

    public EstudianteDAO(Connection con) {
        this.con = con;
    }

    /**
     * Metodo que registra los datos del estudiante en la Base de datos     
     * @param est
     * @return boolean, con valor verdadero si hubo registro exitoso, falso si existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    public boolean registrarEstudiante(EstudianteDTO est) throws SQLException {
                       
        String sql = "INSERT INTO estudiante (identificacion_est, tipodocumentoid_est, codigo_est, nombre_est, "
                + "correo_est, fechanacimiento_est, genero_est, edad_est, estadocivil_est, direccion_est, telefono_est, programa_est )"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, est.getIdentificacion_est());
        ps.setString(2, est.getTipodocumentoid_est());
        ps.setInt(3, est.getCodigo_est());
        ps.setString(4, est.getNombre_est());
        ps.setString(5, est.getCorreo_est());
        ps.setString(6, est.getFechanacimiento_est());
        ps.setString(7, est.getGenero_est());
        ps.setInt(8, est.getEdad_est());
        ps.setString(9, est.getEstadocivil_est());
        ps.setString(10, est.getDireccion_est());
        ps.setString(11, est.getTelefono_est());                
        ps.setString(12, est.getPrograma_est());               

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    /**
     * Metodo que consulta en la base de datos un estudiante por su Identificación
     * @param id
     * @return Objeto de tipo EstudianteDTO
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    public EstudianteDTO consultarEstudiantePorId(int id) throws SQLException {

        String sql = "SELECT * FROM estudiante WHERE identificacion_est = ?";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();               

        EstudianteDTO est = null;

        if (rs.next()) {
            est = new EstudianteDTO();
            
            est.setIdentificacion_est(rs.getInt("identificacion_est"));
            est.setTipodocumentoid_est(rs.getString("tipodocumentoid_est"));
            est.setCodigo_est(rs.getInt("codigo_est"));
            est.setNombre_est(rs.getString("nombre_est"));
            est.setCorreo_est(rs.getString("correo_est"));
            est.setFechanacimiento_est(rs.getString("fechanacimiento_est"));      
            est.setGenero_est(rs.getString("genero_est"));
            est.setEdad_est(rs.getInt("edad_est"));
            est.setEstadocivil_est(rs.getString("estadocivil_est"));
            est.setDireccion_est(rs.getString("direccion_est"));
            est.setTelefono_est(rs.getString("telefono_est")); 
            est.setPrograma_est(rs.getString("programa_est"));            
        }
        
        return est;

    }
    
    public EstudianteDTO consultarEstudiantePorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM estudiante WHERE identificacion_est = ? OR codigo_est = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        EstudianteDTO est = null;

        if (rs.next()) {
            est = new EstudianteDTO();
            
            est.setIdentificacion_est(rs.getInt("identificacion_est"));
            est.setTipodocumentoid_est(rs.getString("tipodocumentoid_est"));
            est.setCodigo_est(rs.getInt("codigo_est"));
            est.setNombre_est(rs.getString("nombre_est"));
            est.setCorreo_est(rs.getString("correo_est"));
            est.setFechanacimiento_est(rs.getString("fechanacimiento_est"));      
            est.setGenero_est(rs.getString("genero_est"));
            est.setEdad_est(rs.getInt("edad_est"));
            est.setEstadocivil_est(rs.getString("estadocivil_est"));
            est.setDireccion_est(rs.getString("direccion_est"));
            est.setTelefono_est(rs.getString("telefono_est")); 
            est.setPrograma_est(rs.getString("programa_est"));;                             
        }
        
        return est;

    }
    
    public List<EstudianteDTO> consultarEstudiantes() throws SQLException {

        List<EstudianteDTO> listaEst = new ArrayList<EstudianteDTO>();
        
        String sql = "SELECT * FROM estudiante ORDER BY programa_est, nombre_est";

        PreparedStatement ps = con.prepareStatement(sql);                       

        ResultSet rs = ps.executeQuery();               

        EstudianteDTO est = null;

        while (rs.next()) {
            est = new EstudianteDTO();
            
            est.setIdentificacion_est(rs.getInt("identificacion_est"));
            est.setTipodocumentoid_est(rs.getString("tipodocumentoid_est"));
            est.setCodigo_est(rs.getInt("codigo_est"));
            est.setNombre_est(rs.getString("nombre_est"));
            est.setCorreo_est(rs.getString("correo_est"));
            est.setFechanacimiento_est(rs.getString("fechanacimiento_est"));      
            est.setGenero_est(rs.getString("genero_est"));
            est.setEdad_est(rs.getInt("edad_est"));
            est.setEstadocivil_est(rs.getString("estadocivil_est"));
            est.setDireccion_est(rs.getString("direccion_est"));
            est.setTelefono_est(rs.getString("telefono_est")); 
            est.setPrograma_est(rs.getString("programa_est"));      
            
            listaEst.add(est);
        }
        
        return listaEst;

    }
    
    public boolean modificarEstudiante(int identificacion_est, String correo_est, String fechanacimiento_est, String genero_est, String estadocivil_est, String direccion_est, String telefono_est ) throws SQLException{
          
            String sql = "UPDATE estudiante SET correo_est = ? , fechanacimiento_est = ?, genero_est = ?, estadocivil_est = ? , direccion_est =?, telefono_est = ?  "
                + "WHERE  identificacion_est = ?";

        PreparedStatement ps = con.prepareStatement(sql);
                
        ps.setString(1, correo_est);
        ps.setString(2, fechanacimiento_est);        
        ps.setString(3, genero_est);
        ps.setString(4, estadocivil_est);  
        ps.setString(5, direccion_est);
        ps.setString(6, telefono_est);
        ps.setInt(7, identificacion_est);
        
        int rta = ps.executeUpdate();

        return rta > 0;
          
      }

}
