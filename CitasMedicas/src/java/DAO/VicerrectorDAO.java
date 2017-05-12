/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.VicerrectorDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Gladys M
 */
public class VicerrectorDAO {
    
    private Connection con;

    public VicerrectorDAO(Connection con) {
        this.con = con;
    }
    
    public VicerrectorDTO consultarViceporId(int id) throws SQLException{               
        
        String sql = "SELECT * FROM vicerrector WHERE identificacion_vice = ? ";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, id);
        
        ResultSet rs = ps.executeQuery();
        
        VicerrectorDTO admin = null;
        
        if(rs.next()){
            
            admin = new VicerrectorDTO();
            
            admin.setIdentificacion_vice(rs.getInt("identificacion_vice"));
            admin.setNombre_vice(rs.getString("nombre_vice"));
            admin.setCorreo_vice(rs.getString("correo_vice"));
            admin.setTelefono_vice(rs.getString("telefono_vice"));
            admin.setCodigo_vice(rs.getInt("codigo_vice"));
            admin.setContrasena_vice(rs.getString("contrasena_vice"));                        
        }
        
        
        return admin;
        
    }
    public boolean modificarVicerrector(int identificacion_vice, String correo_vice, String telefono_vice, String contrasena_vice) throws SQLException{
        
        String sql = "UPDATE vicerrector SET correo_vice = ?, telefono_vice = ?, contrasena_vice = ? "
                + "WHERE identificacion_vice = ? ";
        
        PreparedStatement ps = con.prepareStatement(sql);                
         
        ps.setString(1, correo_vice);
        ps.setString(2, telefono_vice);
        ps.setString(3, contrasena_vice);
        ps.setInt(4, identificacion_vice);
        
        System.out.println("ps: " +ps.toString());
        
        int rta = ps.executeUpdate();
        
        if(rta > 0){
            return true;
            
        }
        else
            return false;
        
    }
    
}
