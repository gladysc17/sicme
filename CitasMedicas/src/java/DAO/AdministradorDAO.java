/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.AdministradorDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author Gladys M
 */
public class AdministradorDAO {
    
    private Connection con;

    public AdministradorDAO(Connection con) {
        this.con = con;
    }
    
    public boolean registrarAdministrador(AdministradorDTO adm) throws SQLException {
                       
        String sql = "INSERT INTO administrador (identificacion_usuario, contrasena )"
                + " VALUES (?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, adm.getIdentificacion_usuario());                
        ps.setString(2, adm.getContrasena());               

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }
    
     public AdministradorDTO consultarAdminId(String id) throws SQLException {

        String sql = "SELECT * FROM administrador WHERE identificacion_usuario = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();
        
        System.out.println("sql "+rs.toString());      

        AdministradorDTO ad = null;

        if (rs.next()) {
            ad = new AdministradorDTO();
            ad.setIdentificacion_usuario(rs.getString("identificacion_usuario"));            
            ad.setContrasena(rs.getString("contrasena"));

        }
        return ad;
    }
}
