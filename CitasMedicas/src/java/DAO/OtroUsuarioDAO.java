/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.OtroUsuarioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class OtroUsuarioDAO {
    
    private Connection con;

    public OtroUsuarioDAO(Connection con) {
        this.con = con;
    }
    
     public boolean registrarOtroUsuario(OtroUsuarioDTO otro) throws SQLException {

        String sql = "INSERT INTO otrousuario (identificacion, tipodocumentoid, codigo, nombre, correo, "
                + "fechanacimiento, genero, edad, estadocivil, direccion, telefono, rol)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, otro.getIdentificacion());
        ps.setString(2, otro.getTipodocumentoid());
        ps.setInt(3, otro.getCodigo());
        ps.setString(4, otro.getNombre());
        ps.setString(5, otro.getCorreo());
        ps.setString(6, otro.getFechanacimiento());
        ps.setString(7, otro.getGenero());
        ps.setInt(8, otro.getEdad());
        ps.setString(9, otro.getEstadocivil());
        ps.setString(10, otro.getDireccion());
        ps.setString(11, otro.getTelefono());
        ps.setString(12, otro.getRol());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }
     
     public OtroUsuarioDTO consultarOtroUsuarioPorId(int id) throws SQLException {

        String sql = "SELECT * FROM otrousuario WHERE identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        OtroUsuarioDTO otro = null;

        if (rs.next()) {
            otro = new OtroUsuarioDTO();
            otro.setIdentificacion(rs.getInt("identificacion"));
            otro.setTipodocumentoid(rs.getString("tipodocumentoid"));
            otro.setCodigo(rs.getInt("codigo"));
            otro.setNombre(rs.getString("nombre"));
            otro.setCorreo(rs.getString("correo"));
            otro.setFechanacimiento(rs.getString("fechanacimiento"));      
            otro.setGenero(rs.getString("genero"));
            otro.setEdad(rs.getInt("edad"));
            otro.setEstadocivil(rs.getString("estadocivil"));
            otro.setDireccion(rs.getString("direccion"));
            otro.setTelefono(rs.getString("telefono")); 
            otro.setRol(rs.getString("rol"));
            
        }
        return otro;
    }
     public List<OtroUsuarioDTO> consultarOtrosUsuarios() throws SQLException {

        List<OtroUsuarioDTO> listaOtro = new ArrayList<OtroUsuarioDTO>();

        String sql = "SELECT * FROM otrousuario ORDER BY nombre";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        OtroUsuarioDTO otro = null;

        while (rs.next()) {
            otro = new OtroUsuarioDTO();

            otro.setIdentificacion(rs.getInt("identificacion"));
            otro.setTipodocumentoid(rs.getString("tipodocumentoid"));
            otro.setCodigo(rs.getInt("codigo"));
            otro.setNombre(rs.getString("nombre"));
            otro.setCorreo(rs.getString("correo"));
            otro.setFechanacimiento(rs.getString("fechanacimiento"));      
            otro.setGenero(rs.getString("genero"));
            otro.setEdad(rs.getInt("edad"));
            otro.setEstadocivil(rs.getString("estadocivil"));
            otro.setDireccion(rs.getString("direccion"));
            otro.setTelefono(rs.getString("telefono")); 
            otro.setRol(rs.getString("rol"));

            listaOtro.add(otro);
        }

        return listaOtro;

    }
     
     public OtroUsuarioDTO consultarOtroPorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM otrousuario WHERE identificacion = ? OR codigo = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        OtroUsuarioDTO otro = null;

        if (rs.next()) {
            otro = new OtroUsuarioDTO();
            
            otro.setIdentificacion(rs.getInt("identificacion"));
            otro.setTipodocumentoid(rs.getString("tipodocumentoid"));
            otro.setCodigo(rs.getInt("codigo"));
            otro.setNombre(rs.getString("nombre"));
            otro.setCorreo(rs.getString("correo"));
            otro.setFechanacimiento(rs.getString("fechanacimiento"));      
            otro.setGenero(rs.getString("genero"));
            otro.setEdad(rs.getInt("edad"));
            otro.setEstadocivil(rs.getString("estadocivil"));
            otro.setDireccion(rs.getString("direccion"));
            otro.setTelefono(rs.getString("telefono")); 
            otro.setRol(rs.getString("rol"));                             
        }
        
        return otro;

    }
    
    public boolean modificarOtroUsuario(int identificacion, String correo, String fechanacimiento, String genero, String estadocivil, String direccion, String telefono) throws SQLException{
          
            String sql = "UPDATE otrousuario SET correo = ? , fechanacimiento = ?, genero = ?, estadocivil = ? , direccion =?, telefono = ? "
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
