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

        String sql = "INSERT INTO otrousuario (identificacion_otro, tipodocumentoid_otro, codigo_otro, nombre_otro, correo_otro, "
                + "fechanacimiento_otro, genero_otro, edad_otro, estadocivil_otro, direccion_otro, telefono_otro, rol_otro)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, otro.getIdentificacion_otro());
        ps.setString(2, otro.getTipodocumentoid_otro());
        ps.setInt(3, otro.getCodigo_otro());
        ps.setString(4, otro.getNombre_otro());
        ps.setString(5, otro.getCorreo_otro());
        ps.setString(6, otro.getFechanacimiento_otro());
        ps.setString(7, otro.getGenero_otro());
        ps.setInt(8, otro.getEdad_otro());
        ps.setString(9, otro.getEstadocivil_otro());
        ps.setString(10, otro.getDireccion_otro());
        ps.setString(11, otro.getTelefono_otro());
        ps.setString(12, otro.getRol_otro());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }
     
     public OtroUsuarioDTO consultarOtroUsuarioPorId(int id) throws SQLException {

        String sql = "SELECT * FROM otrousuario WHERE identificacion_otro = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        OtroUsuarioDTO otro = null;

        if (rs.next()) {
            otro = new OtroUsuarioDTO();
            otro.setIdentificacion_otro(rs.getInt("identificacion_otro"));
            otro.setTipodocumentoid_otro(rs.getString("tipodocumentoid_otro"));
            otro.setCodigo_otro(rs.getInt("codigo_otro"));
            otro.setNombre_otro(rs.getString("nombre_otro"));
            otro.setCorreo_otro(rs.getString("correo_otro"));
            otro.setFechanacimiento_otro(rs.getString("fechanacimiento_otro"));      
            otro.setGenero_otro(rs.getString("genero_otro"));
            otro.setEdad_otro(rs.getInt("edad_otro"));
            otro.setEstadocivil_otro(rs.getString("estadocivil_otro"));
            otro.setDireccion_otro(rs.getString("direccion_otro"));
            otro.setTelefono_otro(rs.getString("telefono_otro")); 
            otro.setRol_otro(rs.getString("rol_otro"));
            
        }
        return otro;
    }
     public List<OtroUsuarioDTO> consultarOtrosUsuarios() throws SQLException {

        List<OtroUsuarioDTO> listaOtro = new ArrayList<OtroUsuarioDTO>();

        String sql = "SELECT * FROM otrousuario ORDER BY nombre_otro";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        OtroUsuarioDTO otro = null;

        while (rs.next()) {
            otro = new OtroUsuarioDTO();

            otro.setIdentificacion_otro(rs.getInt("identificacion_otro"));
            otro.setTipodocumentoid_otro(rs.getString("tipodocumentoid_otro"));
            otro.setCodigo_otro(rs.getInt("codigo_otro"));
            otro.setNombre_otro(rs.getString("nombre_otro"));
            otro.setCorreo_otro(rs.getString("correo_otro"));
            otro.setFechanacimiento_otro(rs.getString("fechanacimiento_otro"));      
            otro.setGenero_otro(rs.getString("genero_otro"));
            otro.setEdad_otro(rs.getInt("edad_otro"));
            otro.setEstadocivil_otro(rs.getString("estadocivil_otro"));
            otro.setDireccion_otro(rs.getString("direccion_otro"));
            otro.setTelefono_otro(rs.getString("telefono_otro")); 
            otro.setRol_otro(rs.getString("rol_otro"));

            listaOtro.add(otro);
        }

        return listaOtro;

    }
     
     public OtroUsuarioDTO consultarOtroPorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM otrousuario WHERE identificacion_otro = ? OR codigo_otro = ? ";

        PreparedStatement ps = con.prepareStatement(sql);               

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();                             

        OtroUsuarioDTO otro = null;

        if (rs.next()) {
            otro = new OtroUsuarioDTO();
            
            otro.setIdentificacion_otro(rs.getInt("identificacion_otro"));
            otro.setTipodocumentoid_otro(rs.getString("tipodocumentoid_otro"));
            otro.setCodigo_otro(rs.getInt("codigo_otro"));
            otro.setNombre_otro(rs.getString("nombre_otro"));
            otro.setCorreo_otro(rs.getString("correo_otro"));
            otro.setFechanacimiento_otro(rs.getString("fechanacimiento_otro"));      
            otro.setGenero_otro(rs.getString("genero_otro"));
            otro.setEdad_otro(rs.getInt("edad_otro"));
            otro.setEstadocivil_otro(rs.getString("estadocivil_otro"));
            otro.setDireccion_otro(rs.getString("direccion_otro"));
            otro.setTelefono_otro(rs.getString("telefono_otro")); 
            otro.setRol_otro(rs.getString("rol_otro"));                             
        }
        
        return otro;

    }
    
    public boolean modificarOtroUsuario(int identificacion_otro, String correo_otro, String fechanacimiento_otro, String genero_otro, String estadocivil_otro, String direccion_otro, String telefono_otro) throws SQLException{
          
            String sql = "UPDATE otrousuario SET correo_otro = ? , fechanacimiento_otro = ?, genero_otro = ?, estadocivil_otro = ? , direccion_otro =?, telefono_otro = ? "
                + "WHERE  identificacion_otro = ?";

        PreparedStatement ps = con.prepareStatement(sql);
                
        ps.setString(1, correo_otro);
        ps.setString(2, fechanacimiento_otro);        
        ps.setString(3, genero_otro);
        ps.setString(4, estadocivil_otro);  
        ps.setString(5, direccion_otro);
        ps.setString(6, telefono_otro);        
        ps.setInt(7, identificacion_otro);
        
        int rta = ps.executeUpdate();

        return rta > 0;
          
      }
    
}
