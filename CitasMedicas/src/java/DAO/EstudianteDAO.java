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
                       
        String sql = "INSERT INTO estudiante (identificacion, tipodocumentoid, codigo, nombre, "
                + "correo, fechanacimiento, genero, edad, estadocivil, direccion, telefono, programa )"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, est.getIdentificacion());
        ps.setString(2, est.getTipodocumentoid());
        ps.setInt(3, est.getCodigo());
        ps.setString(4, est.getNombre());
        ps.setString(5, est.getCorreo());
        ps.setString(6, est.getFechanacimiento());
        ps.setString(7, est.getGenero());
        ps.setInt(8, est.getEdad());
        ps.setString(9, est.getEstadocivil());
        ps.setString(10, est.getDireccion());
        ps.setString(11, est.getTelefono());                
        ps.setString(12, est.getPrograma());               

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

        String sql = "SELECT * FROM estudiante WHERE identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();               

        EstudianteDTO est = null;

        if (rs.next()) {
            est = new EstudianteDTO();
            
            est.setIdentificacion(rs.getInt("identificacion"));
            est.setTipodocumentoid(rs.getString("tipodocumentoid"));
            est.setCodigo(rs.getInt("codigo"));
            est.setNombre(rs.getString("nombre"));
            est.setCorreo(rs.getString("correo"));
            est.setFechanacimiento(rs.getString("fechanacimiento"));      
            est.setGenero(rs.getString("genero"));
            est.setEdad(rs.getInt("edad"));
            est.setEstadocivil(rs.getString("estadocivil"));
            est.setDireccion(rs.getString("direccion"));
            est.setTelefono(rs.getString("telefono")); 
            est.setPrograma(rs.getString("programa"));            
        }
        
        return est;

    }
    
    public EstudianteDTO consultarEstudiantePorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM estudiante WHERE identificacion = ? OR codigo = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        EstudianteDTO est = null;

        if (rs.next()) {
            est = new EstudianteDTO();
            
            est.setIdentificacion(rs.getInt("identificacion"));
            est.setTipodocumentoid(rs.getString("tipodocumentoid"));
            est.setCodigo(rs.getInt("codigo"));
            est.setNombre(rs.getString("nombre"));
            est.setCorreo(rs.getString("correo"));
            est.setFechanacimiento(rs.getString("fechanacimiento"));      
            est.setGenero(rs.getString("genero"));
            est.setEdad(rs.getInt("edad"));
            est.setEstadocivil(rs.getString("estadocivil"));
            est.setDireccion(rs.getString("direccion"));
            est.setTelefono(rs.getString("telefono")); 
            est.setPrograma(rs.getString("programa"));;                             
        }
        
        return est;

    }
    
    public List<EstudianteDTO> consultarEstudiantes() throws SQLException {

        List<EstudianteDTO> listaEst = new ArrayList<EstudianteDTO>();
        
        String sql = "SELECT * FROM estudiante ORDER BY programa, nombre";

        PreparedStatement ps = con.prepareStatement(sql);                       

        ResultSet rs = ps.executeQuery();               

        EstudianteDTO est = null;

        while (rs.next()) {
            est = new EstudianteDTO();
            
            est.setIdentificacion(rs.getInt("identificacion"));
            est.setTipodocumentoid(rs.getString("tipodocumentoid"));
            est.setCodigo(rs.getInt("codigo"));
            est.setNombre(rs.getString("nombre"));
            est.setCorreo(rs.getString("correo"));
            est.setFechanacimiento(rs.getString("fechanacimiento"));      
            est.setGenero(rs.getString("genero"));
            est.setEdad(rs.getInt("edad"));
            est.setEstadocivil(rs.getString("estadocivil"));
            est.setDireccion(rs.getString("direccion"));
            est.setTelefono(rs.getString("telefono")); 
            est.setPrograma(rs.getString("programa"));      
            
            listaEst.add(est);
        }
        
        return listaEst;

    }
    
    public boolean modificarEstudiante(int identificacion, String correo, String fechanacimiento, String genero, String estadocivil, String direccion, String telefono ) throws SQLException{
          
            String sql = "UPDATE estudiante SET correo = ? , fechanacimiento = ?, genero = ?, estadocivil = ? , direccion =?, telefono = ?  "
                + "WHERE  identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);
                
        ps.setString(1, correo);
        ps.setString(2, fechanacimiento);        
        ps.setString(3, genero);
        ps.setString(4, estadocivil);  
        ps.setString(5, direccion);
        ps.setString(6, telefono);
        ps.setInt(7, identificacion);
        
        int rta = ps.executeUpdate();

        return rta > 0;
          
      }

}
