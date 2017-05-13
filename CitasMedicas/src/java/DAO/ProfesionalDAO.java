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

        String sql = "INSERT INTO profesional (identificacion, tipodocumentoid, codigo, nombre, correo, "
                + "fechanacimiento, genero, edad, estadocivil, direccion, telefono)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, prof.getIdentificacion());
        ps.setString(2, prof.getTipodocumentoid());
        ps.setInt(3, prof.getCodigo());
        ps.setString(4, prof.getNombre());
        ps.setString(5, prof.getCorreo());
        ps.setString(6, prof.getFechanacimiento());
        ps.setString(7, prof.getGenero());
        ps.setInt(8, prof.getEdad());
        ps.setString(9, prof.getEstadocivil());
        ps.setString(10, prof.getDireccion());
        ps.setString(11, prof.getTelefono());                      

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
        
        String sql = "SELECT * FROM profesional WHERE identificacion = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id);
        
        ResultSet rs = ps.executeQuery();
        
        ProfesionalDTO prof = null;
        
        if (rs.next()){
            
            prof = new ProfesionalDTO();
            
            prof.setIdentificacion(rs.getInt("identificacion"));
            prof.setTipodocumentoid(rs.getString("tipodocumentoid"));
            prof.setCodigo(rs.getInt("codigo"));
            prof.setNombre(rs.getString("nombre"));
            prof.setCorreo(rs.getString("correo"));
            prof.setFechanacimiento(rs.getString("fechanacimiento"));      
            prof.setGenero(rs.getString("genero"));
            prof.setEdad(rs.getInt("edad"));
            prof.setEstadocivil(rs.getString("estadocivil"));
            prof.setDireccion(rs.getString("direccion"));
            prof.setTelefono(rs.getString("telefono"));            
                        
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
            prof.setIdentificacion(rs.getInt("identificacion"));
            prof.setTipodocumentoid(rs.getString("tipodocumentoid"));
            prof.setCodigo(rs.getInt("codigo"));
            prof.setNombre(rs.getString("nombre"));
            prof.setCorreo(rs.getString("correo"));
            prof.setFechanacimiento(rs.getString("fechanacimiento"));      
            prof.setGenero(rs.getString("genero"));
            prof.setEdad(rs.getInt("edad"));
            prof.setEstadocivil(rs.getString("estadocivil"));
            prof.setDireccion(rs.getString("direccion"));
            prof.setTelefono(rs.getString("telefono"));             
            
            profe.add(prof);
        }
        
        return profe;
        
    }
    
     public ProfesionalDTO consultarProfesionalPorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM profesional WHERE identificacion = ? OR codigo = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        ProfesionalDTO prof = null;

        if (rs.next()) {
            prof = new ProfesionalDTO();
            
            prof.setIdentificacion(rs.getInt("identificacion"));
            prof.setTipodocumentoid(rs.getString("tipodocumentoid"));
            prof.setCodigo(rs.getInt("codigo"));
            prof.setNombre(rs.getString("nombre"));
            prof.setCorreo(rs.getString("correo"));
            prof.setFechanacimiento(rs.getString("fechanacimiento"));      
            prof.setGenero(rs.getString("genero"));
            prof.setEdad(rs.getInt("edad"));
            prof.setEstadocivil(rs.getString("estadocivil"));
            prof.setDireccion(rs.getString("direccion"));
            prof.setTelefono(rs.getString("telefono"));                              
        }
        
        return prof;

    }              
     
    public boolean modificarProfesional(int identificacion, String correo, String fechanacimiento, String genero, String estadocivil, String direccion, String telefono) throws SQLException{
          
            String sql = "UPDATE profesional SET correo = ? , fechanacimiento = ?, genero = ?, estadocivil = ? , direccion =?, telefono = ? "
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
