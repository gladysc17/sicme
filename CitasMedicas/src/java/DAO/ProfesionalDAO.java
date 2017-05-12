/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.ProfesionalDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class ProfesionalDAO {

    private Connection con;

    public ProfesionalDAO(Connection con) {
        this.con = con;
    }

    /**
     * Método que registra un objeto de tipo ProfesionalDTO en la tabla profesional de la base de datos.
     * @param prof,  
     * @return boolean, con valor verdadero si hubo registro exitoso, falso si existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    
    public boolean registrarProfesional(ProfesionalDTO prof) throws SQLException {

        String sql = "INSERT INTO profesional (identificacion_prof, tipodocumentoid_prof, codigo_prof, nombre_prof, correo_prof, "
                + "fechanacimiento_prof, genero_prof, edad_prof, estadocivil_prof, direccion_prof, telefono_prof)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, prof.getIdentificacion_prof());
        ps.setString(2, prof.getTipodocumentoid_prof());
        ps.setInt(3, prof.getCodigo_prof());
        ps.setString(4, prof.getNombre_prof());
        ps.setString(5, prof.getCorreo_prof());
        ps.setString(6, prof.getFechanacimiento_prof());
        ps.setString(7, prof.getGenero_prof());
        ps.setInt(8, prof.getEdad_prof());
        ps.setString(9, prof.getEstadocivil_prof());
        ps.setString(10, prof.getDireccion_prof());
        ps.setString(11, prof.getTelefono_prof());                      

        int rta = ps.executeUpdate();

        return rta == 1;

    }
    
    /**
     * Metodo que consulta en la base de datos un Profesional de la salud por su Identificación.
     * @param id 
     * @return Objeto de tipo ProfesionalDTO
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    
    public ProfesionalDTO consultarProfesionalPorId(int id) throws SQLException{
        
        String sql = "SELECT * FROM profesional WHERE identificacion_prof = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id);
        
        ResultSet rs = ps.executeQuery();
        
        ProfesionalDTO prof = null;
        
        if (rs.next()){
            
            prof = new ProfesionalDTO();
            
            prof.setIdentificacion_prof(rs.getInt("identificacion_prof"));
            prof.setTipodocumentoid_prof(rs.getString("tipodocumentoid_prof"));
            prof.setCodigo_prof(rs.getInt("codigo_prof"));
            prof.setNombre_prof(rs.getString("nombre_prof"));
            prof.setCorreo_prof(rs.getString("correo_prof"));
            prof.setFechanacimiento_prof(rs.getString("fechanacimiento_prof"));      
            prof.setGenero_prof(rs.getString("genero_prof"));
            prof.setEdad_prof(rs.getInt("edad_prof"));
            prof.setEstadocivil_prof(rs.getString("estadocivil_prof"));
            prof.setDireccion_prof(rs.getString("direccion_prof"));
            prof.setTelefono_prof(rs.getString("telefono_prof"));            
                        
        }
        
        return prof;
    }
    /**
     * Metodo que retorna todos los datos de la tabla profesinoal
     * @return listado tipo ProfesionalDTO
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    public List<ProfesionalDTO> listarProfesionales () throws SQLException{
        
        List<ProfesionalDTO> profe = new ArrayList<ProfesionalDTO>();
        
        String sql = "SELECT * FROM profesional";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        ProfesionalDTO prof = null;
        
        while (rs.next()){
            
            prof = new ProfesionalDTO();
            prof.setIdentificacion_prof(rs.getInt("identificacion_prof"));
            prof.setTipodocumentoid_prof(rs.getString("tipodocumentoid_prof"));
            prof.setCodigo_prof(rs.getInt("codigo_prof"));
            prof.setNombre_prof(rs.getString("nombre_prof"));
            prof.setCorreo_prof(rs.getString("correo_prof"));
            prof.setFechanacimiento_prof(rs.getString("fechanacimiento_prof"));      
            prof.setGenero_prof(rs.getString("genero_prof"));
            prof.setEdad_prof(rs.getInt("edad_prof"));
            prof.setEstadocivil_prof(rs.getString("estadocivil_prof"));
            prof.setDireccion_prof(rs.getString("direccion_prof"));
            prof.setTelefono_prof(rs.getString("telefono_prof"));             
            
            profe.add(prof);
        }
        
        return profe;
        
    }
    
     public ProfesionalDTO consultarProfesionalPorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM profesional WHERE identificacion_prof = ? OR codigo_prof = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        ProfesionalDTO prof = null;

        if (rs.next()) {
            prof = new ProfesionalDTO();
            
            prof.setIdentificacion_prof(rs.getInt("identificacion_prof"));
            prof.setTipodocumentoid_prof(rs.getString("tipodocumentoid_prof"));
            prof.setCodigo_prof(rs.getInt("codigo_prof"));
            prof.setNombre_prof(rs.getString("nombre_prof"));
            prof.setCorreo_prof(rs.getString("correo_prof"));
            prof.setFechanacimiento_prof(rs.getString("fechanacimiento_prof"));      
            prof.setGenero_prof(rs.getString("genero_prof"));
            prof.setEdad_prof(rs.getInt("edad_prof"));
            prof.setEstadocivil_prof(rs.getString("estadocivil_prof"));
            prof.setDireccion_prof(rs.getString("direccion_prof"));
            prof.setTelefono_prof(rs.getString("telefono_prof"));                              
        }
        
        return prof;

    }              
     
    public boolean modificarProfesional(int identificacion_prof, String correo_prof, String fechanacimiento_prof, String genero_prof, String estadocivil_prof, String direccion_prof, String telefono_prof) throws SQLException{
          
            String sql = "UPDATE profesional SET correo_prof = ? , fechanacimiento_prof = ?, genero_prof = ?, estadocivil_prof = ? , direccion_prof =?, telefono_prof = ? "
                + "WHERE  identificacion_prof = ?";

        PreparedStatement ps = con.prepareStatement(sql);
                
        ps.setString(1, correo_prof);
        ps.setString(2, fechanacimiento_prof);        
        ps.setString(3, genero_prof);
        ps.setString(4, estadocivil_prof);  
        ps.setString(5, direccion_prof);
        ps.setString(6, telefono_prof);        
        ps.setInt(7, identificacion_prof);
        
        int rta = ps.executeUpdate();

        return rta > 0;
          
      }
}
